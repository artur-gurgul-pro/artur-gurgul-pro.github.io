---
layout: post
title:  "The software development process"
date:   2016-10-19 12:09:07 +0200
categories: management
---

Here I am going to share all the things I faced during the software development process. This article is in working progress (and always will be). Feel free to discuss out the content on github or make a pull request with your changes.


### Planning

#### Features planning

If something becomes difficult to plan or to do there is high change there is a mistake in the design or solution. 

#### Sprints

A sprint is a chunk of job usually planed for week or two.

Thare are a couple of suggestions
* *Do not take to much* The goals has to be realistic and possbile to acomplish. It is quite obvious, but developers tend to overextimate thier capcatity to solving the problems, becouse everyone wants to be seen as smart person. In another hand when the developers accomplish everyting on time it allows feel them good. 
* The goals should bring as much value as possible. Like baking a pie using the sand, which is labor intensive, doesn't bring any value. Nobody will eat such pie. The same thing, however less obvious, happens to the software. Try to measure where in your app the users spend most of the time, or try to find out what functionality will bring real appriciaton. Every change in your app, like change a library, should be strongly argumented.  
* Consider *Fun Fridays* - Allow the developers to take any task from back log they want. (without it the task that has category unimportant, not urgent will never be completed, however some of them might bring unexpected value to the project) In addition, the developers work more effective on things they like.

#### IDEA Box

##### Levels of planning

* *The general goal* of the sprint. All apps consist with numerous futures and couple of crucial functionalities, however each has to have a priority. Take is as an example: there is a messaging app, user will be able to send the text and the stickers, but sticker is something extra and might be done latter on. To bring the value to the users, we have to focus on raw text sending in first run, and another functionalities that make it possible to publish the app. In second run we will plan goals according to
* Which tasks to take to accomplish general gaol and how to split task over the team. The suggestions for this step is *Do not take to much*. It is better much better to take stuff from backlog latter on. This makes developers feel good, because they finished everything they suppose to and they do extra.


#####  Demo after each sprint
Sprint should end up with the demo, where every person involved in the project shows his work to others. It is also very desirable to publish a new version for the customers.

### Code managment

During my career I faced a lot of different approuches to the subject. 

#### Git Branching - Branch Management
There are several successful branching models, but there are my modified model.

* `master` branch [protected] - contains stable version of the application where are tags with released version named for example `release-1.1.1`. Hot fixes are done here and merged back to development branch.
* `development` branch [protected] - here should land every pull request from feature branches that are desired to be released in the next version

###### Extra branches
Those are created for special purpose. Should have been described
* `feature-name` - the feature branch with changes that are not scheduled for the next release
* `experimental-name` - ...

A protected branch is the branch when it might be changed only in pull request process.

We might consider to have only those two branches in the main repository. Developers should work on theirs own forks and send the changes through pull requests. Suggested names of branches for them might be like:

* Feature's branches the name is usually taken from the tasks manager like `JIRA`, for example `PROJ-234`
* Quick fixes branches `HOTFIX-PROJ-234`

#### Code review -- pull requests

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
* Duplicates - they cost time and create confusions, so overtime somebody report an issue he has to check for similar
* Reopen because of exclusive requirements
* poorly described issues

### Marketing process

In order to make a project successful you have to spend significant amount of time on marketing. Good product will not advertise for itself, even if it is the best of the best in the business area.

### Recruitment process

I have to admit I have a little experience in this subject, however I have some thoughts I'd like to share.

#### Tech people

In my opinion the success of the project is in 20% talent of the workers and the rest is a hard and dedicated work, therefore the recruiters should make sure the candidate is motivated and focused on solving the problems. A can-do attitude is only thing that is mandatory.

Another thing that has to be checked is if the candidate fits to the team. Good sense of humor and optimism is highly desirable. In case the candidate fails this step, you can still hire him and work on him, but you have to pay attention if he will not make bad influence to the team. You and the candidate can work on improving the attitude, if it will work, great, but if not you should consider to give a notice after probation period.

#### Non-tech people

I have no idea :) I will update this one when I fugure out 

### Meetings

* Career path: Pay attention to the workers and **talk to them** on regular basis. Make for each developer his own career path and create opportunities. All of them should feel important and it will help it out. Tech people earn quite a lot, so usually more money is not significant motivation for them, but possibility to grow in their area is.

Encourage team to healthy live style and help them out make it happen, give them gym-cards, award them, something it works. Try to convince them, but remember this is theirs lives, so you have no right to enforce anything in that area, just polite suggestions.

* Demo: Show the project status and gives opportunity to developers present their contribution and abilities. The meeting should be short (in my opinion no longer than 10 mins per person + extra time for answering the questions) and dense with informations. As a project manager pay attention to the questions. Pretty often they are more important than the answers. To this meetings should attend only people who are involved in and optionally executives.

* Daily stand-ups. In my opinion this kind of meetings tend to be very unproductive, especially when participants work on the same project but for different platforms or areas (marketing, software development, design ...) Just nobody is listening to things (at last don't remember for longer period of time) that don't really care about. If you are only one on your field (let say there are only you who works on iOS) you can consider make a request to your project manager to let you quit such meetings. However there might be a situation that you want to know what it going on in entire project (bacons you want to know if somebody had the same problem as you etc.), so you can look at demo slides, or look at task tracker. Another solution might be running an IM chat room for stand-ups, so it can be searched out for the things that particular person is interested in.

* After hours



## Links to resources
1. [A succesful git branching model considered harmful](https://barro.github.io/2016/02/a-succesful-git-branching-model-considered-harmful/)
1. [Gitflow considered harmful](http://endoflineblog.com/gitflow-considered-harmful)
1. [A git branching consider as cuccessful](http://nvie.com/posts/a-successful-git-branching-model/)
