# Rails ActiveAdmin Library Project

Welcome to the Rails ActiveAdmin Library Project! This README serves as a comprehensive guide for setting up and utilizing our Ruby on Rails application. Our project seamlessly integrates ActiveAdmin with the FormAdmin theme, Devise for user authentication and functionality for models with intricate relational data and Authorization with CanCanCan.

## Table of Contents

- [Rails ActiveAdmin Library Project](#rails-activeadmin-library-project)
  - [Table of Contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Prerequisites](#prerequisites)
  - [Installation](#installation)
  - [Configuration](#configuration)
  - [Usage](#usage)
  - [Database Schema](#database-schema)
  - [Contributing](#contributing)

## Introduction

Our Rails Library Project showcases a sophisticated Ruby on Rails web application that skillfully integrates various components:

- **Devise**: A widely adopted authentication solution for Rails, empowering user registration, login, and password management.
- **CanCanCan**: A robust authorization library, enabling precise user permission management.
- **ActiveAdmin**: Demonstrates the seamlessly integration for ActiveAdmin.
- **FormAdmin**: For a better looking site.
- **Relational Models**: Exhibits best practices for managing models with complex associations, such as users having multiple books.

This project stands as an exemplary boilerplate for constructing web applications, offering user authentication, stringent authorization, a modern user interface, and comprehensive support for data relationship management.

## Prerequisites

Before embarking on this journey, ensure your development environment has the following prerequisites:

- **Ruby on Rails**: You must have a functional installation of Ruby and Rails. If you don't, please consult the official installation guide.
- **Git**: You'll need Git for cloning this repository and version control.
- **Database System**: Depending on your preferences, select a database system like PostgreSQL, MySQL, or SQLite. Your database should be properly configured.

## Installation

Let's begin the setup process:

1. **Clone the Repository**: Start by cloning the project repository to your local machine.
2. **Navigate to the Project Directory**: Change your working directory to the project folder.
3. **Install Required Gems**: Install the necessary gems by running the `bundle install` command.
4. **Database Setup**: Create and set up your database by executing the `rails db:create` and `rails db:migrate` commands.
5. **Database Seeding (Optional)**: If desired, populate the database with sample data using the `rails db:seed` command.

## Configuration

Before launching the application, you may need to configure specific settings. Typically, these configurations are found in files such as `config/database.yml`, `config/secrets.yml`, and the Devise initializer. For comprehensive configuration details for ActiveAdmin, Devise, CanCanCan please refer to their respective documentation.

## Usage

To start the application, use the following command:

```bash
rails server
```

Access the application in your web browser at [http://localhost:3000](http://localhost:3000). You can register, log in, and explore the CRUD features for your models. CanCanCan's authorization rules will manage access based on user roles.

Feel free to adapt the application to meet your specific requirements. You have the flexibility to add new models, customize the user interface, and define your unique authorization rules.

## Database Schema

Below is the final schema for the database, illustrating the tables and their relationships. This schema will help you understand how data is structured in the application:

```bash
Table "active_admin_comments" {
  "id" varchar
  "namespace" string
  "body" text
  "resource_type" string
  "resource_id" bigint
  "author_type" string
  "author_id" bigint
  "created_at" datetime
  "updated_at" datetime
}

Table "admin_users" {
  "id" varchar
  "email" string
  "encrypted_password" string
  "reset_password_token" string
  "reset_password_sent_at" datetime
  "remember_created_at" datetime
  "created_at" datetime
  "updated_at" datetime
  "role" integer
  "mem_end_date" date
  "mem_start_date" date
  "total_amount_paid" integer
  "username" string
}

Table "book_allotments" {
  "id" varchar
  "book_transactions_type" integer
  "admin_user_id" integer
  "book_id" integer
  "number_of_pieces" integer
  "created_at" datetime
  "updated_at" datetime
}

Table "books" {
  "id" varchar
  "book_title" string
  "book_author" string
  "book_summary" string
  "book_edition" integer
  "book_total_stock" integer
  "created_at" datetime
  "updated_at" datetime
  "shelf_id" bigint
  "section_id" bigint
}

Table "membership_plans" {
  "id" varchar
  "created_at" datetime
  "updated_at" datetime
  "plan_amount" integer
  "active" integer
  "total_days" integer
  "plan_name" string
}

Table "sections" {
  "id" varchar
  "name" string
  "created_at" datetime
  "updated_at" datetime
}

Table "shelves" {
  "id" varchar
  "name" string
  "section_id" bigint
  "created_at" datetime
  "updated_at" datetime
}

Table "transactions" {
  "id" varchar
  "mem_plan_id" integer
  "admin_user_id" integer
  "created_at" datetime
  "updated_at" datetime
}

Table "users" {
  "id" varchar
  "email" string
  "encrypted_password" string
  "reset_password_token" string
  "reset_password_sent_at" datetime
  "remember_created_at" datetime
  "sign_in_count" integer
  "current_sign_in_at" datetime
  "last_sign_in_at" datetime
  "current_sign_in_ip" string
  "last_sign_in_ip" string
  "confirmation_token" string
  "confirmed_at" datetime
  "confirmation_sent_at" datetime
  "unconfirmed_email" string
  "failed_attempts" integer
  "unlock_token" string
  "locked_at" datetime
  "created_at" datetime
  "updated_at" datetime
}

Ref "fk_rails_book_allotments_admin_users":"book_allotments"."admin_user_id" - "admin_users"."id"

Ref "fk_rails_book_allotments_books":"book_allotments"."book_id" - "books"."id"

Ref "fk_rails_books_sections":"books"."section_id" - "sections"."id"

Ref "fk_rails_books_shelves":"books"."shelf_id" - "shelves"."id"

Ref "fk_rails_shelves_sections":"shelves"."section_id" - "sections"."id"

Ref "fk_rails_transactions_admin_users":"transactions"."admin_user_id" - "admin_users"."id"

Ref "fk_rails_transactions_membership_plans":"transactions"."mem_plan_id" - "membership_plans"."id"
```

## Contributing

If you wish to contribute to this project or have suggestions for improvements, please follow these steps:

1. **Fork the Repository on GitHub**.
2. **Create a New Branch**: Establish a new branch with a descriptive name (e.g., `git checkout -b feature/my-new-feature`).
3. **Make Your Changes**: Implement your modifications and provide clear, informative commit messages.
4. **Push Your Changes**: Push your changes to your fork (e.g., `git push origin feature/my-new-feature`).
5. **Create a Pull Request**: Submit your changes by creating a pull request on the original repository.

We welcome your contributions and ideas to make this project even better.
