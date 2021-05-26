using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class godMode : MonoBehaviour
{
    public FoodSwitch food;
    public PlateSample plate;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown("p"))
        {
            food.changeSelectedFoodString("Onion");
        }
        else if (Input.GetKeyDown("o"))
        {
            food.changeSelectedFoodString("Mushroom");
        }
        else if (Input.GetKeyDown("i"))
        {
            food.changeSelectedFoodString("Lettuce");
        }
        else if (Input.GetKeyDown("u"))
        {
            food.changeSelectedFoodString("Tomato");
        }
        else if (Input.GetKeyDown("y"))
        {
            food.changeSelectedFoodString("Chopped Onion");
        }
        else if (Input.GetKeyDown("t"))
        {
            
        }
        else if (Input.GetKeyDown("r"))
        {
           
        }
        else if (Input.GetKeyDown("e"))
        {
            food.changeSelectedFood(9);
        }
    }
}
