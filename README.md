# Budget Control V3 Core Application
Opens Source AGPL license project. Your Finances in One Place Set unlimited daily, weekly, monthly, or one-time budgets See every transaction, categorized automatically with tags or categories.

![version](https://img.shields.io/badge/version-2.2.2-blue.svg) ![license](https://img.shields.io/badge/license-AGPL-blue.svg) <a 
href="https://github.com/budgetcontrol/budgetcontrol/issues?q=is%3Aopen+is%3Aissue" target="_blank">![GitHub issues](https://img.shields.io/github/issues/budgetcontrol/budgetcontrol)
</a>
</a> <a href="https://github.com/budgetcontrol/budgetcontrol/issues?q=is%3Aissue+is%3Aopen+label%3Abug" target="_blank">![GitHub issues by-label](https://img.shields.io/github/issues/budgetcontrol/budgetcontrol/bug?color=red)
</a><a href="https://discord.gg/TtMTeUbSpW" target="_blank">![Chat](https://img.shields.io/badge/chat-on%20discord-7289da.svg)</a>

## Microservice Architecture
The Budget Control V3.0 is designed using a microservice architecture, which allows for better scalability, flexibility, and maintainability of the application. The application is divided into multiple independent budgetcontrol, each responsible for a specific functionality.

## Requirment
php version >= 8.2

### Useful links
* [Documentation](https://doc.budgetcontrol.cloud/docs/intro)
* [Official Website](http://www.budgetcontrol.cloud)
* [Staging enviroment](https://dev.budgetcontrol.cloud)

### Installations
* Clone the repository on your computer with the command git clone git@github.com:BudgetControl/Core.git.
* Enter the repository directory with the command cd Core.
* Checkout on the last stable version branch for dev environment or last tag version
* Copy file .env.example on .env 
* Run the install.sh bash script
* * Params:
* * * Enviroment variable -e dev | prod, default is dev
* * * How serve PWA -p node | apache, default is apache
* Enjoy
   insert url http://localhost:3000/ ( api/incoming )
   
### Usage
Go to http://localhost or your desidered domain and enjoy the application

### Contributing
Thank you for considering contributing to the Budget Control The contribution guide can be found in the Budget Control documentation.

### Security Vulnerabilities
If you discover a security vulnerability within Budget Control, please send an e-mail to marco.defelice890@gmail.com. All security vulnerabilities will be promptly addressed.

### License
The Budget Control is open-sourced software licensed under the MIT license.

### Some develop information
Front-end is developed with Vue Notus template Back-end is developed with laravel and other PHP Packages
- **FE-REPO** https://github.com/BudgetControl/Pwa

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
{
    "name": "Listen for Xdebug",
    "type": "php",
    "request": "launch",
    "port": 9003,
    "pathMappings": {
        "/var/www/workdir": "${workspaceRoot}",
    }
}

### Xdebug configuration for IDE ( php storm )
https://www.jetbrains.com/help/phpstorm/troubleshooting-php-debugging.html#no-debug-server-is-configured% 

### Test with mailhog service
You can use an fake mailhog server
- docker run --rm -d --name mailhog -p 8025:8025 -p 1025:1025 mailhog/mailhog
- docker network connect [network_name] mailhog

## Author
* Marco De Felice

## Contributors
* [FullBl](https://github.com/fullbl)

## Contributing
We welcome contributions to Budget Control please refer to the contribution guide in the project documentation for more information on how to contribute.

## Security Vulnerabilities
If you discover any security vulnerabilities in Budget Control please report them to the project team immediately. We take security seriously and will address any vulnerabilities promptly.

## License
Budget Control is open-source software licensed under the AGPL license.
