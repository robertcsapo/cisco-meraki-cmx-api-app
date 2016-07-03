FROM ruby:latest
MAINTAINER Robert (robert@nigma.org)

EXPOSE 4567

# Installing python and python3
RUN DEBIAN_FRONTEND=noninteractive gem install sinatra
RUN DEBIAN_FRONTEND=noninteractive gem install data_mapper
RUN DEBIAN_FRONTEND=noninteractive gem install dm-sqlite-adapter
RUN DEBIAN_FRONTEND=noninteractive gem install thin
RUN DEBIAN_FRONTEND=noninteractive git clone https://github.com/meraki/cmx-api-app.git

COPY cmx_app_start.sh /cmx-api-app/
CMD bash /cmx-api-app/cmx_app_start.sh
