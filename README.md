[![Build Status](https://travis-ci.org/arfo90/boostx.svg?branch=master)](https://travis-ci.org/arfo90/boostx)

# Boostx

Boostx is code generator for ruby project based on required template

  - It helps to create basic files and folders (module, lib, etc)
  - Creating Rake test automatically 

# Command

```sh
$ gem install boostx
$ boostx init <project_name>
```


```sh
--project_name
  -lib
	-project_name
	-project_name.rb
  -Gemfile
```
Still in progress for first iteration, in case you are interested to contribute you can check [PLAN.md](https://github.com/arfo90/boost/blob/master/PLAN.md)

# Running the test

This project has code coverage of test, and tests run upon each commit (in Travis), you can run the test using rake task test or if you want clean run you can use rake docker:test

```sh
$ rake test
$ rake docker:test   // for clean run
```

