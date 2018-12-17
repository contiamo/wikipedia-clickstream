# Wikipedia Clickstream

The idea for this bundle was taken from
[this blog post](https://blog.wikimedia.org/2018/01/16/wikipedia-rabbit-hole-clickstream/).

## Setup

Build the docker image with
```
make build-docker
```

## Editor

Data can be read in, prepared, and written to disk using the following steps:

- Run `notebooks/get_data.ipynb`: downloads data from https://dumps.wikimedia.org,
  and writes to `data/processed/wikipedia_referer.parquet`
- Run `notebooks/exploration.ipynb`: filters for internal referers and writes
  two data sets to Parquet:
  - `prev.parquet`: top link for each referer
  - `curr.parquet`: top referer for each link
- Run `make cp-data`: copies required data files to the `common` folder

## Functions

Functions can be built with

```
labs bundle build prev-referer
labs bundle build curr-referer
```

`prev-referer` can be used to tell you the most common link to be clicked on
from within a Wikipedia page:

```
$ labs function run prev-referer Black_Mirror
Checking function container health..Ready
List_of_Black_Mirror_episodes
```

`curr-referer` can be used to tell you the most common referer given a
Wikipedia page:

```
$ labs function run curr-referer List_of_pizza_chains_of_the_United_States
Checking function container health..Ready
List_of_pizza_chains
```