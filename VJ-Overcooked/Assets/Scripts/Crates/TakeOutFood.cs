using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using UnityEngine.SceneManagement;

public class TakeOutFood : MonoBehaviour
{

    public GameObject Food;
    public GameObject SpaceIcon;
    private GameObject Player;
    private FoodSwitch foodSwitch;
    private GameObject foodInstantiate;
    private Vector3 pos;
    public Animator myAnimatorController;
    // Start is called before the first frame update

    void Start()
    {
        myAnimatorController.SetBool("Open", false);
        Player = GameObject.Find("Player_1");
        foodSwitch = Player.transform.Find("player_no_anim/Items").GetComponent<FoodSwitch>();
        

    }

    // Update is called once per frame
    void Update()
    {
        myAnimatorController.SetBool("Open", false);
        GameObject playerTarget = Player.transform.Find("player_no_anim").GetComponent<TargetHighlight>().target;
        if ( playerTarget != null && playerTarget.name == gameObject.name)
        {
            if(foodSwitch.selectedFood == -1 && SceneManager.GetActiveScene().name == "Nivell 1") gameObject.transform.Find("Keyboard_Space").gameObject.SetActive(true);
            if (Input.GetKeyUp("space"))
            {
                if (foodSwitch.selectedFood == -1){
                    myAnimatorController.SetBool("Open", true);
                    GameObject player_no_anim = Player.transform.Find("player_no_anim").gameObject;
                    foreach(Transform item in player_no_anim.transform)
                    {
                        if (item.name == "Items")
                        {
                            foodInstantiate = Instantiate(Food, new Vector3(0,0,0),Quaternion.identity);
                            foodInstantiate.transform.SetParent(player_no_anim.transform.Find("Items").gameObject.transform,false);
                        }
                    }
                    foodSwitch.changeSelectedFoodString(Food.name);
                }
            }
        } else {
            if (SceneManager.GetActiveScene().name == "Nivell 1") gameObject.transform.Find("Keyboard_Space").gameObject.SetActive(false);
        }
    }
}
