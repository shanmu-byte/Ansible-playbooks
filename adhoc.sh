#!/bin/bash

ansible all -m yum_repository -a 'name=baseos description="Baseos" baseurl=http://content/rhel8.0/x86_64/dvd/BaseOS gpgcheck=yes gpgkey=http://content.example.com/rhel8.0/x86_64/dvd/RPM-GPG-KEY-redhat-release enabled=1'

ansible all -m yum_repository -a 'name=appstream description="App" baseurl=http://content/rhel8.0/x86_64/dvd/AppStream gpgcheck=yes gpgkey=http://content.example.com/rhel8.0/x86_64/dvd/RPM-GPG-KEY-redhat-release enabled=1'
