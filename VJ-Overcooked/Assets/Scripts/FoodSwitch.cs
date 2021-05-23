using UnityEngine;

public class FoodSwitch : MonoBehaviour
{
    public int selectedFood = -1;
    public bool selectedFoodChoppeable = false;
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
        int i = 0;
        foreach (Transform food in transform)
        {
            if (i == selectedFood)
            {
                food.gameObject.SetActive(true);
            }

            else
                food.gameObject.SetActive(false);
            i++;
        }
    }

    public void changeSelectedFood(int x)
    {
        selectedFood = x;
        SelectFood();
    }

    public void changeSelectedFoodString(string foodName)
    {
        switch(foodName){
            case "Onion":
                changeSelectedFood(0);
                break;
            case "Mushroom":
                changeSelectedFood(1);
                break;
            case "Lettuce":
                changeSelectedFood(2);
                break;
            case "Tomato":
                changeSelectedFood(3);
                break;
            case "Sliced Onion":
                changeSelectedFood(4);
                break;
            default:
                break;
        }
    }

    public void emptyHands()
    {
        selectedFood = -1;
        foreach (Transform food in transform)
        {
            food.gameObject.SetActive(false);
        }
    }
}
