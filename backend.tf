terraform { 
  cloud { 
    
    organization = "BeardedNetwork" 

    workspaces { 
      name = "fem-eci-tfe" 
    } 
  } 
}