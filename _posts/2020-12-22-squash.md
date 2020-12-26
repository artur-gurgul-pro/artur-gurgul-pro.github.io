---
layout: post
title:  "Git - squasing commits"
date:   2020-12-22 12:09:07 +0200
categories: git
---

In this post I will despcibe how to change git history and make history looking better. First thing we want to do is to make history as much linear as possible, so it is easier to keep track of changes. We can achieve this by rebase. 

{% highlight bash %}
git rebase feature-branch
{% endhighlight %}

After this command, `feature-branch` will move all commits atop the branch it's comes from.

Adding `-i` parameter we have posibility to squash and chnage messages of commiits.

{% highlight bash %}
git rebase -i HEAD~3
{% endhighlight %}

This command takes three last commits and ask us what to do with them by opeining the default editor with file like the one presented below. 

{% highlight bash %}
pick f392171 Added new feature X
pick ba9dd9a Added new elements to page design
pick df71a27 Updated CSS for new elements
{% endhighlight %}

`pick` mean that the commit will be taken, but we can replace this with squash commit, which means two or more commits will be merged. See an exaple below.

{% highlight plaintext %}
pick f392171 New message for this three commit!
squash ba9dd9a
squash df71a27
{% endhighlight %}

Now we can accept the change by continuing the rebase:

{% highlight bash %}
git rebase --continue
{% endhighlight %}

After that we can push the changes to the remote. Pretty often we have to force overriding using this command:

{% highlight bash %}
git push origin master --force
{% endhighlight %}

## Squash merge

In oder to keep history clean sometimes we want to merge our changes on feature branch another branch into main branch as single commit, and we can do this as below:

{% highlight bash %}
git checkout master
git merge --squash bugfix
git commit
{% endhighlight %}




