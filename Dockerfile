FROM compss/compss-ubuntu16:stable

RUN pip3 install --no-cache-dir notebook==5.*
ENV NB_USER jenkins
ENV NB_UID 1000
ENV HOME /home/${NB_USER}
ENV PATH $PATH:/opt/COMPSs/Runtime/scripts/user:/opt/COMPSs/Bindings/c/bin:/opt/COMPSs/Runtime/scripts/utils
ENV CLASSPATH $CLASSPATH:/opt/COMPSs/Runtime/compss-engine.jar
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
ENV LD_LIBRARY_PATH /opt/COMPSs/Bindings/bindings-common/lib:$JAVA_HOME/jre/lib/amd64/server
ENV PYTHONPATH /home/${NB_USER}

# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
USER root
RUN cp -r /root/.ssh ${HOME}/ && \
    chown -R ${NB_UID} ${HOME}
#USER ${NB_USER}
COPY handler.sh /


ENTRYPOINT ["/home/jenkins/handler.sh"]
