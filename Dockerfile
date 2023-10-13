FROM ibmcom/spectrum-discover-application-sdk:latest

### Required labels
LABEL application_name="get-file-type"
# comma delimted list of file extensions (ex: jpg,jpeg,tiff)
LABEL filetypes="all"
LABEL description="Extracts mime type from files without valid extensions"
#smeverv2 (ex: 0.1.2)
LABEL version="0.0.2"
#license type (ex: MIT)
LABEL license="mit"

### Optional labels.
### Uncomment if in use
#LABEL company_name=""
#LABEL company_url=""
#LABEL maintainer="" # email address
#LABEL icon_url=""
# a comma delimited key,value pair (ex: param1k:param1v,param2k:param2v).
#LABEL parameters=""

COPY get_file_type.py requirements.txt /application/

RUN python3 -m pip install -r /application/requirements.txt && \
    rm -f /application/requirements.txt

ENTRYPOINT []
CMD ["python3", "/application/get_file_type.py"]
