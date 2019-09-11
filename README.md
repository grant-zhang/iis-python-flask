# iis-python-flask
A docker container with IIS + Python + Flask
---
It is based on [python:3.7.4-windowsservercore-1803](https://hub.docker.com/_/python) image. IIS installation steps are copied from [microsoft/iis Dockerfile](https://hub.docker.com/_/microsoft-windows-servercore-iis). The remaining work is to config IIS to work with Python togehter. It uses [wfastcgi](https://pypi.org/project/wfastcgi/) to integrate IIS and python. [Flask](http://docs.jinkan.org/docs/flask/) is used as the developing framework.
