# Juggerchat

Juggerchat is a simple implementation of a webchat using [Rails][1] and [Juggernaut][2].

# Installation

Assuming you already have Ruby and Ruby on Rails installed, you will need Juggernaut. Installation instructions are on [their repo][2]. 

You also need a Facebook application's ID and Secret, and add them to the `config/initializers/oomniauth.rb` file:

    Rails.application.config.middleware.use OmniAuth::Builder do
      provider :facebook, 'APP_ID', 'APP_SECRET'
    end

You can then do:

    $ git clone git@github.com:ianmurrays/juggerchat.git
    $ bundle install
    $ rake db:migrate
    $ rails s

Then, make sure redis and juggernaut are running (follow juggernaut installation instructions for this), and point your browser to [http://localhost:3000](http://localhost:3000) to test juggerchat!

# License

This is licensed under the MIT License.

[1]: https://github.com/rails/rails
[2]: https://github.com/maccman/juggernaut