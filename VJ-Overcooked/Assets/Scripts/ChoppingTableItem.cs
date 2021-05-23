using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChoppingTableItem : MonoBehaviour
{

    public string ItemOnTop = "";
    public bool Chopping = false;
    public GameObject Player;
    public bool itemOnTopChoppeable = false;
    private int timeChopping = 0;
    private int timeToChop = 1000;
    private FoodSwitch foodSwitch;
    public Animator playerAnimator;
    // Start is called before the first frame update
    void Start()
    {
        foodSwitch = Player.transform.Find("player_no_anim/Food").GetComponent<FoodSwitch>();
        playerAnimator = Player.transform.Find("player_no_anim").GetComponent<Animator>();
    }

    // Update is called once per frame
    void Update()
    {
        GameObject playerTarget = Player.transform.Find("player_no_anim").GetComponent<TargetHighlight>().target;
        int itemOnTableInt = getItemInteger(ItemOnTop);
        if (playerTarget != null && playerTarget.name == gameObject.name){
            if ( itemOnTableInt < 4 && itemOnTableInt >= 0 && !Chopping ) {
                Debug.Log("Entra");
                gameObject.transform.Find("Keyboard_Ctrl").gameObject.SetActive(true);
                gameObject.transform.Find("Keyboard_Space").gameObject.SetActive(false);
            } else if ( (foodSwitch.selectedFood >= 0 && foodSwitch.selectedFood < 4 && itemOnTableInt == -1) ||
                         itemOnTableInt > 3 && !Chopping){
                gameObject.transform.Find("Keyboard_Ctrl").gameObject.SetActive(false);
                gameObject.transform.Find("Keyboard_Space").gameObject.SetActive(true);
            } else if(Chopping){
                gameObject.transform.Find("Keyboard_Ctrl").gameObject.SetActive(false);
                gameObject.transform.Find("Keyboard_Space").gameObject.SetActive(false);
            }
        } else {
            if(Chopping) StopChopping();
            gameObject.transform.Find("Keyboard_Ctrl").gameObject.SetActive(false);
            gameObject.transform.Find("Keyboard_Space").gameObject.SetActive(false);
        }
        if(Chopping) timeChopping++;
        if(timeChopping >= timeToChop){
            timeChopping = 0;
            Chopping = false;
            playerAnimator.SetBool("isCutting", false);
            Player.transform.Find("player_no_anim/Chef_Body/Hand_Open_R").gameObject.SetActive(true);
            Player.transform.Find("player_no_anim/Chef_Body/Hand_Grip_R").gameObject.SetActive(false);
            Player.transform.Find("player_no_anim/Chef_Body/Knife").gameObject.SetActive(false);
        }
        if(timeChopping%200 == 0 && timeChopping > 0) Debug.Log("timeChopping = " + timeChopping);
    }

    public void UpdateItemOnTop(int foodId){
        switch(foodId){
            case 0:
                ItemOnTop = "Onion";
                gameObject.transform.Find("Onion").gameObject.SetActive(true);
                itemOnTopChoppeable = true;
                break;
            case 4:
                ItemOnTop = "ChoppedOnion";
                gameObject.transform.Find("ChoppedOnion").gameObject.SetActive(true);
                itemOnTopChoppeable = false;
                break;
        }
    }

    public void CleanTable() {
        foreach (Transform food in transform)
        {
            if (food.gameObject.tag == "Pre-Ingredient")
                food.gameObject.SetActive(false);
        }
        ItemOnTop = "";
        itemOnTopChoppeable = false;
    }

    public int getItemInteger(string foodName){
        switch(foodName){
            case "Onion":
                return 0;
            case "Lettuce":
                return 1;
            case "Mushroom":
                return 2;
            case "Tomato":
                return 3;
            case "ChoppedOnion":
                return 4;
            case "Chopped Lettuce":
                return 5;
            case "Chopped Mushroom":
                return 6;
            case "Chopped Tomato":
                return 7;
            default:
                return -1;
        }
    }

    public void StartChopping(){
        Debug.Log("StartChopping");
        Chopping = true;
        ItemChopped();
    }

    public void ContinueChopping(){
        if(Chopping == false){
            Debug.Log("ContinueChopping");
            Chopping = true;
        }
    }

    public void StopChopping(){
        Debug.Log("StopChopping");
        Chopping = false;
    }

    private void ItemChopped(){
        switch(ItemOnTop){
            case "Onion":
                ItemOnTop = "ChoppedOnion";
                gameObject.transform.Find("Onion").gameObject.SetActive(false);
                gameObject.transform.Find("ChoppedOnion").gameObject.SetActive(true);
                itemOnTopChoppeable = false;
                break;
            case "Lettuce":
                ItemOnTop = "Chopped Lettuce";
                break;
            case "Mushroom":
                ItemOnTop = "Chopped Mushroom";
                break;
            case "Tomato":
                ItemOnTop = "Chopped Tomato";
                break;
        }
    }

}
