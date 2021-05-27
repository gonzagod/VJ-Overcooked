using System.Collections;
using System.Collections.Generic;
using UnityEngine.SceneManagement;
using UnityEngine;

public class TableTopItem : MonoBehaviour
{

    public string itemOnTopString = "";
    public GameObject itemOnTop = null;

    // Start is called before the first frame update
    void Start()
    {
        if(SceneManager.GetActiveScene().name == "Nivell 1"){
            if(gameObject.name == "TableTop_Side 101" || gameObject.name == "TableTop_Side 102" || gameObject.name == "TableTop_Side 103"){
                setStartingPlate();
            }
            if(gameObject.name == "TableTop_Side 68"){
                setExtinguisher();
            }
        }else if(SceneManager.GetActiveScene().name == "Nivell 2"){
            if(gameObject.name == "TableTop_Space10" || gameObject.name == "TableTop_Space9" || gameObject.name == "TableTop_Space8"){
                setStartingPlate();
            }
            if(gameObject.name == "TableTop_Space21"){
                setExtinguisher();
            }
        }
    }

    // Update is called once per frame
    void Update()
    {

    }

    public void setItemOnTable(GameObject item, string itemName){
        if(item != null){
            item.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
            itemOnTopString = itemName;
        }
        itemOnTop = item;
    }

    public void CleanTable() {
        itemOnTop = null;
        itemOnTopString = "";
    }

    private void setStartingPlate(){
        GameObject plate = Instantiate(Resources.Load("Plate"), Vector3.zero, Quaternion.identity) as GameObject;
        setItemOnTable(plate, "Plate");
    }

    private void setExtinguisher(){
        GameObject Extinguisher = GameObject.Find("FireExtinguisher");
        Extinguisher.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
        itemOnTop = Extinguisher;
        itemOnTopString = "FireExtinguisher";
    }
}
