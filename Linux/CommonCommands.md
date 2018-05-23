* Check disk space: <pre>df</pre>
* Check disk space (human readable) : <pre>df -h </pre>
* Sort files by disk space descending order : <pre> du | sort -n -r | head -n 10 </pre>

* Check disk usage of all subdirectories:  sudo du -sch /home/test/Desktop* | sort -nr | tail -20
* Check disk usage of all subdirectories from root: sudo du -sch /* | sort -nr | tail -20
* Check disk usage of current directory and include hidden files: du -sch .[!.]* * |sort -h


* Use touch to create a temporary file for deletion/comparing purposes: touch -t 201805220000 /folderpath/timestamp
  Examples below:
* To delete files created older than a specific date:
  find . -type f ! -newer timestamp -delete
* To delete directories created older than a specific date. Just change the type to 'd':
  find . -type d ! -newer timestamp -delete
* To find files larger than a specific size (For example directories larger than 10 MB here):
  find . -type d ! -newer timestamp -size +10M
 