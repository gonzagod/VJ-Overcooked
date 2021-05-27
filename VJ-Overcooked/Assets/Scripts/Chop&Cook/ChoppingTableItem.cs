﻿using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChoppingTableItem : MonoBehaviour
{

    public string itemOnTopString = "";
    public bool Chopping = false;
    public bool itemOnTopChoppeable = false;
    public GameObject itemOnTop = null;
    public float timeChopping = 0;
    public GameObject Player;
    public Animator playerAnimator;
    private ItemSwitch itemSwitch;
    private Animator itemOnTopAnimator = null;
    // Start is called before the first frame update
    void Start()
    {
        itemSwitch = Player.transform.Find("player_no_anim/Item").GetComponent<ItemSwitch>();
        playerAnimator = Player.transform.Find("player_no_anim").GetComponent<Animator>();
    }

    // Update is called once per frame
    void Update()
    {
        GameObject playerTarget = Player.transform.Find("player_no_anim").GetComponent<TargetHighlight>().target;

        if (playerTarget != null && playerTarget.name == gameObject.name){
            if (itemOnTopChoppeable && !Chopping ) {
                gameObject.transform.Find("Keyboard_Ctrl").gameObject.SetActive(true);
                gameObject.transform.Find("Keyboard_Space").gameObject.SetActive(false);
            } else if ( (itemSwitch.selectedFoodChoppeable && itemOnTop == null) ||
                         itemOnTopChoppeable && !Chopping){
                gameObject.transform.Find("Keyboard_Ctrl").gameObject.SetActive(false);
                gameObject.transform.Find("Keyboard_Space").gameObject.SetActive(true);
            } else if(Chopping){
                gameObject.transform.Find("Keyboard_Ctrl").gameObject.SetActive(false);
                gameObject.transform.Find("Keyboard_Space").gameObject.SetActive(false);
            }
            if(Chopping) {
                timeChopping += Time.deltaTime;
                transform.Find("Knife").gameObject.SetActive(false);
            } else transform.Find("Knife").gameObject.SetActive(true);
        } else {
            if(Chopping) StopChopping();
            gameObject.transform.Find("Keyboard_Ctrl").gameObject.SetActive(false);
            gameObject.transform.Find("Keyboard_Space").gameObject.SetActive(false);
        }
        if(timeChopping >= 4f) FinishedChopping();
    }

    public void setItemOnChoppingTable(GameObject item, string itemName, bool itemChoppeable){
        if(item != null){
            item.transform.SetParent(transform.Find("AttachPoint"), false);
            itemOnTopString = itemName;
            itemOnTopChoppeable = itemChoppeable;
            if(!itemChoppeable){
                item.transform.GetComponentInChildren<Animator>().enabled = false;
            }
        }
        itemOnTop = item;
    }

    public void CleanTable() {
        itemOnTopString = "";
        Chopping = false;
        itemOnTopChoppeable = false;
        itemOnTop = null;
    }

    public void StartChopping(){
        Chopping = true;
        ItemChopped();
        itemOnTopAnimator.speed = 0.65f;
    }

    public void ContinueChopping(){
        if(Chopping == false){
            Chopping = true;
            itemOnTopAnimator.speed = 0.65f;
        }
    }

    public void StopChopping(){
        Chopping = false;
        itemOnTopAnimator.speed = 0f;
    }

    public void FinishedChopping(){
        Chopping = false;
        itemOnTopChoppeable = false;
        timeChopping = 0;
        playerAnimator.SetBool("isCutting", false);
        Player.transform.Find("player_no_anim/Chef_Body/Hand_Open_R").gameObject.SetActive(true);
        Player.transform.Find("player_no_anim/Chef_Body/Hand_Grip_R").gameObject.SetActive(false);
        Player.transform.Find("player_no_anim/Chef_Body/Knife").gameObject.SetActive(false);
        itemOnTop.transform.Find("Icon").gameObject.SetActive(true);
    }

    private void ItemChopped(){
        switch(itemOnTopString){
            case "Onion":
                foreach(Transform child in transform.Find("AttachPoint")) Destroy(child.gameObject);
                GameObject newOnion = Instantiate(Resources.Load("ChoppedOnion"), new Vector3(0.6f,  0.4f, 0f), Quaternion.Euler(0f, 0f, 90f)) as GameObject;
                setItemOnChoppingTable(newOnion, "ChoppedOnion", true);
                itemOnTopAnimator = itemOnTop.GetComponentInChildren<Animator>();
                itemOnTop.transform.Find("Icon").gameObject.SetActive(false);
                break;
            case "Lettuce":
                foreach(Transform child in transform.Find("AttachPoint")) Destroy(child.gameObject);
                GameObject newLettuce = Instantiate(Resources.Load("ChoppedLettuce"), new Vector3(0.6f,  0.4f, 0f), Quaternion.Euler(0f, 0f, 90f)) as GameObject;
                setItemOnChoppingTable(newLettuce, "ChoppedLettuce", true);
                itemOnTopAnimator = itemOnTop.GetComponentInChildren<Animator>();
                itemOnTop.transform.Find("Icon").gameObject.SetActive(false);
                break;
            case "Mushroom":
                foreach(Transform child in transform.Find("AttachPoint")) Destroy(child.gameObject);
                GameObject newMushroom = Instantiate(Resources.Load("ChoppedMushroom"), new Vector3(0.6f,  0.4f, 0f), Quaternion.Euler(0f, 0f, 90f)) as GameObject;
                setItemOnChoppingTable(newMushroom, "ChoppedMushroom", true);
                itemOnTopAnimator = itemOnTop.GetComponentInChildren<Animator>();
                itemOnTop.transform.Find("Icon").gameObject.SetActive(false);
                break;
            case "Tomato":
                foreach(Transform child in transform.Find("AttachPoint")) Destroy(child.gameObject);
                GameObject newTomato = Instantiate(Resources.Load("ChoppedTomato"), new Vector3(0.6f,  0.4f, 0f), Quaternion.Euler(0f, 0f, 90f)) as GameObject;
                setItemOnChoppingTable(newTomato, "ChoppedTomato", true);
                itemOnTopAnimator = itemOnTop.GetComponentInChildren<Animator>();
                itemOnTop.transform.Find("Icon").gameObject.SetActive(false);
                break;
        }
    }

}
