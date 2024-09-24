# 📊 OTT-PLATFORM-DATA-ANALYSIS

This project involves analyzing the Netflix content dataset using SQL to extract valuable insights and answer business-related questions. The dataset contains information about movies and TV shows available on Netflix, including cast details, country of production, release year, ratings, and more.

## 🚀 Project Overview

The goal of this project is to explore the Netflix dataset using various SQL queries. The dataset is rich in content details, and through structured analysis, we aim to gain insights into content distribution, country-specific trends, popular actors, and more. This project demonstrates the power of SQL in handling real-world data, performing aggregations, and answering complex queries.

## 📁 Dataset Details

The dataset used in this analysis includes the following fields:
- **Show ID**: Unique identifier for each movie or show.
- **Type**: Whether the content is a "Movie" or "TV Show".
- **Title**: Name of the content.
- **Director**: Director(s) of the content.
- **Cast**: Main actors in the movie or show.
- **Country**: Country where the content was produced.
- **Date Added**: Date the content was added to Netflix.
- **Release Year**: The year the content was released.
- **Rating**: Audience rating of the content (e.g., PG, TV-MA).
- **Duration**: Duration of the movie or number of seasons for TV shows.
- **Genres**: Categories or genres the content falls under.
- **Description**: A brief description or summary of the content.

## 📝 Key Insights

In this project, several key business insights were obtained by writing and executing SQL queries on the dataset, such as:

- **Content Distribution**: How Netflix's content is split between movies and TV shows.
- **Most Popular Ratings**: Understanding the distribution of ratings for Netflix content.
- **Country-Specific Content**: Identifying the top countries producing the most Netflix content.
- **Trending Directors and Actors**: Insights into directors and actors with the most appearances in the Netflix catalog.
- **Genre Insights**: Finding the most common genres and categories of content on Netflix.
- **Content Duration**: Identifying the longest-running movies and TV shows in the catalog.

## 🔍 Business Questions Addressed

Here are some of the key business problems this project aims to solve:

1. **Content Distribution**: What is the ratio of TV shows to movies on Netflix?
2. **Most Common Ratings**: What are the most common ratings for movies and TV shows on Netflix?
3. **Country Insights**: Which countries produce the most Netflix content?
4. **Top Actors**: Who are the top actors featured in Indian movies on Netflix?
5. **Documentary Identification**: How can we identify movies that fall under the "Documentaries" category?
6. **Recent Additions**: What content has been added to Netflix in the last five years?
7. **Content Without Directors**: How much content is missing director information?
8. **Content Categorization**: How can we categorize content based on keywords like 'kill' and 'violence'?

## 🛠️ Tools & Technologies

- **MySQL**: The primary tool used for querying and analyzing the Netflix dataset.
- **SQL**: Structured Query Language is used to perform operations on the database.
- **Data Aggregation**: Techniques like `GROUP BY`, `COUNT()`, and `ORDER BY` were used to generate insights from the data.
- **Window Functions**: Windowing operations (`RANK()`, `PARTITION BY`) were used to identify patterns in the dataset.
- **String Functions**: String manipulation functions were used to clean and split data, such as handling comma-separated cast members.

## 📊 Key Features

- **Exploratory Data Analysis**: A thorough investigation of Netflix’s data, including content type, release years, and geographic distribution.
- **Insights on Actors and Directors**: Identification of the most featured actors and directors based on their presence in the dataset.
- **Date-Based Analysis**: Queries to track content added over a specific time period.
- **Genre-Specific Queries**: Insights into the most common genres available on Netflix.

## 🔧 Setup Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/netflix-sql-project.git
   ```
2. Import the dataset into MySQL:
   ```sql
   LOAD DATA INFILE 'path_to_netflix_titles.csv'
   INTO TABLE netflix_titles
   FIELDS TERMINATED BY ',' 
   ENCLOSED BY '"'
   LINES TERMINATED BY '\n'
   IGNORE 1 ROWS;
   ```

3. Run the SQL queries provided in the `queries.sql` file.

## 📈 Results

The analysis results showcase how SQL can be leveraged to uncover important insights from a media dataset. From understanding content distribution to tracking top actors and popular genres, this project provides a comprehensive look into the Netflix content library.

## 🧑‍💻 Contribution

Contributions are welcome! If you find any issues or want to improve the SQL queries, feel free to open a pull request or submit an issue.

## 📜 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

This README provides a clear and structured overview of your project while keeping it professional and presentable. You can customize the details and provide your GitHub repository link where applicable.
