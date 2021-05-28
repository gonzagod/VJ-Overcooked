using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class godMode : MonoBehaviour
{
    public GameObject playerItem;
    public ItemSwitch itemSwitch;
    public bool enableBurning = true;
    private GameObject itemOnHands = null;
    private string itemOnHandsName = "";
    private bool itemOnHandsChoppeable = false;
    private string itemOnHandsChoppedFood = "";
    private string typeOfItemOnHands = "";

    private KeyCode[] keyCodes = {
         KeyCode.Alpha1,
         KeyCode.Alpha2,
         KeyCode.Alpha3,
         KeyCode.Alpha4,
         KeyCode.Alpha5,
         KeyCode.Alpha6,
         KeyCode.Alpha7,
         KeyCode.Alpha8,
         KeyCode.Alpha9,
     };

    // Start is called before the first frame update
    void Start()
    {
        playerItem = GameObject.Find("Player_1/player_no_anim/Item");
        itemSwitch = playerItem.GetComponent<ItemSwitch>();
    }

    // Update is called once per frame
    void Update()
    {
        itemOnHands = itemSwitch.selectedItemOnHands;
        itemOnHandsName = itemSwitch.selectedItemName;
        itemOnHandsChoppedFood = itemSwitch.choppedFood;
        itemOnHandsChoppeable = itemSwitch.selectedFoodChoppeable;
        typeOfItemOnHands = itemSwitch.typeOfItem;

        for(int i = 0 ; i < keyCodes.Length; i ++ ){
           if(Input.GetKeyDown(keyCodes[i])){
                  int numberPressed = i+1;
                  if(numberPressed == 6 ){
                      setOrderOnHands();
                  }else if(numberPressed == 7){
                      completeCooking();
                  }else if(numberPressed == 8){
                      disableBurning();
                  }
           }
       }

        if (Input.GetKeyDown("o"))
        {
            itemSwitch.deleteItemOnHands();
            itemSwitch.emptyHands();
            GameObject Onion = Instantiate(Resources.Load("ChoppedPotato")) as GameObject;
            itemSwitch.setItemOnHands(Onion);
        }
        else if (Input.GetKeyDown("m"))
        {
            itemSwitch.deleteItemOnHands();
            itemSwitch.emptyHands();
            GameObject ChoppedChicken = Instantiate(Resources.Load("ChoppedChicken")) as GameObject;
            itemSwitch.setItemOnHands(ChoppedChicken);
        }
        else if (Input.GetKeyDown("l"))
        {
            itemSwitch.deleteItemOnHands();
            itemSwitch.emptyHands();
            GameObject Lettuce = Instantiate(Resources.Load("Lettuce")) as GameObject;
            itemSwitch.setItemOnHands(Lettuce);
        }
        else if (Input.GetKeyDown("t"))
        {
            itemSwitch.deleteItemOnHands();
            itemSwitch.emptyHands();
            GameObject Tomato = Instantiate(Resources.Load("ChoppedTomato")) as GameObject;
            itemSwitch.setItemOnHands(Tomato);
        }
        else if (Input.GetKeyDown("b"))
        {
            itemSwitch.deleteItemOnHands();
            itemSwitch.emptyHands();
            GameObject ChoppedBurger = Instantiate(Resources.Load("ChoppedBurger")) as GameObject;
            itemSwitch.setItemOnHands(ChoppedBurger);
        }
        else if (Input.GetKeyDown("y"))
        {
            itemSwitch.deleteItemOnHands();
            itemSwitch.emptyHands();
            itemOnHands.GetComponent<PlateSample>().InstantiateIngredientsInPlate("PlatedLettuce");
        }
        else if (Input.GetKeyDown("i"))
        {
            itemSwitch.deleteItemOnHands();
            itemSwitch.emptyHands();
            itemOnHands.GetComponent<PlateSample>().InstantiateIngredientsInPlate("PlatedTomato");
        }
        else if (Input.GetKeyDown("r"))
        {
            itemSwitch.deleteItemOnHands();
            itemSwitch.emptyHands();
            itemOnHands.GetComponent<PlateSample>().InstantiateIngredientsInPlate("Burger");
        }
        else if (Input.GetKeyDown("e"))
        {
            itemSwitch.deleteItemOnHands();
            itemSwitch.emptyHands();
            itemOnHands.GetComponent<PlateSample>().InstantiateIngredientsInPlate("PlatedOnion");
        }
        else if (Input.GetKeyDown("x")) {
            itemSwitch.deleteItemOnHands();
            itemSwitch.emptyHands();
            GameObject Plate = Instantiate(Resources.Load("Plate")) as GameObject;
            itemSwitch.setItemOnHands(Plate);
            RecipeOrder recipes = GameObject.Find("GameEnviroment 1/Canvases/HUDCanvas/ReceptesUI").GetComponent<RecipeOrder>();
            itemOnHands = itemSwitch.selectedItemOnHands;
            itemOnHandsName = itemSwitch.selectedItemName;
            itemOnHandsChoppedFood = itemSwitch.choppedFood;
            itemOnHandsChoppeable = itemSwitch.selectedFoodChoppeable;
            typeOfItemOnHands = itemSwitch.typeOfItem;
            itemOnHands.GetComponent<PlateSample>().InstantiatePlate(recipes._poolOrders[0]);
            itemSwitch.setItemOnHands(itemOnHands);
        }
    }

    public void setOrderOnHands(){
        itemOnHands = itemSwitch.selectedItemOnHands;
        itemOnHandsName = itemSwitch.selectedItemName;
        itemOnHandsChoppedFood = itemSwitch.choppedFood;
        itemOnHandsChoppeable = itemSwitch.selectedFoodChoppeable;
        typeOfItemOnHands = itemSwitch.typeOfItem;
        itemSwitch.deleteItemOnHands();
        itemSwitch.emptyHands();
        GameObject Plate = Instantiate(Resources.Load("Plate")) as GameObject;
        itemSwitch.setItemOnHands(Plate);
        RecipeOrder recipes = GameObject.Find("GameEnviroment 1/Canvases/HUDCanvas/ReceptesUI").GetComponent<RecipeOrder>();
        itemOnHands = itemSwitch.selectedItemOnHands;
        itemOnHandsName = itemSwitch.selectedItemName;
        itemOnHandsChoppedFood = itemSwitch.choppedFood;
        itemOnHandsChoppeable = itemSwitch.selectedFoodChoppeable;
        typeOfItemOnHands = itemSwitch.typeOfItem;
        itemOnHands.GetComponent<PlateSample>().InstantiatePlate(recipes._poolOrders[0]);
        itemSwitch.setItemOnHands(itemOnHands);
    }

    public void completeCooking(){
        GameObject Pot1 = GameObject.Find("Pot 1");
        GameObject Pot2 = GameObject.Find("Pot 2");
        GameObject Pot3 = GameObject.Find("Pot 3");
        GameObject Pot4 = GameObject.Find("Pot 4");
        GameObject Pan1 = GameObject.Find("Pan 1");
        GameObject Pan2 = GameObject.Find("Pan 2");
        GameObject Pan3 = GameObject.Find("Pan 3");
        GameObject Pan4 = GameObject.Find("Pan 4");

        if(Pot1 != null) Pot1.GetComponent<PotScript>().finishCooking();
        if(Pot2 != null) Pot2.GetComponent<PotScript>().finishCooking();
        if(Pot3 != null) Pot3.GetComponent<PotScript>().finishCooking();
        if(Pot4 != null) Pot4.GetComponent<PotScript>().finishCooking();
        if(Pan1 != null) Pan1.GetComponent<PanScript>().finishCooking();
        if(Pan2 != null) Pan2.GetComponent<PanScript>().finishCooking();
        if(Pan3 != null) Pan3.GetComponent<PanScript>().finishCooking();
        if(Pan4 != null) Pan4.GetComponent<PanScript>().finishCooking();
    }

    public void disableBurning(){
        enableBurning = !enableBurning;
    }
}
