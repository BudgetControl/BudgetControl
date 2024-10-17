# Budget Control V3 Application
Opens Source AGPL license project. Your Finances in One Place Set unlimited daily, weekly, monthly, or one-time budgets See every transaction, categorized automatically with tags or categories.

![license](https://img.shields.io/badge/license-AGPL-blue.svg) <a 
href="https://github.com/budgetcontrol/budgetcontrol/issues?q=is%3Aopen+is%3Aissue" target="_blank">![GitHub issues](https://img.shields.io/github/issues/budgetcontrol/budgetcontrol)
</a>
</a> <a href="https://github.com/budgetcontrol/budgetcontrol/issues?q=is%3Aissue+is%3Aopen+label%3Abug" target="_blank">![GitHub issues by-label](https://img.shields.io/github/issues/budgetcontrol/budgetcontrol/bug?color=red)
</a><a href="https://discord.gg/TtMTeUbSpW" target="_blank">![Chat](https://img.shields.io/badge/chat-on%20discord-7289da.svg)</a>

## Microservice Architecture
The Budget Control V3.0 is designed using a microservice architecture, which allows for better scalability, flexibility, and maintainability of the application. The application is divided into multiple independent budgetcontrol, each responsible for a specific functionality.

## Requirment
* php version >= 8.2
* Docker version 27.0.3
* node version v20.8.0


### Useful links
* [Documentation](https://doc.budgetcontrol.cloud/docs/intro)
* [Official Website](http://www.budgetcontrol.cloud)
* [Staging enviroment](https://dev.budgetcontrol.cloud)

## Use Task
Install the Task tool on your local machine to access useful commands. For instance, running 'task install' will set up the necessary environment infrastructure.
[Official guide](https://docs.vapor.build/introduction.html)

### Before install
Before install modify your etc host adding the following domain ( nano /etc/hosts ---> 127.0.0.1 dev.app.budgetcontrol.lan )

### Installation BE microservices
* run ./install.sh
* enjoy

### Installation Front End Application
* clone Front End application ( git clone git@github.com:BudgetControl/Pwa.git )
* lunch docker compose ( docker-compose up -d )
   
### Usage
Go to https://dev.app.budgetcontrol.lan or your desidered domain and enjoy the application

## Microservice list

* Core: The backbone of the application, managing essential functionalities and providing the foundational budgetcontrol that other microbudgetcontrol rely on.
* Entries: Handles the creation, modification, and management of financial entries, such as income and expenses.
* Wallets: Manages different wallets or accounts, allowing users to track balances and transactions across multiple financial sources.
* Budgets: Provides tools for creating and maintaining budgets, helping users plan and control their spending.
* CommandJob: Manages background jobs and scheduled tasks, ensuring that operations like data synchronization and periodic updates run smoothly.
* SearchEngine: Powers the search functionality within the application, enabling users to quickly find transactions, entries, and other data.
* Stats: Generates and displays statistical data and reports, providing users with insights into their financial activities and trends.
* Workspace: Organizes user activities and projects within the application, offering a structured environment for managing finances.
* Authentication: Handles user authentication and authorization, ensuring secure access to the application.
* Labels: Manages labels and tags, allowing users to categorize and organize their financial data more effectively.

## DEBUG MODE WITH Xdebug
You can set-up xdebug interactive debuging mode

1. configure your IDE for every microservice

### Xdebug configuration to insert in your IDE ( visual-studio )
```
{
    "name": "Listen for Xdebug",
    "type": "php",
    "request": "launch",
    "port": 9003,
    "pathMappings": {
        "/var/www/workdir": "${workspaceRoot}",
    }
}
```

### Xdebug configuration for IDE ( php storm )
https://www.jetbrains.com/help/phpstorm/troubleshooting-php-debugging.html#no-debug-server-is-configured% 

## Utils
Some utils for development

### Ftp Server

#### CPU Intel/AMD
* docker run --rm -d --name ftpd_server -p 21:21 -p 30000-30009:30000-30009 -e FTP_USER_NAME=user -e FTP_USER_PASS=12345 -e FTP_USER_HOME=/home/user stilliard/pure-ftpd

#### M1 Apple
* docker run --platform linux/amd64 -d -p 21:21 -p 21100-21110:21100-21110 -e FTP_USER=user -e FTP_PASS=12345 -e PASV_ADDRESS=127.0.0.1 -e PASV_MIN_PORT=21100 -e PASV_MAX_PORT=21110 --name ftpd_server fauria/vsftpd

* docker network connect [budgetcontrol_network] ftpd_server

### Test with mailhog service
You can use an fake mailhog server
* docker run --rm -d --name mailhog -p 8025:8025 -p 1025:1025 mailhog/mailhog
* docker network connect [budgetcontrol_network] mailhog

## Generate dummy certificate only for local env
* openssl req -x509 -nodes -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365

## Author
* Marco De Felice

## Contributing
We welcome contributions to Budget Control please refer to the contribution guide in the project documentation for more information on how to contribute.

## Support US
Please support US with a coffe donation at the following link [open collective](https://opencollective.com/budgetcontrol)

## Security Vulnerabilities
If you discover any security vulnerabilities in Budget Control please report them to the project team immediately. We take security seriously and will address any vulnerabilities promptly.

## License
Budget Control is open-source software licensed under the AGPL license.
