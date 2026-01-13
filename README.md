# Analytics Foundation – FlowTrack

This project demonstrates an end-to-end analytics foundation for a fictional B2B SaaS product called FlowTrack.

## Goal
Build a clean, reliable analytics setup from raw data to business metrics using:
- BigQuery
- SQL
- Analytics best practices

## What’s included
- Raw CSV data (simulated SaaS sources)
- Clean analytics views
- Core SaaS metrics (MRR, etc.)
- Learning notes and debugging decisions

## Stack
- BigQuery
- SQL
- GitHub

## Status
In progress – metrics and dashboards being added.

## How to run
- Upload CSVs to BigQuery dataset flowtrack_raw
- Create clean views in flowtrack_analytics using SQL in sql/clean/

## How views are created

Each SQL file in this repo represents a BigQuery VIEW.
Files contain SELECT statements only.

To create or update a view in BigQuery:

CREATE OR REPLACE VIEW `flowtrack-analytics.flowtrack_analytics.<view_name>` AS
<contents of the SQL file>
