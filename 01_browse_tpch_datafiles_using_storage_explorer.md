# 1.  Download Azure Storage Explorer 
     https://azure.microsoft.com/en-us/features/storage-explorer/
![Open Screenshot](screenshots/001_storage_explorer_download.jpg)

# 2.  Copy SAS URI

Copy the storage account SAS URI
````
https://tpchdata.blob.core.windows.net/?sv=2020-02-10&ss=bfqt&srt=sco&sp=rlpx&se=2023-12-30T07:54:13Z&st=2021-02-17T23:54:13Z&spr=https&sig=w67IPYYI%2BRvxD6Iy9cUBRGo6WmI0d1yVl3tYZlEAReQ%3D
````
# 3.    Configure Storage Explorer
##  Click 'Open Connect Dialog option' from the left
![Open Screenshot](screenshots/002_storage_explorer_connect_to_az_storage.jpg)
##  Add connection to Storage SAS URI
##  Type in a display name for the storage account and paste the SAS URI and then click next
![Open Screenshot](screenshots/003_storage_explorer_add_sas_uri.jpg)
##  Click connect
![Open Screenshot](screenshots/004_storage_explorer_connect.jpg)

# 4.  Browse files
![Open Screenshot](screenshots/005_storage_explorer_browse_tpch_files.jpg)
##  view parquet files
![Open Screenshot](screenshots/006_storage_explorer_browse_tpch_files2.jpg)



# 5.  Summary of files  tpch-sf1000
Sl No|Container Name|Folder Name|Total Files|Total Folder Size|Avg File Size|Row Count
----|-----|----|----|----|----|
1|tpch-sf1000|CUSTOMER| 148,196|2.5 TB|15.6 MB
2|tpch-sf1000|LINEITEM| 148,196|2.5 TB|15.6 MB|5999989709
3|tpch-sf1000|NATION|100|10 MB|15 MB
4|tpch-sf1000|ORDERS|100|10 MB|15 MB|
5|tpch-sf1000|PART|100|10 MB|15 MB
6|tpch-sf1000|PARTSUPP|100|10 MB|15 MB
7|tpch-sf1000|REGION|100|10 MB|15 MB
8|tpch-sf1000|SUPPLIER|100|10 MB|15 MB
