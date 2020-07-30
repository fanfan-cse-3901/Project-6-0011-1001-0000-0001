# Project 6
### Ruby on Rails Project

### Roles

* Overall Project Manager: Kevin Dong
* Coding Manager:  Troy Stein
* Testing Manager: Amanda Cheng
* Documentation Manager: Yifan Yao
* Honorable Mention: Prachiti Garge

### Contributions

* Amanda Cheng: User profile
* Kevin Dong: Search and filter
* Prachiti Garge: Messaging feature
* Troy Stein: Transactions and rating
* Yifan Yao: User authentication, model

### Testing

* The test plan is provided in Test_plan_Porject_6.pdf

### Powerpoint Slides

[Link Here](https://buckeyemailosu-my.sharepoint.com/:p:/r/personal/dong_696_buckeyemail_osu_edu/Documents/3rd%20Year/Summer%20Semester/CSE%203901%20-%200x3901/Proposals/Project-6-0011-1001-0000-0001%20amanda.pptx?d=w65e4b336d24441a1ad26cec228755c00&csf=1&web=1&e=AoCkKI)

### References

* Lecture videos and slides
* https://www.railstutorial.org/book
* https://web-crunch.com/posts/lets-build-with-ruby-on-rails-trade-app-in-app-messaging



### Setup

#### Something You Might Need To Know

* Ruby Version: `ruby-2.6.3`

#### Step 1: Install Dependencies

```
$ gem install bundler
$ bundle install
```

#### Step 3: Create the Database

`$ rails db:migrate`

#### Step 4: Run Server From Local

```
# Run rails server
$ rails server
# Type localhost:3000 in the browser and go.
```

#### Step 5: Create an User and Set it as admin

1. Create Your First Account From [http://localhost:3000/users/sign_up](http://localhost:3000/users/sign_up)
2. Run `$ rake promote_admin`

Instructions for Post Installation:

```
View List of Users (Priviliged): http://localhost:3000/users
Add New Admins (Priviliged): http://localhost:3000/users/add_admin
```

#### :beers: Step 6: Enjoy :beers:

