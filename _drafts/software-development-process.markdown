---
layout: post
title:  "[draft] The software development process"
date:   2016-10-19 12:09:07 +0200
categories: management
---

Here I have wrote all the things I faced during the software development process ... blah blah

### The sprints

Sprint is a chunk of job usually planed for week or two.

Important thing is to have the realistic goals that bring as much value as possible. To figure this out you can measure where users spend most of the time in your app and knowing what functionality is the most crucial for your business.

##### Two levels of planning

* *The general goal* of the sprint. Almost all apps consist with numerous futures and couple of crucial functionalities, however each has to have a priority. Take is as an example: there is a messaging app, user will be able to send the text and the stickers, but sticker is something extra and might be done latter on. To bring the value to the users, we have to focus on raw text sending in first run, and another functionalities that make it possible to publish the app. In second run we will plan goals according to
* Which tasks to take to accomplish general gaol and how to split task over the team. The suggestions for this step is *Do not take to much*. It is better much better to take stuff from backlog latter on. This makes developers feel good, because they finished everything they suppose to and they do extra.

* *Do not take to much*, it is better to take stuff from backlog instead. This makes developers feel good, because they finished everything they should and they do extra.
* *Fun Fridays* - Allow the developers to take any task from back log they want. (without it the task that has category unimportant, not urgent will never be completed, however some of them might bring unexpected value to the project) In addition, the developers work more effective on things they like.

Sprint should end with the demo, where every person involved in the project shows his work to others. It is also very desirable to publish a new version for the customers.

### Git Branching - Branch Management
There are several successful branching models, but there are my modified model.

* `master` branch [protected] - contains stable version of the application where are tags with released version named for example `release-1.1.1`. Hot fixes are done here and merged back to development branch.
* `development` branch [protected] - here should land every pull request from feature branches that are desired to be released in the next version

##### Extra branches
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
The goal is to check the code according to specification and make code readable/extendable.

However it leads to a blame war especially then there is no clear code guidelines.

There are a couple things that make the process easier
* Clear commit message, so everyone knows what has been changed
* Commits that are continuation of the same issue should be squashed into one
* Use `rebase -i` instead of `merge`

##### The guidelines
The company should have a document that describes the rules all programmers shall follow. it decrease tension during the pull review process.

### QA process

* *Unit testing team* : Probably not everyone will agree with me, but in my opinion tests should do separate team. This approach has very important advantage, if somebody else will write tests, he has to understand the code, if not, he will reject the push request. This team should work closely to *refactoring team*

* *The monkey and automation testing team*. The team that tests functionality of the app from top level.

* *Help desk team* Collecting the feedback from the users and helping them out. Giving feedback to other teams about the problems the user faced.

##### Reporting bugs
Problems
* Duplicates
* Reopen because of exclusive requirements

#### Bug reporting

### Marketing process

### Recruitment process

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
