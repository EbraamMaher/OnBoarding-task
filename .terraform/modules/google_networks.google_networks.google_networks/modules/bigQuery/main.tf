##https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_table

resource "google_bigquery_dataset" "neuron-datasets" {
### https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/bigquery_dataset

  count       = length(var.dataset_name)
  dataset_id                  = element(var.dataset_name, count.index)     ##R- The dataset ID to create the table in. Changing this forces a new resource to be created.[letters,numbers and underscore allowed]
  #friendly_name               = "test"                                     ##O- A descriptive name for the dataset
  #description                 = element()               ##O- The field description.
  location                    = element(var.dataset_location, count.index) #"EU" ##O- The geographic location where the dataset should reside.//two types of locations, regional(ex.Tokyo) or multi-regional(contains at least two geographic places.ex.US or EU).
  #default_table_expiration_ms = 3600000                                   ##O- The default lifetime of all tables in the dataset, in milliseconds. The minimum value is 3600000 milliseconds (one hour).  #-expirationTime property - set to the creation time plus the value in this property, and changing the value will only affect new tables, not existing ones. When the expirationTime for a given table is reached, that table will be deleted automatically. 
  
  
  labels = {                                                               ##O- The labels associated with this dataset. You can use these to organize and group your datasets
    name = element(var.dataset_name, count.index)
    dataset_location = "${lower(element(var.dataset_location, count.index))}-location"   ##Note: labls are accepts lowercase only
    }
}

