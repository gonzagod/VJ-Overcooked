using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TargetInteraction : MonoBehaviour
{

    private GameObject target;
    private ItemSwitch itemSwitch;
    private string itemOnHandsName = "";
    private bool itemOnHandsChoppeable = false;
    private string itemOnHandsChoppedFood = "";
    private string typeOfItemOnHands = "";
    private GameObject itemOnHands = null;
    private Animator playerAnimator;
    // Start is called before the first frame update
    void Start()
    {
        target = null;
        itemSwitch = gameObject.transform.Find("player_no_anim/Item").GetComponent<ItemSwitch>();
        playerAnimator = transform.Find("player_no_anim").gameObject.GetComponent<Animator>();
    }

    // Update is called once per frame
    void Update()
    {
        target = gameObject.transform.Find("player_no_anim").GetComponent<TargetHighlight>().target;
        if (target != null){
            itemOnHands = itemSwitch.selectedItemOnHands;
            itemOnHandsName = itemSwitch.selectedItemName;
            itemOnHandsChoppedFood = itemSwitch.choppedFood;
            itemOnHandsChoppeable = itemSwitch.selectedFoodChoppeable;
            typeOfItemOnHands = itemSwitch.typeOfItem;
            if(Input.GetKeyDown("space")){
                switch(target.tag){
                    case "Table":
                        string itemOnTableString = target.GetComponent<TableTopItem>().itemOnTopString;
                        GameObject itemOnTable = target.GetComponent<TableTopItem>().itemOnTop;
                        if(itemOnTable == null){
                            if(itemOnHands != null){
                                target.GetComponent<TableTopItem>().setItemOnTable(itemOnHands, itemOnHandsName);
                                itemSwitch.emptyHands();
                            }
                        }else if(itemOnHands == null){
                            itemSwitch.setItemOnHands(itemOnTable);
                            target.GetComponent<TableTopItem>().CleanTable();
                        } else if(itemOnTableString == "Pot" && itemOnHandsChoppedFood != ""){
                            int numOfIngredientsInPot = itemOnTable.GetComponent<PotScript>().numIngredients;
                            bool potBurned = itemOnTable.GetComponent<PotScript>().burned;
                            if(numOfIngredientsInPot < 3 && !potBurned){
                                itemOnTable.GetComponent<PotScript>().addIngredient(itemOnHandsChoppedFood);
                                itemSwitch.emptyHands();
                            }
                        }
                        break;

                    case "ChoppingStation":
                        string itemOnChoppingTableString = target.GetComponent<ChoppingTableItem>().itemOnTopString;
                        GameObject itemOnChoppingTable = target.GetComponent<ChoppingTableItem>().itemOnTop;
                        if(itemOnChoppingTable == null){
                            if(itemOnHandsChoppeable){
                                Debug.Log("Entra");
                                target.GetComponent<ChoppingTableItem>().setItemOnChoppingTable(itemOnHands, itemOnHandsName, itemOnHandsChoppeable);
                                itemSwitch.emptyHands();
                            }
                        }else {
                            bool chopping = target.GetComponent<ChoppingTableItem>().Chopping;
                            if(!chopping && itemOnHands == null){
                                itemSwitch.setItemOnHands(itemOnChoppingTable);
                                target.GetComponent<ChoppingTableItem>().CleanTable();
                            }
                        }
                        break;

                    case "CookingStation":
                        if(itemOnHandsChoppedFood != ""){
                            GameObject utensil = target.GetComponent<CookingStationScript>().utensilOnTop;
                            string utensilName = target.GetComponent<CookingStationScript>().utensilOnTopString;
                            if(utensil != null){
                                if(utensilName == "Pot"){
                                    int numOfIngredientsInPot = utensil.GetComponent<PotScript>().numIngredients;
                                    bool potBurned = utensil.GetComponent<PotScript>().burned;
                                    if(numOfIngredientsInPot < 3 && !potBurned){
                                        utensil.GetComponent<PotScript>().addIngredient(itemOnHandsChoppedFood);
                                        itemSwitch.deleteItemOnHands();
                                        itemSwitch.emptyHands();
                                    }
                                }
                            }
                        } else if(itemOnHands == null){
                            GameObject utensil = target.GetComponent<CookingStationScript>().utensilOnTop;
                            string utensilName = target.GetComponent<CookingStationScript>().utensilOnTopString;
                            if(utensil != null){
                                if(utensilName != "") itemSwitch.setItemOnHands(utensil);
                                target.GetComponent<CookingStationScript>().cleanCookingStation();
                            }
                        }else if(typeOfItemOnHands == "Utensil"){
                            GameObject utensil = target.GetComponent<CookingStationScript>().utensilOnTop;
                            if(utensil == null){
                                target.GetComponent<CookingStationScript>().setPotOnTop(itemOnHands.name);
                                itemSwitch.emptyHands();
                            }

                        }
                        break;

                    /* case "PlateStation":
                        string itemOnPlateStation = target.GetComponent<PlateStationItem>().ItemOnTop;
                        if (itemOnHands >= 0)
                        {
                            target.GetComponent<PlateStationItem>().UpdateItemOnTop(itemOnHands);
                            foodSwitch.emptyHands();
                        }
                        else
                        {
                            foodSwitch.changeSelectedFoodString(itemOnPlateStation);
                            target.GetComponent<PlateStationItem>().CleanTable();
                        }
                        break;

                    case "PlateReturn":
                        string itemOnPlateReturn = target.GetComponent<PlateReturnTopItem>().ItemOnTop;
                        if (itemOnHands >= 0)
                        {
                            target.GetComponent<PlateReturnTopItem>().UpdateItemOnTop(itemOnHands);
                            foodSwitch.emptyHands();
                        }
                        else
                        {
                            foodSwitch.changeSelectedFoodString(itemOnPlateReturn);
                            target.GetComponent<PlateReturnTopItem>().CleanTable();
                        }
                        break;*/

                    default:
                        break;
                }
            } if(Input.GetKeyDown("left ctrl")){
                if(target.tag == "ChoppingStation"){
                    string itemOnChoppingTable = target.GetComponent<ChoppingTableItem>().itemOnTopString;
                    bool itemChoppeable = target.GetComponent<ChoppingTableItem>().itemOnTopChoppeable;
                    if(itemOnChoppingTable != "" && itemChoppeable){
                        if(itemOnHands == null){
                            bool chopping = target.GetComponent<ChoppingTableItem>().Chopping;
                            float timechopping = target.GetComponent<ChoppingTableItem>().timeChopping;
                            if(!chopping && timechopping == 0f){
                                target.GetComponent<ChoppingTableItem>().StartChopping();
                            }else if(!chopping && timechopping > 0f) target.GetComponent<ChoppingTableItem>().ContinueChopping();
                            playerAnimator.SetBool("isWalking", false);
                            playerAnimator.SetBool("isHolding", false);
                            playerAnimator.SetBool("isCutting", true);
                            gameObject.transform.Find("player_no_anim/Chef_Body/Hand_Open_R").gameObject.SetActive(false);
                            gameObject.transform.Find("player_no_anim/Chef_Body/Hand_Grip_R").gameObject.SetActive(true);
                            gameObject.transform.Find("player_no_anim/Chef_Body/Knife").gameObject.SetActive(true);
                        }
                    }
                }
            }
        }
    }
}
