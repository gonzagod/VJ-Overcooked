using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TargetInteraction : MonoBehaviour
{

    public bool usingExtinguisher = false;
    private GameObject target;
    private ItemSwitch itemSwitch;
    public string itemOnHandsName = "";
    public bool itemOnHandsChoppeable = false;
    public string itemOnHandsChoppedFood = "";
    public string typeOfItemOnHands = "";
    public GameObject itemOnHands = null;
    private Animator playerAnimator;
    public GameObject particleExtinguisher;
    AudioSource[] sounds;
    AudioSource[] itemDown = new AudioSource[5];
    AudioSource[] itemPickUp = new AudioSource[5];
    AudioSource extintorSound;
    private bool extintorSounding;
    // Start is called before the first frame update
    void Start()
    {
        sounds = transform.GetComponents<AudioSource>();
        
        for (int i = 0; i < 5; ++i)
        {
            itemDown[i] = sounds[i];
        }
        for (int j = 5; j < 10; ++j)
        {
            itemPickUp[j-5] = sounds[j];
        }
        extintorSound = sounds[10];
        target = null;
        itemSwitch = gameObject.transform.Find("player_no_anim/Item").GetComponent<ItemSwitch>();
        playerAnimator = transform.Find("player_no_anim").gameObject.GetComponent<Animator>();
    }

    // Update is called once per frame
    void Update()
    {
        int rand5 = UnityEngine.Random.Range(0,4);
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
                if (!extintorSounding)
                {
                    extintorSounding = true;
                    extintorSound.Play();
                }
                }
            else {
                particleExtinguisher.SetActive(false);
                usingExtinguisher = false;
                extintorSounding = false;
                extintorSound.Stop();

                if (Input.GetKeyDown("space") && target != null){
                    if( target.tag == "Table"){
                        string itemOnTableString = target.GetComponent<TableTopItem>().itemOnTopString;
                        GameObject itemOnTable = target.GetComponent<TableTopItem>().itemOnTop;
                        if(itemOnTable == null){
                            if(itemOnHands != null){
                                target.GetComponent<TableTopItem>().setItemOnTable(itemOnHands, itemOnHandsName);
                                itemSwitch.emptyHands();
                                itemDown[rand5].Play();
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
                                itemDown[rand5].Play();
                            }
                        } else if(itemOnHands == null){
                            itemSwitch.setItemOnHands(itemOnTable);
                            target.GetComponent<TableTopItem>().CleanTable();
                            itemPickUp[rand5].Play();
                        } else if(itemOnTableString == "Pot" && itemOnHandsChoppedFood != ""){
                            int numOfIngredientsInPot = itemOnTable.GetComponent<PotScript>().numIngredients;
                            bool potBurned = itemOnTable.GetComponent<PotScript>().burned;
                            bool canSoupItemOnHands = itemOnTable.GetComponent<PotScript>().canSoupItem(itemOnHandsChoppedFood);
                            if(numOfIngredientsInPot < 3 && !potBurned && canSoupItemOnHands){
                                itemOnTable.GetComponent<PotScript>().addIngredient(itemOnHandsChoppedFood);
                                itemSwitch.deleteItemOnHands();
                                itemSwitch.emptyHands();
                            }
                        } else if (itemOnTableString == "Pot" && itemOnTable.transform.GetComponent<PotScript>().soupReady)
                        {
                            if (itemOnHandsName == "Plate" && itemOnHands.GetComponent<PlateSample>().CanIInstantiatePlate())
                            {
                                string typeOfSoup = itemOnTable.transform.GetComponent<PotScript>().madeOf;
                                if (typeOfSoup == "Onion") itemOnHands.GetComponent<PlateSample>().InstantiatePlate("OnionSoup");
                                else if(typeOfSoup == "Tomato") itemOnHands.GetComponent<PlateSample>().InstantiatePlate("TomatoSoup");
                                else if(typeOfSoup == "Mushroom") itemOnHands.GetComponent<PlateSample>().InstantiatePlate("MushroomSoup");
                                else if(typeOfSoup == "Error") itemOnHands.GetComponent<PlateSample>().InstantiatePlate("ErrorSoup");
                                itemOnTable.transform.GetComponent<PotScript>().cleanPot();
                                itemPickUp[rand5].Play();
                            }
                        } else if(itemOnTableString == "Pan" && itemOnHandsChoppedFood != ""){
                            string ingredientOnPan = itemOnTable.GetComponent<PanScript>().ingredientName;
                            bool panBurned = itemOnTable.GetComponent<PanScript>().burned;
                            bool canFryItemOnHands = itemOnTable.GetComponent<PanScript>().canFryItem(itemOnHandsChoppedFood);
                            if(ingredientOnPan == "" && !panBurned && canFryItemOnHands){
                                itemOnTable.GetComponent<PanScript>().addIngredient(itemOnHands, itemOnHandsName);
                                itemSwitch.deleteItemOnHands();
                                itemSwitch.emptyHands();
                            }
                        } else if (itemOnTableString == "Pan" && itemOnTable.transform.GetComponent<PanScript>().foodReady)
                        {
                            if (itemOnHandsName == "Plate")
                            {
                                string primaryFoodOnPan = itemOnTable.GetComponent<PanScript>().primaryFood;
                                bool foodInPanReady = itemOnTable.GetComponent<PanScript>().foodReady;
                                if(foodInPanReady && itemOnHands.GetComponent<PlateSample>().CanIInstantiateIngredientsInPlate(primaryFoodOnPan)){
                                    itemOnHands.GetComponent<PlateSample>().InstantiateIngredientsInPlate(primaryFoodOnPan);
                                    itemOnTable.transform.GetComponent<PanScript>().cleanPan();
                                    itemPickUp[rand5].Play();
                                }

                            }
                        } else if (itemOnTableString == "Plate")
                        {
                            if(itemOnHandsName == "Pot"){
                                if (itemOnHands.transform.GetComponent<PotScript>().soupReady && itemOnTable.GetComponent<PlateSample>().CanIInstantiatePlate())
                                {
                                    int numOfIngredientsInPot = itemOnHands.GetComponent<PotScript>().numIngredients;
                                    bool soupInPot = itemOnHands.GetComponent<PotScript>().soupReady;
                                    if (numOfIngredientsInPot == 3 && soupInPot)
                                    {
                                        string typeOfSoup = itemOnHands.GetComponent<PotScript>().madeOf;
                                        if (typeOfSoup == "Onion") itemOnTable.GetComponent<PlateSample>().InstantiatePlate("OnionSoup");
                                        else if (typeOfSoup == "Tomato") itemOnTable.GetComponent<PlateSample>().InstantiatePlate("TomatoSoup");
                                        else if (typeOfSoup == "Mushroom") itemOnTable.GetComponent<PlateSample>().InstantiatePlate("MushroomSoup");
                                        else if (typeOfSoup == "Error") itemOnTable.GetComponent<PlateSample>().InstantiatePlate("ErrorSoup");
                                        itemOnHands.GetComponent<PotScript>().cleanPot();
                                        itemPickUp[rand5].Play();
                                    }
                                }
                            }else if (itemOnHandsChoppedFood != "") {
                                if (itemOnTable.GetComponent<PlateSample>().CanIInstantiateIngredientsInPlate(itemOnHandsChoppedFood))
                                {
                                    itemOnTable.GetComponent<PlateSample>().InstantiateIngredientsInPlate(itemOnHandsChoppedFood);
                                    itemSwitch.deleteItemOnHands();
                                    itemSwitch.emptyHands();
                                    itemDown[rand5].Play();
                                }

                            } else if (itemOnHandsName == "Plate") {
                                if (itemOnTable.GetComponent<PlateSample>().PlateType == "Plate")
                                {
                                    if (itemOnHands.GetComponent<PlateSample>().ingredientNames.Count == 0)
                                    {
                                        foreach (string ingredient in itemOnTable.GetComponent<PlateSample>().ingredientNames)
                                        {
                                            itemOnHands.GetComponent<PlateSample>().InstantiateIngredientsInPlate(ingredient);
                                        }
                                        itemOnTable.GetComponent<PlateSample>().CleanPlate();
                                        itemPickUp[rand5].Play();
                                    }
                                    else if (itemOnTable.GetComponent<PlateSample>().CanIInstantiateIngredientsInPlate(itemOnHands.GetComponent<PlateSample>().ingredientNames))
                                    {
                                        foreach (string ingredient in itemOnHands.GetComponent<PlateSample>().ingredientNames)
                                        {
                                            itemOnTable.GetComponent<PlateSample>().InstantiateIngredientsInPlate(ingredient);
                                        }
                                        itemOnHands.GetComponent<PlateSample>().CleanPlate();
                                        itemDown[rand5].Play();
                                    }
                                }
                                else
                                {
                                    if (itemOnHandsChoppedFood != null)
                                    {
                                        if (itemOnTable.GetComponent<PlateSample>().CanIInstantiateIngredientsInPlate(itemOnHandsChoppedFood))
                                        {
                                            itemOnTable.GetComponent<PlateSample>().InstantiateIngredientsInPlate(itemOnHands.GetComponent<PlateSample>().PlateType);
                                            itemOnHands.GetComponent<PlateSample>().CleanPlate();
                                            itemPickUp[rand5].Play();
                                        }
                                    }
                                }
                            } else if (itemOnHandsName == "Pan" && itemOnHands.transform.GetComponent<PanScript>().foodReady)
                            {
                                if (itemOnTableString == "Plate" && itemOnTable.GetComponent<PlateSample>().CanIInstantiateIngredientsInPlate(itemOnHandsName))
                                {
                                    string primaryFoodOnPan = itemOnHands.GetComponent<PanScript>().primaryFood;
                                    bool foodInPanReady = itemOnHands.GetComponent<PanScript>().foodReady;
                                    if (foodInPanReady && itemOnTable.GetComponent<PlateSample>().CanIInstantiateIngredientsInPlate(primaryFoodOnPan))
                                    {
                                        itemOnTable.GetComponent<PlateSample>().InstantiateIngredientsInPlate(primaryFoodOnPan);
                                        itemOnHands.transform.GetComponent<PanScript>().cleanPan();
                                        itemPickUp[rand5].Play();
                                    }
                                }
                            }
                        }
                        else if (itemOnHandsName == "Plate")
                        {
                            if (itemOnTable.name == "Plate")
                            {
                                if (itemOnTable.GetComponent<PlateSample>().CanIInstantiateIngredientsInPlate(itemOnHands.GetComponent<PlateSample>().ingredientNames))
                                {
                                    foreach(string ingredient in itemOnHands.GetComponent<PlateSample>().ingredientNames)
                                    {
                                        itemOnTable.GetComponent<PlateSample>().InstantiateIngredientsInPlate(ingredient);
                                        itemDown[rand5].Play();
                                    }
                                }
                            }
                            else {
                                switch (itemOnTableString)
                                {
                                    case "ChoppedOnion":
                                        if (itemOnHands.GetComponent<PlateSample>().CanIInstantiateIngredientsInPlate("Onion"))
                                        {
                                            itemOnHands.GetComponent<PlateSample>().InstantiateIngredientsInPlate("Onion");
                                            target.GetComponent<TableTopItem>().CleanTable();
                                            target.GetComponent<TableTopItem>().deleteItemOnTable();
                                            target.GetComponent<TableTopItem>().setItemOnTable(itemOnHands, itemOnHandsName);
                                            itemSwitch.deleteItemOnHands();
                                            itemSwitch.emptyHands();
                                            itemDown[rand5].Play();
                                        }
                                            break;
                                    case "ChoppedTomato":
                                        if (itemOnHands.GetComponent<PlateSample>().CanIInstantiateIngredientsInPlate("Tomato"))
                                        {
                                            itemOnHands.GetComponent<PlateSample>().InstantiateIngredientsInPlate("Tomato");
                                            target.GetComponent<TableTopItem>().CleanTable();
                                            target.GetComponent<TableTopItem>().deleteItemOnTable();
                                            target.GetComponent<TableTopItem>().setItemOnTable(itemOnHands, itemOnHandsName);
                                            itemSwitch.deleteItemOnHands();
                                            itemSwitch.emptyHands();
                                            itemDown[rand5].Play();
                                        }
                                            break;
                                    case "ChoppedMushroom":
                                        if (itemOnHands.GetComponent<PlateSample>().CanIInstantiateIngredientsInPlate("Mushroom"))
                                        {
                                            itemOnHands.GetComponent<PlateSample>().InstantiateIngredientsInPlate("Mushroom");
                                            target.GetComponent<TableTopItem>().CleanTable();
                                            target.GetComponent<TableTopItem>().deleteItemOnTable();
                                            target.GetComponent<TableTopItem>().setItemOnTable(itemOnHands, itemOnHandsName);
                                            itemSwitch.deleteItemOnHands();
                                            itemSwitch.emptyHands();
                                            itemDown[rand5].Play();
                                        }
                                            break;
                                    case "ChoppedLettuce":
                                        if (itemOnHands.GetComponent<PlateSample>().CanIInstantiateIngredientsInPlate("Lettuce"))
                                        {
                                            itemOnHands.GetComponent<PlateSample>().InstantiateIngredientsInPlate("Lettuce");
                                            target.GetComponent<TableTopItem>().CleanTable();
                                            target.GetComponent<TableTopItem>().deleteItemOnTable();
                                            target.GetComponent<TableTopItem>().setItemOnTable(itemOnHands, itemOnHandsName);
                                            itemSwitch.deleteItemOnHands();
                                            itemSwitch.emptyHands();
                                            itemDown[rand5].Play();
                                        }
                                            break;
                                    default:

                                        break;
                                }
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
                                itemDown[rand5].Play();
                            }
                        }else {
                            bool chopping = target.GetComponent<ChoppingTableItem>().Chopping;
                            if(!chopping && itemOnHands == null && timeChoppingSpent <= 0){
                                itemSwitch.setItemOnHands(itemOnChoppingTable);
                                target.GetComponent<ChoppingTableItem>().CleanTable();
                                itemPickUp[rand5].Play();
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
                                    bool canSoupItemOnHands = utensil.GetComponent<PotScript>().canSoupItem(itemOnHandsChoppedFood);
                                    if(numOfIngredientsInPot < 3 && !potBurned && canSoupItemOnHands){
                                        utensil.GetComponent<PotScript>().addIngredient(itemOnHandsChoppedFood);
                                        itemSwitch.deleteItemOnHands();
                                        itemSwitch.emptyHands();
                                    }
                                }else if(utensilName == "Pan"){
                                    string ingredientOnPan = utensil.GetComponent<PanScript>().ingredientName;
                                    bool panBurned = utensil.GetComponent<PanScript>().burned;
                                    bool canFryItemOnHands = utensil.GetComponent<PanScript>().canFryItem(itemOnHandsChoppedFood);
                                    if(ingredientOnPan == "" && !panBurned && canFryItemOnHands){
                                        utensil.GetComponent<PanScript>().addIngredient(itemOnHands, itemOnHandsName);
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
                                itemPickUp[rand5].Play();
                            }
                        }else if(typeOfItemOnHands == "Utensil"){
                            GameObject utensil = target.GetComponent<CookingStationScript>().utensilOnTop;
                            if(utensil == null){
                                if(itemOnHandsName == "Pot") target.GetComponent<CookingStationScript>().setPotOnTop(itemOnHands.name);
                                else target.GetComponent<CookingStationScript>().setPanOnTop(itemOnHands.name);
                                itemSwitch.emptyHands();
                                itemDown[rand5].Play();
                            }

                        }else if(typeOfItemOnHands == "Plate"){
                            GameObject utensil = target.GetComponent<CookingStationScript>().utensilOnTop;
                            string utensilName = target.GetComponent<CookingStationScript>().utensilOnTopString;
                            if(utensil != null){
                                if(utensilName == "Pot"){
                                    int numOfIngredientsInPot = utensil.GetComponent<PotScript>().numIngredients;
                                    bool soupInPot = utensil.GetComponent<PotScript>().soupReady;
                                    if(numOfIngredientsInPot == 3 && soupInPot){
                                        string typeOfSoup = utensil.GetComponent<PotScript>().madeOf;
                                        if(typeOfSoup == "Onion") itemOnHands.GetComponent<PlateSample>().InstantiatePlate("OnionSoup");
                                        else if(typeOfSoup == "Tomato") itemOnHands.GetComponent<PlateSample>().InstantiatePlate("TomatoSoup");
                                        else if(typeOfSoup == "Mushroom") itemOnHands.GetComponent<PlateSample>().InstantiatePlate("MushroomSoup");
                                        else if(typeOfSoup == "Error") itemOnHands.GetComponent<PlateSample>().InstantiatePlate("ErrorSoup");
                                        utensil.GetComponent<PotScript>().cleanPot();
                                        itemPickUp[rand5].Play();
                                    }
                                }else if(utensilName == "Pan"){
                                    string primaryFoodOnPan = utensil.GetComponent<PanScript>().primaryFood;
                                    bool foodInPanReady = utensil.GetComponent<PanScript>().foodReady;
                                    if(foodInPanReady && itemOnHands.GetComponent<PlateSample>().CanIInstantiateIngredientsInPlate(primaryFoodOnPan)){
                                        itemOnHands.GetComponent<PlateSample>().InstantiateIngredientsInPlate(primaryFoodOnPan);
                                        utensil.GetComponent<PanScript>().cleanPan();
                                        itemPickUp[rand5].Play();
                                    }
                                }
                            }
                        }
                        break;

                    case "PlateStation":
                        if (typeOfItemOnHands == "Plate")
                        {
                            target.GetComponent<PlateStationItem>().setPlateOnTop(itemOnHandsName);
                            itemSwitch.deleteItemOnHands();
                            itemSwitch.emptyHands();
                            itemDown[rand5].Play();
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
                            itemPickUp[rand5].Play();
                        }
                        break;

                    case "Bin":
                        if(typeOfItemOnHands == "Utensil"){
                            if(itemOnHandsName == "Pot"){
                                bool burnedPot = itemOnHands.transform.GetComponent<PotScript>().burned;
                                float burningCountPot = itemOnHands.transform.GetComponent<PotScript>().burningCount;
                                if(!burnedPot || (burnedPot && burningCountPot <= 0)){
                                    itemOnHands.transform.GetComponent<PotScript>().cleanPot();
                                    itemPickUp[rand5].Play();
                                }

                            } else if(itemOnHandsName == "Pan") {
                                bool burnedPan = itemOnHands.transform.GetComponent<PanScript>().burned;
                                float burningCountPan = itemOnHands.transform.GetComponent<PanScript>().burningCount;
                                if(!burnedPan || (burnedPan && burningCountPan <= 0)){
                                    itemOnHands.transform.GetComponent<PanScript>().cleanPan();
                                    itemPickUp[rand5].Play();
                                }
                            }
                        }else if(typeOfItemOnHands == "Plate"){
                            itemOnHands.transform.GetComponent<PlateSample>().CleanPlate();
                            itemDown[rand5].Play();
                        }
                        else {
                            itemSwitch.deleteItemOnHands();
                            itemSwitch.emptyHands();
                            itemDown[rand5].Play();
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
