# Quora App

[quora_demo](https://github.com/Dhaval-Gandhi/quora_demo)

## Install

### Clone the repository

```shell
git clone git@github.com:Dhaval-Gandhi/quora_demo.git
cd quora_demo
```

### Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 3.0.0`

If not, install the right ruby version using [rvm](https://rvm.io/rvm/install) (it could take a while):

```shell
rvm install 3.0.0
```

### Install dependencies

```shell
bundle install
```

### Set environment variables

```shell
EDITOR=nano rails credentials:edit
```

### Initialize the database

```shell
rails db:create db:migrate
```

### To start rails server

```shell
rails s
```
