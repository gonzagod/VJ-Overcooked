using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class TakeOutFood : MonoBehaviour
{

    public GameObject Food;
    public GameObject SpaceIcon;
    public GameObject Player;
    private FoodSwitch foodSwitch;
    private Vector3 pos;
    public Animator myAnimatorController;
    // Start is called before the first frame update

    void Start()
    {
        myAnimatorController.SetBool("Open", false);
        foodSwitch = Player.transform.Find("player_no_anim/Food").GetComponent<FoodSwitch>();

    }

    // Update is called once per frame
    void Update()
    {
        myAnimatorController.SetBool("Open", false);
        GameObject playerTarget = Player.transform.Find("player_no_anim").GetComponent<TargetHighlight>().target;
        if ( playerTarget != null && playerTarget.name == gameObject.name)
        {
            gameObject.transform.Find("Keyboard_Space").gameObject.SetActive(true);
            if (Input.GetKeyUp("space"))
            {
                if (foodSwitch.selectedFood == -1){
                    myAnimatorController.SetBool("Open", true);
                    foodSwitch.changeSelectedFood(0);
                    foodSwitch.SelectFood();
                }
            }
        } else {
            gameObject.transform.Find("Keyboard_Space").gameObject.SetActive(false);
        }
    }
}
