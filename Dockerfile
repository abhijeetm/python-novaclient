FROM centos:centos6

RUN yum install -y libevent-devel python-devel

RUN yum install -y gcc libxml2 libxml2-devel libxslt libxslt-devel

RUN yum install -y git

# install setup tools
RUN curl https://bitbucket.org/pypa/setuptools/raw/bootstrap/ez_setup.py | python -

# install pip
RUN easy_install pip

RUN pip install pbr

WORKDIR /home/

# install nova client
RUN git clone https://github.com/abhijeetm/python-novaclient.git

WORKDIR /home/python-novaclient

RUN python setup.py install
