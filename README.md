Credits
------------

StratiFi PRISM API Documentation is created with [Slate](https://github.com/lord/slate). Head over to their GitHub page for more details. 

Getting Started with Slate
------------------------------

### Prerequisites

You're going to need:

 - **Linux or OS X** — Windows may work, but is unsupported.
 - **Ruby, version 2.3.1 or newer**
 - **Bundler** — If Ruby is already installed, but the `bundle` command doesn't work, just run `gem install bundler` in a terminal.

### Getting Set Up

```shell
# run this in your terminal
bundle install
bundle exec middleman server
```

You can now see the docs at http://localhost:4567.

Now that Slate is all set up on your machine, you'll probably want to learn more about [editing Slate markdown](https://github.com/lord/slate/wiki/Markdown-Syntax).

If you'd prefer to use Docker, instructions are available [in the wiki](https://github.com/lord/slate/wiki/Docker).

### Deployment
This deploys your changes to [http://stratifi.github.io/slate](http://stratifi.github.io/slate), **no matter which branch you are on locally**. 

```
# run this in the root of the project
./deploy.sh
```

### Note on JavaScript Runtime

For those who don't have JavaScript runtime or are experiencing JavaScript runtime issues with ExecJS, it is recommended to add the [rubyracer gem](https://github.com/cowboyd/therubyracer) to your gemfile and run `bundle` again. 

### Additional Notes specifically for StratiFi PRISM API Documentation

The original slate was a flat structure. A new file wrap_content.rb was added in the lib directory to group items under the same hierarchiral level and wrap them in divs. 

'-request-type: ' and '-request-url: ' are used in the markdown which will be checked for and replaced by wrap_content. Look at source \> includes \> \_scores.md for examples.

**\*The code for wrap_content can definitely be improved.\***

### Additional Notes During Development

Middleman only observed the source folder. If you made changes to the lib directory, terminate your middleman server process and start it again to see your changes. 