using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TargetInteraction : MonoBehaviour
{

    private GameObject target;
    private FoodSwitch foodSwitch;
    private int itemOnHands;
    private GameObject goOnHands = null;
    private Animator playerAnimator;
    // Start is called before the first frame update
    void Start()
    {
        target = null;
        foodSwitch = gameObject.transform.Find("player_no_anim/Food").GetComponent<FoodSwitch>();
        playerAnimator = transform.Find("player_no_anim").gameObject.GetComponent<Animator>();

    }

    // Update is called once per frame
    void Update()
    {
        target = gameObject.transform.Find("player_no_anim").GetComponent<TargetHighlight>().target;
        if (target != null){
            itemOnHands = foodSwitch.selectedFood;
            goOnHands = foodSwitch.selectedItemOnHands;
            string choppedFood = foodSwitch.choppedFood;
            if(Input.GetKeyDown("space")){
                switch(target.tag){
                    case "Table":
                        string itemOnTable = target.GetComponent<TableTopItem>().ItemOnTop;
                        if(itemOnTable == ""){
                            if(itemOnHands >= 0){
                                if(itemOnHands < 9){
                                    Debug.Log("itemOnHands = " + itemOnHands);
                                    target.GetComponent<TableTopItem>().UpdateItemOnTop(itemOnHands);
                                    foodSwitch.emptyHands();
                                } else {
                                    GameObject utensil = null;
                                    foreach(Transform child in transform.Find("player_no_anim/Food/Utensil")){
                                        if(child.tag == "CookingUtensil") utensil = child.gameObject;
                                    }
                                    target.GetComponent<TableTopItem>().placeUtensil(utensil);
                                    foodSwitch.emptyHands();
                                }
                            }
                        }else if(itemOnHands == -1){
                            GameObject utensil = target.GetComponent<TableTopItem>().hasUtensilOnTop();
                            string utensilType = "";
                            if(utensil != null){
                                utensilType = target.GetComponent<TableTopItem>().typeOfUtensil(utensil);
                                if(utensilType != "") foodSwitch.takeItem(utensil);
                                target.GetComponent<TableTopItem>().CleanTable();
                            } else {
                                foodSwitch.changeSelectedFoodString(itemOnTable);
                                target.GetComponent<TableTopItem>().CleanTable();
                            }
                        } else if(itemOnTable == "Pot" && itemOnHands > 3 && itemOnHands < 8){
                            GameObject potOnTable = target.GetComponent<TableTopItem>().hasUtensilOnTop();
                            int numOfIngredientsInPot = potOnTable.GetComponent<PotScript>().numIngredients;
                            bool potBurned = potOnTable.GetComponent<PotScript>().burned;
                            if(numOfIngredientsInPot < 3 && !potBurned){
                                potOnTable.GetComponent<PotScript>().addIngredient(choppedFood);
                                foodSwitch.emptyHands();
                            }
                        }
                        break;

                    case "ChoppingStation":
                        string itemOnChoppingTable = target.GetComponent<ChoppingTableItem>().ItemOnTop;
                        if(itemOnChoppingTable == ""){
                            if(itemOnHands >= 0 && itemOnHands < 8){
                                target.GetComponent<ChoppingTableItem>().UpdateItemOnTop(itemOnHands);
                                foodSwitch.emptyHands();
                            }
                        }else {
                            bool chopping = target.GetComponent<ChoppingTableItem>().Chopping;
                            if(!chopping && itemOnHands == -1){
                                foodSwitch.changeSelectedFoodString(itemOnChoppingTable);
                                target.GetComponent<ChoppingTableItem>().CleanTable();
                            }
                        }
                        break;

                    case "CookingStation":
                        if(choppedFood != ""){
                            GameObject utensil = target.GetComponent<CookingStationScript>().hasUtensilOnTop();
                            string utensilType = "";
                            if(utensil != null){
                                utensilType = target.GetComponent<CookingStationScript>().typeOfUtensil(utensil);
                                if(utensilType == "Pot"){
                                    int numOfIngredientsInPot = utensil.GetComponent<PotScript>().numIngredients;
                                    bool potBurned = utensil.GetComponent<PotScript>().burned;
                                    if(numOfIngredientsInPot < 3 && !potBurned){
                                        utensil.GetComponent<PotScript>().addIngredient(choppedFood);
                                        foodSwitch.emptyHands();
                                    }
                                }
                            }
                        } else if(itemOnHands == -1){
                            GameObject utensil = target.GetComponent<CookingStationScript>().hasUtensilOnTop();
                            string utensilType = "";
                            if(utensil != null){
                                utensilType = target.GetComponent<CookingStationScript>().typeOfUtensil(utensil);
                                if(utensilType != "") foodSwitch.takeItem(utensil);
                            }
                        }else if(itemOnHands > 8){
                            GameObject utensil = target.GetComponent<CookingStationScript>().hasUtensilOnTop();
                            if(utensil == null){
                                if(itemOnHands == 9) {
                                    target.GetComponent<CookingStationScript>().setPotOnTop(goOnHands.name);
                                }
                                foodSwitch.emptyHands();
                            }

                        }
                        break;

                    case "PlateStation":
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
                        break;

                    default:
                        break;
                }
            } if(Input.GetKeyDown("left ctrl")){
                if(target.tag == "ChoppingStation"){
                    string itemOnChoppingTable = target.GetComponent<ChoppingTableItem>().ItemOnTop;
                    bool ItemChoppeable = target.GetComponent<ChoppingTableItem>().itemOnTopChoppeable;
                    if(itemOnChoppingTable != "" && ItemChoppeable){
                        if(itemOnHands < 0){
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
