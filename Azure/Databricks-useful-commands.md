#Define storage account, SAS Key / URL
SasURL = "https://datalake.blob.core.windows.net/?sv=2019-02-02&ss=bfqt&srt=sco&sp=rwdlacup&se=2020-01-09T11:36:14Z&st=2020-01-09T02:36:14Z&spr=https&sig=MZOAVyt6s1%2BiktRNMVu2JQuuUVZWUamAk%2FkTHj%2B4NEg%3D"
indQuestionMark = SasURL.index('?')
SasKey = SasURL[indQuestionMark:len(SasURL)]
StorageAccount = "datalake"

#Define source container names / mount points / file path
SourceContainerName = "iot-events"
SourceMountPoint = "/mnt/avrofiles1"
SourceAvroFilePath = SourceMountPoint + "/*.avro"

#Define destination container names / mount points
DestinationContainerName = "iot-events-csv"
DestinationMountPoint = "/mnt/csv1"

#Mount source container
try:
  dbutils.fs.mount(
    source = "wasbs://%s@%s.blob.core.windows.net/" % (SourceContainerName, StorageAccount),
    mount_point = SourceMountPoint,
    extra_configs = {"fs.azure.sas.%s.%s.blob.core.windows.net" % (SourceContainerName, StorageAccount) : "%s" % SasKey}
  )
except:
  print("avrofiles already mounted")

#Mount destination container
try:
  dbutils.fs.mount(
    source = "wasbs://%s@%s.blob.core.windows.net/" % (DestinationContainerName, StorageAccount),
    mount_point = DestinationMountPoint,
    extra_configs = {"fs.azure.sas.%s.%s.blob.core.windows.net" % (DestinationContainerName, StorageAccount) : "%s" % SasKey}
  )
except:
  print("csvfiles already mounted")
  
#List all contents of source mount point
%fs ls dbfs:/mnt/avrofiles1

#Load Avro File into DataFrame
avroDf = (spark.read.format(file_type).load(SourceAvroFilePath))
display(avroDf)

#Convert Avro file to JSON format
jsonRdd = avroDf.select(avroDf.Body.cast("string")).rdd.map(lambda x: x[0])
data = spark.read.json(jsonRdd)
display(data)

#Write JSON file in CSV format to mount point / Azure storage
data.write.format("csv").option("header", "true").save("/mnt/csv1/sprinklerevents")


