# Data for workshop
For the deep learning training that is going to organized on the [3rd of April 2023 at the Vrije Universiteit as part of Computer Application in Archaeology Conference](https://2023.caaconference.org/conference-information/workshops/#DeepLearning), we will be using the data from the excavation activities that were perfromed between 2003 and 2012 for the construction of the North/South metro line [see](https://belowthesurface.amsterdam/en/pagina/de-opgravingen-0). 

The data can be downloaded as csv file [here](https://belowthesurface.amsterdam/en/pagina/publicaties-en-datasets)

To make the dataset suitable for an English Audience the column names have been translated from Dutch. This was done using a Postgres database with the following [SQL script](https://github.com/esciencecenter-digital-skills/deep-learning-archaeology/data/import_translate_column_names.sql).

# Subsets
Based on an explorative analysis of the dataset three subsets have been created. The various fields in the dataset have been assessed by Maurice de Kleijn based on his domain knowledge of archaeological research.
First every field was assessed and classified to the following categories:
  - Adminstrative (e.g. find number, projectnumber, archaeological unit etc.)
  - Measurement (length, weight, diameter etc. )
  - Characteristic (characteristics of the object which does not necessaryly be done by an expert, like color or type of blade, decoration technique)
  - Interpretation (Classification by an expert preferably to a reference collection / typochronology) 
 
 The classification was done on [this file](https://statics.belowthesurface.amsterdam/downloadbare-datasets/Data_fields_description.xlsx) from the project. The results can be found [here](https://github.com/esciencecenter-digital-skills/deep-learning-archaeology/data/description_fields.csv).
  
 *Note that the distinction between Characteristic and Interpretation is a bit arbitrary*

## Ceramics
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
  ceramics_deventer_system_code, 
  ceramics_rim_eve_estimated_vessel_equivalent, 
  ceramics_base_eve_estimated_vessel_equivalent, 
  ceramics_location_of_production, 
  ceramics_reconstructed_object_diameter_in_mm, 
  ceramics_reconstructed_object_height_in_mm, 
  ceramics_surface_treatment, 
  ceramics_decoration_technique, 
  ceramics_image_type, 
  ceramics_mark
FROM rokin_data
WHERE material_category = 'CER';
```
The core idea for the deep learning tutorial is that 
  - material
  - weight_in_grams 
  - ceramics_rim_eve_estimated_vessel_equivalent 
  - ceramics_base_eve_estimated_vessel_equivalent 
  - ceramics_reconstructed_object_diameter_in_mm 
  - ceramics_reconstructed_object_height_in_mm
  - ceramics_surface_treatment 
  - ceramics_decoration_technique 
  - ceramics_image_type 
  - ceramics_mark

and maybe minimum_level_height & maximum_level_height . 

Can predict **ceramics_deventer_system_code**, which is used to determine **start_date** and **end_date**. The [Deventer System Code](https://www.deventersysteem.nl/about-the-deventer-system-596e3e51-809c-4aa0-bf2f-d12e9adace06) is a Dutch classification system for medieval and post-medieval ceramics and glass. 

The subset can be found [here](https://github.com/esciencecenter-digital-skills/deep-learning-archaeology/data/subset_ceramics.csv)


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

The subset can be found [here](https://github.com/esciencecenter-digital-skills/deep-learning-archaeology/data/subset_glass.csv)

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

The subset can be found [here](https://github.com/esciencecenter-digital-skills/deep-learning-archaeology/data/subset_pipes.csv)

## Knives & Metal
We might consider to look at metal knives as well, but will do the at a later stage.
