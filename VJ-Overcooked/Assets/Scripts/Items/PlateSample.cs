using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlateSample : MonoBehaviour
{
    private GameObject childObject;
    public string PlateType;
    public List<string> ingredientNames = new List<string>();
    // Start is called before the first frame update
    void Start()
    {
        PlateType = "Plate";
    }

    // Update is called once per frame
    void Update()
    {
        if (ingredientNames.Count == 0) PlateType = "Plate";
        else if (ingredientNames.Count == 3)
        {
            if (ingredientNames.Contains("Onion") && ingredientNames.Contains("Tomato") && ingredientNames.Contains("Burger"))
            {
                CleanPlate();
                ingredientNames.Add("Tomato");
                ingredientNames.Add("Burger");
                ingredientNames.Add("Onion");
                childObject = Instantiate(Resources.Load("plates/OnionTomatoBurger")) as GameObject;
                childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                PlateType = "OnionTomatoBurger";
            }
            else if (ingredientNames.Contains("Lettuce") && ingredientNames.Contains("Tomato") && ingredientNames.Contains("Burger"))
            {
                CleanPlate();
                ingredientNames.Add("Tomato");
                ingredientNames.Add("Burger");
                ingredientNames.Add("Lettuce");
                childObject = Instantiate(Resources.Load("plates/LettuceTomatoBurger")) as GameObject;
                childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                PlateType = "LettuceTomatoBurger";
            }
            else if (ingredientNames.Contains("Chicken") && ingredientNames.Contains("Tomato") && ingredientNames.Contains("Mushroom"))
            {
                CleanPlate();
                ingredientNames.Add("Chicken");
                ingredientNames.Add("Tomato");
                ingredientNames.Add("Mushroom");
                childObject = Instantiate(Resources.Load("plates/ChickenTomatoMushroom")) as GameObject;
                childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                PlateType = "ChickenTomatoMushroom";
            }
            else if (ingredientNames.Contains("Chicken") && ingredientNames.Contains("Potatoes") && ingredientNames.Contains("Tomato"))
            {
                CleanPlate();
                ingredientNames.Add("Chicken");
                ingredientNames.Add("Potato");
                ingredientNames.Add("Tomato");
                childObject = Instantiate(Resources.Load("plates/ChickenPotatoTomato")) as GameObject;
                childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                PlateType = "ChickenPotatoTomato";
            }
        }
    }

    public bool CanIInstantiateIngredientsInPlate(List<string> Plate)
    {
        if (ingredientNames.Count + Plate.Count > 3) return false;
        for (int i = 0; i < ingredientNames.Count; ++i)
        {
            for (int j = 0; j < Plate.Count; ++j)
            {
                if (ingredientNames[i] == Plate[j])
                {
                    return false;
                }
            }
        }
        return true;
    }

    public bool CanIInstantiateIngredientsInPlate(string Plate)
    {
        if (ingredientNames.Count + 1 > 3) return false;
        for (int i = 0; i < ingredientNames.Count; ++i)
        {
            if (ingredientNames[i] == Plate)
            {
                return false;
            }
        }
        return true;
    }

    public void InstantiateIngredientsInPlate(List<string> Plate)
    {
        for (int i = 0; i < Plate.Count; ++i)
        {
            childObject = Instantiate(Resources.Load("plates/" + Plate[i])) as GameObject;
            childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
        }
    }

    public void InstantiateIngredientsInPlate(string Plate)
    {
        ingredientNames.Add(Plate);
        childObject = Instantiate(Resources.Load("plates/Plated" + Plate)) as GameObject;
        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
     }

    public void InstantiatePlate(string Plate)
    {
        ingredientNames.Add("Tomato");
        childObject = Instantiate(Resources.Load("plates/" + Plate)) as GameObject;
        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
        PlateType = Plate;
    }


    public void CleanPlate()
    {
        foreach (Transform child in transform.Find("AttachPoint")) Destroy(child.gameObject);
        PlateType = "Plate";
        ingredientNames.Clear();
    }
}
