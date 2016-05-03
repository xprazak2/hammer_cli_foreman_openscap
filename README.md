# hammer_cli_foreman_openscap

Next-gen CLI tool for [ForemanOpenscap](http://www.theforeman.org/plugins/foreman_openscap/)

hammer-cli development docs for [help](https://github.com/theforeman/hammer-cli/blob/master/doc/developer_docs.md#hammer-development-docs)

## Development setup
With this guide, you'll be able to set up hammer_cli_foreman_openscap with hammer-cli-foreman for development.

###Requirements for this setup

These are the requirements for this setup. Note that some may not be needed at
all depending on your setup.

* git
* ruby
* rvm
* foreman

###Steps

First, cd into the directory where your projects will live. Then clone everything.

```bash
git clone https://github.com/theforeman/hammer-cli-foreman.git
git clone https://github.com/xprazak2/hammer_cli_foreman_openscap.git
```

Before we bundle, we need to setup our local Gemfile. Edit `Gemfile.local.rb` in your hammer_cli_foreman_openscap directory to point to the local projects instead of using the gems. Enter the following:

```ruby
gem 'hammer_cli_foreman', :path => '../hammer-cli-foreman'
```

Now, let's create the directories we need for configuration.

```bash
mkdir -p ~/.hammer/cli.modules.d
```

Edit `~/.hammer/cli_config.yml` and [enter any hammer-cli config values you
want](https://github.com/theforeman/hammer-cli/blob/master/doc/installation.md#options).

Next edit `~/.hammer/cli.modules.d/foreman.yml` and enter the following:

```yaml
:foreman:
  :enable_module: true
  :host: 'http://foreman.example.com/'
  :username: 'admin'
  :password: 'changeme'
```

Edit `~/.hammer/cli.modules.d/foreman_opesncap.yml` and enter in the following:

```yaml
:foreman_openscap:
  :enable_module: true
```

And then finally test out your installation:

```
bundle exec hammer -vh
```

You should see in the output:
```
Extension module hammer_cli_foreman_openscap (version) loaded
```
If you see no errors, you should be good to go.



