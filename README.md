# AJUI_BreadCrumb

Composant 4D d'AJAR SA : fil d'Ariane dessiné en SVG (modèles simple, flèche, boutons groupés), avec modèles JSON, callbacks nommés ou formules, et méthode `Draw`.

Sources du composant [AJUI_Breadcrumb](https://github.com/AJARProject/AJUI_Breadcrumb). La documentation d'origine reste sur le [wiki](https://github.com/AJARProject/AJUI_Breadcrumb/wiki) et dans `Documentation/Methods`. Ce dépôt n'est pas maintenu activement ; une proposition de correction peut passer par une [pull request](https://github.com/AJARProject/AJUI_Breadcrumb_source/pulls).

**4D 21 R4**, mode projet, `compatibilityVersion` 2140. Version **1.3.0** : `AJUI_BC_info` renvoie `AJUI BreadCrumb (v21 R4): 1.3.0`. Licence MIT (`LICENSE`).

Cette migration a été réalisée avec l'aide de Cursor et de Grok Bot. Détail : [MIGRATION-21R4.md](MIGRATION-21R4.md).

## Installation rapide

**Interprété.** Ouvrir `Project/AJUI_BreadCrumb.4DProject` avec 4D 21 R4, ou déclarer le dossier du dépôt comme dépendance locale. Une dépendance vers les sources ne fonctionne qu'en interprété.

**Compilé.** Construire le composant (Développement > Générer l'application, ou `AJUI_BC_buildComponent`, qui appelle `BUILD APPLICATION` sur `Settings/buildApp.4DSettings`). Placer le `.4dbase` produit dans le dossier `Components` de l'hôte. Un hôte compilé ne charge pas un composant interprété.

**4D SVG** est déclaré dans `Project/Sources/dependencies.json` (`github: 4d/4D-SVG`). Sans cette déclaration, les appels `SVG_*` ne se résolvent pas en 4D 21 R4.

## Utilisation

L'application Transitoires appelle l'API par formules :

```4d
var $bc : Object
$bc:=New object()
$bc.templateName:="Debit-Credit"
$bc.templatePath:=Get 4D folder(Current resources folder)+"Debit-Credit"+Folder separator

Form.bc1:=New AJUI_BreadCrumb($bc)
Form.bc1.Name("bc1")
Form.bc1.Draw()
```

`AJUI_Breadcrumb.new()` expose la même surface via la classe `cs.Breadcrumb`.

Réalisé avec Cursor / Grok Bot (Codesky) pour Maurice Inzirillo.

---

# AJUI_BreadCrumb

4D component by AJAR SA: an SVG-drawn breadcrumb (simple, arrow and grouped-button models), with JSON templates, named or formula callbacks, and `Draw`.

Sources of the [AJUI_Breadcrumb](https://github.com/AJARProject/AJUI_Breadcrumb) component. The original documentation stays on the [wiki](https://github.com/AJARProject/AJUI_Breadcrumb/wiki) and in `Documentation/Methods`. This repository is not actively maintained; fixes can be proposed with a [pull request](https://github.com/AJARProject/AJUI_Breadcrumb_source/pulls).

**4D 21 R4**, project mode, `compatibilityVersion` 2140. Version **1.3.0**: `AJUI_BC_info` returns `AJUI BreadCrumb (v21 R4): 1.3.0`. MIT licence (`LICENSE`).

This migration was made with the help of Cursor and Grok Bot. Details: [MIGRATION-21R4.md](MIGRATION-21R4.md).

## Short install

**Interpreted.** Open `Project/AJUI_BreadCrumb.4DProject` with 4D 21 R4, or declare the repository folder as a local dependency. A dependency on sources works in interpreted mode only.

**Compiled.** Build the component (Design > Build Application, or `AJUI_BC_buildComponent`, which calls `BUILD APPLICATION` on `Settings/buildApp.4DSettings`). Put the resulting `.4dbase` in the host `Components` folder. A compiled host does not load an interpreted component.

**4D SVG** is declared in `Project/Sources/dependencies.json` (`github: 4d/4D-SVG`). Without it, the `SVG_*` calls do not resolve in 4D 21 R4.

## Usage

The Transitoires application calls the formula API:

```4d
var $bc : Object
$bc:=New object()
$bc.templateName:="Debit-Credit"
$bc.templatePath:=Get 4D folder(Current resources folder)+"Debit-Credit"+Folder separator

Form.bc1:=New AJUI_BreadCrumb($bc)
Form.bc1.Name("bc1")
Form.bc1.Draw()
```

`AJUI_Breadcrumb.new()` exposes the same surface through the `cs.Breadcrumb` class.

Made with Cursor / Grok Bot (Codesky) for Maurice Inzirillo.
