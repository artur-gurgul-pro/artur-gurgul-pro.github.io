---
layout: page
title: Backlog
permalink: /backlog/
---

There is a list of things i want to write the articles about

# Functional programming

* prmises: https://www.youtube.com/watch?v=s6SH72uAn3Q

# Reactive programming
* RxSwift/Zip

{% highlight swift %}
let openMenu = PublishSubject<Void>()
openMenu.subscribeNext {
    print("Received signal")
}.addDisposableTo(disposeBag)

openMenu.onNext()
openMenu.onNext()
openMenu.onNext()
{% endhighlight %}

reactive programming blog
https://realm.io/news/slug-max-alexander-functional-reactive-rxswift/

# Git - tricks and tips
* rebase and magange branches
* Git interactive rebase
* squash the lastests commints

# GDC vs NSOperationQueue
* In particular how to manage sync calls
* How to cancel NSOperationQueue

# Notification center vs delegate

# Version and package managment 
Carthage vs Cocoa-pods

## branch memangment

# Working with code
* GIT
* Code review

# Release flow and CI 
* Fastlane

# Interface Builder

* Size classes
* Visual Format Language
* Empty view for padding handling
* Segue
    https://www.appcoda.com/custom-segue-animations/

# API handling best practices

* How to create a widget to use it in Interface Builder
* Auto-layouts under the hood
* Stack view, why Apple introduced such thing

# Error handling 
And How to write no errous code
* How optional's work
* throw-catch 
* Anti patterns
  https://en.wikipedia.org/wiki/Anti-pattern

# ARC vs MRC - Memory menagment
Does arc manage releases/retains in runtime or compiler cares about it

* Why all drawing has to be done on the main theread

# Generics

* `map` vs `flatMap`
  Both map and flatMap can be applied to a Stream<T> and they both return a Stream<R>. The difference is that the map operation produces one output value for each input value, whereas the flatMap operation produces an arbitrary number (zero or more) values for each input value.

# S.O.L.I.D. principles
* https://www.youtube.com/watch?v=gwIS9cZlrhk
* https://www.youtube.com/watch?v=TMuno5RZNeE

# Design patterns
* Repository pattern: https://www.youtube.com/watch?v=rtXpYpZdOzM
* Mixin: https://pypi.python.org/pypi/mixin/1.1

# Dependency injections
https://www.youtube.com/watch?v=RVpADaFIlRw

# Swift syntax and useful snippsets
* typealias StringDictionary<Value> = Dictionary<String, Value>
* returning bloks: 

{% highlight swift %}
func someFunction(a: inout Int) -> () -> Int {
    return { [a] in return a + 1  }
}
{% endhighlight %}

## `@infix`

* https://github.com/apple/swift/tree/master/docs

* https://github.com/apple/swift-protobuf/

# keyboard handling
* Handling keyboard with `scrollView.keyboardDismissMode = .Interactive`
  * http://stackoverflow.com/questions/30042352/dismiss-keyboard-with-swipe-gesture 
  * http://stackoverflow.com/questions/24634795/keyboard-handling-just-like-in-messages-app-in-ios-7

# VIPER
* https://www.objc.io/issues/13-architecture/viper/

# Unix - command line tools

## Networking 
`dig artgur.net +nostats +nocomments +nocmd`

## interface builder
* https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/AutolayoutPG/ModifyingConstraints.html#//apple_ref/doc/uid/TP40010853-CH29-SW1

## Links to browse

* https://love2d.org/
* http://www.monkey-x.com/
* https://en.wikipedia.org/wiki/YAML

## iOS - Architectural design patterns
* https://medium.com/ios-os-x-development/ios-architecture-patterns-ecba4c38de52#.i1b1ttas5
* https://ghotiphud.github.io/design/2016/06/26/factoring-code-what-and-when.html
* https://yoichitgy.github.io/post/dependency-injection-in-mvvm-architecture-with-reactivecocoa-part-1-introduction/

# General design patterns
* creational
* structural
* behavioral

## Work organization - how to make stuff done
* https://medium.freecodecamp.com/live-asynchronously-c8e7172fe7ea#.bn0vyq31h

# Memory tricks and how to learn fast
* https://www.youtube.com/watch?v=eVajQPuRmk8
* Copy on write

# Vim as an IDE 

* https://github.com/xmementoit/vim-ide
* http://vimawesome.com/
* http://stackoverflow.com/questions/1218390/what-is-your-most-productive-shortcut-with-vim#answer-1220118
* https://www.youtube.com/watch?v=6Fn8KS2L7EQ - vim plugins
  * https://www.youtube.com/watch?v=2ME-aqoUpaU
  * https://www.youtube.com/watch?v=vMAeYp8mX_M
  * https://www.youtube.com/watch?v=wh_WGWii7UE
  * https://www.youtube.com/watch?v=3TX3kV3TICU
* https://github.com/easymotion/vim-easymotion

* Execute script in background on save
* wite file when editin without command `:w`

## RxSwift

let arrayOfObservables: [Observable<E>] = ...
let singleObservable: Observable<E> = arrayOfObservables.toObservable().merge()
let wholeSequence: Observable<[E]> = singleObservable.toArray()
{% highlight swift %}
timr = Timer(fireDate: when, interval: 0, repeats: false) {
    print("Time to go")
}
RunLoop.main.add(timer, forMode: .commonModes)
{% endhighlight %}

## Mocking and testing
* OCMock
* http://www.hpique.com/2013/12/nsnotificationcenter-part-3/
* http://stackoverflow.com/questions/26918593/unit-testing-http-traffic-in-alamofire-app
* https://en.wikipedia.org/wiki/Integration_testing
* https://en.wikipedia.org/wiki/Software_testing
* Self-testing code

# unclassified 
* https://yoichitgy.github.io/post/dependency-injection-in-mvvm-architecture-with-reactivecocoa-part-1-introduction/
* https://github.com/square/Cleanse
* https://github.com/Swinject/SwinjectMVVMExample
* https://github.com/Wolg/awesome-swift
* https://developer.apple.com/swift/blog/
* https://developer.apple.com/videos/play/wwdc2016/207/

# Make Android swifty
* https://github.com/Ecco/HelloSwift/blob/master/jni/hello-swift.c

# overview of programming languages
* Paradigms
  * https://en.wikipedia.org/wiki/Comparison_of_programming_paradigms
  * https://pl.wikipedia.org/wiki/Programowanie_obiektowe
  * https://en.wikipedia.org/wiki/Imperative_programming
  * https://en.wikipedia.org/wiki/Programming_paradigm
* Speed test bunch mark

# Favourite list of libraries 
* https://github.com/Hearst-DD/ObjectMapper
* https://github.com/jessesquires/JSQMessagesViewController
* https://cocoapods.org/pods/QMChatViewController
* https://github.com/layerhq/Atlas-iOS
* NERDTreeToggle
* https://github.com/Moya/Moya

# Productivity and time managment
* Robienie notatek (takze z otaczajacych rozmow)
* Zarządzanie kalendarzem i planowanie czasu
* Zarządzanie kontaktami
* Organizacja emaili
* Apple style of talk presentation

## Static webpages
* https://gohugo.io/
* http://jekyllrb.com/
* http://mashable.com/2014/08/28/static-website-generators/#QS4BGTmNEkq6
* http://charliepark.org/tags-in-jekyll/
* https://github.com/pattex/jekyll-tagging
* Implement skin like markdown from github
  * https://github.com/johnotander/pixyll
* https://help.github.com/articles/using-jekyll-as-a-static-site-generator-with-github-pages/

spisac liste rzeczy jakie chce sie nauczyc

# Sorting

# Data structures 

# form of the blog
Things you need to know about the subject

# How to work with people
look for books described how to analise what people say

# psychology - the things you might to know

# MongoDB and noSQL databases

# SQL Databases

# Books that must to read

https://www.amazon.co.uk/Cloud-Computing-Patterns-Fundamentals-Applications/dp/3709115671/ref=sr_1_61?s=books&ie=UTF8&qid=1476275288&sr=1-61
https://www.amazon.co.uk/Agile-Testing-Practical-Addison-Wesley-Signature/dp/0321534468/ref=sr_1_54?s=books&ie=UTF8&qid=1476275288&sr=1-54
https://www.amazon.co.uk/Enterprise-Integration-Patterns-Designing-Addison-Wesley/dp/0321200683/ref=sr_1_47?s=books&ie=UTF8&qid=1476275235&sr=1-47
https://www.amazon.co.uk/Functional-Programming-Scala-Paul-Chiusano/dp/1617290653/ref=sr_1_46?s=books&ie=UTF8&qid=1476275235&sr=1-46
https://www.amazon.co.uk/Agile-Product-Management-Scrum-Addison-Wesley/dp/0321605780/ref=sr_1_45?s=books&ie=UTF8&qid=1476275235&sr=1-45
https://www.amazon.co.uk/Refactoring-Improving-Design-Existing-Technology/dp/0201485672/ref=sr_1_29?s=books&ie=UTF8&qid=1476275191&sr=1-29
https://www.amazon.co.uk/Dependency-Injection-Microsoft-patterns-practices/dp/1621140288/ref=sr_1_4?ie=UTF8&qid=1476274320&sr=8-4&keywords=dependency+injection
https://www.amazon.co.uk/Adaptive-Code-via-patterns-principles/dp/0735683204/ref=sr_1_3?ie=UTF8&qid=1476274320&sr=8-3&keywords=dependency+injection
https://www.amazon.co.uk/Professional-Test-Driven-Development-Applications/dp/047064320X/ref=pd_sim_14_6?ie=UTF8&psc=1&refRID=Q3REZT5NTR3DZKH9JC9X
https://www.amazon.co.uk/Principles-Patterns-Practices-Robert-Martin/dp/0131857258/ref=pd_sim_14_7?ie=UTF8&psc=1&refRID=Y34PRRVYFY36WQD41QGC
https://www.amazon.co.uk/Cracking-Coding-Interview-6th-Programming/dp/0984782850/ref=lp_14159921_1_1?s=books&ie=UTF8&qid=1476274907&sr=1-1
https://www.amazon.co.uk/Clean-Code-Handbook-Software-Craftsmanship/dp/0132350882/ref=lp_14159921_1_3?s=books&ie=UTF8&qid=1476274907&sr=1-3
https://www.amazon.co.uk/Agile-Estimating-Planning-Robert-Martin/dp/0131479415/ref=sr_1_38?s=books&ie=UTF8&qid=1476275235&sr=1-38
https://www.amazon.co.uk/Kanban-Successful-Evolutionary-Technology-Business/dp/0984521402/ref=sr_1_77?s=books&ie=UTF8&qid=1476276055&sr=1-77
https://www.amazon.co.uk/Extreme-Programming-Explained-Embrace-Change/dp/0321278658/ref=sr_1_78?s=books&ie=UTF8&qid=1476276055&sr=1-78
https://www.amazon.co.uk/Agile-Software-Requirements-Enterprise-Development/dp/0321635841/ref=pd_bxgy_14_img_2?ie=UTF8&psc=1&refRID=K9RNXDSM4SFPS1N1FR7P

https://www.amazon.co.uk/Building-Microservices-Sam-Newman/dp/1491950358/ref=lp_14159921_1_4?s=books&ie=UTF8&qid=1476274907&sr=1-4
https://www.amazon.co.uk/Software-Engineering-Ian-Sommerville/dp/1292096136/ref=lp_14159921_1_7?s=books&ie=UTF8&qid=1476274907&sr=1-7
https://www.amazon.co.uk/Site-Reliability-Engineering-Production-Systems/dp/149192912X/ref=lp_14159921_1_10?s=books&ie=UTF8&qid=1476274907&sr=1-10
https://www.amazon.co.uk/Jira-7-Development-Cookbook-Third-ebook/dp/B01BFD2Z3U/ref=sr_1_64?s=books&ie=UTF8&qid=1476275288&sr=1-64

???
https://www.amazon.co.uk/Continuous-Delivery-Deployment-Automation-Addison-Wesley/dp/0321601912/ref=lp_14159921_1_9?s=books&ie=UTF8&qid=1476274907&sr=1-9
https://www.amazon.co.uk/Founders-Work-Stories-Startups-Problem-Solution/dp/1430210788/ref=sr_1_66?s=books&ie=UTF8&qid=1476276055&sr=1-66
https://www.amazon.co.uk/Agile-Application-Security-Enabling-Continuous/dp/1491938846/ref=sr_1_67?s=books&ie=UTF8&qid=1476276055&sr=1-67
https://www.amazon.co.uk/Principles-Product-Development-Flow-Generation/dp/1935401009/ref=pd_sim_14_4?ie=UTF8&psc=1&refRID=XZBZW2GG0MYG6M0V19V2

Software Design, Testing & Engineering
https://www.amazon.co.uk/s/ref=sr_pg_6?rh=n%3A266239%2Cn%3A%211025612%2Cn%3A71%2Cn%3A269678%2Cn%3A14159921&page=6&ie=UTF8&qid=1476276055

https://www.amazon.co.uk/Writing-Effective-Crystal-Software-Development/dp/0201702258/ref=sr_1_89?s=books&ie=UTF8&qid=1476276107&sr=1-89
https://www.amazon.co.uk/Mastering-Requirements-Process-Getting-Right/dp/0321815742/ref=sr_1_97?s=books&ie=UTF8&qid=1476276481&sr=1-97
https://www.amazon.co.uk/Management-3-0-Developers-Developing-Addison-Wesley/dp/0321712471/ref=sr_1_100?s=books&ie=UTF8&qid=1476276481&sr=1-100
https://www.amazon.co.uk/Software-Engineering-Practitioners-Approach-Intl/dp/1259253155/ref=sr_1_99?s=books&ie=UTF8&qid=1476276481&sr=1-99
https://www.amazon.co.uk/BDD-Action-Behavior-driven-development-lifecycle/dp/161729165X/ref=sr_1_102?s=books&ie=UTF8&qid=1476276481&sr=1-102
https://www.amazon.co.uk/Docker-Action-Jeff-Nickoloff/dp/1633430235/ref=sr_1_105?s=books&ie=UTF8&qid=1476276481&sr=1-105
https://www.amazon.co.uk/Pro-Git-Scott-Chacon/dp/1484200772/ref=sr_1_104?s=books&ie=UTF8&qid=1476276481&sr=1-104
https://www.amazon.co.uk/Think-Like-Programmer-Introduction-Creative/dp/1593274246/ref=sr_1_143?s=books&ie=UTF8&qid=1476276707&sr=1-143
https://www.amazon.co.uk/Thinking-Science-Decision-Making-Problem-Solving-Prediction/dp/0062258540/ref=sr_1_4?s=books&ie=UTF8&qid=1476276780&sr=1-4&keywords=problem+solving

https://www.amazon.co.uk/REST-Practice-Hypermedia-Systems-Architecture/dp/0596805829/ref=sr_1_146?s=books&ie=UTF8&qid=1476276831&sr=1-146
https://www.amazon.co.uk/Functional-Programming-Java-Harnessing-Expressions/dp/1937785467/ref=sr_1_148?s=books&ie=UTF8&qid=1476276831&sr=1-148
https://www.amazon.co.uk/Programming-Language-Pragmatics-Michael-Scott/dp/0124104096/ref=sr_1_150?s=books&ie=UTF8&qid=1476276831&sr=1-150
https://www.amazon.co.uk/Software-Requirements-Developer-Best-Practices/dp/0735679665/ref=sr_1_152?s=books&ie=UTF8&qid=1476276831&sr=1-152
https://www.amazon.co.uk/Your-Code-Crime-Scene-Bottlenecks/dp/1680500384/ref=sr_1_178?s=books&ie=UTF8&qid=1476276969&sr=1-178
https://www.amazon.co.uk/Regular-Expression-Pocket-Reference-Expressions/dp/0596514271/ref=sr_1_185?s=books&ie=UTF8&qid=1476276969&sr=1-185
https://www.amazon.co.uk/Advanced-Software-Testing-Certification-Analyst/dp/1937538680/ref=sr_1_193?s=books&ie=UTF8&qid=1476277025&sr=1-193
https://www.amazon.co.uk/Advanced-Software-Testing-Certification-Manager/dp/1937538508/ref=sr_1_194?s=books&ie=UTF8&qid=1476277025&sr=1-194
https://www.amazon.co.uk/Software-Product-Line-Engineering-Foundations/dp/3540243720/ref=sr_1_211?s=books&ie=UTF8&qid=1476277066&sr=1-211
https://www.amazon.co.uk/Jenkins-Definitive-John-Ferguson-Smart/dp/1449305350/ref=sr_1_226?s=books&ie=UTF8&qid=1476277087&sr=1-226
https://www.amazon.co.uk/xUnit-Test-Patterns-Refactoring-Signature/dp/0131495054/ref=sr_1_237?s=books&ie=UTF8&qid=1476277087&sr=1-237
