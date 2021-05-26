using System.Collections;
using System;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class RecipeOrder : MonoBehaviour
{
    private float timeForNextOrder = 2f;
    private int maxOrders = 5;
    private float elapsedTime;
    private int minRecipe;
    private int maxRecipe;
    private int food;
    private int rand;
    public Sprite Recipe0, Recipe1, Recipe2, Recipe3, Recipe4, Recipe5, Recipe6;

    private GameObject ChildGameObject;

    private List<int> _orders = new List<int>();
    public List<int> _poolOrders = new List<int>();
    // Start is called before the first frame update
    void Start()
    {
        elapsedTime = 0f;
        switch(SceneManager.GetActiveScene().buildIndex){
            case 2:
                minRecipe = 0;
                maxRecipe = 0;
                break;
            case 3:
                break;
            case 4:
                break;
            case 5:
                break;
            case 6:
                break;
            default:
                break;
        }
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

      if (Input.GetKeyDown("p"))
        {
            orderDelivered(0);
        }
    }

    void newOrder()
    {
        if (_poolOrders.Count < maxOrders)
        {
            if (minRecipe == maxRecipe) _poolOrders.Add(minRecipe);
            else
            {
                rand = UnityEngine.Random.Range(minRecipe, maxRecipe);
                _poolOrders.Add(rand);
            }
            showOrders();
        }
    }

    void showOrders()
    {

        int size = _poolOrders.Count;
        for (int i = 0; i < size; ++i)
        {
            ChildGameObject = gameObject.transform.GetChild(i).gameObject;
            food = _poolOrders[i];
            switch (food)
            {
                case 0:
                   ChildGameObject.GetComponent<Image>().enabled = true;
                   ChildGameObject.GetComponent<Image>().sprite = Recipe0;
                break;
                case 1:
                    ChildGameObject.GetComponent<Image>().enabled = true;
                    ChildGameObject.GetComponent<Image>().sprite = Recipe1;
                break;
                case 2:
                    ChildGameObject.GetComponent<Image>().enabled = true;
                    ChildGameObject.GetComponent<Image>().sprite = Recipe2;
                break;
                case 3:
                    ChildGameObject.GetComponent<Image>().enabled = true;
                    ChildGameObject.GetComponent<Image>().sprite = Recipe3;
                break;
                case 4:
                    ChildGameObject.GetComponent<Image>().enabled = true;
                    ChildGameObject.GetComponent<Image>().sprite = Recipe4;
                break;
                case 5:
                    ChildGameObject.GetComponent<Image>().enabled = true;
                    ChildGameObject.GetComponent<Image>().sprite = Recipe5;
                break;
                case 6:
                    ChildGameObject.GetComponent<Image>().enabled = true;
                    ChildGameObject.GetComponent<Image>().sprite = Recipe6;
                break;
                default:
                break;

            }
        }
    }

    public void orderDelivered(int order)
    {
        int size = _poolOrders.Count;
        int pos = -1;
        for (int i = 0; i < size; ++i)
        {
            int x = _poolOrders[i];
            //Debug.Log("numero comanda " + x.ToString() + " Posicio " + i.ToString());
            if (x == order)
            {
                pos = i;
                i = size;
            }
        }
        for (int i = 0; i < size; ++i) {
            ChildGameObject = gameObject.transform.GetChild(i).gameObject;
            ChildGameObject.GetComponent<Image>().enabled = false;
        }

        if (pos != -1) _poolOrders.RemoveAt(pos);
        showOrders();
    }
}
