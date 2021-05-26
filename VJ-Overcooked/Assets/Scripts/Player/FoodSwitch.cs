using UnityEngine;

public class FoodSwitch : MonoBehaviour
{
    public int selectedFood = -1;
    public string selectedFoodString = "";
    public bool selectedFoodChoppeable = false;
    public string choppedFood = "";
    public GameObject selectedItemOnHands = null;
    private Animator playerAnimator = null;
    void Start()
    {
        SelectFood();
        playerAnimator = gameObject.GetComponentInParent(typeof(Animator)) as Animator;
    }


    void Update()
    {
        if(selectedFood >= 0) playerAnimator.SetBool("isHolding", true);
        else playerAnimator.SetBool("isHolding", false);
        if(selectedFood >= 0 && selectedFood < 4) selectedFoodChoppeable = true;
        else selectedFoodChoppeable = false;
    }

    public void SelectFood()
    {
        foreach (Transform food in transform)
        {
            if (food.gameObject.name == selectedFoodString)
            {
                food.gameObject.SetActive(true);
            }

            else
                food.gameObject.SetActive(false);
        }
    }

    public void changeSelectedFood(int x)
    {
        selectedFood = x;
        SelectFood();
    }

    public void changeSelectedFoodString(string foodName)
    {
        selectedFoodString = foodName;
        switch(foodName){
            case "Onion":
                changeSelectedFood(0);
                choppedFood = "";
                break;
            case "Mushroom":
                changeSelectedFood(1);
                choppedFood = "";
                break;
            case "Lettuce":
                changeSelectedFood(2);
                choppedFood = "";
                break;
            case "Tomato":
                changeSelectedFood(3);
                choppedFood = "";
                break;
            case "ChoppedOnion":
                changeSelectedFood(4);
                choppedFood = "Onion";
                break;
            case "Plate":
                changeSelectedFood(8);
                break;
            default:
                break;
        }
    }

    public void emptyHands()
    {
        selectedFood = -1;
        selectedFoodString = "";
        choppedFood = "";
        foreach (Transform food in transform)
        {
            food.gameObject.SetActive(false);
        }
    }

    public void takeItem(GameObject item){
        if(item.tag == "CookingUtensil") item.transform.SetParent(gameObject.transform.Find("Utensil"));
        item.transform.localRotation = Quaternion.identity;
        item.transform.localPosition = Vector3.zero;
        item.transform.localScale = Vector3.one;
        if(item.name.Contains("Pot")){
            selectedFood = 9;
            selectedFoodString = "Pot";
        } else if(item.name.Contains("Pan")){
            selectedFood = 10;
            selectedFoodString = "Pan";
        }
        selectedItemOnHands = item;
        choppedFood = "";
        gameObject.transform.Find("Utensil").gameObject.SetActive(true);
    }
}
