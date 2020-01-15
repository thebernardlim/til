# Azure Monitoring / Auditing Services

## General Auditing

Examples:
- Event Logs
- Performance Data
- Hosts Metrics

### 1) Azure Diagnostics Logs
By Azure resource:
- Performance
- Event logs 

### 2) Azure Activity Log
Azure Configuration - Who did what, who granted what role?
Operational Audit Log from all resources

## Security Auditing

### 1) Azure Active Directory audit and sign-in logs
Users and their activity

### 2) Azure Key Vault audit logs
Who access information here

### 3) Azure Storage analytics logs
Audit info on storage access

### 4) Azure Synapse logs - Only when threat detection mechanism enabled
Audit info & store in Azure Storage 

## Application Telemetry
Application/Component level monitoring 

### 1) Azure Application Insights
- Telemetry info from application
- Capture exceptions / errors from code and push into Application Insights

## Azure Monitor
One-stop place to review and analysis of audit logs.
Azure Monitor service gathers all information from Azure Audit and Diagnostics logs and allows to access it from a single location in the Azure portal. Also allows alerts to be specified based on specific events.

