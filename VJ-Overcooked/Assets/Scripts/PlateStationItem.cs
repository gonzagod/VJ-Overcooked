using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class PlateStationItem : MonoBehaviour
{
    public string ItemOnTop = "";
    private bool check;
    public GameObject Player;
    private FoodSwitch foodSwitch;
    public PlateReturnTopItem plateReturn;
    public RecipeOrder recipes;
    private float time = 0.5f;
    private float timeElapsed;
    // Start is called before the first frame update
    void Start()
    {
        foodSwitch = Player.transform.Find("player_no_anim/Food").GetComponent<FoodSwitch>();
        timeElapsed = 0f;
        check = false;
    }

    // Update is called once per frame
    void Update()
    {
        GameObject playerTarget = Player.transform.Find("player_no_anim").GetComponent<TargetHighlight>().target;
        int itemOnTableInt = getItemInteger(ItemOnTop);

        if (ItemOnTop != "")
        {
            timeElapsed += Time.deltaTime;
            if (!check)
            {
                check = true;
                recipes.orderDelivered(0);
            }
            if (timeElapsed >= time)
            {
                CleanTable();
                timeElapsed = 0f;
                GeneratePlate();
                check = false;
            }
        }
    }

    public void UpdateItemOnTop(int foodId)
    {
        switch (foodId)
        {
            case 8:
                ItemOnTop = "Plate";
                gameObject.transform.Find("Plate").gameObject.SetActive(true);
                break;
            case 9:
                ItemOnTop = "OnionSoup";
                gameObject.transform.Find("OnionSoup").gameObject.SetActive(true);
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
            case "OnionSoup":
                return 9;
            default:
                return -1;
        }
    }

    void GeneratePlate()
    {
        if (SceneManager.GetActiveScene().name == "Nivell 1")
        {
            if (gameObject.name == "PlateReturn")
            {
                UpdateItemOnTop(8);
            }
        }
        else if (SceneManager.GetActiveScene().name == "Nivell 2")
        {
           plateReturn.UpdateItemOnTop(8);
        }
    }

}