using UnityEngine;

public class ItemSwitch : MonoBehaviour
{
    public string selectedItemName = ""; //Onion, Tomato, Mushroom, Lettuce...
    public bool selectedFoodChoppeable = false; //True if Pre-Ingredient, False if Ingredient
    public string choppedFood = ""; //ChoppedOnion => Onion , ChoppedMushroom => Mushroom ...
    public string typeOfItem = ""; //Food , Plate , Utensil, Fire Extinguisher
    public GameObject selectedItemOnHands = null; //GameObject in Item
    private Animator playerAnimator = null;
    void Start()
    {
        playerAnimator = gameObject.GetComponentInParent(typeof(Animator)) as Animator;
    }


    void Update()
    {
        if(selectedItemOnHands != null) playerAnimator.SetBool("isHolding", true);
        else playerAnimator.SetBool("isHolding", false);
    }

    public void setItemOnHands(GameObject item){
        if(item != null){

            item.transform.SetParent(transform, false);

            if(item.tag == "Pre-Ingredient") selectedFoodChoppeable = true;
            else selectedFoodChoppeable = false;

            if(item.name.Contains("ChoppedOnion")){
                selectedItemName="ChoppedOnion";
                choppedFood = "Onion";
                typeOfItem = "Food";
            } else if(item.name.Contains("ChoppedMushroom")){
                selectedItemName="ChoppedMushroom";
                choppedFood = "Mushroom";
                typeOfItem = "Food";
            } else if(item.name.Contains("ChoppedLettuce")){
                selectedItemName="ChoppedLettuce";
                choppedFood = "Lettuce";
                typeOfItem = "Food";
            } else if(item.name.Contains("ChoppedTomato")){
                selectedItemName="ChoppedTomato";
                choppedFood = "Tomato";
                typeOfItem = "Food";
            } else {

                choppedFood = "";

                if(item.name.Contains("Onion")){
                    selectedItemName="Onion";
                    typeOfItem = "Food";
                } else if(item.name.Contains("Mushroom")){
                    selectedItemName="Mushroom";
                    typeOfItem = "Food";
                } else if(item.name.Contains("Lettuce")){
                    selectedItemName="Lettuce";
                    typeOfItem = "Food";
                } else if(item.name.Contains("Tomato")){
                    selectedItemName="Tomato";
                    typeOfItem = "Food";
                }if(item.name.Contains("Pot")){
                    selectedItemName="Pot";
                    typeOfItem = "Utensil";
                } else if(item.name.Contains("Pan")){
                    selectedItemName="Pan";
                    typeOfItem = "Utensil";
                } else if(item.name.Contains("Plate")){
                    selectedItemName="Plate";
                    typeOfItem = "Plate";
                } else if(item.name.Contains("FireExtinguisher")){
                    selectedItemName = "FireExtinguisher";
                    typeOfItem = "FireExtinguisher";
                }
            }
        }
        selectedItemOnHands = item;
    }

    public void emptyHands()
    {
        selectedItemName = ""; //Onion, Tomato, Mushroom, Lettuce...
        selectedFoodChoppeable = false; //True if Pre-Ingredient, False if Ingredient
        choppedFood = ""; //ChoppedOnion => Onion , ChoppedMushroom => Mushroom
        typeOfItem = ""; //Food , Plate , Utensil
        selectedItemOnHands = null;
    }

    public void deleteItemOnHands(){
        foreach(Transform child in transform) Destroy(child.gameObject);
    }

}
