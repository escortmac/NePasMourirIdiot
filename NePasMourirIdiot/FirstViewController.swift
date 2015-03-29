/*******************************************************************/
/*****************  FirstViewController.swift  *********************/
/*********************  NePasMourirIdiot  **************************/
/*                                                                 */
/*  Créé par PHILIPPE PESCATORE 2 le 07/03/2015                    */
/*  Copyright (c) 2015 i@telier. All rights reserved.              */
/*                                                                 */
/*                                                                 */
/*******************************************************************/
/****************************   IMPORT  ****************************/
/*******************************************************************/

import UIKit

class FirstViewController: UIViewController {

    /***************************************************************/
    /***********************   PROPRIÉTÉS   ************************/
    /***************************************************************/
    
    @IBOutlet var imagesDesThemes: [UIImageView]!
    @IBOutlet var etiquettesDesThemes: [UILabel]!
    @IBOutlet var imagesDesJetons: [UIImageView]!
    
    var themes = Theme()
   
    /***************************************************************/
    /************************   MÉTHODES   *************************/
    /***************************************************************/
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

       let banc = themes.tabBancDeThemes(6, effectifs: themes.dctEffectifsDesThemesChoisis)
        var nom = ""
        for (indice, idTheme) in enumerate (banc) {
            nom = themes.kDctID[idTheme]!
            imagesDesThemes[indice].image = UIImage (named: nom)
            etiquettesDesThemes[indice].text = nom.uppercaseString
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

