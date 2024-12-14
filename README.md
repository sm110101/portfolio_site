# 2024-DSAN-5000-Project

This repository contains my final project for the DSAN 5000 course (Data Science and Analytics) completed during my first year as a data science graduate student at Georgetown University. The project investigates Amazon Electronics reviews to uncover patterns, apply machine learning models, and gain insights into customer sentiment and ratings.

---

## Project Overview

The study leverages a dataset of 6.7 million Amazon reviews, filtered to a manageable 100,000 reviews to fit computational constraints. Key objectives include:

- **Predicting Review Ratings:** Assessing if review text alone can predict ratings.
- **Uncovering Patterns:** Exploring linguistic markers across different star ratings.
- **Dimensionality Reduction:** Utilizing PCA and t-SNE for visualization.
- **Clustering:** Applying KMeans, DBSCAN, and Hierarchical Clustering for unsupervised learning.
- **Supervised Learning:** Implementing regression and classification models to predict sentiment and ratings.

### Core Questions Addressed:
- How does review text relate to star ratings?
- What linguistic patterns differentiate high and low ratings?
- Can machine learning models effectively predict sentiment or ratings?

For more details, see the corresponding project sections.

---

## Dataset

The project uses the **Amazon Electronics Reviews Dataset** (5-core subset) curated by Jianmo Ni. The original dataset includes 233.1 million reviews. For this project:
- A subset of **100,000 reviews** is analyzed.
- Reviews include fields such as `reviewText`, `summary`, `rating`, and `verified`.

Dataset preparation involved cleaning, preprocessing, and reducing to focus on relevant features such as text embeddings and polarity.

**Citation:** Jianmo Ni et al., 2019. [Original Paper](https://cseweb.ucsd.edu/~jmcauley/pdfs/emnlp19a.pdf).

---

## Methods and Techniques

### Data Preprocessing
- **Text Cleaning:** Removed digits, punctuation, and stopwords; lowercased text using NLTK and Python's string library.
- **Encoding:** Converted categorical fields into binary or numerical values for modeling.
- **Feature Extraction:** Used TF-IDF embeddings to vectorize text data.

### Exploratory Data Analysis
- Generated statistical summaries of `vote` and `rating`.
- Visualized distributions of raw and cleaned review text.
- Highlighted linguistic patterns with document-term matrices (DTMs).

### Dimensionality Reduction
- Applied **PCA** and **t-SNE** for reducing high-dimensional TF-IDF vectors.
- Optimized parameters such as perplexity for t-SNE to improve visualization quality.

### Unsupervised Learning
- Clustered reviews using:
  - **KMeans**: Optimized `k` via the elbow method.
  - **DBSCAN**: Tuned `eps` and `MinPts` for density-based clustering.
  - **Hierarchical Clustering**: Used agglomerative approaches to form dendrograms.

### Supervised Learning
- **Binary Classification:** Logistic Regression, Random Forests.
- **Multi-class Classification:** Support Vector Machines, Multinomial Naive Bayes.
- **Regression:** Ridge Regression for numerical predictions.

Evaluation metrics included accuracy, F1-score, and R².

---

## Requirements

This project was developed with Python 3.11.5. The following libraries are required:

- `requests`
- `warnings` (optional)
- `gzip`
- `orjson` (preferred over `json` for speed)
- `pandas`
- `nltk`
- `string`
- `scipy`
- `textblob`
- `numpy`
- `seaborn`
- `matplotlib`
- `scikit-learn`
- `plotly`

---

## Key Findings

- High ratings (5 stars) dominate the dataset, reflecting a left-skewed distribution.
- Clustering methods highlighted distinct patterns in review text, but dense clusters required DBSCAN for effective separation.
- Logistic Regression and Random Forests performed well in binary classification of sentiment.
- Multi-class classification was most accurate with SVMs using TF-IDF embeddings.
- For full details, consult the [website](https://morris.georgetown.domains/) for this project

---

## Athor

Sean Morris - [Linkedin](https://www.linkedin.com/in/spm122/) | [GitHub](https://github.com/sm110101)