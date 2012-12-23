photOrganize
============

photOrganize helps you to copy and organize your photos to folders correctly date-named

#What is it ?

photOrganize is a simple command line utility that copies photos contained in a source folder into a set of folders date-named.

Example:

    $ ruby photorganize.rb '/media/XXXX-YYYY/DCIM/100CANON' ~/photos

That command copies all the photos in '/media/XXXX-YYYY/DCIM/100CANON' (my PhotoCamera's folder), into sub-folders date-named created inside the folder '~/photos':

    $ ls ~/photos

    2011-12-29  2012-05-13  2012-05-18  2012-06-19  2012-07-08  2012-09-13

Easy :)

#How it works

Before to copy each photo, the creation date is read from the photo, and then a new folder named year-month-day (yyyy-mm-dd) is created and the file copied. 

Note: that photOrganize gets the creation date inside the photo, not from the file system, that's important, so you can use it to organize photos that you already moved/copied on other folders.

#Dependencies
photOrganize uses *mini_exiftool* to read the creation date. 

To install it:
    $ gem install mini_exiftool

Organize you photos, and take care of them!
