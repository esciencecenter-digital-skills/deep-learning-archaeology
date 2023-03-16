-- Create table postgres
CREATE TABLE rokin_data
(vondstnummer varchar,
project_code varchar,
categorie varchar,
subcategorie varchar,
gewicht numeric,
object varchar,
objectdeel varchar,
fragmenten numeric,
past_aan_hoort_bij varchar,
begin_dat numeric,
eind_dat numeric,
put varchar,
vlak varchar,
spoor varchar,
vak varchar,
vlak_min numeric,
vlak_max numeric,
trefwoorden varchar,
niveau1 varchar,
niveau2 varchar,
niveau3 varchar,
niveau4 varchar,
website numeric,
aardewerk_ds_type varchar,
aardewerk_eve_rand numeric,
aardewerk_eve_bodem numeric,
aardewerk_herkomst varchar,
aardewerk_object_diameter_mm numeric,
aardewerk_object_hoogte_mm numeric,
aardewerk_fragm_lengte_mm numeric,
aardewerk_fragm_breedte_mm numeric,
aardewerk_fragm_hoogte_mm numeric,
aardewerk_opp_behandeling varchar,
aardewerk_decoratietechniek varchar,
aardewerk_decorgroepen varchar,
aardewerk_merk varchar,
blankewapens_totale_lengte_mm numeric,
blankewapens_type_lemmet varchar,
blankewapens_type_klingvanger varchar,
blankewapens_type_heft varchar,
blankewapens_materiaal_heft varchar,
blankewapens_type_heftbekroning varchar,
blankewapens_productiemerk varchar,
bouwmaterialen_kleur varchar,
bouwmaterialen_grootstelengte_mm numeric,
bouwmaterialen_grootstebreedte_mm numeric,
bouwmaterialen_grootstedikte_mm numeric,
bouwmaterialen_productiecentrum varchar,
bouwmaterialen_afbeelding varchar,
bouwmaterialen_oppervlakte varchar,
fauna_soort varchar,
fauna_element varchar,
fauna_lengte_mm numeric,
fauna_breedte_mm numeric,
fauna_hoogte_mm numeric,
glas_ds_type varchar,
glas_kleur varchar,
glas_herkomst varchar,
glas_eve_rand numeric,
glas_eve_bodem numeric,
glas_object_diameter_mm numeric,
glas_object_hoogte_mm numeric,
glas_fragm_lengte_mm numeric,
glas_fragm_breedte_mm numeric,
glas_fragm_hoogte_mm numeric,
glas_fragm_dikte_mm numeric,
glas_decoratie varchar,
glas_merk varchar,
hout_deelmaterialen varchar,
hout_grootstelengte_mm numeric,
hout_grootstebreedte_mm numeric,
hout_grootstehoogte_mm numeric,
hout_grootstedikte_mm numeric,
hout_diameter_mm numeric,
hout_productiewijze varchar,
kunststof_deelmaterialen varchar,
kunststof_grootstelengte_mm numeric,
kunststof_grootstebreedte_mm numeric,
kunststof_grootstehoogte_mm numeric,
kunststof_diameter_mm numeric,
kunststof_productiecentrum varchar,
kunststof_eigenaar varchar,
kunststof_merk varchar,
kunststof_type varchar,
kunststof_eenheid_waarde varchar,
leer_archeologischobjecttype varchar,
leer_deelmaterialen varchar,
leer_versiering varchar,
leer_leersoort varchar,
leer_grootste_lengte_mm numeric,
leer_grootste_breedte_mm numeric,
leer_grootste_hoogte_mm numeric,
messen_angel_of_plaatangel varchar,
messen_heft_mat_1 varchar,
messen_lemmet_lengte numeric,
messen_heft_lengte numeric,
messen_minimale_totale_lengte numeric,
messen_minimale_totale_breedte numeric,
metaal_deelmaterialen varchar,
metaal_grootstelengte_mm numeric,
metaal_grootstebreedte_mm numeric,
metaal_grootstehoogte_mm numeric,
metaal_grootstedikte_mm numeric,
metaal_diameter_mm numeric,
metaal_productiecentrum varchar,
mix_grootstelengte_mm numeric,
mix_grootstebreedte_mm numeric,
mix_grootstehoogte_mm numeric,
mix_grootstedikte_mm numeric,
mix_diameter_mm numeric,
munt_land_geografisch varchar,
munt_staat_politieke_eenheid varchar,
munt_autoriteit_politiek varchar,
munt_muntsoort varchar,
munt_eenheid_waarde varchar,
munt_ontwerper varchar,
munt_onderwerp_gelegenheid varchar,
munt_muntplaats_productieplaats varchar,
munt_lengte_diameter_in_mm numeric,
munt_breedte_in_mm numeric,
natuursteen_subsoort varchar,
natuursteen_grootstelengte_mm numeric,
natuursteen_grootstebreedte_mm numeric,
natuursteen_grootstehoogte_mm numeric,
natuursteen_grootstedikte_mm numeric,
natuursteen_diameter_mm numeric,
natuursteen_productiesporen varchar,
plant_soort varchar,
plant_grootstelengte_mm numeric,
plant_grootstebreedte_mm numeric,
plant_grootstehoogte_mm numeric,
plant_grootstedikte_mm numeric,
plant_diameter_mm numeric,
rookpijpen_model varchar,
rookpijpen_zijmerk_links varchar,
rookpijpen_zijmerk_rechts varchar,
rookpijpen_bijmerk_links varchar,
rookpijpen_bijmerk_rechts varchar,
rookpijpen_merk_of_hielmerk varchar,
rookpijpen_oppervlaktebehandeling_kop varchar,
rookpijpen_kopopening varchar,
rookpijpen_radering varchar,
rookpijpen_steelbehandeling varchar,
rookpijpen_kwaliteit varchar,
rookpijpen_productiecentrum varchar,
rookpijpen_pijpenmaker varchar,
sculpturen_baksel varchar,
sculpturen_hoogte_mm numeric,
sculpturen_breedte_mm numeric,
sculpturen_diepte_mm numeric,
sculpturen_hol_of_massief varchar,
sculpturen_voorstelling varchar,
textiel_deelmaterialen varchar,
textiel_grootstelengte_mm numeric,
textiel_grootstebreedte_mm numeric,
textiel_productiewijze varchar,
textiel_binding varchar,
textiel_bewerking varchar,
touw_grootstelengte_mm numeric,
touw_grootstebreedte_mm numeric,
touw_diameter_mm numeric,
touw_strengen numeric,
touw_productiewijze varchar);

--##################################
--Import data from .csv file to Postgres
--##################################


COPY rokin_data(vondstnummer,
project_code,
categorie,
subcategorie,
gewicht,
object,
objectdeel,
fragmenten,
past_aan_hoort_bij,
begin_dat,
eind_dat,
put,
vlak,
spoor,
vak,
vlak_min,
vlak_max,
trefwoorden,
niveau1,
niveau2,
niveau3,
niveau4,
website,
aardewerk_ds_type,
aardewerk_eve_rand,
aardewerk_eve_bodem,
aardewerk_herkomst,
aardewerk_object_diameter_mm,
aardewerk_object_hoogte_mm,
aardewerk_fragm_lengte_mm,
aardewerk_fragm_breedte_mm,
aardewerk_fragm_hoogte_mm,
aardewerk_opp_behandeling,
aardewerk_decoratietechniek,
aardewerk_decorgroepen,
aardewerk_merk,
blankewapens_totale_lengte_mm,
blankewapens_type_lemmet,
blankewapens_type_klingvanger,
blankewapens_type_heft,
blankewapens_materiaal_heft,
blankewapens_type_heftbekroning,
blankewapens_productiemerk,
bouwmaterialen_kleur,
bouwmaterialen_grootstelengte_mm,
bouwmaterialen_grootstebreedte_mm,
bouwmaterialen_grootstedikte_mm,
bouwmaterialen_productiecentrum,
bouwmaterialen_afbeelding,
bouwmaterialen_oppervlakte,
fauna_soort,
fauna_element,
fauna_lengte_mm,
fauna_breedte_mm,
fauna_hoogte_mm,
glas_ds_type,
glas_kleur,
glas_herkomst,
glas_eve_rand,
glas_eve_bodem,
glas_object_diameter_mm,
glas_object_hoogte_mm,
glas_fragm_lengte_mm,
glas_fragm_breedte_mm,
glas_fragm_hoogte_mm,
glas_fragm_dikte_mm,
glas_decoratie,
glas_merk,
hout_deelmaterialen,
hout_grootstelengte_mm,
hout_grootstebreedte_mm,
hout_grootstehoogte_mm,
hout_grootstedikte_mm,
hout_diameter_mm,
hout_productiewijze,
kunststof_deelmaterialen,
kunststof_grootstelengte_mm,
kunststof_grootstebreedte_mm,
kunststof_grootstehoogte_mm,
kunststof_diameter_mm,
kunststof_productiecentrum,
kunststof_eigenaar,
kunststof_merk,
kunststof_type,
kunststof_eenheid_waarde,
leer_archeologischobjecttype,
leer_deelmaterialen,
leer_versiering,
leer_leersoort,
leer_grootste_lengte_mm,
leer_grootste_breedte_mm,
leer_grootste_hoogte_mm,
messen_angel_of_plaatangel,
messen_heft_mat_1,
messen_lemmet_lengte,
messen_heft_lengte,
messen_minimale_totale_lengte,
messen_minimale_totale_breedte,
metaal_deelmaterialen,
metaal_grootstelengte_mm,
metaal_grootstebreedte_mm,
metaal_grootstehoogte_mm,
metaal_grootstedikte_mm,
metaal_diameter_mm,
metaal_productiecentrum,
mix_grootstelengte_mm,
mix_grootstebreedte_mm,
mix_grootstehoogte_mm,
mix_grootstedikte_mm,
mix_diameter_mm,
munt_land_geografisch,
munt_staat_politieke_eenheid,
munt_autoriteit_politiek,
munt_muntsoort,
munt_eenheid_waarde,
munt_ontwerper,
munt_onderwerp_gelegenheid,
munt_muntplaats_productieplaats,
munt_lengte_diameter_in_mm,
munt_breedte_in_mm,
natuursteen_subsoort,
natuursteen_grootstelengte_mm,
natuursteen_grootstebreedte_mm,
natuursteen_grootstehoogte_mm,
natuursteen_grootstedikte_mm,
natuursteen_diameter_mm,
natuursteen_productiesporen,
plant_soort,
plant_grootstelengte_mm,
plant_grootstebreedte_mm,
plant_grootstehoogte_mm,
plant_grootstedikte_mm,
plant_diameter_mm,
rookpijpen_model,
rookpijpen_zijmerk_links,
rookpijpen_zijmerk_rechts,
rookpijpen_bijmerk_links,
rookpijpen_bijmerk_rechts,
rookpijpen_merk_of_hielmerk,
rookpijpen_oppervlaktebehandeling_kop,
rookpijpen_kopopening,
rookpijpen_radering,
rookpijpen_steelbehandeling,
rookpijpen_kwaliteit,
rookpijpen_productiecentrum,
rookpijpen_pijpenmaker,
sculpturen_baksel,
sculpturen_hoogte_mm,
sculpturen_breedte_mm,
sculpturen_diepte_mm,
sculpturen_hol_of_massief,
sculpturen_voorstelling,
textiel_deelmaterialen,
textiel_grootstelengte_mm,
textiel_grootstebreedte_mm,
textiel_productiewijze,
textiel_binding,
textiel_bewerking,
touw_grootstelengte_mm,
touw_grootstebreedte_mm,
touw_diameter_mm,
touw_strengen,
touw_productiewijze
) 
--Link to csv file
FROM 'YOURPATH /Downloadtabel_EN.csv' CSV HEADER;

ALTER TABLE rokin_data RENAME COLUMN vondstnummer TO Find_number;
ALTER TABLE rokin_data RENAME COLUMN project_code TO Project_code_Location;
ALTER TABLE rokin_data RENAME COLUMN categorie TO Material_category;
ALTER TABLE rokin_data RENAME COLUMN subcategorie TO Material;
ALTER TABLE rokin_data RENAME COLUMN gewicht TO Weight_in_grams;
ALTER TABLE rokin_data RENAME COLUMN object TO Object_name;
ALTER TABLE rokin_data RENAME COLUMN objectdeel TO Object_part;
ALTER TABLE rokin_data RENAME COLUMN fragmenten TO Number_of_fragments;
ALTER TABLE rokin_data RENAME COLUMN past_aan_hoort_bij TO Fits_or_belongs_to_find_numbers;
ALTER TABLE rokin_data RENAME COLUMN begin_dat TO Start_date;
ALTER TABLE rokin_data RENAME COLUMN eind_dat TO End_date;
ALTER TABLE rokin_data RENAME COLUMN put TO Trench_number;
ALTER TABLE rokin_data RENAME COLUMN vlak TO Level_number;
ALTER TABLE rokin_data RENAME COLUMN spoor TO Feature_number;
ALTER TABLE rokin_data RENAME COLUMN vak TO Section_number;
ALTER TABLE rokin_data RENAME COLUMN vlak_min TO Minimum_level_height;
ALTER TABLE rokin_data RENAME COLUMN vlak_max TO Maximum_level_height;
ALTER TABLE rokin_data RENAME COLUMN trefwoorden TO Keywords_photographed_finds_only;
ALTER TABLE rokin_data RENAME COLUMN niveau1 TO Level_1_of_the_functional_classification;
ALTER TABLE rokin_data RENAME COLUMN niveau2 TO Level_2_of_the_functional_classification;
ALTER TABLE rokin_data RENAME COLUMN niveau3 TO Level_3_of_the_functional_classification;
ALTER TABLE rokin_data RENAME COLUMN niveau4 TO Level_4_of_the_functional_classification;
ALTER TABLE rokin_data RENAME COLUMN website TO On_website;
ALTER TABLE rokin_data RENAME COLUMN aardewerk_ds_type TO Ceramics_Deventer_system_code;
ALTER TABLE rokin_data RENAME COLUMN aardewerk_eve_rand TO Ceramics_rim_EVE_Estimated_vessel_equivalent;
ALTER TABLE rokin_data RENAME COLUMN aardewerk_eve_bodem TO Ceramics_base_EVE_Estimated_vessel_equivalent;
ALTER TABLE rokin_data RENAME COLUMN aardewerk_herkomst TO Ceramics_Location_of_production;
ALTER TABLE rokin_data RENAME COLUMN aardewerk_object_diameter_mm TO Ceramics_reconstructed_object_diameter_in_mm;
ALTER TABLE rokin_data RENAME COLUMN aardewerk_object_hoogte_mm TO Ceramics_reconstructed_object_height_in_mm;
ALTER TABLE rokin_data RENAME COLUMN aardewerk_fragm_lengte_mm TO Ceramics_Fragment_length_in_mm;
ALTER TABLE rokin_data RENAME COLUMN aardewerk_fragm_breedte_mm TO Ceramics_Fragment_width_in_mm;
ALTER TABLE rokin_data RENAME COLUMN aardewerk_fragm_hoogte_mm TO Ceramics_Fragment_height_in_mm;
ALTER TABLE rokin_data RENAME COLUMN aardewerk_opp_behandeling TO Ceramics_Surface_treatment;
ALTER TABLE rokin_data RENAME COLUMN aardewerk_decoratietechniek TO Ceramics_Decoration_technique;
ALTER TABLE rokin_data RENAME COLUMN aardewerk_decorgroepen TO Ceramics_Image_type;
ALTER TABLE rokin_data RENAME COLUMN aardewerk_merk TO Ceramics_Mark;
ALTER TABLE rokin_data RENAME COLUMN blankewapens_totale_lengte_mm TO Hilted_weapons_Total_length_in_mm;
ALTER TABLE rokin_data RENAME COLUMN blankewapens_type_lemmet TO Hilted_weapons_Blade_type;
ALTER TABLE rokin_data RENAME COLUMN blankewapens_type_klingvanger TO Hilted_weapons_Blade_catcher_type;
ALTER TABLE rokin_data RENAME COLUMN blankewapens_type_heft TO Hilted_weapons_Grip_type;
ALTER TABLE rokin_data RENAME COLUMN blankewapens_materiaal_heft TO Hilted_weapons_Grip_material;
ALTER TABLE rokin_data RENAME COLUMN blankewapens_type_heftbekroning TO Hilted_weapons_Pommel_cap_type;
ALTER TABLE rokin_data RENAME COLUMN blankewapens_productiemerk TO Hilted_weapons_Production_mark;
ALTER TABLE rokin_data RENAME COLUMN bouwmaterialen_kleur TO Building_material_Colour;
ALTER TABLE rokin_data RENAME COLUMN bouwmaterialen_grootstelengte_mm TO Building_material_Greatest_length_in_mm;
ALTER TABLE rokin_data RENAME COLUMN bouwmaterialen_grootstebreedte_mm TO Building_material_Greatest_width_in_mm;
ALTER TABLE rokin_data RENAME COLUMN bouwmaterialen_grootstedikte_mm TO Building_material_Greatest_thickness_in_mm;
ALTER TABLE rokin_data RENAME COLUMN bouwmaterialen_productiecentrum TO Building_material_Production_centre;
ALTER TABLE rokin_data RENAME COLUMN bouwmaterialen_afbeelding TO Building_material_Image_type;
ALTER TABLE rokin_data RENAME COLUMN bouwmaterialen_oppervlakte TO Building_material_Surface_treatment;
ALTER TABLE rokin_data RENAME COLUMN fauna_soort TO Fauna_Species;
--ALTER TABLE rokin_data RENAME COLUMN fauna_element TO Fauna_Element;
ALTER TABLE rokin_data RENAME COLUMN fauna_lengte_mm TO Fauna_Length_in_mm;
ALTER TABLE rokin_data RENAME COLUMN fauna_breedte_mm TO Fauna_Width_in_mm;
ALTER TABLE rokin_data RENAME COLUMN fauna_hoogte_mm TO Fauna_Height_in_mm;
ALTER TABLE rokin_data RENAME COLUMN glas_ds_type TO Glass_Deventer_system_code;
ALTER TABLE rokin_data RENAME COLUMN glas_kleur TO Glass_Colour;
ALTER TABLE rokin_data RENAME COLUMN glas_herkomst TO Glass_Location_of_production;
ALTER TABLE rokin_data RENAME COLUMN glas_eve_rand TO Glass_rim_EVE_Estimated_vessel_equivalent;
ALTER TABLE rokin_data RENAME COLUMN glas_eve_bodem TO Glass_base_EVE_Estimated_vessel_equivalent;
ALTER TABLE rokin_data RENAME COLUMN glas_object_diameter_mm TO Glass_reconstructed_object_diameter_in_mm;
ALTER TABLE rokin_data RENAME COLUMN glas_object_hoogte_mm TO Glass_reconstructed_object_height_in_mm;
ALTER TABLE rokin_data RENAME COLUMN glas_fragm_lengte_mm TO Glass_Fragment_length_in_mm;
ALTER TABLE rokin_data RENAME COLUMN glas_fragm_breedte_mm TO Glass_Fragment_width_in_mm;
ALTER TABLE rokin_data RENAME COLUMN glas_fragm_hoogte_mm TO Glass_Fragment_height_in_mm;
ALTER TABLE rokin_data RENAME COLUMN glas_fragm_dikte_mm TO Glass_Fragment_thickness_in_mm;
ALTER TABLE rokin_data RENAME COLUMN glas_decoratie TO Glass_Decoration;
ALTER TABLE rokin_data RENAME COLUMN glas_merk TO Glass_Mark;
ALTER TABLE rokin_data RENAME COLUMN hout_deelmaterialen TO Wood_Secondary_material;
ALTER TABLE rokin_data RENAME COLUMN hout_grootstelengte_mm TO Wood_Greatest_length_in_mm;
ALTER TABLE rokin_data RENAME COLUMN hout_grootstebreedte_mm TO Wood_Greatest_width_in_mm;
ALTER TABLE rokin_data RENAME COLUMN hout_grootstehoogte_mm TO Wood_Greatest_height_in_mm;
ALTER TABLE rokin_data RENAME COLUMN hout_grootstedikte_mm TO Wood_Greatest_thickness_in_mm;
ALTER TABLE rokin_data RENAME COLUMN hout_diameter_mm TO Wood_Diameter_in_mm;
ALTER TABLE rokin_data RENAME COLUMN hout_productiewijze TO Wood_Production_method;
ALTER TABLE rokin_data RENAME COLUMN kunststof_deelmaterialen TO Synthetics_Secondary_material;
ALTER TABLE rokin_data RENAME COLUMN kunststof_grootstelengte_mm TO Synthetics_Greatest_length_in_mm;
ALTER TABLE rokin_data RENAME COLUMN kunststof_grootstebreedte_mm TO Synthetics_Greatest_width_in_mm;
ALTER TABLE rokin_data RENAME COLUMN kunststof_grootstehoogte_mm TO Synthetics_Greatest_height_in_mm;
ALTER TABLE rokin_data RENAME COLUMN kunststof_diameter_mm TO Synthetics_Diameter_in_mm;
ALTER TABLE rokin_data RENAME COLUMN kunststof_productiecentrum TO Synthetics_Production_centre;
ALTER TABLE rokin_data RENAME COLUMN kunststof_eigenaar TO Synthetics_Owner;
ALTER TABLE rokin_data RENAME COLUMN kunststof_merk TO Synthetics_Mark;
ALTER TABLE rokin_data RENAME COLUMN kunststof_type TO Synthetics_Type;
ALTER TABLE rokin_data RENAME COLUMN kunststof_eenheid_waarde TO Synthetics_Unit_value;
ALTER TABLE rokin_data RENAME COLUMN leer_archeologischobjecttype TO Leather_Type;
ALTER TABLE rokin_data RENAME COLUMN leer_deelmaterialen TO Leather_Secondary_material;
ALTER TABLE rokin_data RENAME COLUMN leer_versiering TO Leather_Decoration_technique;
ALTER TABLE rokin_data RENAME COLUMN leer_leersoort TO Leather_Leather_type;
ALTER TABLE rokin_data RENAME COLUMN leer_grootste_lengte_mm TO Leather_Greatest_length_in_mm;
ALTER TABLE rokin_data RENAME COLUMN leer_grootste_breedte_mm TO Leather_Greatest_width_in_mm;
ALTER TABLE rokin_data RENAME COLUMN leer_grootste_hoogte_mm TO Leather_Greatest_height_in_mm;
ALTER TABLE rokin_data RENAME COLUMN messen_angel_of_plaatangel TO Knives_Whittle_tang_or_scale_tang;
ALTER TABLE rokin_data RENAME COLUMN messen_heft_mat_1 TO Knives_Hilt_material;
ALTER TABLE rokin_data RENAME COLUMN messen_lemmet_lengte TO Knives_Blade_length_in_mm;
ALTER TABLE rokin_data RENAME COLUMN messen_heft_lengte TO Knives_Hilt_length_in_mm;
ALTER TABLE rokin_data RENAME COLUMN messen_minimale_totale_lengte TO Knives_Greatest_length;
ALTER TABLE rokin_data RENAME COLUMN messen_minimale_totale_breedte TO Knives_Greatest_width;
ALTER TABLE rokin_data RENAME COLUMN metaal_deelmaterialen TO Metal_Secondary_material;
ALTER TABLE rokin_data RENAME COLUMN metaal_grootstelengte_mm TO Metal_Greatest_length_in_mm;
ALTER TABLE rokin_data RENAME COLUMN metaal_grootstebreedte_mm TO Metal_Greatest_width_in_mm;
ALTER TABLE rokin_data RENAME COLUMN metaal_grootstehoogte_mm TO Metal_Greatest_height_in_mm;
ALTER TABLE rokin_data RENAME COLUMN metaal_grootstedikte_mm TO Metal_Greatest_thickness_in_mm;
ALTER TABLE rokin_data RENAME COLUMN metaal_diameter_mm TO Metal_Diameter_in_mm;
ALTER TABLE rokin_data RENAME COLUMN metaal_productiecentrum TO Metal_Production_centre;
ALTER TABLE rokin_data RENAME COLUMN mix_grootstelengte_mm TO Mixed_Greatest_length_in_mm;
ALTER TABLE rokin_data RENAME COLUMN mix_grootstebreedte_mm TO Mixed_Greatest_width_in_mm;
ALTER TABLE rokin_data RENAME COLUMN mix_grootstehoogte_mm TO Mixed_Greatest_height_in_mm;
ALTER TABLE rokin_data RENAME COLUMN mix_grootstedikte_mm TO Mixed_Greatest_thickness_in_mm;
ALTER TABLE rokin_data RENAME COLUMN mix_diameter_mm TO Mixed_Diameter_in_mm;
ALTER TABLE rokin_data RENAME COLUMN munt_land_geografisch TO Coins_Country_geographical;
ALTER TABLE rokin_data RENAME COLUMN munt_staat_politieke_eenheid TO Coins_Political_entity;
ALTER TABLE rokin_data RENAME COLUMN munt_autoriteit_politiek TO Coins_Authority;
ALTER TABLE rokin_data RENAME COLUMN munt_muntsoort TO Coins_Coin_type;
ALTER TABLE rokin_data RENAME COLUMN munt_eenheid_waarde TO Coins_Denomination_value;
ALTER TABLE rokin_data RENAME COLUMN munt_ontwerper TO Coins_Designer;
ALTER TABLE rokin_data RENAME COLUMN munt_onderwerp_gelegenheid TO Coins_Subject_or_occasion;
ALTER TABLE rokin_data RENAME COLUMN munt_muntplaats_productieplaats TO Coins_Location_of_production;
ALTER TABLE rokin_data RENAME COLUMN munt_lengte_diameter_in_mm TO Coins_Diameter_in_mm;
ALTER TABLE rokin_data RENAME COLUMN munt_breedte_in_mm TO Coins_Width_in_mm;
ALTER TABLE rokin_data RENAME COLUMN natuursteen_subsoort TO Natural_stone_Sub_type;
ALTER TABLE rokin_data RENAME COLUMN natuursteen_grootstelengte_mm TO Natural_stone_Greatest_length_in_mm;
ALTER TABLE rokin_data RENAME COLUMN natuursteen_grootstebreedte_mm TO Natural_stone_Greatest_width_in_mm;
ALTER TABLE rokin_data RENAME COLUMN natuursteen_grootstehoogte_mm TO Natural_stone_Greatest_height_in_mm;
ALTER TABLE rokin_data RENAME COLUMN natuursteen_grootstedikte_mm TO Natural_stone_Greatest_thickness_in_mm;
ALTER TABLE rokin_data RENAME COLUMN natuursteen_diameter_mm TO Natural_stone_Diameter_in_mm;
ALTER TABLE rokin_data RENAME COLUMN natuursteen_productiesporen TO Natural_stone_Production_marks;
ALTER TABLE rokin_data RENAME COLUMN plant_soort TO Botanical_Species;
ALTER TABLE rokin_data RENAME COLUMN plant_grootstelengte_mm TO Botanical_Greatest_length_in_mm;
ALTER TABLE rokin_data RENAME COLUMN plant_grootstebreedte_mm TO Botanical_Greatest_width_in_mm;
ALTER TABLE rokin_data RENAME COLUMN plant_grootstehoogte_mm TO Botanical_Greatest_height_in_mm;
ALTER TABLE rokin_data RENAME COLUMN plant_grootstedikte_mm TO Botanical_Greatest_thickness_in_mm;
ALTER TABLE rokin_data RENAME COLUMN plant_diameter_mm TO Botanical_Diameter_in_mm;
ALTER TABLE rokin_data RENAME COLUMN rookpijpen_model TO Pipes_Model;
ALTER TABLE rokin_data RENAME COLUMN rookpijpen_zijmerk_links TO Pipes_Mark_on_side_of_bowl_left;
ALTER TABLE rokin_data RENAME COLUMN rookpijpen_zijmerk_rechts TO Pipes_Mark_on_side_of_bowl_right;
ALTER TABLE rokin_data RENAME COLUMN rookpijpen_bijmerk_links TO Pipes_Mark_on_base_of_heel_left;
ALTER TABLE rokin_data RENAME COLUMN rookpijpen_bijmerk_rechts TO Pipes_Mark_on_base_of_heel_right;
ALTER TABLE rokin_data RENAME COLUMN rookpijpen_merk_of_hielmerk TO Pipes_Mark_or_mark_on_base_of_heel;
ALTER TABLE rokin_data RENAME COLUMN rookpijpen_oppervlaktebehandeling_kop TO Pipes_Surface_treatment_bowl;
ALTER TABLE rokin_data RENAME COLUMN rookpijpen_kopopening TO Pipes_Bowl_opening;
ALTER TABLE rokin_data RENAME COLUMN rookpijpen_radering TO Pipes_Milling;
ALTER TABLE rokin_data RENAME COLUMN rookpijpen_steelbehandeling TO Pipes_Stem_treatment;
ALTER TABLE rokin_data RENAME COLUMN rookpijpen_kwaliteit TO Pipes_Quality;
ALTER TABLE rokin_data RENAME COLUMN rookpijpen_productiecentrum TO Pipes_Production_centre;
ALTER TABLE rokin_data RENAME COLUMN rookpijpen_pijpenmaker TO Pipes_Pipe_maker;
ALTER TABLE rokin_data RENAME COLUMN sculpturen_baksel TO Sculptures_Fabric;
ALTER TABLE rokin_data RENAME COLUMN sculpturen_hoogte_mm TO Sculptures_Height_in_mm;
ALTER TABLE rokin_data RENAME COLUMN sculpturen_breedte_mm TO Sculptures_Width_in_mm;
ALTER TABLE rokin_data RENAME COLUMN sculpturen_diepte_mm TO Sculptures_Depth_in_mm;
ALTER TABLE rokin_data RENAME COLUMN sculpturen_hol_of_massief TO Sculptures_Hollow_or_solid;
ALTER TABLE rokin_data RENAME COLUMN sculpturen_voorstelling TO Sculptures_Image_description;
ALTER TABLE rokin_data RENAME COLUMN textiel_deelmaterialen TO Textile_Secondary_material;
ALTER TABLE rokin_data RENAME COLUMN textiel_grootstelengte_mm TO Textile_Greatest_length_in_mm;
ALTER TABLE rokin_data RENAME COLUMN textiel_grootstebreedte_mm TO Textile_Greatest_width_in_mm;
ALTER TABLE rokin_data RENAME COLUMN textiel_productiewijze TO Textile_Production_method;
ALTER TABLE rokin_data RENAME COLUMN textiel_binding TO Textile_Binding;
ALTER TABLE rokin_data RENAME COLUMN textiel_bewerking TO Textile_Processing;
ALTER TABLE rokin_data RENAME COLUMN touw_grootstelengte_mm TO Rope_Greatest_length_in_mm;
ALTER TABLE rokin_data RENAME COLUMN touw_grootstebreedte_mm TO Rope_Greatest_width_in_mm;
ALTER TABLE rokin_data RENAME COLUMN touw_diameter_mm TO Rope_Diameter_in_mm;
ALTER TABLE rokin_data RENAME COLUMN touw_strengen TO Rope_Number_of_strands;
ALTER TABLE rokin_data RENAME COLUMN touw_productiewijze TO Rope_Production_method;


