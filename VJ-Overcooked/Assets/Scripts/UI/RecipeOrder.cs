using System.Collections;
using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class RecipeOrder : MonoBehaviour
{
    private float timeForNextOrder = 27f;
    private float timeOrder = 75f;
    private int maxOrders = 5;
    private float elapsedTime;
    private int minRecipe;
    private int maxRecipe;
    private string food;
    private int rand;
    private int extra;
    private AudioSource RecipeDelivered;
    private AudioSource[] audioSound;
    private AudioSource RecipeFail;
    public Sprite Recipe0, Recipe1, Recipe2, Recipe3, Recipe4, Recipe5, Recipe6;

    private GameObject ChildGameObject;
    private GameObject ChildofChildGameObject;

    public List<float> orderTime = new List<float>();
    public List<String> _poolOrders = new List<String>();
    // Start is called before the first frame update
    void Start()
    {
        audioSound = transform.GetComponents<AudioSource>();
        RecipeDelivered = audioSound[0];
        RecipeFail = audioSound[1];
        elapsedTime = 0f;
        switch(SceneManager.GetActiveScene().name){
            case "Nivell 1":
                minRecipe = 0;
                maxRecipe = 0;
                break;
            case "Nivell 2":
                minRecipe = 0;
                maxRecipe = 2;
                break;
            case "Nivell 3":
                minRecipe = 2;
                maxRecipe = 3;
                break;
            case "Nivell 4":
                minRecipe = 6;
                maxRecipe = 7;
                break;
            case "Nivell 5":
                minRecipe = 4;
                maxRecipe = 6;
                break;
            default:
                break;
        }
        newOrder();
    }

    // Update is called once per frame
    void Update()
    {
        elapsedTime += Time.deltaTime;
        if (elapsedTime >= timeForNextOrder)
        {
            elapsedTime = 0f;
            newOrder();
        }
        int size = orderTime.Count;
        for (int i = 0; i < size; ++i)
        {
            orderTime[i] -= Time.deltaTime;
            if (orderTime[i] < 0)
            {
                orderDelivered("Fail",i);
                size--;
            }
        }
    }

    void newOrder()
    {
        if (_poolOrders.Count < maxOrders)
        {
         if (minRecipe == maxRecipe) rand = minRecipe;
         else rand = UnityEngine.Random.Range(minRecipe, maxRecipe + 1);
         switch (rand)
         {
            case 0:
                food = "OnionSoup";
            break;
            case 1:
                food = "TomatoSoup";
            break;
            case 2:
                food = "OnionTomatoBurger";
            break;
            case 3:
                food = "LettuceTomatoBurger";
            break;
            case 4:
                food = "ChickenTomatoMushroom";
            break;
            case 5:
                food = "ChickenPotatoTomato";
            break;
            case 6:
                food = "MushroomSoup";
            break;
            case 7:
                food = "TomatoSoup";
            break;
            default:
            break;
         }
            _poolOrders.Add(food);
            showOrders(true);
        }
    }

    void showOrders(bool actualitzar)
    {
        int size = _poolOrders.Count;
        for (int i = 0; i < size; ++i)
        {
            ChildGameObject = gameObject.transform.GetChild(i).gameObject;
            ChildofChildGameObject = ChildGameObject.transform.GetChild(0).gameObject;
            food = _poolOrders[i];
            switch (food)
            {
                case "OnionSoup":
                   ChildGameObject.GetComponent<Image>().enabled = true;
                   ChildGameObject.GetComponent<Image>().sprite = Recipe0;
                break;
                case "MushroomSoup":
                    ChildGameObject.GetComponent<Image>().enabled = true;
                    ChildGameObject.GetComponent<Image>().sprite = Recipe1;
                    break;
                case "TomatoSoup":
                    ChildGameObject.GetComponent<Image>().enabled = true;
                    ChildGameObject.GetComponent<Image>().sprite = Recipe2;
                    break;
                case "OnionTomatoBurger":
                    ChildGameObject.GetComponent<Image>().enabled = true;
                    ChildGameObject.GetComponent<Image>().sprite = Recipe3;
                    break;
                case "LettuceTomatoBurger":
                    ChildGameObject.GetComponent<Image>().enabled = true;
                    ChildGameObject.GetComponent<Image>().sprite = Recipe4;
                    break;
                case "ChickenPotatoTomato":
                    ChildGameObject.GetComponent<Image>().enabled = true;
                    ChildGameObject.GetComponent<Image>().sprite = Recipe5;
                    break;
                case "ChickenTomatoMushroom":
                    ChildGameObject.GetComponent<Image>().enabled = true;
                    ChildGameObject.GetComponent<Image>().sprite = Recipe6;
                    break;
                default:
                break;

            }
            ChildofChildGameObject.GetComponent<Image>().enabled = true;
            if (i == size - 1 && actualitzar)
            {
                ChildGameObject.GetComponent<TimeBarRecipes>().elapsedTime = timeOrder;
                ChildGameObject.GetComponent<TimeBarRecipes>().maxTime = timeOrder;
                orderTime.Add(timeOrder);
            }
            else
            {
                ChildGameObject.GetComponent<TimeBarRecipes>().elapsedTime = orderTime[i];
            }
        }
    }

    public void orderDelivered(string order, int posError)
    {
        if (order == "Fail")
        {
            int size = _poolOrders.Count;
            ChildGameObject = gameObject.transform.GetChild(size - 1).gameObject;
            ChildGameObject.GetComponent<Image>().enabled = false;
            ChildofChildGameObject = ChildGameObject.transform.GetChild(0).gameObject;
            ChildofChildGameObject.GetComponent<Image>().enabled = false;
            _poolOrders.RemoveAt(posError);
            orderTime.RemoveAt(posError);
            GameObject points = GameObject.Find("GameEnviroment 1/Canvases/HUDCanvas/PointsUI");
            points.GetComponent<PointsController>().addPoints(-10);
            GameObject pointsScene = GameObject.Find("PointsSurvivor");
            pointsScene.GetComponent<PointsScene>().AddPoints(-10);
            RecipeFail.Play();
        }
        else if (order != "Plate" && order != "Error") {
            int size = _poolOrders.Count;
            int pos = -1;
            for (int i = 0; i < size; ++i)
            {
                string x = _poolOrders[i];
                if (x == order)
                {
                    pos = i;
                    i = size;
                }
            }
            if (pos != -1)
            {
                ChildGameObject = gameObject.transform.GetChild(size-1).gameObject;
                ChildGameObject.GetComponent<Image>().enabled = false;
                ChildofChildGameObject = ChildGameObject.transform.GetChild(0).gameObject;
                ChildofChildGameObject.GetComponent<Image>().enabled = false;
                GameObject points = GameObject.Find("GameEnviroment 1/Canvases/HUDCanvas/PointsUI");
                if (orderTime[pos] > 40f) extra = 4;
                else if (orderTime[pos] > 25f) extra = 2;
                else extra = 1;
                int pts = 20 + extra;
                points.GetComponent<PointsController>().addPoints(pts);
                GameObject pointsScene = GameObject.Find("PointsSurvivor");
                pointsScene.GetComponent<PointsScene>().AddPoints(pts);
                _poolOrders.RemoveAt(pos);
                orderTime.RemoveAt(pos);
                RecipeDelivered.Play();
            }
        }
        showOrders(false);

    }
}
