using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TargetInteraction : MonoBehaviour
{

    private GameObject target;
    private FoodSwitch foodSwitch;
    private int itemOnHands;
    private Animator playerAnimator;
    // Start is called before the first frame update
    void Start()
    {
        target = null;
        foodSwitch = gameObject.transform.Find("player_no_anim/Food").GetComponent<FoodSwitch>();
        playerAnimator = transform.Find("player_no_anim").gameObject.GetComponent<Animator>();

    }

    // Update is called once per frame
    void Update()
    {
        target = gameObject.transform.Find("player_no_anim").GetComponent<TargetHighlight>().target;
        if (target != null){
            itemOnHands = foodSwitch.selectedFood;
            if(Input.GetKeyDown("space")){
                switch(target.tag){
                    case "Table":
                        string itemOnTable = target.GetComponent<TableTopItem>().ItemOnTop;
                        if(itemOnTable == ""){
                            if(itemOnHands >= 0){
                                target.GetComponent<TableTopItem>().UpdateItemOnTop(itemOnHands);
                                foodSwitch.emptyHands();
                            }
                        }else if(itemOnHands == -1){
                            foodSwitch.changeSelectedFoodString(itemOnTable);
                            target.GetComponent<TableTopItem>().CleanTable();
                        }
                        break;

                    case "ChoppingStation":
                        string itemOnChoppingTable = target.GetComponent<ChoppingTableItem>().ItemOnTop;
                        if(itemOnChoppingTable == ""){
                            if(itemOnHands >= 0){
                                target.GetComponent<ChoppingTableItem>().UpdateItemOnTop(itemOnHands);
                                foodSwitch.emptyHands();
                            }
                        }else {
                            bool chopping = target.GetComponent<ChoppingTableItem>().Chopping;
                            if(!chopping && itemOnHands == -1){
                                foodSwitch.changeSelectedFoodString(itemOnChoppingTable);
                                target.GetComponent<ChoppingTableItem>().CleanTable();
                            }
                        }
                        break;

                    default:
                        break;
                }
            } if(Input.GetKeyDown("left ctrl")){
                if(target.tag == "ChoppingStation"){
                    string itemOnChoppingTable = target.GetComponent<ChoppingTableItem>().ItemOnTop;
                    int itemOnChoppingTableInt = target.GetComponent<ChoppingTableItem>().getItemInteger(itemOnChoppingTable);
                    if(itemOnChoppingTableInt >= 0 && itemOnChoppingTableInt < 4){
                        if(itemOnHands < 0){
                            bool chopping = target.GetComponent<ChoppingTableItem>().Chopping;
                            bool ItemChoppeable = target.GetComponent<ChoppingTableItem>().itemOnTopChoppeable;
                            if(!chopping){
                                target.GetComponent<ChoppingTableItem>().StartChopping();
                            }else if(ItemChoppeable)target.GetComponent<ChoppingTableItem>().ContinueChopping();
                            playerAnimator.SetBool("isWalking", false);
                            playerAnimator.SetBool("isHolding", false);
                            playerAnimator.SetBool("isCutting", true);
                            gameObject.transform.Find("player_no_anim/Chef_Body/Hand_Open_R").gameObject.SetActive(false);
                            gameObject.transform.Find("player_no_anim/Chef_Body/Hand_Grip_R").gameObject.SetActive(true);
                            gameObject.transform.Find("player_no_anim/Chef_Body/Knife").gameObject.SetActive(true);
                        }
                    }
                }
            }
        }
    }
}
