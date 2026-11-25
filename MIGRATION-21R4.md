# Migration 4D 21 R4 — AJUI_BreadCrumb

Réalisé avec Cursor / Grok Bot (Codesky) pour Maurice Inzirillo.

## Français

### Version d'origine

- Dépôt : `AJARProject/AJUI_Breadcrumb_source`, branche par défaut `master`.
- Mode projet, sans `compatibilityVersion` dans `Project/AJUI_BreadCrumb.4DProject`.
- `AJUI_BC_info` renvoyait `AJUI BreadCrumb (v20 R4): 1.2.3+Build42` (commentaire daté du 5 février 2024). C'est la version de sources retenue comme origine.
- Un journal de build plus ancien (`Logs/BuildApp.log.xml`, 22 janvier 2020) décrit une compilation v18. Il n'est pas la version courante des sources.
- Aucun tag Git, aucune release GitHub (vérifié sur le dépôt : `git tag` vide, API releases vide).

### API publique conservée

Transitoires (`AJARProject/Transitoires`, formulaire `Input`, objets `bc1` à `bc4`) utilise l'API par formules, pas le constructeur de classe :

- `New AJUI_BreadCrumb($bc)` avec `templateName` et `templatePath`
- `.Name("bc1")`, `.RemoveCurrent()`, `.SetCurrentSection(...)`, `.UpdateSection(id; objet)`
- callbacks nommés en texte : `onClickCB` = `"setType"`, `"typeFilter_cb"`, `"currencyFilter_cb"`, `"setCurrency"`, plus `onClickCBParams` (objet)
- `.Draw()` à chaque événement de l'objet image

Méthodes projet partagées (inchangées, toujours `shared`) :

| Méthode | Rôle |
| --- | --- |
| `New AJUI_BreadCrumb` | instance objet + formules (API utilisée par Transitoires) |
| `AJUI_Breadcrumb` | renvoie la classe `cs.Breadcrumb` (`AJUI_Breadcrumb.new()`) |
| `AJUI_BC_loadTemplates` | collection des modèles JSON |
| `AJUI_BC_info` | chaîne de version |

Les noms de formules (`Draw`, `Name`, `UpdateSection`, `AddSection`, `Export`, …) et les noms de fonctions de la classe sont les mêmes. Les modèles JSON, le préfixe `#` vers le dossier Resources, et `EXECUTE METHOD` vers une méthode hôte partagée qui reçoit un objet sont inchangés.

### Ce qui change

- `compatibilityVersion` 2140, `tokenizedText` false. Jetons `:C` et `:K` retirés.
- `C_XXX` remplacé par `var`. Paramètres et retours en `#DECLARE` (méthodes) ou sur la ligne `Function` / `Class constructor` (classe). `Count parameters` est conservé pour les paramètres optionnels, comme sur AJUI_Button 2.2.1.
- Propriétés de classe : `breadCrumb` (Object), `failImport` (Boolean), `templateName` (Text).
- Compilateur : `compilation_path="3"` (valeur du composant 4D SVG 21.4), `fat_binary`, fichier d'erreurs, de symboles et de syntaxe, cible `all`, numérique par défaut longint (`default_for_numeric="1"`).
- `Project/Sources/dependencies.json` déclare `4D SVG` (`github: 4d/4D-SVG`). Sans cela, `SVG_New`, `SVG_New_path`, `SVG_Export_to_picture`, `SVGTool_SHOW_IN_VIEWER`, etc. ne se résolvent pas. Les commandes 4D `DOM …` et `SVG EXPORT TO PICTURE` / `SVG Find element ID by coordinates` restent des commandes du langage.
- `Settings/buildApp.4DSettings` versionné (composant, nom `AJUI_BreadCrumb`, pas de chemin de licence). Le `.gitignore` ne l'exclut plus.
- Version **1.3.0**. `AJUI_BC_info` renvoie `AJUI BreadCrumb (v21 R4): 1.3.0`. `AJUI_BuildComponent` n'incrémente `+Build` que si l'ancienne ligne `+Build` … `GMT` est encore là.
- Un callback **créé** par le composant (méthode hôte absente) reçoit maintenant `#DECLARE($param1 : Object)` au lieu de `C_OBJECT($1)`. Les méthodes déjà présentes chez l'hôte (`setType`, etc.) ne sont pas réécrites. L'appel reste `EXECUTE METHOD` avec un objet.

Commandes vérifiées sur la doc 21 / 21 R4 (elles restent, elles ne sont pas préfixées `_o_`) : `Test path name`, `Document to text`, `TEXT TO DOCUMENT`, `CREATE FOLDER`, `Create document`, `DOCUMENT LIST`, `METHOD GET CODE` / `METHOD SET CODE` / `METHOD Get path` / `METHOD GET NAMES` / `METHOD SET ATTRIBUTE`, `BUILD APPLICATION`, `DOM Create XML Ref`, `DOM Create XML element`, `DOM Parse XML variable`, `SVG EXPORT TO PICTURE`, `SVG Find element ID by coordinates`, `PICTURE TO BLOB`, `BASE64 ENCODE`, `PICTURE PROPERTIES`, `OBJECT GET COORDINATES`, `MOUSE POSITION` (ex-`GET MOUSE`, commande 468, renommée en 20 R7 ; les jetons `:C468` avaient été retirés). Aucune commande `_o_` n'était dans les sources. Les `C_XXX` sont dépréciés depuis 4D 20 R7 ([variables](https://developer.4d.com/docs/21-R4/Concepts/variables), [compilation](https://developer.4d.com/docs/21-R4/Project/compiler)). Les 21 autres renommages « Get … » de 20 R7 ne sont pas utilisés.

### Comportements d'origine laissés tels quels

- Dans `AJUI_BC_addSection` et `AJUI_BC_updateSection`, la branche « créer le callback double-clic » appelle encore `METHOD SET CODE` sur `onClickCB`, pas sur `onDoubleClickCB`.
- Le constructeur de classe lit `This.failImport` avant de copier l'objet importé sur `This`. Transitoires n'emprunte pas ce chemin : il passe par `New AJUI_BreadCrumb`, qui teste `$instance_obj.failImport`.

### Non compilé, non exécuté

4D n'est pas disponible dans cet environnement. Rien n'a été compilé, vérifié par le contrôle de syntaxe, ni ouvert dans Transitoires. En particulier : dessin SVG, import des modèles `Debit-Credit` et `Currencies`, callbacks nommés, binaire universel (Intel + Apple Silicon), signature, installation par `dependencies.json`.

### Publier une release 21 R4 (à décider par le propriétaire)

Ne pas poser le tag tant que la compilation 4D 21 R4 n'est pas faite sur un Mac. Aucun tag n'existe aujourd'hui.

1. Merger `migration/21R4` dans `master` (décision du propriétaire ; cet agent ne merge pas).
2. Ouvrir `Project/AJUI_BreadCrumb.4DProject` avec 4D 21 R4. Si le menu de compatibilité du compilateur est encore proposé, choisir **Toutes les variables sont typées (typage direct)**. Le fichier de réglages porte déjà `compilation_path="3"`, comme 4D SVG 21.4.
3. Contrôle de syntaxe, puis compilation. Le réglage `fat_binary` demande un binaire Intel et Apple Silicon.
4. Générer le composant : Développement > Générer l'application, ou `AJUI_BC_buildComponent` (appelle `BUILD APPLICATION` sur `Settings/buildApp.4DSettings`). Pas de chemin de licence dans ce fichier : la signature, s'il y en a une, vient du Mac de build, comme pour AJUI_Button 2.2.1.
5. Le résultat est un dossier `AJUI_BreadCrumb.4dbase` (`.4DZ`, `Resources`, `dependencies.json` pour que l'hôte reçoive aussi 4D SVG).
6. Zipper **ce dossier** `.4dbase` (la racine de l'archive est le `.4dbase`, pas un dossier parent supplémentaire). Nom exact de l'archive, identique au dépôt : `AJUI_Breadcrumb_source.zip`. Doc : [composants / GitHub](https://developer.4d.com/docs/21-R4/Project/components).
7. Release GitHub sur le commit compilé :
   - tag : `1.3.0`
   - titre : `AJUI_BreadCrumb 1.3.0 (4D 21 R4)`
   - asset : `AJUI_Breadcrumb_source.zip`
8. Déclaration hôte :

```json
"AJUI_BreadCrumb": {
  "github": "AJARProject/AJUI_Breadcrumb_source",
  "version": "1.3.0"
}
```

Le dossier `Components/AJUI_BreadCrumb.4dbase` de Transitoires a priorité sur `dependencies.json`. Il faut le remplacer par ce build, ou le retirer, pour que la 1.3.0 soit celle qui est chargée.

Les releases sœurs (AJUI_Button 2.2.1, AJUI_Banner 1.9.0, AJUI_Tip 1.8.1, AJ_Math 2.1.1) utilisent un tag sémantique, pas un tag `21R4`. Un tag `21R4` ne servirait que pour la règle « Suivre la version de 4D ».

---

## English

Made with Cursor / Grok Bot (Codesky) for Maurice Inzirillo.

### Original version

- Repository: `AJARProject/AJUI_Breadcrumb_source`, default branch `master`.
- Project mode, no `compatibilityVersion` in `Project/AJUI_BreadCrumb.4DProject`.
- `AJUI_BC_info` returned `AJUI BreadCrumb (v20 R4): 1.2.3+Build42` (comment dated 5 February 2024). That is the source version this migration starts from.
- An older build log (`Logs/BuildApp.log.xml`, 22 January 2020) describes a v18 compile. It is not the current source version.
- No Git tags and no GitHub releases (verified: empty `git tag`, empty releases API).

### Public API kept

Transitoires (`AJARProject/Transitoires`, `Input` form, objects `bc1`–`bc4`) uses the formula API, not the class constructor:

- `New AJUI_BreadCrumb($bc)` with `templateName` and `templatePath`
- `.Name("bc1")`, `.RemoveCurrent()`, `.SetCurrentSection(...)`, `.UpdateSection(id; object)`
- named text callbacks: `onClickCB` = `"setType"`, `"typeFilter_cb"`, `"currencyFilter_cb"`, `"setCurrency"`, plus `onClickCBParams` (object)
- `.Draw()` on each picture-object event

Shared project methods (unchanged, still `shared`):

| Method | Role |
| --- | --- |
| `New AJUI_BreadCrumb` | object instance plus formulas (the API Transitoires calls) |
| `AJUI_Breadcrumb` | returns the `cs.Breadcrumb` class (`AJUI_Breadcrumb.new()`) |
| `AJUI_BC_loadTemplates` | collection of JSON templates |
| `AJUI_BC_info` | version string |

Formula names (`Draw`, `Name`, `UpdateSection`, `AddSection`, `Export`, …) and class function names are unchanged. JSON templates, the `#` prefix for the Resources folder, and `EXECUTE METHOD` to a shared host method that receives one object are unchanged.

### What changed

- `compatibilityVersion` 2140, `tokenizedText` false. `:C` and `:K` tokens removed.
- `C_XXX` replaced with `var`. Parameters and returns use `#DECLARE` (methods) or the `Function` / `Class constructor` line (class). `Count parameters` still handles optional parameters, as in AJUI_Button 2.2.1.
- Class properties: `breadCrumb` (Object), `failImport` (Boolean), `templateName` (Text).
- Compiler: `compilation_path="3"` (the value stored by the 4D SVG 21.4 component), fat binary, error, symbol and syntax files, target `all`, default numeric longint (`default_for_numeric="1"`).
- `Project/Sources/dependencies.json` declares `4D SVG` (`github: 4d/4D-SVG`). Without it, `SVG_New`, `SVG_New_path`, `SVG_Export_to_picture`, `SVGTool_SHOW_IN_VIEWER` and the other `SVG_*` component calls do not resolve. `DOM …`, `SVG EXPORT TO PICTURE` and `SVG Find element ID by coordinates` stay language commands.
- `Settings/buildApp.4DSettings` is versioned (component, name `AJUI_BreadCrumb`, no licence path). `.gitignore` no longer excludes it.
- Version **1.3.0**. `AJUI_BC_info` returns `AJUI BreadCrumb (v21 R4): 1.3.0`. `AJUI_BuildComponent` increments `+Build` only when the old `+Build` … `GMT` line is still present.
- A callback **created** by the component (missing host method) is now seeded with `#DECLARE($param1 : Object)` instead of `C_OBJECT($1)`. Existing host methods (`setType` and the others) are not rewritten. The call is still `EXECUTE METHOD` with one object.

Commands checked on the v21 / 21 R4 docs (kept; they are not `_o_` commands): `Test path name`, `Document to text`, `TEXT TO DOCUMENT`, `CREATE FOLDER`, `Create document`, `DOCUMENT LIST`, `METHOD GET CODE` / `METHOD SET CODE` / `METHOD Get path` / `METHOD GET NAMES` / `METHOD SET ATTRIBUTE`, `BUILD APPLICATION`, `DOM Create XML Ref`, `DOM Create XML element`, `DOM Parse XML variable`, `SVG EXPORT TO PICTURE`, `SVG Find element ID by coordinates`, `PICTURE TO BLOB`, `BASE64 ENCODE`, `PICTURE PROPERTIES`, `OBJECT GET COORDINATES`, `MOUSE POSITION` (formerly `GET MOUSE`, command 468, renamed in 20 R7; the `:C468` tokens had been stripped). No `_o_` command was in the sources. `C_XXX` has been deprecated since 4D 20 R7 ([variables](https://developer.4d.com/docs/21-R4/Concepts/variables), [compilation](https://developer.4d.com/docs/21-R4/Project/compiler)). The other 21 "Get …" renames from 20 R7 are not used.

### Original behaviour left as it was

- In `AJUI_BC_addSection` and `AJUI_BC_updateSection`, the "create the double-click callback" branch still calls `METHOD SET CODE` on `onClickCB`, not on `onDoubleClickCB`.
- The class constructor reads `This.failImport` before copying the imported object onto `This`. Transitoires does not use that path: it calls `New AJUI_BreadCrumb`, which tests `$instance_obj.failImport`.

### Not compiled, not run

4D is not available in this environment. Nothing was compiled, syntax-checked, or opened in Transitoires. In particular: SVG drawing, import of the `Debit-Credit` and `Currencies` templates, named callbacks, the universal binary (Intel + Apple Silicon), signing, and install through `dependencies.json`.

### Publishing a 21 R4 release (the owner's decision)

Do not create the tag until a 4D 21 R4 compile has been done on a Mac. No tag exists today.

1. Merge `migration/21R4` into `master` (the owner's decision; this agent does not merge).
2. Open `Project/AJUI_BreadCrumb.4DProject` with 4D 21 R4. If the compiler compatibility menu is still offered, choose **All variables are typed (Direct typing)**. The settings file already stores `compilation_path="3"`, as in 4D SVG 21.4.
3. Syntax check, then compile. `fat_binary` requests an Intel and Apple Silicon binary.
4. Build the component: Design > Build Application, or `AJUI_BC_buildComponent` (calls `BUILD APPLICATION` on `Settings/buildApp.4DSettings`). This file has no licence path: signing, if any, comes from the build Mac, as with AJUI_Button 2.2.1.
5. The result is an `AJUI_BreadCrumb.4dbase` folder (`.4DZ`, `Resources`, `dependencies.json` so the host also receives 4D SVG).
6. Zip **that** `.4dbase` folder (the archive root is the `.4dbase`, not an extra parent folder). The archive name must match the repository: `AJUI_Breadcrumb_source.zip`. Docs: [components / GitHub](https://developer.4d.com/docs/21-R4/Project/components).
7. GitHub release on the compiled commit:
   - tag: `1.3.0`
   - title: `AJUI_BreadCrumb 1.3.0 (4D 21 R4)`
   - asset: `AJUI_Breadcrumb_source.zip`
8. Host declaration:

```json
"AJUI_BreadCrumb": {
  "github": "AJARProject/AJUI_Breadcrumb_source",
  "version": "1.3.0"
}
```

Transitoires' `Components/AJUI_BreadCrumb.4dbase` folder wins over `dependencies.json`. Replace that copy with this build, or remove it, for 1.3.0 to be the one that loads.

Sibling releases (AJUI_Button 2.2.1, AJUI_Banner 1.9.0, AJUI_Tip 1.8.1, AJ_Math 2.1.1) use a semantic tag, not a `21R4` tag. A `21R4` tag is only for the "Follow 4D version" rule.
