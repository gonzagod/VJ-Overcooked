using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class TakeOutFood : MonoBehaviour
{

    public GameObject Food;
    public GameObject SpaceIcon;
    public GameObject Player;
    public FoodSwitch foodSwitch;
    private Vector3 pos;
    private bool spaceIconClone = false;
    private GameObject clone;
    public Animator myAnimatorController;
    // Start is called before the first frame update

    bool playerNear()
    {
        if (Math.Abs(transform.position.x - Player.transform.position.x) < 0.75 & Math.Abs(transform.position.z - Player.transform.position.z) < 1.5) return true;
        else return false;
    }
    void Start()
    {
        myAnimatorController.SetBool("Open", false);

    }

    // Update is called once per frame
    void Update()
    {
        myAnimatorController.SetBool("Open", false);

        if (playerNear())
        {
            pos = new Vector3(transform.position.x, (transform.position.y + 0.5f), transform.position.z);
            if (!spaceIconClone){
                clone = Instantiate(SpaceIcon, new Vector3(pos.x, pos.y + 1f, pos.z), Quaternion.identity);
                spaceIconClone = true;
              }
            if (Input.GetKeyUp("space"))
            {
                myAnimatorController.SetBool("Open", true);
                foodSwitch.changeSelectedFood(0);
                foodSwitch.SelectFood();
            }
        } else {
          Destroy(clone);
          spaceIconClone = false;
        }
    }
}
