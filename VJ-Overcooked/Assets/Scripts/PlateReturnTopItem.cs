using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlateReturnTopItem : MonoBehaviour
{
    public string ItemOnTop = "";
    public GameObject Player;
    private FoodSwitch foodSwitch;
    // Start is called before the first frame update
    void Start()
    {
        foodSwitch = Player.transform.Find("player_no_anim/Food").GetComponent<FoodSwitch>();
    }

    // Update is called once per frame
    void Update()
    {
        GameObject playerTarget = Player.transform.Find("player_no_anim").GetComponent<TargetHighlight>().target;
        int itemOnTableInt = getItemInteger(ItemOnTop);
    }

    public void UpdateItemOnTop(int foodId)
    {
        switch (foodId)
        {
            case 8:
                ItemOnTop = "Plate";
                gameObject.transform.Find("Plate").gameObject.SetActive(true);
                break;
        }
    }

    public void CleanTable()
    {
        foreach (Transform food in transform)
        {
            if (food.gameObject.tag == "Plate")
                food.gameObject.SetActive(false);
        }
        ItemOnTop = "";
    }

    public int getItemInteger(string foodName)
    {
        switch (foodName)
        {
            case "Plate":
                return 8;
            default:
                return -1;
        }
    }
}
