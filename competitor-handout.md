# Competitor Handout

**HRDK × SamsungSkills Invitational Friendly Challenge 2026**

You can solve the tasks by developing them on your own machine.

## Gitea, git

The Gitea service is available at the following address: [https://git.sfc.skillsit.eu](https://git.sfc.skillsit.eu)

For **all six** tasks, you can start from a selected template repo on Gitea.

The available template repos:

- react
- react-ts
- vue
- vue-ts
- node
- node-ts
- laravel
- vanilla-js
- node-ts-prisma

To log in, you must use the username and password (a 4-digit PIN code) you have been given.
After logging in, create a new repo for the next task.

- Give the name of the new repo using the following pattern: `module-Y`, where `Y` is the module's letter (eg. `module-a`, `module-b`). **Make sure you set the repo's name carefully because if you make a mistake, the automatic deployment will not work!**
- Under the template field, select the appropriate template (e.g. `react-ts`). Select `Git Content (Default Branch)` for `Template Items`.

Once the new repo is created, clone it to your own workstation.

### Using npm modules

The npm modules will be accessible via a local npm cache. This means that even though there will be no internet access to the machines, you will be able to add the available npm modules to the projects as usual, and the `npm install` command issued on the cloned template projects will install all the npm modules needed for your project.

The available npm modules:

- express
- mysql2
- vue-router
- react-router, react-router-dom
- axios
- sass
- tailwindcss
- prisma, @prisma/client
- express-validator
- zod
- bootstrap
- _and all the types (`@types/`) needed for the TS projects_

## Laravel projects, composer install

The Laravel project contains all the necessary files, so you will not need to `composer install`. Your workstation has PHP 8 installed, so you can use the `php artisan` commands in the Laravel project.

## Deployment

When you commit and push your work, the deployment will start automatically. You can follow the process in the Gitea interface under the Action tab. Once the deployment is complete, your project will be available at https://cXX-YYYY-module-Z.sfc.skillsit.eu, where `X` is your workstation number, `YYYY` is your 4 digit pin, and `Z` is the module letter.

Competitors can also check the container logs of their deployed projects at [https://logs.sfc.skillsit.eu/](https://logs.sfc.skillsit.eu/). To log in, use your PIN.

## Database access

You will have your own database on the MySQL database server (`db.sfc.skillsit.eu`) available on the local network. You will need to use this database for development, and the same database will provide the data for your projects deployed to the server. A database dump will be provided to get the initial data. During the marking, the database will be restored to its original state using the same dump. Your backend solution (Module C) uses this database.

You can use PHPMyAdmin to manage your databases at [https://pma.sfc.skillsit.eu](https://pma.sfc.skillsit.eu). Log in with the same credentials you use for Gitea. The database naming convention is `cXX_module-y`, where `cXX` is your username and `y` is the module letter (e.g. `c07_module-c`).
