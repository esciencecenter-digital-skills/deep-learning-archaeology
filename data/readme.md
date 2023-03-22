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

## Ceramics
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
  ceramics_mark --this field will be used as a characteristic to train the network on
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
  - ceramics_surface_treatment 
  - ceramics_decoration_technique 
  - ceramics_image_type 
  - ceramics_mark

Can predict whether something is categorized as "Food consumption: plate, dish, bowl" or "Food consumption: drinking" in the field **level_2_of_the_functional_classification**

The subset can be found [here](https://github.com/esciencecenter-digital-skills/deep-learning-archaeology/tree/main/data/subset_ceramics_v21032023.csv)








# Other categories

We did consider to look at other material categories as well, but decided to stick with Ceramics only. Yet, the ideas below could in theory be explored at a later stage.

## Glass
The Ceramics subset was made based on the following SQL query. 
```sql
SELECT 
  find_number, 
  material_category, 
  material, 
  weight_in_grams, 
  object_name, 
  object_part, 
  start_date, 
  end_date, 
  minimum_level_height, 
  maximum_level_height, 
  level_1_of_the_functional_classification, 
  level_2_of_the_functional_classification, 
  level_3_of_the_functional_classification, 
  level_4_of_the_functional_classification,
  glass_deventer_system_code,
  glass_colour,
  glass_location_of_production,
  glass_rim_eve_estimated_vessel_equivalent,
  glass_base_eve_estimated_vessel_equivalent,
  glass_reconstructed_object_diameter_in_mm,
  glass_reconstructed_object_height_in_mm,
  glass_decoration,
  glass_mark
FROM rokin_data
WHERE material_category = 'GLS';
```

Just like Ceramics, we want to explore if
  - material 
  - weigth
  - glass_colour,
  - glass_location_of_production,
  - glass_rim_eve_estimated_vessel_equivalent,
  - glass_base_eve_estimated_vessel_equivalent,
  - glass_reconstructed_object_diameter_in_mm,
  - glass_reconstructed_object_height_in_mm,
  - glass_decoration,
  - glass_mark

and maybe minimum_level_height & maximum_level_height . 

Can predict **glass_deventer_system_code** from which it could get information about the dating. 

The subset can be found [here](https://github.com/esciencecenter-digital-skills/deep-learning-archaeology/tree/main/data/subset_glass.csv)

## Clay Pipes (for smoking tobacco)

The Clay Pipe subset was made based on the following SQL query. 
```sql
SELECT 
  find_number, 
  material_category, 
  material, 
  weight_in_grams, 
  object_name, 
  object_part, 
  start_date, 
  end_date, 
  minimum_level_height, 
  maximum_level_height, 
  level_1_of_the_functional_classification, 
  level_2_of_the_functional_classification, 
  level_3_of_the_functional_classification, 
  level_4_of_the_functional_classification,
  pipes_model,
  pipes_mark_on_side_of_bowl_left,
  pipes_mark_on_side_of_bowl_right,
  pipes_mark_on_base_of_heel_left,
  pipes_mark_on_base_of_heel_right,
  pipes_mark_or_mark_on_base_of_heel,
  pipes_surface_treatment_bowl,
  pipes_bowl_opening,
  pipes_milling,
  pipes_stem_treatment,
  pipes_quality,
  pipes_production_centre,
  pipes_pipe_maker  
FROM rokin_data
WHERE material_category = 'CPY';
```

We wonder whether 
 - material
 - weigth
 - pipes_mark_on_side_of_bowl_left,
 - pipes_mark_on_side_of_bowl_right,
 - pipes_mark_on_base_of_heel_left,
 - pipes_mark_on_base_of_heel_right,
 - pipes_mark_or_mark_on_base_of_heel,
 - pipes_surface_treatment_bowl,
 - pipes_bowl_opening,
 - pipes_milling,
 - pipes_stem_treatment,
 - pipes_quality,
 - material 
  
and maybe minimum_level_height & maximum_level_height . 

Can predict **pipes_model** from which it could get information about the pipe maker and the dating. 

The subset can be found [here](https://github.com/esciencecenter-digital-skills/deep-learning-archaeology/tree/main/data/subset_pipes.csv)
