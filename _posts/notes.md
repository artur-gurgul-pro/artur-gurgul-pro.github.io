[Raywenderlich article](https://www.raywenderlich.com/60749/grand-central-dispatch-in-depth-part-1)
3. [This answer says that "`NSOperationQueue` does use GCD on iOS 4.0 and later"](http://stackoverflow.com/questions/7078658/operation-queue-vs-dispatch-queue-for-ios-application)
4. [[1]](https://www.raywenderlich.com/76341/use-nsoperation-nsoperationqueue-swift)
4. [Nice article that TODO: look at examples from the picture](http://www.appcoda.com/ios-concurrency/)




// Extend pthread
**var** attrs = pthread_attr_t()

        **let** qos = pthread_attr_set_qos_class_np(&attrs, QOS_CLASS_USER_INTERACTIVE, 0)