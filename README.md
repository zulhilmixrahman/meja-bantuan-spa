<p align="center">
<a href="https://laravel.com" target="_blank">
<img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" height="100">
</a>
</p>

<p align="center">
<a href="https://github.com/tabler/tabler" target="_blank">
<img src="https://raw.githubusercontent.com/tabler/tabler/dev/src/static/logo.svg" height="60">
</a>
</p>

<p align="center">
<a href="https://github.com/laravel/framework/tree/v11.15.0" target="__blank">
<img src="https://img.shields.io/badge/Laravel-11.0.15-red?logo=laravel&logoColor=orange">
</a>
<a href="https://www.npmjs.com/package/bootstrap/v/5.3.3" target="__blank">
<img src="https://img.shields.io/badge/Bootstrap-5.3-purple?logo=bootstrap&logoColor=purple">
</a>
<a href="https://www.npmjs.com/package/@tabler/core/v/1.0.0-beta20" target="__blank">
<img src="https://img.shields.io/badge/Tabler-1.0.0--beta20-blue">
</a>
</p>

# Laravel with Tabler Admin Dashboard Template

## Project Installation

1. 

- git clone
- cp .env.example .env
- composer install
- php artisan key:generate
- php migrate --seed --step

## Project Configuration

- Change logo
- Change default password
- Model Auditable

### Reset Commit Histroy
1. Remove remote repository and add new repository
```
git remote rm origin
git remote add origin [git-remote-URL]
```

2. Checkout/create orphan branch (this branch won't show in git branch command): 
```
git checkout --orphan main
```

3. Add all the files to the newly created branch:
```
git add -A
```

4. Commit the changes:
```
git commit -am "Initial commit"
```

5. Delete master (default) branch (this step is permanent):
```
git branch -D master
```

6. Finally, all changes are completed on your local repository, and force update your remote repository:
```
git push -f origin main
```
