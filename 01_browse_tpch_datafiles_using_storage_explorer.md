# 1.  Download Azure Storage Explorer 
     https://azure.microsoft.com/en-us/features/storage-explorer/
![Download Screenshot](screenshots/001_storage_explorer_download.jpg)

# 2.  Configure Connection to ADLS Gen2

Copy the storage account SAS URI
````
https://tpchdata.blob.core.windows.net/?sv=2020-02-10&ss=bfqt&srt=sco&sp=rlpx&se=2023-12-30T07:54:13Z&st=2021-02-17T23:54:13Z&spr=https&sig=w67IPYYI%2BRvxD6Iy9cUBRGo6WmI0d1yVl3tYZlEAReQ%3D
````

    1.  Open Storage Explorer
    2.  Click 'Open Connect Dialog option' from the left
![Open Screenshot](screenshots\002_storage_explorer_connect_to_az_storage.jpg)
    2.  Add connection to Storage SAS URI
![Open Screenshot](screenshots\003_storage_explorer_add_sas_uri.jpg)
    3.  Click connect
![Open Screenshot](screenshots\004_storage_explorer_connect.jpg)

# 3.  Browse files
![Open Screenshot](screenshots\005_storage_explorer_browse_tpch_files.jpg)




