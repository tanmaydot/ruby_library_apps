# Welcome to the Rails Library Project

This README serves as a comprehensive guide for setting up and utilizing our Ruby on Rails application, which seamlessly integrates the CanCanCan authorization library, Devise for user authentication, Bootstrap for elegant styling, and offers essential CRUD (Create, Read, Update, Delete) functionality for models with intricate relational data.

## Table of Contents

1. [Introduction](#introduction)
2. [Prerequisites](#prerequisites)
3. [Installation](#installation)
4. [Configuration](#configuration)
5. [Usage](#usage)
6. [Database Schema](#database-schema)
7. [Contributing](#contributing)
8. [License](#license)

## Introduction

Our Rails Library Project showcases a sophisticated Ruby on Rails web application that skillfully integrates various components:

- **CanCanCan:** A robust authorization library, enabling precise user permission management.
- **Devise:** A widely adopted authentication solution for Rails, empowering user registration, login, and password management.
- **Bootstrap:** A versatile front-end framework that elevates your application's style and responsiveness.
- **CRUD Operations:** Demonstrates the implementation of Create, Read, Update, and Delete functionalities for models.
- **Relational Models:** Exhibits the best practices for managing models with complex associations, such as users having multiple books.

This project stands as an exemplary boilerplate for constructing web applications, offering user authentication, stringent authorization, a modern user interface, and comprehensive support for data relationship management.

## Prerequisites

Before embarking on this journey, ensure your development environment has the following prerequisites:

- **Ruby on Rails:** You must have a functional installation of Ruby and Rails. If you don't, please consult the [official installation guide](https://guides.rubyonrails.org/getting_started.html).
- **Git:** You'll need Git for cloning this repository and version control.
- **Database System:** Depending on your preferences, select a database system like PostgreSQL, MySQL, or SQLite. Your database should be properly configured.

## Installation

Let's begin the setup process:

1. **Clone the Repository:** Start by cloning the project repository to your local machine.
2. **Navigate to the Project Directory:** Change your working directory to the project folder.
3. **Install Required Gems:** Install the necessary gems by running the `bundle install` command.
4. **Database Setup:** Create and set up your database by executing the `rails db:create` and `rails db:migrate` commands.
5. **Database Seeding (Optional):** If desired, populate the database with sample data using the `rails db:seed` command.

## Configuration

Before launching the application, you may need to configure specific settings. Typically, these configurations are found in files such as `config/database.yml`, `config/secrets.yml`, and the Devise initializer. For comprehensive configuration details for CanCanCan, Devise, and Bootstrap, please refer to their respective documentation:

- [CanCanCan Documentation](link-to-cancancan-doc)
- [Devise Documentation](link-to-devise-doc)
- [Bootstrap Documentation](link-to-bootstrap-doc)

## Usage

To start the application, use the following command:

```shell
rails server
```

Access the application in your web browser at http://localhost:3000. You can register, log in, and explore the CRUD features for your models. CanCanCan's authorization rules will manage access based on user roles.

Feel free to adapt the application to meet your specific requirements. You have the flexibility to add new models, customize the user interface, and define your unique authorization rules.

Database Schema
Below is the final schema for the database, illustrating the tables and their relationships:

```
(Table "book_transactions")
- "id" varchar
- "status" integer
- "expected_date" date
- "created_at" datetime
- "updated_at" datetime
- "user_id" bigint
- "book_id" bigint

(Table "books")
- "id" varchar
- "name" string
- "author" string
- "publication" string
- "genres" string
- "description" text
- "created_at" datetime
- "updated_at" datetime
- "rak_id" bigint
- "section_id" bigint
- "quantity" integer
- "remaining_books" integer

(Table "raks")
- "id" varchar
- "name" string
- "created_at" datetime
- "updated_at" datetime
- "section_id" bigint

(Table "sections")
- "id" varchar
- "name" string
- "created_at" datetime
- "updated_at" datetime

(Table "users")
- "id" varchar
- "name" string
- "age" integer
- "location" string
- "created_at" datetime
- "updated_at" datetime
- "mem_start_date" date
- "mem_end_date" date
- "total_amount_paid" integer
- "email" string
- "encrypted_password" string
- "reset_password_token" string
- "reset_password_sent_at" datetime
- "remember_created_at" datetime
- "role" integer

(References)
- "fk_rails_book_transactions_books":"book_transactions"."book_id" - "books"."id"
- "fk_rails_book_transactions_users":"book_transactions"."user_id" - "users"."id"
- "fk_rails_books_raks":"books"."rak_id" - "raks"."id"
- "fk_rails_books_sections":"books"."section_id" - "sections"."id"
- "fk_rails_raks_sections":"raks"."section_id" - "sections"."id"
```
## Contributing

If you wish to contribute to this project or have suggestions for improvements, please follow these steps:

1. **Fork the Repository on GitHub.**

2. **Create a New Branch:** Establish a new branch with a descriptive name (e.g., `git checkout -b feature/my-new-feature`).

3. **Make Your Changes:** Implement your modifications and provide clear, informative commit messages.

4. **Push Your Changes:** Push your changes to your fork (e.g., `git push origin feature/my-new-feature`).

5. **Create a Pull Request:** Submit your changes by creating a pull request on the original repository.

