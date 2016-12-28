---
layout: post
title:  "[draft] The software development process"
date:   2016-10-19 12:09:07 +0200
categories: management
---
Here I have wrote all the things I faced during the software development process ... blah blah

### The sprints
* *Do not take to much*, it is better to take stuff from backlog instead. This makes developers feel good, because they finished everything they should and they do extra.
* *Fun Fridays* - Allow the developers to take any task from back log they want. (without it the task that has category unimportant, not urgent will never be completed, however they might bring unexpected value to the project)
Realistic goals that bring as much value as possible. To figure this out you can measure where users spend most of the time, what functionality is the most crucial for your business.
Do not take to much, it is better to take stuff from backlog instead. This makes developers feel good, because they finished everything they should and they do extra.

### Git Branching - Branch Management
There are several successful branching models, but there are my modified model.

* `master` branch [protected] - contains stable version of the application where are tags with released version named for example `release-1.1.1`. Hot fixes are done here and merged back to development branch.
* `development` branch [protected] - here should land every pull request from feature branches that are desired to be released in the next version

#### Extra branches
Those are created for special purpose. Should have been described
* `feature-name` - the feature branch with changes that are not scheduled for the next release
* `experimental-name` - ...

A protected branch is the branch when it might be changed only in pull request process.

We might consider to have only those two branches in the main repository. Developers should work on theirs own forks and send the changes through pull requests. Suggested names of branches for them might be like:

* Feature's branches the name is usually taken from the tasks manager like `JIRA`, for example `PROJ-234`
* Quick fixes branches `HOTFIX-PROJ-234`

### Code review -- pull requests

The idea is to force the team to check the new changes in the code and helps catch the bugs, bad quality code, teach everybody, make code less redundant.
The code review is a very important process which in my opinion should be a must-to-have thing.

However it leads to a blame war especially then there is no clear code guidelines.

There are a couple things that make the process easier
* Clear commit message, so everyone knows what has been changed
* Commits that are continuation of the same issue should be squashed into one
* Use `rebase -i` instead of `merge`

#### The guidlines
The company shuld have a document that describes the rules all programmers shall follow. it decrease tension during the pull review process.

### QA process
The automation test and refactoring team.

Reopen and duplicates. Checking the code according to specification and making
Feedback from the users

#### Bug reporting



#### Features planning

### Meetings

* Career path: Pay attention to the developers and talk to them on regular basis. All of them should feel important. Make for each developer his own career path and create opportunities.
* Demo: Show the project status and gives opportunity to developers show is contribution and abilities.


IDEA Box

## Tools
* Gitkraken
* Source tree


## Copied to
* Quora
* Diquss
* md gist

## Links to resources
1. [A succesful git branching model considered harmful](https://barro.github.io/2016/02/a-succesful-git-branching-model-considered-harmful/)
1. [Gitflow considered harmful](http://endoflineblog.com/gitflow-considered-harmful)
1. [A git branching consider as cuccessful](http://nvie.com/posts/a-successful-git-branching-model/)
