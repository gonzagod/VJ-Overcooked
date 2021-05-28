using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlateSample : MonoBehaviour
{
    private GameObject childObject;
    private GameObject childIcon;
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
                for (int i = 0; i < 3; ++i)
                {
                    childIcon = Instantiate(Resources.Load("Icons/" + ingredientNames[i] + "Icon")) as GameObject;
                    childIcon.transform.SetParent(gameObject.transform.Find("Icon" + i.ToString()), false);
                }
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
                for (int i = 0; i < 3; ++i)
                {
                    childIcon = Instantiate(Resources.Load("Icons/" + ingredientNames[i] + "Icon")) as GameObject;
                    childIcon.transform.SetParent(gameObject.transform.Find("Icon" + i.ToString()), false);
                }
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
                for (int i = 0; i < 3; ++i)
                {
                    childIcon = Instantiate(Resources.Load("Icons/" + ingredientNames[i] + "Icon")) as GameObject;
                    childIcon.transform.SetParent(gameObject.transform.Find("Icon" + i.ToString()), false);
                }
            }
            else if (ingredientNames.Contains("Chicken") && ingredientNames.Contains("Potato") && ingredientNames.Contains("Tomato"))
            {
                CleanPlate();
                ingredientNames.Add("Chicken");
                ingredientNames.Add("Potato");
                ingredientNames.Add("Tomato");
                childObject = Instantiate(Resources.Load("plates/ChickenPotatoTomato")) as GameObject;
                childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                PlateType = "ChickenPotatoTomato";
                for (int i = 0; i < 3; ++i)
                {
                    childIcon = Instantiate(Resources.Load("Icons/" + ingredientNames[i] + "Icon")) as GameObject;
                    childIcon.transform.SetParent(gameObject.transform.Find("Icon" + i.ToString()), false);
                }
            }
            else
            {
                string firstIngredient = ingredientNames[0];
                for (int i = 1; i < ingredientNames.Count; ++i)
                {
                    if (firstIngredient != ingredientNames[i]) PlateType = "ErrorSoup";
                    else PlateType = firstIngredient + "Soup";
                }
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

    public bool CanIInstantiatePlate()
    {
        if (ingredientNames.Count != 0) return false;
        else return true;
    }

    public void InstantiateIngredientsInPlate(List<string> Plate)
    {
        for (int i = 0; i < Plate.Count; ++i)
        {
            childObject = Instantiate(Resources.Load("Plates/" + Plate[i])) as GameObject;
            childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
            childIcon = Instantiate(Resources.Load("Icons/" + Plate[i] + "Icon")) as GameObject;
            childIcon.transform.SetParent(gameObject.transform.Find("Icon" + i.ToString()), false);
        }
    }

    public void InstantiateIngredientsInPlate(string Plate)
    {
        ingredientNames.Add(Plate);
        childObject = Instantiate(Resources.Load("Plates/Plated" + Plate)) as GameObject;
        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
        childIcon = Instantiate(Resources.Load("Icons/" + Plate + "Icon")) as GameObject;
        childIcon.transform.SetParent(gameObject.transform.Find("Icon" + (ingredientNames.Count - 1).ToString() ), false);
    }


    public void InstantiatePlate(string Plate)
    {
        string food = "";
        switch (Plate)
        {
            case "OnionSoup":
                for (int i = 0; i < 3; ++i) ingredientNames.Add("Onion");
                food = "Onion";
                break;
            case "TomatoSoup":
                for (int i = 0; i < 3; ++i) ingredientNames.Add("Tomato");
                food = "Tomato";
                break;
            case "MushroomSoup":
                for (int i = 0; i < 3; ++i) ingredientNames.Add("Mushroom");
                food = "Mushroom";
                break;
            case "OnionTomatoBurger":
                ingredientNames.Add("Onion");
                ingredientNames.Add("Tomato");
                ingredientNames.Add("Burger");
                break;
            case "LettuceTomatoBurger":
                ingredientNames.Add("Lettuce");
                ingredientNames.Add("Tomato");
                ingredientNames.Add("Burger");
                break;
            case "ChickenTomatoMushroom":
                ingredientNames.Add("Chicken");
                ingredientNames.Add("Tomato");
                ingredientNames.Add("Mushroom");
                break;
            case "ChickenPotatoTomato":
                ingredientNames.Add("Chicken");
                ingredientNames.Add("Potato");
                ingredientNames.Add("Tomato");
                break;
            case "ErrorSoup":
                food = "Error";
                break;

        }
        childObject = Instantiate(Resources.Load("Plates/" + Plate)) as GameObject;
        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
        for (int i = 0; i < 3; ++i)
        {
            if (food != "" && Plate != "ErrorSoup")
            {
                childIcon = Instantiate(Resources.Load("Icons/" + food + "Icon")) as GameObject;
                childIcon.transform.SetParent(gameObject.transform.Find("Icon" + i.ToString()), false);
            }
            else if (Plate != "ErrorSoup")
            {
                childIcon = Instantiate(Resources.Load("Icons/" + ingredientNames[i] + "Icon")) as GameObject;
                childIcon.transform.SetParent(gameObject.transform.Find("Icon" + i.ToString()), false);
            }
            else if (Plate == "ErrorSoup")
            {
                if (i == 0)
                {
                    childIcon = Instantiate(Resources.Load("Icons/" + food + "Icon")) as GameObject;
                    childIcon.transform.SetParent(gameObject.transform.Find("Icon" + i.ToString()), false);
                }
            }
        }
        PlateType = Plate;
    }


    public void CleanPlate()
    {
        foreach (Transform child in transform.Find("AttachPoint")) Destroy(child.gameObject);
        for (int i = 0; i < 3; ++i) foreach (Transform icon in transform.Find("Icon" + i.ToString())) Destroy(icon.gameObject);
        PlateType = "Plate";
        ingredientNames.Clear();
    }
}
