FROM compss/compss-ubuntu16:stable

RUN userdel jenkins -r
RUN pip3 install --no-cache-dir notebook==5.*
ENV NB_USER jovyan
ENV NB_UID 1000
ENV HOME /home/${NB_USER}
ENV PATH $PATH:/opt/COMPSs/Runtime/scripts/user:/opt/COMPSs/Bindings/c/bin:/opt/COMPSs/Runtime/scripts/utils
ENV CLASSPATH $CLASSPATH:/opt/COMPSs/Runtime/compss-engine.jar
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64/
ENV LD_LIBRARY_PATH /opt/COMPSs/Bindings/bindings-common/lib:$JAVA_HOME/jre/lib/amd64/server
ENV PYTHONPATH /home/${NB_USER}

#RUN useradd --disabled-password \
RUN useradd --uid ${NB_UID} -c "Default user" ${NB_USER}
    # Add the default user to sudoers
#echo "${NB_USER}  ALL=(ALL)  NOPASSWD:ALL" >> /etc/sudoers && \

#jRUN useradd  \
#    -c "Default user" \
#    --uid ${NB_UID} \
#${NB_USER}

# Make sure the contents of our repo are in ${HOME}
COPY . ${HOME}
USER root
RUN chown -R ${NB_UID} ${HOME}
USER ${NB_USER}

ENTRYPOINT []
