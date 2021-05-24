using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChoppingTableItem : MonoBehaviour
{

    public string ItemOnTop = "";
    public bool Chopping = false;
    public GameObject Player;
    public bool itemOnTopChoppeable = false;
    public float timeChopping = 0;
    public Animator playerAnimator;
    private FoodSwitch foodSwitch;
    private Animator itemOnTopAnimator = null;
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
            if (itemOnTopChoppeable && !Chopping ) {
                gameObject.transform.Find("Keyboard_Ctrl").gameObject.SetActive(true);
                gameObject.transform.Find("Keyboard_Space").gameObject.SetActive(false);
            } else if ( (foodSwitch.selectedFoodChoppeable && itemOnTableInt == -1) ||
                         itemOnTableInt > 3 && !Chopping){
                gameObject.transform.Find("Keyboard_Ctrl").gameObject.SetActive(false);
                gameObject.transform.Find("Keyboard_Space").gameObject.SetActive(true);
            } else if(Chopping){
                gameObject.transform.Find("Keyboard_Ctrl").gameObject.SetActive(false);
                gameObject.transform.Find("Keyboard_Space").gameObject.SetActive(false);
            }
            if(Chopping) timeChopping += Time.deltaTime;
        } else {
            if(Chopping) StopChopping();
            gameObject.transform.Find("Keyboard_Ctrl").gameObject.SetActive(false);
            gameObject.transform.Find("Keyboard_Space").gameObject.SetActive(false);
        }
        if(timeChopping >= 4f) FinishedChopping();
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
                transform.Find("ChoppedOnion/Onion").GetComponent<Animator>().enabled = false;
                itemOnTopChoppeable = false;
                break;
        }
    }

    public void CleanTable() {
        foreach (Transform food in transform)
        {
            if (food.gameObject.tag == "Pre-Ingredient" || food.gameObject.tag == "Ingredient")
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
        Chopping = true;
        ItemChopped();
        itemOnTopAnimator.speed = 0.78f;
    }

    public void ContinueChopping(){
        if(Chopping == false){
            Chopping = true;
            itemOnTopAnimator.speed = 0.78f;
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
        gameObject.transform.Find("ChoppedOnion/OnionIcon").gameObject.SetActive(true);
    }

    private void ItemChopped(){
        switch(ItemOnTop){
            case "Onion":
                ItemOnTop = "ChoppedOnion";
                gameObject.transform.Find("Onion").gameObject.SetActive(false);
                gameObject.transform.Find("ChoppedOnion").gameObject.SetActive(true);
                gameObject.transform.Find("ChoppedOnion/OnionIcon").gameObject.SetActive(false);
                itemOnTopAnimator = transform.Find("ChoppedOnion/Onion").GetComponent<Animator>();
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
