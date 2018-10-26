FROM contiamo/datascience-lab-all:latest

USER root

COPY environment.yml .
RUN conda env update

USER $NB_USER