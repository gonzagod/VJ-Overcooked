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
}
