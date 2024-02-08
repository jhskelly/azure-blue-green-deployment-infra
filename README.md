brew install azure-cli
brew install terraform


terraform apply -auto-approve

Don't try and create a slot called production, it won't work as by default there is already a slot called production.  Also, it might give you an error regarding the number of slots
│ 3"},{"Code":"Conflict"},{"ErrorEntity":{"ExtendedCode":"59202","MessageTemplate":"Cannot modify this webspace because another operation is in progress. Details: {0}","Parameters":["Id: 5860a0fe-7784-427f-9840-be8920405d00,
│ OperationName: Create, CreatedTime: 2/8/2024 3:50:26 PM, RequestId: 84f9ac13-aa03-446d-bff6-0a3d280470a2, EntityType: 3"],"Code":"Conflict","Message":"Cannot modify this webspace because another operation is in progress.
│ Details: Id: 5860a0fe-7784-427f-9840-be8920405d00, OperationName: Create, CreatedTime: 2/8/2024 3:50:26 PM, RequestId: 84f9ac13-aa03-446d-bff6-0a3d280470a2, EntityType: 3"}}],"Innererror":null}

This means that there is going to be an entity which is going to be called the Production. Also can only have slots with the Standard tier.