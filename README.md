# DermAI-Diagnostics-SQL-Exploratory-Analysis-of-Skin-Cancer-Dataset
### Leveraging SQL-based descriptive and diagnostic analytics in understanding Epidemiological Insights and Research

## Business Introduction

**DermAI Diagnostics** is revolutionizing dermatological care through AI-powered research and clinical insights. By analyzing skin lesion characteristics, patient demographics, and environmental risk factors, we create **data-driven insights** to support early diagnosis and evidence-based care. Our SQL-based research complements machine learning, serving as a foundation for predictive model development and digital diagnostic support.

---

## Problem Statement

Skin cancer detection is often delayed due to misdiagnoses, limited access to specialists, and poor understanding of contributing factors. With 1,088 skin lesion cases, our goal is to **uncover patterns** connecting lesion characteristics, lifestyle choices, and environmental exposures to cancer diagnosis—supporting both **clinical decisions** and **machine learning applications**.

---

## Project Objectives

- Construct a robust SQL-accessible clinical database.
- Identify demographic and environmental risk factors linked to lesion malignancy.
- Detect visual or symptomatic patterns associated with biopsied and cancerous lesions.
- Provide insights useful for both **clinical diagnosis** and **AI model training**.
- Demonstrate structured thinking and **SQL querying proficiency**.

## Project Workflow
- Import the Dataset
- Join Tables
- Write Queries
- Recommendation


## Dataset Description

### `Patient_Info` Table -  `table1`

| Column | Description |
|--------|-------------|
| patient_id | Unique identifier |
| smoke, drink | Lifestyle factors (TRUE/FALSE) |
| background_father, background_mother | Ethnicity |
| age, gender | Demographics |
| pesticide, has_piped_water, has_sewage_system | Environmental exposure |
| skin_cancer_history, family_cancer_history | Medical history |

### `Lesion_Info` Table -  `table2`

| Column | Description |
|--------|-------------|
| lesion_id | Unique identifier |
| patient_id | Foreign key |
| fitspatrick | Skin type (1–6) |
| region | Body location |
| diameter_1, diameter_2 | Lesion size |
| diagnostic | Diagnosis (MEL, BCC, NEV, etc.) |
| itch, grew, hurt, changed, bleed, elevation | Lesion symptoms |
| biopsed | Biopsy confirmed (TRUE/FALSE) |
| img_id | Linked image filename |



## SQL-Driven Exploration & Sample Insights

### 1. **Biopsy Distribution**
42.1% of all lesions were biopsied.

### 2. **Gender-based Biopsy Analysis**
Females had higher biopsy rates despite males contributing more total lesions.

### 3. **Smoking & Lesion Progression**
Smokers had 61% lesion alteration rate vs 46% in non-smokers.

### 4. **Most Affected Body Parts**
Face, back, and chest are most common lesion sites; lips and nose are most biopsied.

### 5. **Age Group vs Bleeding**
Patients >50 years show highest bleeding rate (23.14%), indicating higher risk.

### 6. **Certain body region associated with high biopsy frequency***
Lesions on the lip and nose show the highest biopsy rates about 86% and 79% respectively.

### 7. **Is Bleeding Predictive of Biopsy?**
88% of bleeding lesions were biopsied vs 30% of non-bleeding ones.

### 8. **Environmental Risk & Sanitation**
Poor sanitation correlates with higher lesion count but not necessarily severity.

### 9. **-What is the distribution of skin cancer history across age groups?**
Skin cancer history rate increases with age, which records 23.4% in patients over 50, 

### 10. **Biopsy Rate by Environmental Exposure**
100% biopsy rate among patients exposed to pesticides and without sewage.

![BI Screenshot](https://github.com/user-attachments/assets/c2f05e1f-a806-40b6-8baa-8a1c23675454)

---

## Summary of Insights

This dataset presents a multi-dimensional view of skin cancer, categorized by demographics, environmental exposure, and lesion characteristics to different types of skin cancer.
The skin cancer dataset shows that certain signs like bleeding, growing, and painful skin lesions are strong reasons why doctors decide to perform a biopsy. The size and where the lesion appear on the body also play a big role, especially if the lesion is large or in a visible area.
We noticed that most lesions are commonly found on the face, chest, back, and forearm, these are areas often exposed to the sun. However, doctors are more likely to biopsy lesions found on the lips, nose, ears, and neck.
This may be because these areas are more sensitive or because skin cancer in these spots tends to be more serious. It also shows that doctors may be more cautious with lesions in these places, even if they don’t appear often.
Other factors like age, family history, exposure to harmful chemicals like pesticides, and lack of clean water or sanitation also increase the chances of needing a biopsy. Altogether, this information helps researchers and doctors understand skin cancer better and also helps build smarter AI tools by using clean, well-organized data that combines personal, medical, and environmental risks.


---

## Limitations

While the dataset provides valuable insights, several limitations affect the depth and generalizability of findings. The sample size of 1,088 lesions may not represent broader or more diverse populations.
Only 458 out of 1,088 cases were biopsy-confirmed, and of those, just 441 were medically relevant to this study i.e. MEL, SCC, ACK, BCC (cancerous), the remaining 17 cases i.e. SEK and NEV are benign. This means a significant portion of the cancer-labelled data lacks clinical validation.
Additionally, the use of binary variables (e.g., TRUE/FALSE for symptoms or exposures) simplifies complex clinical and environmental realities, limiting analytical details.
A major data gap is seen in demographic completeness—over 583 out of 1,088 patients have Unknown or UNK parental ethnic backgrounds, which weakens the dataset’s suitability for predictive modeling and machine learning.
Lastly, potential data collection biases, such as underreporting of symptoms or missing socioeconomic context, may skew results and reduce the reliability of interpretations.


---

## Recommendations

1.	More biopsy needs to be performed as a standard in this medical research to make our data more relevant and accurate for machine learning studies or correct analysis.
2.	Patients need to be re-interviewed or their medical data updated with their parent background to make it easier to make a correlation between skin cancer and individual background (Demography). That will also enhance our dataset integrity for AI and machine learning.
3.	Information/data like skin care habits (like use of sunscreen, clothes), and occupation (like farmers, blue-collar workers due to varying exposure to UV) can also help this study.
4.	Lastly, collaboration with dermatologists during data design and validation can help ensure datasets are both clinically relevant and ethically represented, leading to better diagnostic tools and informed public health interventions.


---

## Repository Structure

| File | Description |
|------|-------------|
| `derm_sql_dataset` | Raw dataset |
| `exploratory_queries.sql` | SQL scripts used for insights |
| `README.md` | This documentation file |
| `BI Dashboard.png` | PowerBI Dashboard |

---

## Conclusion

This SQL-based exploratory project bridges **medical research**, **environmental epidemiology**, and **data analytics**. It showcases my ability to:

- Structure and join complex datasets
- Write efficient queries for clinical insights
- Connect data analysis to real-world health interventions
- Support future machine learning model design through clean SQL-driven data analysis



