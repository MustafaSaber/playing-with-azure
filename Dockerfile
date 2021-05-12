FROM centos:8

RUN  yum -y update && yum -y install \
                            zlib-devel \
                            bzip2-devel \
                            openssl-devel \
                            ncurses-devel \
                            sqlite-devel \
                            python3-devel \
                            python3-setuptools \
                            wget \
                            cyrus-sasl-devel.x86_64 \
                            nginx


# ARG AIRFLOW_VERSION=2.0.2
ARG AIRFLOW_PASSWORD=password
COPY requirements.txt requirements.txt


RUN pip3 install --upgrade pip && pip3 install -r requirements.txt

RUN airflow db init && airflow users create \
    --username admin \
    --firstname Mustafa \
    --lastname Saber \
    --role Admin \
    --email mostafa.saber3789@gmail.com \
    --password ${AIRFLOW_PASSWORD}

RUN airflow webserver -D
COPY nginx.conf /etc/nginx/nginx.conf
COPY airflow.cfg /root/airflow/airflow.cfg
EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]