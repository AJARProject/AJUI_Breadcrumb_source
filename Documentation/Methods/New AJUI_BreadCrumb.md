<!--New AJUI_BreadCrumb ( {template_obj} ) -> AJUI BreadCrumb instance -->

# New AJUI_BreadCrumb

## Parameters

 *  (object) (optional) template :
   * (text) templateName : Represents the name of the JSON file to import (template). If the file is not found, the method will return a new instance of AJUI_Breadcrumb.
   * (text) (optional) templatePath : You can specify a path to recover the file otherwise, the component will search in the default folder located in the host database resources (.../Resources/AJUI_BreadCrumb_Templates/). 

## Return value

(object) instance of an AJUI BreadCrumb

## Description

This method returns an object variable (breadcrump) that represents an instance of AJUI_BreadCrumb. It contains all the properties and their default values as well as the formulas (member functions) to manipulate them.

## Example

```
  C_Object($myBC;$template_obj)
  C_String($path;$templateName)

  $template_obj:=New object("templateName";$templateName;"templatePath";$path)
  $myBC:=New AJUI_BreadCrumb ($template_obj)
```
