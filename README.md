# Sync SigSci request data with ELK
This Docker image will poll the SigSci API for requests and then push the returned json data to an Elasticsearch API endpoint.

The default setting is to poll the SigSci API every 5 minutes and ask for requests from the last 5 minutes.

You must set the variable ELK_URL in SigSciELK.sh.

You must also set the variables EMAIL, PASSWORD, CORP and SITE in SigSci.py.

In order to sync requests from multiple SigSci sites, you may run multiple Docker images with different SITE settings.

You can also customize this Docker configuration to run multiple Python scripts with different SITE settings.

This would require also adding multiple cron jobs in the file crontab.

# Build Docker
docker build -t sigsci-elksync .

# Run Docker
docker run -d sigsci-elksync 
# sigsci-elk-sync

