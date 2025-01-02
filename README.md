# Country Ranking Based on Facebook Comments

Welcome to the **Country Ranking Based on Facebook Comments** repository! This repository contains an SQL query designed to identify which countries have risen in the rankings based on the number of comments between December 2021 and January 2022. The query ensures there are no gaps between ranks when ranking countries.

## Table of Contents
1. [Introduction](#introduction)
2. [Problem Statement](#problem-statement)
3. [Schema](#schema)
4. [SQL Query](#sql-query)
5. [Usage](#usage)
6. [Contributing](#contributing)
7. [License](#license)
8. [Contact](#contact)

## Introduction
This repository aims to analyze the ranking of countries based on the number of comments made by Facebook users in two different months: December 2021 and January 2022. The query compares the rankings to determine which countries have improved their rank.

## Problem Statement
Identify which countries have risen in the rankings based on the number of comments between December 2021 and January 2022. Ensure there are no gaps between ranks when ranking countries.

## Schema
The dataset includes two tables:

- **Fb_comments_count**
  ```sql
  Fb_comments_count(
      User_id int,
      Created_at datetime,
      Number_of_comments int
  );

- **Fb_active_users(**
  ```sql
    User_id int,
    Name varchar,
    Status varchar,
    Country varchar
