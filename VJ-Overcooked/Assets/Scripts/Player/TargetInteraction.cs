using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TargetInteraction : MonoBehaviour
{

    public bool usingExtinguisher = false;
    private GameObject target;
    private ItemSwitch itemSwitch;
    private string itemOnHandsName = "";
    private bool itemOnHandsChoppeable = false;
    private string itemOnHandsChoppedFood = "";
    private string typeOfItemOnHands = "";
    private GameObject itemOnHands = null;
    private Animator playerAnimator;
    public GameObject particleExtinguisher;
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
        itemOnHands = itemSwitch.selectedItemOnHands;
        itemOnHandsName = itemSwitch.selectedItemName;
        itemOnHandsChoppedFood = itemSwitch.choppedFood;
        itemOnHandsChoppeable = itemSwitch.selectedFoodChoppeable;
        typeOfItemOnHands = itemSwitch.typeOfItem;

        target = gameObject.transform.Find("player_no_anim").GetComponent<TargetHighlight>().target;

        if(itemOnHandsName=="FireExtinguisher"){
            particleExtinguisher = itemOnHands.transform.Find("SprayPoint").gameObject;
            if(Input.GetButton("Fire1")){
                particleExtinguisher.SetActive(true);
                usingExtinguisher = true;
                }
            else {
                particleExtinguisher.SetActive(false);
                usingExtinguisher = false;

                if(Input.GetKeyDown("space") && target != null){
                    if( target.tag == "Table"){
                        string itemOnTableString = target.GetComponent<TableTopItem>().itemOnTopString;
                        GameObject itemOnTable = target.GetComponent<TableTopItem>().itemOnTop;
                        if(itemOnTable == null){
                            if(itemOnHands != null){
                                target.GetComponent<TableTopItem>().setItemOnTable(itemOnHands, itemOnHandsName);
                                itemSwitch.emptyHands();
                            }
                        }
                    }
                }
            }
        }else if (target != null){
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
                                itemSwitch.deleteItemOnHands();
                                itemSwitch.emptyHands();
                            }
                        } else if (itemOnTableString == "Pot" && itemOnTable.transform.GetComponent<PotScript>().soupReady)
                        {
                            if (itemOnHandsName == "Plate")
                            {
                                string typeOfSoup = itemOnTable.transform.GetComponent<PotScript>().madeOf;
                                if(typeOfSoup == "Onion") itemOnHands.GetComponent<PlateSample>().InstantiateIngredientsInPlate("OnionSoup");
                                else if(typeOfSoup == "Tomato") itemOnHands.GetComponent<PlateSample>().InstantiateIngredientsInPlate("TomatoSoup");
                                else if(typeOfSoup == "Mushroom") itemOnHands.GetComponent<PlateSample>().InstantiateIngredientsInPlate("MushroomSoup");
                                else if(typeOfSoup == "Error") itemOnHands.GetComponent<PlateSample>().InstantiateIngredientsInPlate("ErrorSoup");
                                itemOnTable.transform.GetComponent<PotScript>().cleanPot();
                            }
                        } else if (itemOnTableString == "Plate")
                        {
                            if(itemOnHandsName == "Pot"){
                                if (itemOnHands.transform.GetComponent<PotScript>().soupReady)
                                {
                                    if (itemOnHands.transform.GetComponent<PotScript>().ingredientNames[0] == "Onion") itemOnTable.GetComponent<PlateSample>().InstantiateIngredientsInPlate("OnionSoup");
                                    itemOnHands.transform.GetComponent<PotScript>().cleanPot();
                                }
                            }else if(itemOnHandsChoppedFood != ""){
                                if(itemOnHandsChoppedFood == "Tomato") itemOnTable.GetComponent<PlateSample>().InstantiateIngredientsInPlate("PlatedTomato");
                                itemSwitch.deleteItemOnHands();
                                itemSwitch.emptyHands();
                            }
                        }
                        break;

                    case "ChoppingStation":
                        string itemOnChoppingTableString = target.GetComponent<ChoppingTableItem>().itemOnTopString;
                        GameObject itemOnChoppingTable = target.GetComponent<ChoppingTableItem>().itemOnTop;
                        float timeChoppingSpent = target.GetComponent<ChoppingTableItem>().timeChopping;
                        if(itemOnChoppingTable == null){
                            if(itemOnHandsChoppeable){
                                target.GetComponent<ChoppingTableItem>().setItemOnChoppingTable(itemOnHands, itemOnHandsName, itemOnHandsChoppeable);
                                itemSwitch.emptyHands();
                            }
                        }else {
                            bool chopping = target.GetComponent<ChoppingTableItem>().Chopping;
                            if(!chopping && itemOnHands == null && timeChoppingSpent <= 0){
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

                    case "PlateStation":
                        if (typeOfItemOnHands == "Plate")
                        {
                            target.GetComponent<PlateStationItem>().setPlateOnTop(itemOnHandsName);
                            itemSwitch.deleteItemOnHands();
                            itemSwitch.emptyHands();
                            string plateType = itemOnHands.GetComponent<PlateSample>().PlateType;
                            GameObject recipes = GameObject.Find("GameEnviroment 1/Canvases/HUDCanvas/ReceptesUI");
                            recipes.GetComponent<RecipeOrder>().orderDelivered(plateType,-1);
                        }
                        break;

                   case "PlateReturn":
                        GameObject plate = target.GetComponent<PlateReturnTopItem>().utensilOnTop;
                        if (itemOnHands == null)
                        {
                            itemSwitch.setItemOnHands(plate);
                        }
                        break;

                    default:
                        break;
                }
            } else if(Input.GetKeyDown("left ctrl")){
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
