---
layout: post
title:  "My links"
categories: notes
---
Project with custom language

https://webkit.org/wpe/
https://forums.swift.org/t/ast-a-small-repo-to-build-abstract-syntax-trees/68214

Swift AST
https://github.com/yanagiba/swift-ast
https://swift-ast-explorer.com/




// Alternative

// https://reactnavigation.org/docs/link/

// import { Link } from '@react-navigation/native'




https://learn.opengeoedu.de/en/opendata/vorlesung/freiwillig-erhobene-daten/openstreetmap/datenmodell
https://2018.stateofthemap.org/2018/T107-Modding_the_OSM_Data_Model/
https://en.wikipedia.org/wiki/GNU_Multiple_Precision_Arithmetic_Library

https://en.wikipedia.org/wiki/List_of_arbitrary-precision_arithmetic_software

	Math.sin(Math.PI).toFixed(3)

``` plain https://v8.dev/features/bigint
➜  maps git:(main) ✗ node
Welcome to Node.js v22.0.0.
Type ".help" for more information.
> 123n
123n
> 123n + 34n
```


slonik library for postgress connection
https://www.npmjs.com/package/slonik/v/18.11.1#slonik-recipes-using-sql-raw-to-generate-dynamic-queries


		`insert into "users"("role", "email")
			values ('admin', 'artur.gurgul@onmenu.app')
			returning *`
		
		SELECT ARRAY[1,2] || ARRAY[3,4];


		create table "venues" (
			"staff" bigint[] default '{}'
	);
	insert into "venues"("business_name", "owner", "menu", "staff") values 
	  ('Pijalnie piwa i wódki', 1, '["fg"]', '{1}')
	returning *;


https://developer.apple.com/documentation/metal/performing_calculations_on_a_gpu

```javascript
const fs = require('fs');
const bz2 = require('unbzip2-stream');
const tarfs = require('tar-fs');

fs.createReadStream('foo.tar.bz2').pipe(bz2()).pipe(tarfs.extract('data'));
```

```ts

import { MenuItem } from '../shared/menu';
import DI from './di';

declare module '../shared/models' {

	export interface MenuItem {
	
		priceString(): string
	
		getAmount(): number | null
	
	}
}

MenuItem.prototype.priceString = function() {

	if (Array.isArray(this.price)) {
	
		return this.price.map((p: Number)=>`${p}zł`).join(' / ')
	
	} else {
	
		return `${this.price}zł`
	
	}

}

  

MenuItem.prototype.getAmount = function() {

	return DI.bag.menuClient.getAmountForMenuItem(this)

}
```

diskutil list
sudo diskutil eraseDisk ExFAT "WIN11" GPT /dev/disk18
hdiutil mount Win11_23H2_EnglishInternational_x64v2.iso
rsync -ahv --progress /Volumes/CCCOMA_X64FRE_EN-GB_DV9/* /Volumes/WIN11


// https://www.assemblyscript.org/introduction.html#from-a-webassembly-perspective

// https://www.freecodecamp.org/news/postgresql-and-json-use-json-data-in-postgresql/
https://node-postgres.com/apis/pool





```json
//import * as XmlStream from 'xml-stream'
const XmlStream = require("xml-stream")

//import { request } from 'http'
const {request} = require('http')

//import { createWriteStream, createReadStream } from 'fs'
const { createWriteStream, createReadStream } = require('fs')

//const xmlFileReadStream = request('http://external.path/to/xml')

const xmlFileReadStream = createReadStream('../map.osm')
const xmlFileWriteStream = new XmlStream(xmlFileReadStream)

//const databaseWriteStream = createWriteStream('/path/to/file.csv')

xmlFileWriteStream.on('endElement: node', (o) =>
	//databaseWriteStream.write(`"${name}","${phone}","${age}"\n`)
	console.log(o)
)

//xmlFileWriteStream.on('end', () => databaseWriteStream.end())
```





https://hg.sr.ht/~scoopta/wofi
https://github.com/sjiveson/nfs-server-alpine
https://www.passwordstore.org/
transimission-cli
https://www.freecodecamp.org/news/fzf-a-command-line-fuzzy-finder-missing-demo-a7de312403ff/

setup https://github.com/djpohly/dwl


[Raywenderlich article](https://www.raywenderlich.com/60749/grand-central-dispatch-in-depth-part-1)
3. [This answer says that "`NSOperationQueue` does use GCD on iOS 4.0 and later"](http://stackoverflow.com/questions/7078658/operation-queue-vs-dispatch-queue-for-ios-application)
4. [[1]](https://www.raywenderlich.com/76341/use-nsoperation-nsoperationqueue-swift)
4. [Nice article that TODO: look at examples from the picture](http://www.appcoda.com/ios-concurrency/)
5. [https://github.com/redox-os/ion.git](https://github.com/redox-os/ion.git)
6. https://medium.com/sudo-by-icalia-labs/ios-architecture-mvvm-c-introduction-1-6-815204248518
7.  https://github.com/JohnSundell/Plot
8. interesujące playgroundy: https://github.com/JohnSundell/SwiftBySundell/tree/master/Basics


https://betterprogramming.pub/swiftui-architecture-a-complete-guide-to-mv-pattern-approach-5f411eaaaf9e
https://medium.com/@vladislavshkodich/architectures-comparing-for-swiftui-6351f1fb3605
https://nalexn.github.io/clean-architecture-swiftui/
https://swiftbysundell.com/articles/swiftui-views-versus-modifiers/
https://swiftbysundell.com/
https://www.swiftbysundell.com/tips/making-async-tests-faster-and-more-stable/
https://medium.com/@almalehdev/you-dont-always-need-weak-self-a778bec505ef
https://martiancraft.com/blog/2018/08/Implementing-custom-key-strategy-for-coding-types/
https://gist.github.com/chiliec/8e431fbf98228b561a98e06ce2f6a439
https://www.launchd.info/
https://en.wikipedia.org/wiki/Null_(SQL)#BOOLEAN_data_type
https://stackoverflow.com/questions/2030863/in-functional-programming-what-is-a-functor
https://stackoverflow.com/questions/36463278/combine-python-thread-results-into-one-list
https://www.datacamp.com/tutorial/git-reset-revert-tutorial
https://www.marcosantadev.com/mvvmc-with-swift/
https://refactoring.guru/design-patterns/swift

https://chat.openai.com/c/4a6f42d5-011e-40a9-b184-3d344ed3ef0d
https://manishpathak99.medium.com/swift-combine-framework-in-nutshell-e451b9a5dbb7
https://alejandromp.com/blog/a-runloop-for-your-swift-script/
https://khorbushko.github.io/article/2020/11/29/runloop-in-depth.html
https://www.avanderlee.com/combine/runloop-main-vs-dispatchqueue-main/
https://developer.apple.com/documentation/foundation/runloop
https://stackoverflow.com/questions/56724566/runloop-vs-dispatchqueue-as-scheduler
https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/Multithreading/RunLoopManagement/RunLoopManagement.html
https://bharath-ns99.medium.com/runloop-internals-by-example-ed626c454a37
https://copyprogramming.com/howto/instantiate-a-background-runloop-in-ios
https://developer.apple.com/documentation/dispatch/dispatchsource
https://developer.apple.com/documentation/dispatch/dispatchobject
https://www.swiftbysundell.com/articles/swift-actors/
https://www.donnywals.com/what-are-sendable-and-sendable-closures-in-swift/
https://vim.fandom.com/wiki/Using_tab_pages
https://theswiftdev.com/the-swift-compiler-for-beginners/
https://eleni.mutantstargoat.com/hikiko/wpe/
https://trac.webkit.org/wiki/BuildingGtk
https://trac.webkit.org/wiki/WPE#WPEWebKit
https://stackoverflow.com/questions/7311435/how-do-i-embed-webkit-in-a-window
https://stackoverflow.com/questions/9618678/using-webkit-for-a-desktop-application
https://operavps.com/docs/secure-nginx-on-debian/
https://luppeng.wordpress.com/2021/08/07/create-and-install-ssl-certificates-for-postgresql-database-running-locally/
https://pavelevstigneev.medium.com/postgresql-ssl-with-letsencrypt-b53051eacc22
https://medium.com/coding-blocks/creating-user-database-and-adding-access-on-postgresql-8bfcd2f4a91e
https://stackoverflow.com/questions/69676009/psql-error-connection-to-server-on-socket-var-run-postgresql-s-pgsql-5432
https://www.howtoforge.com/how-to-enable-ssl-for-postgresql-connections/
https://dev.to/yugabyte/how-to-enable-ssl-for-postgres-connections-5321
https://github.com/leaningtech
https://www.avanderlee.com/swift/sendable-protocol-closures/
https://www.kodeco.com/28540615-grand-central-dispatch-tutorial-for-swift-5-part-1-2
https://www.toptal.com/swift/wrappers-swift-properties
https://medium.com/@ranga.c222/property-wrapper-swift-6b9d12cb5194
https://forums.swift.org/t/why-does-this-property-wrapper-code-compile/31931
https://sarunw.com/posts/what-is-property-wrappers-in-swift/#property-wrapper
https://www.reddit.com/r/webdev/comments/nvzhi0/flexbox_css_cheat_sheet/

https://medium.com/@rahulsinghrajawat/dispatchsemaphore-in-swift-43d888d3724b
https://www.cocoawithlove.com/blog/2016/06/02/threads-and-mutexes.html
https://rderik.com/blog/multithreading-with-pthreads-in-swift/
https://developer.apple.com/documentation/uikit/nsmutableparagraphstyle
https://developer.apple.com/library/archive/documentation/General/Conceptual/ConcurrencyProgrammingGuide/OperationQueues/OperationQueues.html
https://llvm.org/devmtg/2022-11/slides/TechTalk3-ClangClang-WebAssembly.pdf

https://stackoverflow.com/questions/41660514/pulling-from-specific-subfolders-using-for-post-in-site-posts
https://sentry.io/answers/is-there-a-css-parent-selector/
https://medium.com/sudo-by-icalia-labs/ios-architecture-mvvm-c-introduction-1-6-815204248518
https://www.gnu.org/software/emacs/manual/html_node/emacs/Regexps.html
https://stackoverflow.com/questions/6710555/how-to-use-qemu-to-run-a-non-gui-os-on-the-terminal
https://www.appcoda.com/ios-concurrency/
https://www.kodeco.com/5293-operation-and-operationqueue-tutorial-in-swift
https://www.mikeash.com/pyblog/friday-qa-2017-10-27-locks-thread-safety-and-swift-2017-edition.html
https://paigeshin1991.medium.com/swift-combine-changing-threads-as-you-want-3-common-sense-you-must-know-bb170b279374
https://sarunw.com/posts/different-ways-to-catch-throwing-errors-in-swift/#mix-and-match
https://swiftinit.org/docs/swift/foundation/runloop
https://fabernovel.github.io/2021-01-04/uikit-rendering-part-3
https://bou.io/RunRunLoopRun.html
https://suelan.github.io/2021/02/13/20210213-dive-into-runloop-ios/
https://wiki.gnome.org/Initiatives/Wayland/GTK%2B
https://developer.apple.com/documentation/foundation/jsondecoder/keydecodingstrategy/custom
https://stackoverflow.com/questions/54697382/decodable-keydecodingstrategy-custom-handling-for-dictionaries
https://benoitpasquier.com/weak-self-story-memory-management-closure-swift/
https://www.donnywals.com/understanding-combines-publishers-and-subscribers/
https://www.kodeco.com/books/combine-asynchronous-programming-with-swift/v2.0/chapters/2-publishers-subscribers
https://www.vadimbulavin.com/understanding-schedulers-in-swift-combine-framework/
https://www.avanderlee.com/combine/passthroughsubject-currentvaluesubject-explained/
https://holyswift.app/swift-and-combine-which-thread-runs-my-sink-closure/
https://docs.github.com/en/codespaces/the-githubdev-web-based-editor
https://forums.swift.org/t/pitch-destructuring-assignment-of-structs-and-classes/51593/6
https://blog.devgenius.io/learn-combine-by-code-55e661a5256c
https://www.w3schools.com/charsets/ref_utf_arrows.asp
https://www.educative.io/answers/how-to-apply-style-to-parent-if-it-has-a-child-with-css
https://developer.apple.com/documentation/dispatch/1452864-dispatch_group_async_f
https://developer.apple.com/documentation/combine/publisher
https://www.hackingwithswift.com/quick-start/concurrency/whats-the-difference-between-async-let-tasks-and-task-groups
https://www.appypie.com/promises-swift-how-to
https://developer.mozilla.org/en-US/docs/Web/CSS/box-sizing
https://wojciechkulik.pl/ios/redux-architecture-and-mind-blowing-features

https://www.avanderlee.com/
https://github.com/uber/RIBs
https://medium.com/@vladislavshkodich/architectures-comparing-for-swiftui-6351f1fb3605
https://medium.com/mackmobile/getting-started-with-redux-in-swift-54e00f323e2b


       -- --slurp json lines, each line correct json
       cat kato.json | jq -sc
       
       -- no new lines allowed
       \copy json_table FROM PROGRAM 'jq --stream -nc -f myfile.json';


```sql
-- https://medium.com/@ValentinMouret/batch-inserts-in-postgresql-1b65f083fdc
copy batch_user (id, document)
	from '/Users/valentinmouret/Desktop/users.csv'
	with (format 'csv',
		  header,
		  delimiter ',');   
```


odwrotna rzecz:

```json data1.json
[ 
{ "id":"1", 
  "metadata":{"version":"1.0","author":"user1"}
},
{ "id":"2", 
  "metadata":{"version":"1.0","author":"user2","timestamp":"2019-02-05"}
},
{ "id":"3", 
  "metadata":{"version":"1.0","author":"user3","price":"10.0"}
}]
```

```bash
$ jq -c '.[] | .metadata' data1.json
{"version":"1.0","author":"user1"}
{"version":"1.0","author":"user2","timestamp":"2019-02-05"}
{"version":"1.0","author":"user3","price":"10.0"}
```

### React native

```tsx

{device != null && (

	<Camera
		style={styles.camera}
		device={device}
		isActive={isActive}
		codeScanner={codeScanner}
		torch={torch ? 'on' : 'off'}
		onError={handleCameraError}
		enableZoomGesture={true}
/>)}

```


```python
class Swim:
    def swim(self):
        print('swim')

def car_init(self, brand):
    self.brand = brand

def drive(self):
    print(f'{self.brand} drive')

Car = type('Car', (), {
    '__init__': car_init,
    'drive': drive
})

car = Car('test')

car.drive()
# car.swim()
```




```ruby
project '1Nozbe', {
  'iOS 1 Dev Debug' => :debug,
  'iOS 2 Dev AdHoc' => :release,
  'iOS 3 Release Debug' => :debug,
  'iOS 4 Release AdHoc' => :release,
  'iOS 5 Release AppStore' => :release,
}
```

```ruby
 use_react_native!(
    :path => config[:reactNativePath],
    :hermes_enabled => true,
    :flipper_configuration => FlipperConfiguration.enabled(['DevDebug','ProdDebug','DevRelease', 'ProdRelease']),
    :app_path => "#{Pod::Config.instance.installation_root}/.."
  )
```

```ruby
require_relative '../node_modules/react-native/scripts/react_native_pods'
require_relative '../node_modules/@react-native-community/cli-platform-ios/native_modules'

platform :ios, '10.0'

project 'Project',
  'Staging.Debug' => :debug,
  'Staging.Release' => :release,
  'Production.Debug' => :debug,
  'Production.Release' => :release

target 'Project' do
  config = use_native_modules!

  use_react_native!(:path => config["reactNativePath"])

  # STRIPE
  pod 'Stripe', '~> 19.0.1'
  pod 'tipsi-stripe', :path => '../node_modules/tipsi-stripe'

  # PERMISSIONS
  permissions_path = '../node_modules/react-native-permissions/ios'
  pod 'Permission-LocationAlways', :path => "#{permissions_path}/LocationAlways.podspec"
  pod 'Permission-Notifications', :path => "#{permissions_path}/Notifications.podspec"

  target 'ProjectTests' do
    inherit! :complete
    # Pods for testing
  end

  # Enables Flipper.
  #
  # Note that if you have use_frameworks! enabled, Flipper will not work and
  # you should disable these next few lines.
  use_flipper!
  post_install do |installer|
    flipper_post_install(installer)
  end
end
```


```sh
python3 -m venv env
source env/bin/activate
python3 -m pip install msoffcrypto-tool
```
 