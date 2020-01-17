## Azure Managed Disk Types
Used with Azure VMs
- Ultra SSD
  - Disk Size: 65,536 GiB
  - Throughput: 2,000 MiB/s
  - IOPS: 160,000
- Premium SSD
  - Disk Size: 32,767 GiB
  - Throughput: 900 MiB/s
  - IOPS: 20,000
- Standard SSD
  - Disk Size: 32,767 GiB
  - Throughput: 750 MiB/s
  - IOPS: 6,000
- Standard HDD
  - Disk Size: 32,767 GiB
  - Throughput: 500 MiB/s
  - IOPS: 2,000

## SQL Server 
## Encryption
 -  Always Encrypted: Encrypt sensitive data in client apps without revealing encryption keys to DB engine, providing separation between data owners and data managers. 
 - Column-Level encryption - Uses function on erver. Data can be seen by DBA.

### Backup
  - Full Backup
  - Differential Backup: Only backup what is different from previous full backup
  - Partial Backup : Only Primary Filegroup backed up
  - Transaction Logs : Holds all transactions 
  - Tail-end of transaction logs : Log records that have yet to be backed up

## Azure SQL DB Managed Instance 
### Backup 
No geo-replication for Azure SQL Database Managed Instance 

### Auditing
To audit Azure SQL Database Managed Instance:
1) Create SAS
2) T-SQL: Create Credetials where SECRET is SAS
3) T-SQL: Create Server Audit


## CosmosDB

### SLAs
Write - Single / Read - Single: 99.99%, 99.99% <br/>
Write - Single / Read - Multi: 99.99%, 99.999% <br/>
Write - Multi / Read - Multi: 99.999%, 99.999% <br/>

## Azure AD
- Privileged Identity Management - JIT privileged access to resources / AD
- Identity Protection - Automate detection / remediation of identity-based risks, investigate risks, export risk data to 3rd party utilities.


## Azure SQL Data Warehouse

### Backup
- Automatic Restore Points : No configuration required. 7 days retention period. RPO: 8 hours
- User-Defined Restore Points: Manual trigger snapshots. Max 42 user-defined restore points. 7 day retention period. Can use Azure Portal to create.
- When data warehouse deleted, final snapshot created which will be retained for 7 days only
- Geo-Backups happen once per day to paired data center. RPO: 24 hours.
- On restore, firewall rules need to be re-created.
- Recommended file size : 256MB to 2GB


## Azure Databricks
### Cluster Modes
- Standard
    - Terminate after 120 seconds
    - Python, R, Scala, SQL
    - For single users
- High Concurrency
    - Do not terminate automatically
    - Python, R, SQL
    - For multiple users
    - Fault isolation
    - Task preemption for fair usage for all users
    - Table Access Control - Restrict access to data to right people

- Both clusters can have credential passthrough - AD
- Cluster retention period : 30 days after termination

### Security
- To access APIs, use access tokens


## Azure Storage
Cool - At least 30 days. Milliseconds to retrieve.
Archive - At least 180 days. Hours to retrieve.

Rehydration options 
- Standard Priority: 15 hours 
- High Priority: 1 hour

Blob storage not supported by ZRS

## Azure Database
### Migration
Azure Database Migration Service - Migrating with minimal disruptions. Source DB remains online.

## Azure SQL 
### Service Tiers

Basic, Standard, Premium <br/>
Storage Size: 2 GB, 1 TB, 4 TB <br/>
Max DTUs: / eDTUs per DB 5, 3000, 4000 <br/>
Max Backup Retention: 7 days, 35 days, 35 days <br/>
IO Latency: 5ms(read) & 10ms(write), 2 ms(read/write) <br/>

** In-memory OLTP only supported by Premium tier


### Backup
- Long-term retention not available on Azure SQL DB Managed Instance - Up to 10 years
- Geo-Redundant
- Automated Backups - Up to 35 days only
- When under TDE, offline files are still encrypted


## Azure Functions

## Plans
Consumption - Scale Out automatically. Only pay when functions running. <br/>
Premium - Require constant running of functions. Require more power. VNet Connectivity. <br/>
Dedicated (App Service) Plan - When there are under-utilized VMs running in other App Service instances. Manual scaling.

