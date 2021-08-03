# TEST WEB 1

## About the Project

Test Web 1 is a web interface for company sales that accepts file uploads, normalizes the data and stores in a database. It was developed to help testing and comprehending the programmer's skills as a web developer.


Navigation
==================

-[About the Project](#about-the-project)
-[Starting it](#starting-it)
-[Using it](#using-it)
-[How to run the test suite](#how-to-run-the-test-suite)


## About the Project

The project was built using Ruby On Rails. Here we have:
 
 - [Ruby 2.7.2](www.ruby-lang.org)
 - [Rails 6.0.4](www.rubyonrails.org)
 - [Docker 20.10.7](www.docker.com)
 - [Docker-Compose 1.21.2](docs.docker.com/compose)
 - [PostgreSQL 12:1](www.posgresql.org)

## Starting it

We used docker and docker-compose in this project's development. As you will see, its easy tobuild your image, create your own database and start the application>

To build the images and start the containers, just run

```
docker-compose up --build
```

Now its time to create your new database, with the command

```
docker-compose exec app bundle exec rails db:create db:migrate
```

And now, you can access the project in your [localhost](localhost:3000)

## Using it

The project is simple: You can see the purchases in the home screen, and you can add new ones in the upload screen.
In teh upload screen, you can upload tab files with purchases , and they will be stored in the database.
The tab files must be like the example below, with headers:

|purchaser name | item description | item price | purchase count | merchant addres | merchant name |
|---------------|------------------|------------|----------------|-----------------|---------------|
| João          | R$10 off R$20    | 10.0       | 2              | 987 Fake St     | Bob's Pizza   |



## How to run the test suite

You can run the test suite easily using the command

```
docker-compose exec app bundle exec rspec
```

And can see the coverage running

```
xdg-open coverage/index.html
```
