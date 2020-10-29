create table blogUser (

    userId int auto_increment,

    userName varchar(255) not null,

    userPassword varchar(255) not null,

    userDescription varchar(255) not null,

    userGender char(1),

    userCreateTime datetime not null,

    userBirthDay date,

    userBlogCount int default 0,

    primary key(userId)

);

create table blogCategory(

    categoryId int auto_increment,
    categoryName varchar(255) not null,
    categoryDescription varchar(255),
    primary key(categoryId)
);

create table blog(

    blogId int auto_increment,
    blogTitle varchar(255) not null,
    blogContent MEDIUMTEXT not null,
    blogReadTimes int default 0,
    blogCommentTimes int default 0,
    blogEditTime datetime not null,

    blogUserId int not null,
    blogCategoryId int,

    primary key(blogId)
);