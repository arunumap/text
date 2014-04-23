set :stage, :production

role :app, %w{text.nytechday.com}
role :web, %w{text.nytechday.com}
role :db,  %w{text.nytechday.com}

server 'text.nytechday.com',
    user: 'railsapps',
    roles: %w{web app},
    ssh_options: {
        user: 'railsapps', # overrides user setting above
        keys: %w(/home/railsapps/.ssh/id_rsa),
        forward_agent: false,
        auth_methods: %w(password),
        password: '123'
    }
