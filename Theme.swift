/*******************************************************************/
/************************  Theme.swift  ****************************/
/*********************  NePasMourirIdiot  **************************/
/*                                                                 */
/*  Créé par PHILIPPE PESCATORE 2 le 16/03/2015                    */
/*  Copyright (c) 2015 i@telier. All rights reserved.              */
/*                                                                 */
/*                                                                 */
/*******************************************************************/
/****************************   IMPORT  ****************************/
/*******************************************************************/

import Foundation
import UIKit

class Theme {
    /***************************************************************/
    /***********************   PROPRIÉTÉS   ************************/
    /***************************************************************/

    var id = 0                          // identifiant unique du Thème
    var image = UIImage (named: "")     // image du Thème
    var couleur = UIColor ()            // couleur du Thème
    
    /***********************   CONSTANTES   ************************/
    
    let kDctID = [           //dictionnaire des id des Thèmes
        11 : "Architecture",
        12 : "Bande Dessinee",
        13 : "Cinema & TV",
        14 : "Francais",
        15 : "Litterature & Philo",
        16 : "Musique",
        17 : "Peinture & Sculpture",
        21 : "Culture & Religion",
        22 : "Economie",
        23 : "Societe & Population",
        31 : "Geographie",
        32 : "Histoire",
        41 : "Guerre & Paix",
        42 : "Justice & Police",
        43 : "Politique",
        51 : "Mathematiques",
        52 : "Sante & Medecine",
        53 : "Sciences de base",
        54 : "Sciences de la Vie",
        55 : "Technologie",
        61 : "Loisirs & Pratiques",
        62 : "Sport"]
    
    let dctEffectifsDesThemesChoisis = [
        11:0,
        12:0,
        13:0,
        14:1,
        15:0,
        16:0,
        17:0,
        21:0,
        22:0,
        23:1,
        31:1,
        32:0,
        41:1,
        42:1,
        43:0,
        51:0,
        52:1,
        53:0,
        54:1,
        55:0,
        61:1,
        62:0]

    /***************************************************************/
    /************************   MÉTHODES   *************************/
    /***************************************************************/
    /*  Paramètres :
        1 - banc : Int (0...22)
        2 - effectifs : [Int:Int] (valeurs non nulles)
            la Clé est l'id du Thème
            la Valeur est l'effectif du Thème dans les choix du Joueur
        Retour :
        1 - id des thèmes [Int]*/
    func tabBancDeThemes (banc : Int, effectifs : [Int:Int]) -> [Int] {
        
        // contrôle des valeurs de tolérance
        // retraitement des valeurs du dictionnaire des effectifs afin d'éliminer les valeurs nulles
        var effectifsRetraites = effectifs
        
        for (theme, effectif) in effectifs {
            if effectif == 0 {
                effectifsRetraites.updateValue(1, forKey: theme)
            }
        }
        // déclaration et initialisation des variables locales
        var cumul : Int = 0
        var idTheme : Int = 0
        var idThemeInverse : Int = 0
        var idThemes : [Int] = []
        var nombreAleatoire : Int = 0
        // tri croissant et calcul des effectifs cumulés
        let tupEffectifsDesThemesChoisisTries = sorted(effectifsRetraites){a,b in return a.1 < b.1} // tri croissant des effectifs
        
        var tupEffectifsCumulesDesThemesChoisisTries = tupEffectifsDesThemesChoisisTries // init dictionnaire des effectifs cumulés
        
        for (id,effectif) in tupEffectifsDesThemesChoisisTries {
            cumul += effectif // calcul de l'effectif cumulé
            tupEffectifsCumulesDesThemesChoisisTries[idTheme] = (id, cumul) // substitution des effectifs cumulés aux effectifs
            ++idTheme  // incrémentation du compteur idTheme
        }
        // tirage aléatoire du banc de thèmes
        while idThemes.count < banc {
            idTheme = 0 // RAZ du compteur idTheme
            nombreAleatoire = Int(arc4random_uniform(UInt32(cumul)))+1 // génération d'un nombre aléatoire
            while tupEffectifsCumulesDesThemesChoisisTries[idTheme].1 < nombreAleatoire { // jusqu'à ce que l'effectif du thème soit inférieur au nombre aléatoire
                ++idTheme  // incrémentation du compteur idTheme
            }
            
            idThemeInverse = tupEffectifsCumulesDesThemesChoisisTries[effectifsRetraites.count-1-idTheme].0 // détermination de l'id symétrique au thème tiré
            
            if contains(idThemes, idThemeInverse) == false { // si id différent des id des éléments du banc
                idThemes += [idThemeInverse] // ajout de l'id dans le banc
            }
        }
        // retour : banc des id des thèmes
        return idThemes
    }

}
    //Algorithme : estomperLeTheme
    //   Paramètres :
    //      1 -
    //      2 -
    //   Résultat :




