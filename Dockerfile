FROM eu.gcr.io/staging-205711/datascience-lab-all@sha256:2b47bf95656a459c53d9d35669307a627867527d3603ff3a0f3700a93d4fff8b

USER root

RUN conda update -n base conda
COPY environment.yml .
RUN conda env update

USER $NB_USER
