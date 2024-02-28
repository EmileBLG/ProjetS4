# GIF402-Amorce-Projet

## Procédure pour créer le projet Vivado avec le script TCL
1. Ouvir Vivado.
2. Aller dans TCL console au bas de la fenêtre.
3. En utilisant la commande cd déplacez vous dans le répertoire `\scripts` du projet
4. Lancer le script `ProjetS4.tcl` avec la commande `source ./ProjetS4.tcl`

## Démarrage du projet

**Procédure** : Mise en place du projet **Vivado**/**Vitis**

**Note** : Les probabilités qu'un problème survienne sont élevées, envoyez un message au tuteur si vous êtes bloqué pour plus de 20 minutes (**Teams**, **courriel**)


1. Ouvrez **Vivado 2020.2**, puis cliquez sur *Open project*, n'avigez jusqu'à `C:\Travail\s4InfoAtelier4`, puis sélectionnez `s4InfoAtelier4.xpr` puis faire **OK**;
1. Le projet devrait se charger adéquatement. 
1. Cliquez sur **Tools** puis **Launch Vitis IDE**
   1. Connectez votre **Zybo** sur votre ordinateur en USB, et connecter le HDMI TX sur un écran.
   1. Démarrez votre **Zybo**
   1. Dans **Vitis**, cliquez sur l'icône **Run**

**Résultat** : Votre écran devrait affiché des bandes de couleurs en alternances, et une des deux couleurs devraient changées subtilement dans le temps.