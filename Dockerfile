# 基于python3.6镜像来构建owllook镜像
FROM python:3.6
MAINTAINER howie6879 <howie6879@gmail.com>
ENV TIME_ZONE=Asia/Shanghai
RUN echo "${TIME_ZONE}" > /etc/timezone \
    && ln -sf /usr/share/zoneinfo/${TIME_ZONE} /etc/localtime
ADD . /owllook
WORKDIR /owllook
RUN pip install --no-cache-dir pipenv==2021.5.29
RUN pipenv install --skip-lock
RUN find . -name "*.pyc" -delete
