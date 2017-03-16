# Chessmaster

My final project allows users to view a variety of chess games through interacting with a community of chess players. Users can like and comment on games, giving their opinions on the quality of the games and rate other players games. Users can also upload their own games through uploading pgn files or manually entering the pgn. They can also create their own profile page with avatars. It has pagination function and make it easier to navigate.

## Steps

bundle

rails db:migrate

rails db:seed

rails s

Sign in with one of the seeded users; you can use `alice@example.com`, `bob@example.com`, or `carol@example.com`. All of the passwords are `12341234`.


If you encounter 'Cannot load such file — bcrypt_ext'.
The problem was that bundle install of devise installed as a dependency another version of bcrypt (bcrypt (3.1.11 x86-mingw32) instead of bcrypt (3.1.11)) which was causing trouble with ruby 2.3 (it should work with all previous versions of ruby)

The solution I used is to install bcrypt outside of the gemfile, run bundle and then remove the second version of bcrypt 


  
$ gem list bcrypt
bcrypt (3.1.11 x86-mingw32)

$ gem uninstall devise && gem uninstall bcrypt
Successfully uninstalled devise-4.2.0
Successfully uninstalled bcrypt-3.1.11-x86-mingw32

$ gem install bcrypt --platform=Ruby
Temporarily enhancing PATH to include DevKit...
Building native extensions.  This could take a while...
Successfully installed bcrypt-3.1.11
Parsing documentation for bcrypt-3.1.11
Installing ri documentation for bcrypt-3.1.11
Done installing documentation for bcrypt after 1 seconds
1 gem installed

$ gem list bcrypt
bcrypt (3.1.11)

$ bundle install
...
Installing bcrypt 3.1.11 (x86-mingw32)
...
Installing devise 4.2.0
Bundle complete! 25 Gemfile dependencies, 75 gems now installed.

$ gem list bcrypt
bcrypt (3.1.11 ruby x86-mingw32)

$ gem uninstall bcrypt
Select gem to uninstall:
 1. bcrypt-3.1.11
 2. bcrypt-3.1.11-x86-mingw32
 3. All versions
> 2
Successfully uninstalled bcrypt-3.1.11-x86-mingw32

$ gem list bcrypt
bcrypt (3.1.11)



