# SQL Script for Creating Sequences and Triggers

This script creates sequences and triggers for auto-generating primary key values for tables that have a number data type primary key.

## Purpose

The purpose of this script is to automate the process of creating sequences and triggers for tables that have a number data type primary key. It is useful when dealing with a large number of tables and saves time and effort by automating the process.

## How to Use

To use this script, simply copy and paste it into your Oracle SQL developer or any other SQL client, and then execute it. It will automatically create the required sequences and triggers for the tables that have a number data type primary key.

## Prerequisites

- Oracle SQL developer or any other SQL client
- Access to the Oracle database
- The tables should have a number data type primary key.

## Steps

1. Declare the cursors `c_seq_Drop`, `c_trigg_Drop`, and `c_adding`
2. Drop the existing sequences using the `c_seq_Drop` cursor
3. Create a new sequence for each table that has a number data type primary key using the `c_adding` cursor
4. Create a new trigger for each table that has a number data type primary key using the `c_adding` cursor

## Limitations

This script is only designed for tables that have a number data type primary key. Tables with other data types for primary key or composite primary key are not supported.

## Credits

This script was created by [Insert Your Name Here] and is available under the MIT License. Please feel free to modify and use this script for your own purposes.
