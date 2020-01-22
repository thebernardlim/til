# DP-201 Study Notes

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
- Cluster retention period : 30 days after termination. Pin cluster for > 30 days. Max 20 clusters can be pinned.
- Cluster cloning: Permissions, installed libraries, attached notebooks not cloned
- Pool : Azure Databricks pools reduce cluster start and auto-scaling times by maintaining a set of idle, ready-to-use instances. 
- Job : Way of running notebook immediately / by schedule 

### Access Control

** Only available on Premium Plan
- Cluster access control - Default: All users can create / modify clusters unless admin enables 'Cluster access control'
- Pool access control - Default: All users can create / modify pools unless admin enables 'Pool access control'
- Jobs access control - Default: All users can create / modify jobs unless admin enables 'Jobs access control'
- Table access control - Control access to data stored in cluster managed tables Default: All users have access to all data stored in a cluster’s managed tables unless an administrator enables table access control for that cluster. 
- Workspace access control - Control access to create / modify notebooks,  folders. Default: All users can create / modify workspace objects unless admin enables 'Workspace access control'  
- Token-based auth: For REST APIs
- Conditional Access
- Data Lake Storage Credential Passthrough - Use AD Identity used in Databricks for Data Lake

### Security

- To access APIs, use access tokens

## Azure Storage

Cool - At least 30 days. Milliseconds to retrieve. \
Archive - At least 180 days. Hours to retrieve.

### Rehydration options

- Standard Priority: 15 hours
- High Priority: 1 hour

Blob storage not supported by ZRS or GZRS \
SAS does not support Azure Files \
Azure AD does not support Azure Files (REST), Azure Tables \

### Accessing Storage

- Account SAS: Access to multiple resources in 1 or more storage services
- Service SAS: Access to specific storage account resource
- User delegation SAS: Secured with Azure AD credentials. 
- Primary/Secondary Storage: Full access to storage acct, including ability to modify/delete resources on it.

*** If access key is regenerated, Account SAS, Service SAS and Shared Key will be impacted

## Azure Data Lake

### Access Control

- RBAC : Container Level
- ACL : Folder Level
- Shared Key : 'Super-User' access to all operations on all resources
- SAS

### Others

Recommended file size: >256 MB


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


## Azure AD

- Privileged Identity Management - JIT privileged access to resources / AD
- Identity Protection - Automate detection / remediation of identity-based risks, investigate risks, export risk data to 3rd party utilities.

## SQL Server

### Encryption

- Always Encrypted: Encrypt sensitive data in client apps without revealing encryption keys to DB engine, providing separation between data owners and data managers.
- Column-Level encryption - Uses function on server. Data can be seen by DBA.

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


## Azure CosmosDB

### SLAs

Write - Single / Read - Single: 99.99%, 99.99% \
Write - Single / Read - Multi: 99.99%, 99.999% \
Write - Multi / Read - Multi: 99.999%, 99.999% \

## Azure SQL Data Warehouse

### Backup

- Automatic Restore Points : No configuration required. 7 days retention period. RPO: 8 hours
- User-Defined Restore Points: Manual trigger snapshots. Max 42 user-defined restore points. 7 day retention period. Can use Azure Portal to create.
- When data warehouse deleted, final snapshot created which will be retained for 7 days only
- Geo-Backups happen once per day to paired data center. RPO: 24 hours.
- On restore, firewall rules need to be re-created.
- Recommended file size : 256MB to 2GB


## Azure Database

### Migration

Azure Database Migration Service - Migrating with minimal disruptions. Source DB remains online.

## Azure SQL

### Service Tiers

Basic, Standard, Premium \
Storage Size: 2 GB, 1 TB, 4 TB \
Max DTUs: / eDTUs per DB 5, 3000, 4000 \
Max Backup Retention: 7 days, 35 days, 35 days \
IO Latency: 5ms(read) & 10ms(write), 2 ms(read/write) \

Basic, Standard, General - Compute/Storage resources separated
Premium, Business Critical - Compute/Storage integrated

Hyperscale - DB Size up to 100 TB. Use when DB size > 4 TB

** In-memory OLTP only supported by Premium tier \
** Premium tier integrates storage / compute resources & replicates together \
** Use contained users for AAD authentication to Azure SQL
A contained database user based on an Azure AD identity, is a database user that does not have a login in the master database, and which maps to an identity in the Azure AD directory that is associated with the database. Eg: To create contained user: `CREATE USER [bob@contoso.com] FROM EXTERNAL PROVIDER;` \
Before creating contained user, need to set admin to AD User through UI Portal. \
** Dynamic Scalability : Manually change resource limits, etc without downtime \

### Auditing vs Diagnostics

**Auditing:** Retain an audit trail of selected events. You can define categories of database actions to be audited.
Report on database activity. You can use pre-configured reports and a dashboard to get started quickly with activity and event reporting.
Analyze reports. You can find suspicious events, unusual activity, and trends. \

**Diagnostics:** Performance monitoring. CPU percentage, usage etc

### Backup

- Long-term retention not available on Azure SQL DB Managed Instance - Up to 10 years
- Geo-Redundancy : Cheaper option for backup - if DB ok to be offline for a period of time
- Geo-Replication: More expensive option
- Automated Backups - Up to 35 days only
- When under TDE, offline files are still encrypted
- Point-in-time restore = Full Backup + Differential Backup + Transaction Log Backup
- Full Backup: Weekly, Differential Backup: Every 12 Hours, Transaction Logs: Every 5-10 minutes

## Azure Functions

### Plans
Consumption - Scale Out automatically. Only pay when functions running. \
Premium - Require constant running of functions. Require more power. VNet Connectivity. \
Dedicated (App Service) Plan - When there are under-utilized VMs running in other App Service instances. Manual scaling.

## Database Optimization

Choosing Distribution column:\
https://docs.microsoft.com/en-us/azure/sql-data-warehouse/sql-data-warehouse-tables-distribute

- Column where heavily used in JOINs
- Not in WHERE clause
- Not a DATE column
- Has many unique values (Column should have at least 60 unique values)
- Does not have NULLs, or only few NULLs

Choosing Partition key: \
https://docs.microsoft.com/en-us/azure/cosmos-db/partitioning-overview

- Choose a partition key that has a wide range of values and access patterns that are evenly spread across logical partitions.
- Choose a partition key that spreads the workload evenly across all partitions and evenly over time.
- Candidates for partition keys might include properties that appear frequently as a filter in your queries.


Use non-clustered indexes to improve analytics performance
https://docs.microsoft.com/en-us/azure/sql-database/sql-database-in-memory

