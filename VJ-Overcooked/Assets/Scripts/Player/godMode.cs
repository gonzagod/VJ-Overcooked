﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class godMode : MonoBehaviour
{
    public GameObject playerItem;
    public ItemSwitch itemSwitch;
    private GameObject itemOnHands = null;
    private string itemOnHandsName = "";
    private bool itemOnHandsChoppeable = false;
    private string itemOnHandsChoppedFood = "";
    private string typeOfItemOnHands = "";

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
}
