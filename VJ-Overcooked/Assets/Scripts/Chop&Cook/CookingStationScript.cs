using System.Collections;
using System.Collections.Generic;
using UnityEngine.SceneManagement;
using UnityEngine;

public class CookingStationScript : MonoBehaviour
{

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
        Pot.transform.SetParent(gameObject.transform.Find("AttachPoint"));
        Pot.transform.localRotation = Quaternion.identity;
        Pot.transform.localPosition = Vector3.zero;
        Pot.transform.localScale = Vector3.one;
    }

    public GameObject hasUtensilOnTop(){
        GameObject Utensil = null;
        foreach(Transform child in transform.Find("AttachPoint")){
            if(child.tag == "CookingUtensil") Utensil = child.gameObject;
        }
        return Utensil;
    }

    public string typeOfUtensil(GameObject Utensil){
        if(Utensil.name.Contains("Pot")) return "Pot";
        else if(Utensil.name.Contains("Pan")) return "Pan";
        else return "";
    }
}
