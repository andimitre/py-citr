#Image Details
FROM python:3.6-alpine

RUN apk add --no-cache python3 \
&& python3 -m ensurepip \
&& pip3 install --upgrade pip setuptools

RUN apk update && apk upgrade && pip3 install -U pip
RUN apk add --update alpine-sdk make gcc python3-dev libxslt-dev libxml2-dev libc-dev openssl-dev libffi-dev zlib-dev py-pip openssh \
    && rm -rf /var/cache/apk/*

## add python folders to eltsuite & chmod 
ADD ./ /project
RUN chmod 755 -R /project
WORKDIR /project

# Run the script with python
# for python packages -> CMD ["python", "-m", "utilities.data_profile"]
CMD [ "python", "run.py" ]

# example run
# to run the docker run -e scriptfile=utilities.data_profile -e arg1=CIP_SANDBOX_DEV -e arg2=ANDI -e arg3=T1_CONFIG 66a8bb5b741b

