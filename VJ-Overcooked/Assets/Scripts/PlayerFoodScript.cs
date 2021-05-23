using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerFoodScript : MonoBehaviour
{
    public FoodSwitch foodSwitch;
    public GameObject onion;
    private bool CarryingFood;
    // Start is called before the first frame update
    void Start()
    {
        CarryingFood = false;

    }

    // Update is called once per frame
    void Update()
    {
        if (foodSwitch.selectedFood >= 0 && !CarryingFood) Carry();
        else if (Input.GetKeyUp("space") && foodSwitch.selectedFood >= 0 && CarryingFood)
        {
                /* switch (foodSwitch.selectedFood)
                {
                    case 0:
                        Instantiate(onion, transform.position, Quaternion.identity);
                        break;
                    case 1:
                        break;
                    case 2:
                        break;
                    case 3:
                        break;
                }
                Let();
                foodSwitch.changeSelectedFood(-1);
                foodSwitch.SelectFood();
                */
                Debug.Log("suelta");
        }

        else if (Input.GetKeyUp("space") && foodSwitch.selectedFood < 0){

        }
    }

    public void Carry()
    {
        CarryingFood = true;
    }

    public void Let()
    {
        CarryingFood = false;
    }
}
