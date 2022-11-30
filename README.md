# smart-search

A full-text search of a MySQL database thru a web interface.

* Rails 7.0.2
* Percona MySQL


# Import CSV

Place one of more CSV files at the root of this repo. These will be imported into the database using a Rake task.

## Create

```
nerdctl compose build
nerdctl compose up -d
```

## Searching

Navigate to http://localhost:3001/search/ and put in as many tags as you like after the `/` each separated by another `/`. `not` can be used to do an inverse lookup.

http://localhost:3001/search/tag1/tag2/tag3

http://localhost:3001/search/tag1/tag2/nottag3


## Destroy

`nerdctl compose down`

