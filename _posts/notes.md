[Raywenderlich article](https://www.raywenderlich.com/60749/grand-central-dispatch-in-depth-part-1)
3. [This answer says that "`NSOperationQueue` does use GCD on iOS 4.0 and later"](http://stackoverflow.com/questions/7078658/operation-queue-vs-dispatch-queue-for-ios-application)
4. [[1]](https://www.raywenderlich.com/76341/use-nsoperation-nsoperationqueue-swift)
4. [Nice article that TODO: look at examples from the picture](http://www.appcoda.com/ios-concurrency/)




ION as default shell git clone [https://github.com/redox-os/ion.git](https://github.com/redox-os/ion.git)

chroot ./ env -i PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

Creating chroot

```shell
sudo visudo
```

```
artur ALL=(ALL) chroot /path/to/chroot-env
```



https://medium.com/sudo-by-icalia-labs/ios-architecture-mvvm-c-introduction-1-6-815204248518