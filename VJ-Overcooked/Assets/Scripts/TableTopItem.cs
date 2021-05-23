using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TableTopItem : MonoBehaviour
{

    public string ItemOnTop = "";

    // Start is called before the first frame update
    void Start()
    {
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
            default:
                break;
        }
    }

    public void CleanTable() {
        foreach (Transform food in transform)
        {
            if (food.gameObject.tag == "Pre-Ingredient")
                food.gameObject.SetActive(false);
        }
        ItemOnTop = "";
    }
}
