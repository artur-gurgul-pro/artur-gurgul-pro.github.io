---
layout: post
title:  "[draft] The process"
date:   2016-10-19 12:09:07 +0200
categories: management
---
Here I have wrote all the things I faced during the softwate development process ... blah blah 

### The sprints
Do not take to much, it is better to take stuff from backlog instead. This makes developers feel good, becouse they finished evertyiong they should and they do extra.
Fun fridays -  

### Git Branching - Branch Management
There are several successful branching models, but there are my modified model.

* `master` branch [protected] - contains stable version of the application where are tags with released version named for example `release-1.1.1`. Hot fixes are done here and merged back to development branch.
* `development` branch [protexted] - here should land every pull request from feaure branches

A protected branch is the branch when it might be changed only in pull reguest process.

We might consider to have only those two branches in the main repository. Developers should work on theirs own forks and send the chenges through pull requests. Sugested names of branches for them might be like:

* Feature's branches the name is usially taken from the tasks manager like JIRA, for example `PROJ-234`
* Quick fixes branches HOTFIX-PROJ-234

### Code review -- pull requests

The idea is to force the team to check the new changes in the code and helps catch the bugs, bad quality code, teach everybody, make code less redundant.
The code review is a very important process which in my opinion should be a must-to-have thing.

However it leads to a blame war especially then there is no clear code gudlines.

There are a couple things that make the process easier
* Clear commit message, so everyone knows what has been changed
* Commits that are continuation of the same issue should be squasshed into one
* Use `rebase -i` instead of `merge`

### QA process
Reopen and duplicates. Checking the code according to specification and making

#### Bugs reporting

### Features planning 

#### Tools
* Gitkraken
* Source tree

#### Links to resources
1. [A succesful git branching model considered harmful](https://barro.github.io/2016/02/a-succesful-git-branching-model-considered-harmful/)
1. [Gitflow considered harmful](http://endoflineblog.com/gitflow-considered-harmful)
1. [A git branching consider as cuccessful](http://nvie.com/posts/a-successful-git-branching-model/)
