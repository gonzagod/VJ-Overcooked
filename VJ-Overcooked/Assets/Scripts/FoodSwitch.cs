using UnityEngine;

public class FoodSwitch : MonoBehaviour
{
    public int selectedFood = -1;
    public PlayerFoodScript Player;
    void Start()
    {
        SelectFood();
    }


    void Update()
    {

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
    }
}
