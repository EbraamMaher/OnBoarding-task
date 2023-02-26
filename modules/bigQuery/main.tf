
resource "google_bigquery_dataset" "neuron-datasets" {

  count       = length(var.dataset_name)
  dataset_id                  = element(var.dataset_name, count.index)                    
  location                    = element(var.dataset_location, count.index) 
  
  labels = {                                                               
    name = element(var.dataset_name, count.index)
    dataset_location = "${lower(element(var.dataset_location, count.index))}-location"   
    }
}

