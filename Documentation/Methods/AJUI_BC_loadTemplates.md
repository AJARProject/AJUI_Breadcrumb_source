<!--  AJUI_BC_loadTemplates ( {folderPath} ) -> templates -->


## Description

Utility method to retrieve in a collection (templates_col), all templates JSON files inside a folder. You can pass in parameter (folder_path) the path of the folder containing the templates. If this is not the case, the method will search in default path (.../Resources/AJUI_BreadCrumb_Templates/).

```4d
  AJUI_BC_loadTemplates ( {folderPath} ) -> templates
```

| Parameter | Type | In/Out | Description |
| --------- | ---- | ------ | ----------- |
| folderPath | text | in | where to find the template json files |
| templates | collection | out | content of the template files  |

## Example

```		
   $folder:=Folder($path;fk platform path)
  		
   If ($folder.exists)
	 $templates_col:=AJUI_BC_loadTemplates ($folder.platformPath)
   End if
```