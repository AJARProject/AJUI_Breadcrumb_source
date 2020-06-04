<!-- AJUI_BC_loadTemplates ( ) -> templates -->

# AJUI_BC_loadTemplates

## Parameters

 *  (text) (optional) folderPath

## Return value

(collection) content of the template files 

## Description

Utility method to retrieve in a collection (templates_col), all templates JSON files inside a folder. You can pass in parameter (folder_path) the path of the folder containing the templates. If this is not the case, the method will search in default path (.../Resources/AJUI_BreadCrumb_Templates/).

## Example

```		
   $folder:=Folder($path;fk platform path)
  		
   If ($folder.exists)
	 $templates_col:=AJUI_BC_loadTemplates ($folder.platformPath)
   End if
```