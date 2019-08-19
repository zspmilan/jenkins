#!/bin/bash

/usr/sbin/init
systemctl enable nginx
systemctl start nginx
