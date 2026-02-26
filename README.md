
# B2B Sales & Pricing Analytics (SQLite)

Synthetic (non-confidential) example project demonstrating:

- Relational schema design
- SQL analytics (JOINs, aggregations, window functions)
- Sales & pricing KPI analysis

## How to Recreate the Database

Run the following commands:

sqlite3 sales_analytics.db < schema.sql
sqlite3 sales_analytics.db < seed_data.sql
sqlite3 -header -csv sales_analytics.db < queries.sql > query_outputs.csv

This project illustrates analytical capabilities aligned with Business Analytics / Management programs.
