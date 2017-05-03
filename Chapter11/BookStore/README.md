I encountered the context and duplicate declaration issue of core data when create NSManagedObject subclass
The solution is that modify the module to "Current Product Module" and codegen to "Manual/None" in entity data model inspector
And also comment @object(Entity) in Entity+CoreDataClass.swift file 
