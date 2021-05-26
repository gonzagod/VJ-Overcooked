using System.Collections;
using System.Collections.Generic;
using UnityEngine.SceneManagement;
using UnityEngine;

public class CookingStationScript : MonoBehaviour
{

    public GameObject utensilOnTop = null;
    public string utensilOnTopString = "";

    // Start is called before the first frame update
    void Start()
    {
        if(gameObject.name == "CookingStation 1" || gameObject.name == "CookingStation 2"){
            setItemOnTop("Pot");
        }
    }

    // Update is called once per frame
    void Update()
    {

    }

    public void setItemOnTop(string itemName){
        if(itemName == "Pot"){
            if (gameObject.name == "CookingStation 1") setPotOnTop("Pot 1");
            if (gameObject.name == "CookingStation 2") setPotOnTop("Pot 2");
        }
    }

    public void setPotOnTop(string potName){
        GameObject Pot = GameObject.Find(potName);
        Pot.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
        utensilOnTop = Pot;
        utensilOnTopString = "Pot";
    }

    public void cleanCookingStation(){
        utensilOnTop = null;
        utensilOnTopString = "";
    }

}
