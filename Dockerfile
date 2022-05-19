FROM python:3.10-bullseye

# Install the requirements
COPY code/requirements.txt /tmp/requirements.txt
RUN pip install --upgrade pip
RUN pip install -r /tmp/requirements.txt
RUN rm -f /tmp/requirements.txt 

# Add runner user
ARG RUNNER_UID=1000
ARG RUNNER_GID=1000
RUN groupadd -g ${RUNNER_GID} runner
RUN useradd -d /home/runner -s /bin/bash -g ${RUNNER_GID} -u ${RUNNER_UID} runner

# Create the runner directory
WORKDIR /home/runner
COPY . .
RUN chown -R runner:runner /home/runner
USER runner
RUN chmod -R a+w /home/runner

EXPOSE 8888