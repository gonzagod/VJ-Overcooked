﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using UnityEngine.SceneManagement;

public class TakeOutFood : MonoBehaviour
{
    public GameObject Food;
    public GameObject SpaceIcon;
    public GameObject Player;
    private ItemSwitch itemSwitch;
    private Vector3 pos;
    public Animator myAnimatorController;
    // Start is called before the first frame update

    void Start()
    {
        myAnimatorController.SetBool("Open", false);
        //Player = GameObject.Find("Player_1");
        itemSwitch = Player.transform.Find("player_no_anim/Item").GetComponent<ItemSwitch>();

    }

    // Update is called once per frame
    void Update()
    {
        myAnimatorController.SetBool("Open", false);
        GameObject playerTarget = Player.transform.Find("player_no_anim").GetComponent<TargetHighlight>().target;
        if ( playerTarget != null && playerTarget.name == gameObject.name)
        {
            if(itemSwitch.selectedItemOnHands == null && SceneManager.GetActiveScene().name == "Nivell 1") gameObject.transform.Find("Keyboard_Space").gameObject.SetActive(true);
            if (Input.GetKeyUp("space"))
            {
                if (itemSwitch.selectedItemOnHands == null){
                    myAnimatorController.SetBool("Open", true);
                    GameObject foodInstant = Instantiate(Food) as GameObject;
                    itemSwitch.setItemOnHands(foodInstant);
                }
            }
        } else {
            if(SceneManager.GetActiveScene().name == "Nivell 1") gameObject.transform.Find("Keyboard_Space").gameObject.SetActive(false);
        }
    }
}
