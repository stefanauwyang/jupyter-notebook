ARG BASE_CONTAINER=jupyter/tensorflow-notebook
FROM $BASE_CONTAINER

COPY instantclient-basic-linux.x64-19.3.0.0.0dbru.zip /home/jovyan/
RUN unzip instantclient-basic-linux.x64-19.3.0.0.0dbru.zip && rm instantclient-basic-linux.x64-19.3.0.0.0dbru.zip
ENV LD_LIBRARY_PATH=/home/jovyan/instantclient_19_3

# Install Oracle instantclient
RUN conda install --quiet --yes \
    'cx_Oracle=*' && \
    conda clean -tipsy && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER
