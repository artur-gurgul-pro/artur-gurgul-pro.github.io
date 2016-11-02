coppied from the internet

There are plenty of advantages, and I’ll probably skip a lot of them:
* you can stop programming, and start declaring how your program needs to behave and let the computer figure out how to deal with transient state and unanticipated situations.
* you can stop reimplementing the same patterns over and over again and abstract them as operators on observable sequences. Probably the most common ones are:
retry
  * combineLatest (combine latest values of multiple stateful objects, similar to what Excel or some other spreadsheets do when calculating formulas)
  * `map` (transform sequence of values into another sequence)
  * `merge` (combine events from multiple sources into a single source)
  * flatMapLatest (automatically cancel previous async operation when next computation request arrives)
  * refCount (in case you want to download something and want to make sure that if at least somebody needs that download result, then download should continue, but if nobody needs the download result then download needs to be cancelled automatically)
  * zip (want to make N network requests, wait until they are all completed and map the result?, yep, out of the box)
* you can unify all different notification and observing mechanisms into one, e.g:
  * delegates
  * notification center notifications
  * KVO
  * Target/Action pattern.
* by using Rx you do not only chain computation results, but also computation cancellations (disposals) for free, e.g:
there are 3 places in the app that request image download, if 2 of them cancel the request, there is still somebody who needs that information, so image download will be continued
* you need to do some complex data transformations chained by async operations that can possibly fail and once the end operation is disposed, everything is disposed of automatically.
