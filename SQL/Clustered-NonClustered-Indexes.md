## Clustered Index
- Only 1 per table
- Impacts the way data is stored based on the key value
  (Think of indexes in a telephone directory, dictionary)
- Faster to read
- Slower to write as needs to write in the correct order

## Non-Clustered Index
- More than 1 per table
- Does not impact the way data is stored as it is stored separately from the data rows itself. Hence require additional disk space.
  (Think of indexes in a textbook)
- Slower to read 
- Faster to write/update as no phyiscal sorting
- Use when: large index key size, fast insert/update, avoid phyiscal sorting, multiple indexes per table

Source: https://www.youtube.com/watch?v=NGslt99VOCw