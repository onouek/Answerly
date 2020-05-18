FROM phusion/baseimage
# install packages
RUN apt-get -y update
RUN apt-get install -y \
    apache2 \
    libapache2-mod-wsgi-py3 \
    libpq-dev \
    postgresql-client \
    openjdk-8-jre-headless \
    python3 \
    python3-pip
# install google-chrome
RUN echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' | \
    tee /etc/apt/sources.list.d/google-chrome.list && \
    curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add && \
    apt-get update && apt-get install -y google-chrome-stable
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
# add code and directories
RUN mkdir /answerly
WORKDIR /answerly
COPY requirements* /answerly/
COPY django/ /answerly/django
COPY scripts/ /answerly/scripts
COPY apache/ /answerly/apache
COPY chromedriver/ /answerly/chromedriver
RUN mkdir /var/log/answerly/
RUN touch /var/log/answerly/answerly.log
RUN chown www-data /var/log/answerly/answerly.log
# install python requirements
RUN pip3 install -U pip
RUN pip3 install virtualenv
RUN virtualenv /answerly/venv
RUN chmod +x /answerly/scripts/pip_install.sh
RUN /answerly/scripts/pip_install.sh /answerly
# collect the static files
RUN chmod +x /answerly/scripts/collect_static.sh
RUN /answerly/scripts/collect_static.sh /answerly
# configure apache
RUN ln -s /answerly/apache/answerly.apache.conf /etc/apache2/sites-enabled/000-answerly.conf

EXPOSE 80
CMD ["apache2ctl", "-D", "FOREGROUND"]
