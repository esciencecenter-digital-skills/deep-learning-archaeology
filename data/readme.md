# Data for workshop
For the deep learning training that is going to organized on the [3rd of April 2023 at the Vrije Universiteit as part of Computer Application in Archaeology Conference](https://2023.caaconference.org/conference-information/workshops/#DeepLearning), we will be using the data from the excavation activities that were perfromed between 2003 and 2012 for the construction of the North/South metro line [see](https://belowthesurface.amsterdam/en/pagina/de-opgravingen-0). 

The data can be downloaded as csv file [here](https://belowthesurface.amsterdam/en/pagina/publicaties-en-datasets)

# Data processing
To make the dataset suitable for an English Audience the column names have been translated from Dutch. This was done using a Postgres database with the following [SQL script](https://github.com/esciencecenter-digital-skills/deep-learning-archaeology/tree/main/data/import_translate_column_names.sql).

Furthermore, the various fields in the dataset have been assessed ans classified in the following criteria:
  - Adminstrative (e.g. find number, projectnumber, archaeological unit etc.)
  - Measurement (length, weight, diameter etc. )
  - Characteristic (characteristics of the object which does not necessaryly be done by an expert, like color or type of blade, decoration technique)
  - Interpretation (Classification by an expert preferably to a reference collection / typochronology) 
 
The classification was done on [this file](https://statics.belowthesurface.amsterdam/downloadbare-datasets/Data_fields_description.xlsx) from the project and based on doman knowledge by Maurice de Kleijn. The result of this assessment can be found [here](https://github.com/esciencecenter-digital-skills/deep-learning-archaeology/tree/main/data/description_fields.csv).
  
 *Note that the distinction between Characteristic and Interpretation is a bit arbitrary*

# Part I 

To adapt the introduction to Deep Learning workshop part I ("Classification by a Neural Network using Keras") for the archaeological domain we looked at ceramics. 

Since the first part of the deeplearning workshop aims to automatically categorize data based on a variety of characteristics we decided to look at ceramics and see if we can train a neural network that distinguishes ceramics that are cateogorized as "plate, dish, bowl" from ceramics that are categorized as "drinking" based on non interpreted measurements on the dimensions (i.e. height and width), surface treatment and type of material. We thus try to see if the experts could be replaced by our neural nework. 

Please note, that we have simplified the question and that we the aim of this analysis is purely educational. 

The Ceramics subset was made based on the following SQL query. 

```sql
SELECT 
  find_number, --unique ID
  material_category,  
  material, --this field will be used as a characteristic to train the network on
  start_date, 
  end_date, 
  level_1_of_the_functional_classification, 
  level_2_of_the_functional_classification, -- the content of this field follows from the classification that has been produced by the expert through the typochronology Deventer Systeem Code [1]. 
  ceramics_rim_eve_estimated_vessel_equivalent, 
  ceramics_base_eve_estimated_vessel_equivalent, 
  ceramics_reconstructed_object_diameter_in_mm, --this field will be used as a characteristic to train the network on
  ceramics_reconstructed_object_height_in_mm, --this field will be used as a characteristic to train the network on
  ceramics_surface_treatment, --this field will be used as a characteristic to train the network on
  ceramics_decoration_technique, --this field will be used as a characteristic to train the network on
  ceramics_image_type, 
  ceramics_mark, --this field will be used as a characteristic to train the network on
  on_website
  

INTO TABLE rokin_cer
FROM rokin_data

WHERE material_category = 'CER'
--to exclude fields that have no value a subselection is created 
AND NOT ceramics_reconstructed_object_height_in_mm IS NULL 
AND NOT ceramics_reconstructed_object_diameter_in_mm IS NULL
AND NOT level_1_of_the_functional_classification  IS NULL
AND NOT level_2_of_the_functional_classification  IS NULL
AND NOT start_date  IS NULL
AND NOT end_date  IS NULL
AND level_1_of_the_functional_classification = 'Food Processing & Consumption'
AND NOT level_2_of_the_functional_classification = 'Supplies, food general'
AND NOT level_2_of_the_functional_classification = 'Supplies, liquids general'
;
```

[1] The [Deventer System Code](https://www.deventersysteem.nl/about-the-deventer-system-596e3e51-809c-4aa0-bf2f-d12e9adace06) is a Dutch classification system for medieval and post-medieval ceramics and glass.  

The core idea for the deep learning tutorial is that 
  - material
  - ceramics_rim_eve_estimated_vessel_equivalent 
  - ceramics_base_eve_estimated_vessel_equivalent 
  - ceramics_reconstructed_object_diameter_in_mm 
  - ceramics_reconstructed_object_height_in_mm
  - ceramics_image_type 
  - ceramics_mark

Can predict whether something is categorized as "Food consumption: plate, dish, bowl" or "Food consumption: drinking" in the field **level_2_of_the_functional_classification**

```sql
--Since there are too much material categories we have simplyfied them in main categories, this is purely done for educational purposes
ALTER TABLE rokin_cer ADD COLUMN material_simplified varchar;
UPDATE rokin_cer SET material_simplified='faience' WHERE material ='faience';
UPDATE rokin_cer SET material_simplified='faience' WHERE material ='faience: French';
UPDATE rokin_cer SET material_simplified='faience' WHERE material ='faience: Holland';
UPDATE rokin_cer SET material_simplified='faience' WHERE material ='faience: Italian';
UPDATE rokin_cer SET material_simplified='gold lustre' WHERE material ='gold lustre';
UPDATE rokin_cer SET material_simplified='greyware' WHERE material ='greyware: hand-built';
UPDATE rokin_cer SET material_simplified='industrial ware' WHERE material ='industrial ware: black';
UPDATE rokin_cer SET material_simplified='industrial ware' WHERE material ='industrial ware: coloured';
UPDATE rokin_cer SET material_simplified='industrial ware' WHERE material ='industrial ware: creamware';
UPDATE rokin_cer SET material_simplified='industrial ware' WHERE material ='industrial ware: pearlware';
UPDATE rokin_cer SET material_simplified='industrial ware' WHERE material ='industrial ware: red';
UPDATE rokin_cer SET material_simplified='industrial ware' WHERE material ='industrial ware: rewdware';
UPDATE rokin_cer SET material_simplified='industrial ware' WHERE material ='industrial ware: scratchware';
UPDATE rokin_cer SET material_simplified='industrial ware' WHERE material ='industrial ware: stoneware';
UPDATE rokin_cer SET material_simplified='industrial ware' WHERE material ='industrial ware: white';
UPDATE rokin_cer SET material_simplified='maiolica' WHERE material ='maiolica';
UPDATE rokin_cer SET material_simplified='maiolica' WHERE material ='maiolica: Italian';
UPDATE rokin_cer SET material_simplified='maiolica' WHERE material ='maiolica: Spanish';
UPDATE rokin_cer SET material_simplified='porcelain' WHERE material ='porcelain: capucin';
UPDATE rokin_cer SET material_simplified='porcelain' WHERE material ='porcelain: China';
UPDATE rokin_cer SET material_simplified='porcelain' WHERE material ='porcelain: Europe';
UPDATE rokin_cer SET material_simplified='porcelain' WHERE material ='porcelain: famille rose';
UPDATE rokin_cer SET material_simplified='porcelain' WHERE material ='porcelain: famille verte';
UPDATE rokin_cer SET material_simplified='porcelain' WHERE material ='porcelain: Germany';
UPDATE rokin_cer SET material_simplified='porcelain' WHERE material ='porcelain: Japan';
UPDATE rokin_cer SET material_simplified='porcelain' WHERE material ='porcelain: KhangXi';
UPDATE rokin_cer SET material_simplified='porcelain' WHERE material ='porcelain: transitional';
UPDATE rokin_cer SET material_simplified='porcelain' WHERE material ='porcelain: WanLi';
UPDATE rokin_cer SET material_simplified='redware' WHERE material ='redware';
UPDATE rokin_cer SET material_simplified='redware' WHERE material ='redware, slip';
UPDATE rokin_cer SET material_simplified='redware' WHERE material ='redware, slip: Lower Rhine region';
UPDATE rokin_cer SET material_simplified='redware' WHERE material ='redware, slip: sgraffito';
UPDATE rokin_cer SET material_simplified='redware' WHERE material ='redware, slip: slip-cup decoration';
UPDATE rokin_cer SET material_simplified='redware' WHERE material ='redware, slip: Werra';
UPDATE rokin_cer SET material_simplified='redware' WHERE material ='redware: Frankfurt tradition';
UPDATE rokin_cer SET material_simplified='redware' WHERE material ='redware: French';
UPDATE rokin_cer SET material_simplified='redware' WHERE material ='redware: Iberian';
UPDATE rokin_cer SET material_simplified='redware' WHERE material ='redware: slip applied by brush';
UPDATE rokin_cer SET material_simplified='redware' WHERE material ='redware: unglazed';
UPDATE rokin_cer SET material_simplified='redware' WHERE material ='redware: western Germany';
UPDATE rokin_cer SET material_simplified='stoneware' WHERE material ='stoneware';
UPDATE rokin_cer SET material_simplified='stoneware' WHERE material ='stoneware: Aachen';
UPDATE rokin_cer SET material_simplified='stoneware' WHERE material ='stoneware: Cologne';
UPDATE rokin_cer SET material_simplified='stoneware' WHERE material ='stoneware: Frechen';
UPDATE rokin_cer SET material_simplified='stoneware' WHERE material ='stoneware: Langerwehe';
UPDATE rokin_cer SET material_simplified='stoneware' WHERE material ='stoneware: Raeren';
UPDATE rokin_cer SET material_simplified='stoneware' WHERE material ='stoneware: Siegburg';
UPDATE rokin_cer SET material_simplified='stoneware' WHERE material ='stoneware: Westerwald';
UPDATE rokin_cer SET material_simplified='whiteware' WHERE material ='whiteware';
UPDATE rokin_cer SET material_simplified='whiteware' WHERE material ='whiteware: Frankfurt tradition';
UPDATE rokin_cer SET material_simplified='whiteware' WHERE material ='whiteware: Germany';
UPDATE rokin_cer SET material_simplified='whiteware' WHERE material ='whiteware: Hafner';
UPDATE rokin_cer SET material_simplified='whiteware' WHERE material ='whiteware: Weser region';

--added url to website making it nice to be able to click on the individual objects that are present at the website of the project
ALTER TABLE rokin_cer ADD COLUMN url varchar;
UPDATE rokin_cer SET url = concat('https://belowthesurface.amsterdam/en/vondst/',find_number) WHERE on_website =1;

--Finally some of the column names have been renamed to avoid that the participants need to type a lot during the workshop 
ALTER TABLE rokin_cer
RENAME COLUMN level_2_of_the_functional_classification TO l2_class; 

ALTER TABLE rokin_cer
RENAME COLUMN ceramics_reconstructed_object_diameter_in_mm TO object_diameter; 

ALTER TABLE rokin_cer
RENAME COLUMN ceramics_reconstructed_object_height_in_mm TO object_height; 

```


The subset can be found [here](https://github.com/esciencecenter-digital-skills/deep-learning-archaeology/tree/main/data/subset_ceramics_v30032023.csv)


# Part II

To adapt the introduction to Deep Learning workshop part II ("Monitor the training process") to the archaeological domain, we created another subset from [the North South line excavations at the Rokin](https://belowthesurface.amsterdam/en/pagina/de-opgravingen-0). For this exercise we looked whether we could estimate the depth a certain artefact was found based on the dating. A rule of thumb in Archaeology is obviously that the deeper an artefact was found the older it dates. Of course this is not always the case since archaeological layers tend to cut each other and are rarely fully leveled. 

As with most archaeological excavations not all the artefact that are found can be related to a specfic layer. Generally these artefact are assigned a very high  featurenumber that represents all finds that have been found during the excavation activities of of which the exact location is uncertain. In this particular excavation the feature_number '999' was used for these type of finds. 

For the excercise in Part II of the deep learning workshop we looked at the the type of material and dating of that material and see if these can predict the depth where it was found. We want to see whether the type of artefact, thus looking at the artefect/object (the story it tells) and the characteristics provided by the experts Material, Material Category, date_start, date_end, level_1_of_the_functional_classification, level_2_of_the_functional_classification, can estimate in at which depth it should be related to. We looked in particular at Metal.
 
This way we check whether the idea of the older the deeper holds.
 
To create the subset for metal objects where the level heights they from the layer they were found are known the following SQL statement was used. 


```sql

SELECT 
  find_number, --unique ID
  material_category,  
  material, 
  feature_number,
  start_date, 
  end_date, 
  level_1_of_the_functional_classification, 
  level_2_of_the_functional_classification,
  minimum_level_height,
  maximum_level_height,
  (minimum_level_height+maximum_level_height)/2 AS avg_level_height -- to calculate the average height, which in this case is empty
INTO TABLE rokin_temp 
FROM rokin_data
WHERE NOT feature_number = '999'
AND material_category = 'MTL'
AND NOT material IS NULL
AND NOT minimum_level_height IS NULL
AND NOT maximum_level_height IS NULL
AND NOT start_date IS NULL
AND NOT end_date IS NULL
AND NOT material IS NULL
;

ALTER TABLE rokin_temp ADD COLUMN material_simplified varchar;
UPDATE rokin_temp SET material_simplified='discard' WHERE material ='metal';
UPDATE rokin_temp SET material_simplified='metal: aluminium' WHERE material ='metal: aluminium';
UPDATE rokin_temp SET material_simplified='metal: brass' WHERE material ='metal: aluminium-brass';
UPDATE rokin_temp SET material_simplified='metal: aluminium' WHERE material ='metal: aluminium-bronze';
UPDATE rokin_temp SET material_simplified='discard' WHERE material ='metal: billon';
UPDATE rokin_temp SET material_simplified='metal: brass' WHERE material ='metal: brass';
UPDATE rokin_temp SET material_simplified='metal: brass' WHERE material ='metal: brass plate';
UPDATE rokin_temp SET material_simplified='metal: bronze' WHERE material ='metal: bronze';
UPDATE rokin_temp SET material_simplified='metal: composite' WHERE material ='metal: composite';
UPDATE rokin_temp SET material_simplified='metal: copper' WHERE material ='metal: copper';
UPDATE rokin_temp SET material_simplified='metal: copper' WHERE material ='metal: copper-aluminium';
UPDATE rokin_temp SET material_simplified='metal: copper' WHERE material ='metal: copper-nickle';
UPDATE rokin_temp SET material_simplified='metal: copper' WHERE material ='metal: copper-nickle-aluminium';
UPDATE rokin_temp SET material_simplified='metal: copper' WHERE material ='metal: copper-nickle-zinc';
UPDATE rokin_temp SET material_simplified='metal: copper' WHERE material ='metal: copper-zinc';
UPDATE rokin_temp SET material_simplified='metal: copper' WHERE material ='metal: copper alloy';
UPDATE rokin_temp SET material_simplified='metal: gold' WHERE material ='metal: gold';
UPDATE rokin_temp SET material_simplified='metal: iron' WHERE material ='metal: iron';
UPDATE rokin_temp SET material_simplified='metal: iron' WHERE material ='metal: iron-copper';
UPDATE rokin_temp SET material_simplified='metal: iron' WHERE material ='metal: iron-copper-nickle';
UPDATE rokin_temp SET material_simplified='metal: iron' WHERE material ='metal: iron-nickle';
UPDATE rokin_temp SET material_simplified='metal: lead' WHERE material ='metal: lead';
UPDATE rokin_temp SET material_simplified='metal: lead' WHERE material ='metal: lead alloy';
UPDATE rokin_temp SET material_simplified='metal: nickle' WHERE material ='metal: nickle';
UPDATE rokin_temp SET material_simplified='metal: nickle' WHERE material ='metal: nickle-brass';
UPDATE rokin_temp SET material_simplified='metal: nickle' WHERE material ='metal: nickle-bronze';
UPDATE rokin_temp SET material_simplified='metal: nickle' WHERE material ='metal: sheet metal';
UPDATE rokin_temp SET material_simplified='metal: silver' WHERE material ='metal: silver';
UPDATE rokin_temp SET material_simplified='metal: steel' WHERE material ='metal: stainless steel';
UPDATE rokin_temp SET material_simplified='metal: steel' WHERE material ='metal: steel';
UPDATE rokin_temp SET material_simplified='metal: tin' WHERE material ='metal: tin';
UPDATE rokin_temp SET material_simplified='discard' WHERE material ='metal: zamac';
UPDATE rokin_temp SET material_simplified='metal: zinc' WHERE material ='metal: zinc';

```
The resulting dataset can be found here > [here](https://github.com/esciencecenter-digital-skills/deep-learning-archaeology/tree/main/data/metal_feature_numbers_not_999.csv)


To create the subset for objects that are assigned to the feature_number '999', thus where the level heights are not known, the following SQL statement was used. 


```sql


SELECT 
  find_number, --unique ID
  material_category,  
  material, 
  feature_number,
  start_date, 
  end_date, 
  level_1_of_the_functional_classification, 
  level_2_of_the_functional_classification,
  minimum_level_height,
  maximum_level_height,
  (minimum_level_height+maximum_level_height)/2 AS avg_level_height -- to calculate the average height, which in this case is empty
INTO TABLE rokin_temp 
FROM rokin_data
WHERE feature_number = '999'
AND material_category = 'MTL'
;

ALTER TABLE rokin_temp ADD COLUMN material_simplified varchar;
UPDATE rokin_temp SET material_simplified='discard' WHERE material ='metal';
UPDATE rokin_temp SET material_simplified='metal: aluminium' WHERE material ='metal: aluminium';
UPDATE rokin_temp SET material_simplified='metal: brass' WHERE material ='metal: aluminium-brass';
UPDATE rokin_temp SET material_simplified='metal: aluminium' WHERE material ='metal: aluminium-bronze';
UPDATE rokin_temp SET material_simplified='discard' WHERE material ='metal: billon';
UPDATE rokin_temp SET material_simplified='metal: brass' WHERE material ='metal: brass';
UPDATE rokin_temp SET material_simplified='metal: brass' WHERE material ='metal: brass plate';
UPDATE rokin_temp SET material_simplified='metal: bronze' WHERE material ='metal: bronze';
UPDATE rokin_temp SET material_simplified='metal: composite' WHERE material ='metal: composite';
UPDATE rokin_temp SET material_simplified='metal: copper' WHERE material ='metal: copper';
UPDATE rokin_temp SET material_simplified='metal: copper' WHERE material ='metal: copper-aluminium';
UPDATE rokin_temp SET material_simplified='metal: copper' WHERE material ='metal: copper-nickle';
UPDATE rokin_temp SET material_simplified='metal: copper' WHERE material ='metal: copper-nickle-aluminium';
UPDATE rokin_temp SET material_simplified='metal: copper' WHERE material ='metal: copper-nickle-zinc';
UPDATE rokin_temp SET material_simplified='metal: copper' WHERE material ='metal: copper-zinc';
UPDATE rokin_temp SET material_simplified='metal: copper' WHERE material ='metal: copper alloy';
UPDATE rokin_temp SET material_simplified='metal: gold' WHERE material ='metal: gold';
UPDATE rokin_temp SET material_simplified='metal: iron' WHERE material ='metal: iron';
UPDATE rokin_temp SET material_simplified='metal: iron' WHERE material ='metal: iron-copper';
UPDATE rokin_temp SET material_simplified='metal: iron' WHERE material ='metal: iron-copper-nickle';
UPDATE rokin_temp SET material_simplified='metal: iron' WHERE material ='metal: iron-nickle';
UPDATE rokin_temp SET material_simplified='metal: lead' WHERE material ='metal: lead';
UPDATE rokin_temp SET material_simplified='metal: lead' WHERE material ='metal: lead alloy';
UPDATE rokin_temp SET material_simplified='metal: nickle' WHERE material ='metal: nickle';
UPDATE rokin_temp SET material_simplified='metal: nickle' WHERE material ='metal: nickle-brass';
UPDATE rokin_temp SET material_simplified='metal: nickle' WHERE material ='metal: nickle-bronze';
UPDATE rokin_temp SET material_simplified='metal: nickle' WHERE material ='metal: sheet metal';
UPDATE rokin_temp SET material_simplified='metal: silver' WHERE material ='metal: silver';
UPDATE rokin_temp SET material_simplified='metal: steel' WHERE material ='metal: stainless steel';
UPDATE rokin_temp SET material_simplified='metal: steel' WHERE material ='metal: steel';
UPDATE rokin_temp SET material_simplified='metal: tin' WHERE material ='metal: tin';
UPDATE rokin_temp SET material_simplified='discard' WHERE material ='metal: zamac';
UPDATE rokin_temp SET material_simplified='metal: zinc' WHERE material ='metal: zinc';

```

The resulting dataset can be found here > [here](https://github.com/esciencecenter-digital-skills/deep-learning-archaeology/tree/main/data/metal_feature_numbers_999.csv)
