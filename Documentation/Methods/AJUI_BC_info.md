<!-- AJUI_BC_info ( ) -> version -->


## Description

Show the version info of the component.

```4d
  AJUI_BC_info ( ) -> version
```

| Parameter | Type | In/Out | Description |
| --------- | ---- | ------ | ----------- |
| version | text | out | version info of the component |

## Example

```
  C_String($version)

  $version:= AJUI_BC_info () //AJUI BreadCrumb (v18): 1.2.2-Build37
```
