using System.Collections;
using System.Collections.Generic;
using UnityEngine.SceneManagement;
using UnityEngine;

public class TableTopItem : MonoBehaviour
{

    public string ItemOnTop = "";

    // Start is called before the first frame update
    void Start()
    {
        if(SceneManager.GetActiveScene().name == "Nivell 1"){
            if(gameObject.name == "TableTop_Side 101" || gameObject.name == "TableTop_Side 102" || gameObject.name == "TableTop_Side 103"){
                UpdateItemOnTop(8);
            }
        }else if(SceneManager.GetActiveScene().name == "Nivell 2"){
            if(gameObject.name == "TableTop_Space10" || gameObject.name == "TableTop_Space9" || gameObject.name == "TableTop_Space8"){
                UpdateItemOnTop(8);
            }
        }
    }

    // Update is called once per frame
    void Update()
    {

    }

    public void UpdateItemOnTop(int foodId){
        switch(foodId){
            case 0:
                ItemOnTop = "Onion";
                gameObject.transform.Find("Onion").gameObject.SetActive(true);
                break;
            case 1:
                ItemOnTop = "Mushroom";
                gameObject.transform.Find("Mushroom").gameObject.SetActive(true);
                break;
            case 2:
                ItemOnTop = "Lettuce";
                gameObject.transform.Find("Lettuce").gameObject.SetActive(true);
                break;
            case 3:
                ItemOnTop = "Tomato";
                gameObject.transform.Find("Tomato").gameObject.SetActive(true);
                break;
            case 4:
                ItemOnTop = "ChoppedOnion";
                gameObject.transform.Find("ChoppedOnion").gameObject.SetActive(true);
                break;
            case 8:
                ItemOnTop = "Plate";
                gameObject.transform.Find("Plate").gameObject.SetActive(true);
                break;
            case 9:
                ItemOnTop = "Pot";
                break;
            default:
                break;
        }
    }

    public void CleanTable() {
        foreach (Transform food in transform)
        {
            if (food.gameObject.tag == "Pre-Ingredient" || food.gameObject.tag == "Ingredient" || food.gameObject.tag == "Plate")
                food.gameObject.SetActive(false);
        }
        ItemOnTop = "";
    }

    public void placeUtensil(GameObject utensil){
        GameObject Pot = GameObject.Find(utensil.name);
        Pot.transform.SetParent(gameObject.transform.Find("AttachPoint"));
        Pot.transform.localRotation = Quaternion.identity;
        Pot.transform.localPosition = Vector3.zero;
        Pot.transform.localScale = Vector3.one;
        ItemOnTop = "Pot";
    }

    public GameObject hasUtensilOnTop(){
        GameObject utensil = null;
        foreach(Transform child in transform.Find("AttachPoint")){
            if(child.tag == "CookingUtensil") utensil = child.gameObject;
        }
        return utensil;
    }

    public string typeOfUtensil(GameObject utensil){
        if(utensil.name.Contains("Pot")) return "Pot";
        else if(utensil.name.Contains("Pan")) return "Pan";
        else return "";
    }
}
