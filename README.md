Codepath Student App (iOS)
==========================

[![Build Status](https://travis-ci.org/azoff/StudentApp.svg)][15]

This is the codebase for the Codepath Student App. The application is mostly composed of [swift][1] code, making the
codebase *very* expirimental. As a result, this app will be rejected from the app store until iOS8 ships. All imports
and libraries are coded manually, mainly as a side-effect of the nacency of swift.

Project Layout
--------------
This project has the following directory structure:

- __/Frameworks__ Third-party libraries (e.g. [Parse][2])
- __/Products__ Virtual folder, holds compiled binaries
- __/StudentApp__ The main source code folder for the app
- __/StudentAppTests__ Tests for the app, coming soon
- __/Submodules__ Third-party repositories of swift or objC code
- __/Travis__ Scripts [for continuous integration testing][14]

Running the App
-----------------
To compile and run the app, you'll need to download [the latest XCode beta][3]. Double click [the project 
file][13] and wait for XCode to open it up. Have XCode build and run the project for you (Product > Run); you should
see the simulator start up. That's it!

Contributing
------------
Contributing follows a standard github workflow:

- Pick [an issue][7] to solve
- Assign the ticket to your self
- Locally, create a feature or bug branch
  + Make sure to branch off of master, i.e. master is upstream
  + Prefer branches that named after the ticket they solve, e.g. 54-bug-header
- Implement the feature, or fix the bug
  + Make sure to stick with the [standard conventions][11]
- After you're all done working, rebase the branch into a single deliverable
  + If you're uncomfortable with this, just move to the next step and I'll do it. It'll just help your patch to get in 
    quickly.
  + The philosophy is outlined [in this great walkthrough][8]
- Now push your rebased branch to github
  + You may push to the official repo, or you may fork your own
  + If you push to the official repo, take care not to push to master!
- Finally, you can [submit a pull request][9] for your branch
  + Extra points for [referencing the ticket number in the pull request][12]
  + Still need help? Here's [github's official docs][10]
- I'll get around to reviewing the pull request when I can.
  + Github will notify you when the patch is successfully merged in 

Conventions
-----------
In the perpetual pursuit of balancing pragmatisim with facisim, I'll try to keep this short:

- Stick with the folder structure. If a file looks like it should go somewhere new- ask!
- Stick with the tickets. If a ticket doesn't exist, create one! All branches should reference a ticket.
- Small commits are good. However, always try to rebase+squash before submitting a pull request
- Prefer tabs to spaces in the main source code: visual tab size is configurable, spaces are not.
- CamelCase seems like the convention in Swift, stick with it.
- When in doubt, try to emulate how Apple would code it. It won't be pretty, but at least we'll get it.

Troubleshooting
---------------
[Swift][1] is very new, and the builtin API is in flux. As a result, you can expect bugs in XCode and very little help
in the way of documentation. For instance, as of XCode 6 beta 6, the [syntax highlighter chokes on this project][4]. There
is very little recourse, even [in the public domain][5], for dealing with this issue. As a result, I'm doing most of my
coding in [AppCode 3][6], and using XCode only when I need to. It's not perfect, but its certainly better than the 
alternative. If you're having a similar issue, or any other issue for that matter, just add a ticket on [the official
tracker][7], and I'll get to it as soon as I can.

[1]:http://swift-lang.org/main/
[2]:https://parse.com/
[3]:https://developer.apple.com/xcode/downloads/
[4]:http://cl.ly/image/1U0r2E1v0u0R
[5]:http://stackoverflow.com/questions/24063055/error-xcode-6-error-sourcekit-terminated-editor-functionality-temporarily-l
[6]:http://www.jetbrains.com/objc/
[7]:https://github.com/azoff/StudentApp/issues
[8]:https://github.com/edx/edx-platform/wiki/How-to-Rebase-a-Pull-Request#squash-your-changes-optional
[9]:https://github.com/azoff/StudentApp/pulls
[10]:https://help.github.com/articles/using-pull-requests
[11]:https://github.com/azoff/StudentApp#conventions
[12]:https://help.github.com/articles/closing-issues-via-commit-messages
[13]:StudentApp/StudentApp.xcodeproj
[14]:http://blog.thepete.net/blog/2013/05/07/using-travis-ci-and-xctool-to-build-and-test-ios/
[15]:https://travis-ci.org/azoff/StudentApp