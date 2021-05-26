using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class godMode : MonoBehaviour
{
    public GameObject playerItem;
    public ItemSwitch itemSwitch;

    // Start is called before the first frame update
    void Start()
    {
        playerItem = GameObject.Find("Player_1/player_no_anim/Item");
        itemSwitch = playerItem.GetComponent<ItemSwitch>();
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown("o"))
        {
            GameObject Onion = Instantiate(Resources.Load("Onion")) as GameObject;
            itemSwitch.setItemOnHands(Onion);
        }
        else if (Input.GetKeyDown("m"))
        {
            GameObject Mushroom = Instantiate(Resources.Load("Mushroom")) as GameObject;
            itemSwitch.setItemOnHands(Mushroom);
        }
        else if (Input.GetKeyDown("l"))
        {
            GameObject Lettuce = Instantiate(Resources.Load("Lettuce")) as GameObject;
            itemSwitch.setItemOnHands(Lettuce);
        }
        else if (Input.GetKeyDown("t"))
        {
            GameObject Tomato = Instantiate(Resources.Load("Tomato")) as GameObject;
            itemSwitch.setItemOnHands(Tomato);
        }
        /*else if (Input.GetKeyDown("y"))
        {
            food.changeSelectedFoodString("Chopped Onion");
        }
        else if (Input.GetKeyDown("i"))
        {

        }
        else if (Input.GetKeyDown("r"))
        {

        }
        else if (Input.GetKeyDown("e"))
        {
            food.changeSelectedFood(9);
        }*/
    }
}
