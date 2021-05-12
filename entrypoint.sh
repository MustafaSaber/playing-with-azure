#!/bin/bash

airflow webserver -D &

nginx -g 'daemon off;'