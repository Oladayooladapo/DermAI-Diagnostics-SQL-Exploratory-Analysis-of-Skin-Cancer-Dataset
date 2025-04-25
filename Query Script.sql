----How many lesions are in the dataset? and how many were biopsied?

SELECT 
    COUNT(*) AS total_lesions,
    SUM(CASE WHEN biopsed = TRUE THEN 1 ELSE 0 END) AS biopsied_lesions
FROM table2;


---Which gender has the highest proportion of biopsied lesions?
---Although males account for 75% of all biopsied lesions, the biopsy rate is higher among females (55.94%) 
---compared to males (33.2%). This suggests that while more biopsies are performed on males overall; possibly 
---due to a higher number of lesions, females are more likely to have their lesions biopsied, indicating greater 
---clinical suspicion per case.

SELECT 
    gender,
    COUNT(*) FILTER (WHERE biopsed = TRUE) AS biopsied_count,
    COUNT(*) AS total_lesions,
    ROUND(COUNT(*) FILTER (WHERE biopsed = TRUE) * 100.0 / COUNT(*), 2) AS biopsied_to_total_percentage
FROM 
    table1 p
JOIN 
    table2 l ON p.patient_id = l.patient_id
GROUP BY 
    gender;

---Is there correlation between smoking and size or growth of lesion?
---Smokers show a lesion alteration rate (grew or changed) of 61.29%, compared to 46.78% in non-smokers, 
---suggesting that smoking may significantly correlate with lesion progression and transformation.

SELECT 
    smoke,
    COUNT(*) FILTER (WHERE grew = TRUE OR changed = TRUE) AS altered_lesions,
    COUNT(*) AS total_lesions,
    ROUND(COUNT(*) FILTER (WHERE grew = TRUE OR changed = TRUE) * 100.0 / COUNT(*), 2) AS altered_percentage
FROM 
    table1 p
JOIN 
    table2 l ON p.patient_id = l.patient_id
GROUP BY 
    smoke;


---What body parts has the most lesion?

SELECT 
    region, 
    COUNT(*) AS lesion_count
FROM table2
GROUP BY region
ORDER BY lesion_count DESC;

---Does age group have an impact on the likelihood of lesion bleeding?
---Patients over 50 have the highest lesion bleed rate at 23.14%, 
---indicating that age may be a significant demographic risk factor associated with aggressive lesion behavior.

SELECT 
    CASE 
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 50 THEN '30-50'
        ELSE 'Over 50'
    END AS age_group,
    COUNT(*) FILTER (WHERE bleed = TRUE) AS bleeding_cases,
    COUNT(*) AS total_cases,
    ROUND(COUNT(*) FILTER (WHERE bleed = TRUE) * 100.0 / COUNT(*), 2) AS bleed_to_total_percentage
FROM 
    table1 p
JOIN 
    table2 l ON p.patient_id = l.patient_id
GROUP BY 
    age_group
ORDER BY 
    bleed_to_total_percentage DESC;

---Are there certain regions of the body associated with higher biopsy frequencies?
---Lesions on the lip and nose show the highest biopsy rates about 86% and 79% respectively, 
---indicating that lesions in more sun-exposed or visibly monitored regions may be prioritized for 
---diagnostic investigation.

SELECT 
    region,
    COUNT(*) FILTER (WHERE biopsed = TRUE) AS biopsied,
    COUNT(*) AS total,
    ROUND(COUNT(*) FILTER (WHERE biopsed = TRUE) * 100.0 / COUNT(*), 2) AS biopsy_rate
FROM 
    table2
GROUP BY 
    region
ORDER BY 
    biopsy_rate DESC;

---Is lesion bleed an indicator for biopsy?
---Bleeding lesions are biopsied at a 88% rate versus 30% for non-bleeding lesions, 
---strongly indicating that bleeding is treated as a high-risk characteristic for malignancy.

SELECT 
    bleed,
    COUNT(*) FILTER (WHERE biopsed = TRUE) AS biopsied,
    COUNT(*) AS total,
    ROUND(COUNT(*) FILTER (WHERE biopsed = TRUE) * 100.0 / COUNT(*), 2) AS biopsy_rate
FROM 
    table2
GROUP BY 
    bleed;

---Does lack of sewage access correlate with painful lesions?
---Patients without sewage access had more lesions (815 vs. 273), 
---but a lower rate of painful lesions (9.2% vs. 28%). This suggests an environmental health disparity,
---with poor sanitation linked to higher lesion occurrence, while severity may be influenced by other factors.

SELECT 
    has_sewage_system,
    COUNT(*) FILTER (WHERE hurt = TRUE) AS painful_lesions,
    COUNT(*) AS total_lesions,
    ROUND(COUNT(*) FILTER (WHERE hurt = TRUE) * 100.0 / COUNT(*), 2) AS painful_to_total_lesion_percentage
FROM 
    table1 p
JOIN 
    table2 l ON p.patient_id = l.patient_id
GROUP BY 
    has_sewage_system;

---What is the distribution of skin cancer history across age groups?
---he skin cancer history rate increases with age, which records 23.4% in patients over 50, 
---indicating age as a key demographic variable affecting skin cancer.

SELECT 
    CASE 
        WHEN age < 30 THEN 'Under 30'
        WHEN age BETWEEN 30 AND 50 THEN '30-50'
        ELSE 'Over 50'
    END AS age_group,
    COUNT(*) FILTER (WHERE skin_cancer_history = TRUE) AS with_history,
    COUNT(*) AS total,
    ROUND(COUNT(*) FILTER (WHERE skin_cancer_history = TRUE) * 100.0 / COUNT(*), 2) AS history_rate
FROM 
    table1
GROUP BY 
    age_group
ORDER BY 
    age_group;

---What environmental exposure patterns are common among patients with biopsied lesions?
---Patients exposed to pesticides and lacking sewage systems show a 100% biopsy rate, suggesting a 
---strong environmental risk factor that warrants more research. 

SELECT 
    pesticide,
    has_piped_water,
    has_sewage_system,
    COUNT(*) FILTER (WHERE biopsed = TRUE) AS biopsied_lesions,
    COUNT(*) AS total_lesions,
    ROUND(COUNT(*) FILTER (WHERE biopsed = TRUE) * 100.0 / COUNT(*), 2) AS biopsy_rate
FROM 
    table1 p
JOIN 
    table2 l ON p.patient_id = l.patient_id
GROUP BY 
    pesticide, has_piped_water, has_sewage_system
ORDER BY 
    biopsy_rate DESC;



