FROM contiamo/datascience-all-lab:latest

USER root

COPY environment.yml .
RUN conda env update

USER $NB_USER