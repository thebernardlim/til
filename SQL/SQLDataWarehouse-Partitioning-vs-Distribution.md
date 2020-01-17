#Distribution

- The way data is physically stored
- There are 60 Compute nodes in the MPP architecture of SQL Data Warehouse.
- For optimal performance, if data can be distributed across all nodes, hence MPP can be properly utilized as queries can be run against all 60 Compute nodes at once. Imagine the scenario where there are only 5 distributions, that will mean only 5 compute nodes can run at each time, and MPP is not fully utilized.


- Benefits:
    - Improve query performance.

- Types of distributions:
    - Hash distribution: Distributes table rows across the Compute nodes by using a deterministic hash function to assign each row to one distribution.
        - For large fact tables (> 2 GB). 
        - For tables with frequent insert, delete, delete.
    - Round Robin: A round-robin distributed table distributes table rows evenly across all distributions. The assignment of rows to distributions is random.
        - For quick inserting of data. But not good for querying. Lots of data movement.
        - For temporary / staging table
        - Starting point when cannot determine what is a good joining key.
    - Replicated : Table replicated across all compute nodes. Reduced data movement.
        - For small, data that is usually unchanged

- To choose Distribution column:
    - Column allows fair distribution of data across 60 nodes.


#Partitioning

- Table partitioning is a way to divide a large table into smaller, more manageable parts without having to create separate tables for each part.
- Data in a partitioned table is physically stored in groups of rows called partitions and each partition can be accessed and maintained separately.

- Benefits: 
    - Improve the efficiency and performance of loading data by use of partition deletion, switching and merging.
    - Improve query performance. A query that applies a filter to partitioned data can limit the scan to only the qualifying partitions. This method of filtering can avoid a full table scan and only scan a smaller subset of data. 

- To choose Partition column:
    - Column that is always used in FILTERs in queries.
    - Column that might create too many partitions.

- Usual number of partitions: 10 to hundreds. Not thousands. 

- To switch partitions between two tables, you must ensure that the partitions align on their respective boundaries and that the table definitions match
- Only empty partitions can be split

Reference:
https://www.justanalytics.com/blog/technical-know-how/performance-optimization-for-azure-dw
https://docs.microsoft.com/en-us/azure/sql-data-warehouse/sql-data-warehouse-tables-distribute
https://docs.microsoft.com/en-us/azure/sql-data-warehouse/sql-data-warehouse-tables-partition
https://www.cathrinewilhelmsen.net/2015/04/12/table-partitioning-in-sql-server/#more-2097
