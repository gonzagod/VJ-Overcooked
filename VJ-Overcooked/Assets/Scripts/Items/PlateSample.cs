using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlateSample : MonoBehaviour
{
    private GameObject childObject;
    public string PlateType;
    // Start is called before the first frame update
    void Start()
    {
        PlateType = "Plate";
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void InstantiateIngredientsInPlate(string PlateName)
    {
        foreach(Transform food in gameObject.transform.Find("AttachPoint")){
            Destroy(food.gameObject);
        }
        switch (PlateName) {
            case "OnionSoup":
                childObject = Instantiate(Resources.Load("plates/OnionSoup")) as GameObject;
                childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                PlateType = PlateName;
                break;
            case "MushroomSoup":
                childObject = Instantiate(Resources.Load("plates/MushroomSoup")) as GameObject;
                childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                PlateType = PlateName;
                break;
            case "TomatoSoup":
                childObject = Instantiate(Resources.Load("plates/TomatoSoup")) as GameObject;
                childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                PlateType = PlateName;
                break;
            case "OnionTomatoBurger":
                childObject = Instantiate(Resources.Load("plates/OnionTomatoBurger")) as GameObject;
                childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                PlateType = PlateName;
                break;
            case "LettuceTomatoBurger":
                childObject = Instantiate(Resources.Load("plates/LettuceTomatoBurger")) as GameObject;
                childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                PlateType = PlateName;
                break;
            case "ChickenPotatoesTomato":
                childObject = Instantiate(Resources.Load("plates/ChickenPotatoesTomato")) as GameObject;
                childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                PlateType = PlateName;
                break;
            case "ChickenPotatoesMushroom":
                childObject = Instantiate(Resources.Load("plates/ChickenPotatoesMushroom")) as GameObject;
                childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                PlateType = PlateName;
                break;
            case "PlatedLettuce":
                switch (PlateType)
                {
                    case "Plate":
                        childObject = Instantiate(Resources.Load("plates/PlatedLettuce")) as GameObject;
                        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                        PlateType = "PlatedLettuce";
                        break;
                    case "PlatedTomato":
                        childObject = Instantiate(Resources.Load("plates/PlatedLettuceTomato")) as GameObject;
                        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                        PlateType = "PlatedLettuceTomato";
                        break;
                    case "PlatedBurger":
                        childObject = Instantiate(Resources.Load("plates/PlatedLettuceBurger")) as GameObject;
                        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                        PlateType = "PlatedLettuceBurger";
                        break;
                    case "PlatedTomatoBurger":
                        childObject = Instantiate(Resources.Load("plates/LettuceTomatoBurger")) as GameObject;
                        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                        PlateType = "LettuceTomatoBurger";
                        break;
                    default:
                        childObject = Instantiate(Resources.Load("plates/" + PlateType)) as GameObject;
                        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                        break;
                }
            break;
            case "PlatedTomato":
                switch (PlateType)
                {
                    case "Plate":
                        childObject = Instantiate(Resources.Load("plates/PlatedTomato")) as GameObject;
                        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                        PlateType = "PlatedTomato";
                        break;
                    case "PlatedLettuce":
                        childObject = Instantiate(Resources.Load("plates/PlatedLettuceTomato")) as GameObject;
                        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                        PlateType = "PlatedLettuceTomato";
                        break;
                    case "PlatedBurger":
                        childObject = Instantiate(Resources.Load("plates/PlatedTomatoBurger")) as GameObject;
                        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                        PlateType = "PlatedTomatoBurger";
                        break;
                    case "PlatedLettuceBurger":
                        childObject = Instantiate(Resources.Load("plates/LettuceTomatoBurger")) as GameObject;
                        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                        PlateType = "LettuceTomatoBurger";
                        break;
                    case "PlatedMushroom":
                        childObject = Instantiate(Resources.Load("plates/PlatedTomatoMushroom")) as GameObject;
                        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                        PlateType = "PlatedTomatoMushroom";
                        break;
                    case "PlatedChicken":
                        childObject = Instantiate(Resources.Load("plates/PlatedChickenTomato")) as GameObject;
                        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                        PlateType = "PlatedChickenTomato";
                        break;
                    case "PlatedOnion":
                        childObject = Instantiate(Resources.Load("plates/PlatedOnionTomato")) as GameObject;
                        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                        PlateType = "PlatedOnionTomato";
                        break;
                    case "PlatedOnionBurger":
                        childObject = Instantiate(Resources.Load("plates/OnionTomatoBurger")) as GameObject;
                        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                        PlateType = "OnionTomatoBurger";
                        break;
                    case "PlatedPotatoes":
                        childObject = Instantiate(Resources.Load("plates/PlatedPotatoesTomato")) as GameObject;
                        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                        PlateType = "PlatedPotatoesTomato";
                        break;
                    case "PlatedChickenPotatoes":
                        childObject = Instantiate(Resources.Load("plates/PlatedChickenPotatoesTomato")) as GameObject;
                        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                        PlateType = "PlatedChickenPotatoesTomato";
                        break;
                    case "PlatedChickenMushroom":
                        childObject = Instantiate(Resources.Load("plates/PlatedChickenTomatoMushroom")) as GameObject;
                        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                        PlateType = "PlatedChickenTomatoMushroom";
                        break;
                    default:
                        childObject = Instantiate(Resources.Load("plates/" + PlateType)) as GameObject;
                        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                        break;
                }
                break;
            case "PlatedMushroom":
                switch (PlateType)
                {
                    case "PlatedChicken":
                        childObject = Instantiate(Resources.Load("plates/PlatedChickenMushroom")) as GameObject;
                        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                        PlateType = "PlatedChickenMushroom";
                        break;
                    case "PlatedChickenTomato":
                        childObject = Instantiate(Resources.Load("plates/PlatedChickenTomatoMushroom")) as GameObject;
                        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                        PlateType = "PlatedChickenTomatoMushroom";
                        break;
                    case "PlatedTomato":
                        childObject = Instantiate(Resources.Load("plates/PlatedTomatoMushroom")) as GameObject;
                        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                        PlateType = "PlatedTomatoMushroom";
                        break;
                    default:
                        childObject = Instantiate(Resources.Load("plates/" + PlateType)) as GameObject;
                        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                        break;
                }
                break;
            case "PlatedBurger":
                switch(PlateType){
                    case "PlatedTomato":
                        childObject = Instantiate(Resources.Load("plates/PlatedTomatoBurger")) as GameObject;
                        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                        PlateType = "PlatedTomatoBurger";
                        break;
                    case "PlatedLettuce":
                        childObject = Instantiate(Resources.Load("plates/PlatedLettuceBurger")) as GameObject;
                        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                        PlateType = "PlatedLettuceBurger";
                        break;
                    case "PlatedLettuceTomato":
                        childObject = Instantiate(Resources.Load("plates/LettuceTomatoBurger")) as GameObject;
                        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                        PlateType = "LettuceTomatoBurger";
                        break;
                    case "PlatedOnion":
                        childObject = Instantiate(Resources.Load("plates/PlatedOnionBurger")) as GameObject;
                        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                        PlateType = "PlatedOnionBurger";
                        break;
                    case "PlatedOnionTomato":
                        childObject = Instantiate(Resources.Load("plates/OnionTomatoBurger")) as GameObject;
                        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                        PlateType = "OnionTomatoBurger";
                        break;
                    default:
                        childObject = Instantiate(Resources.Load("plates/" + PlateType)) as GameObject;
                        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                        break;
                }
                break;
            case "PlatedChicken":
                switch (PlateType)
                {
                    case "PlatedTomato":
                        childObject = Instantiate(Resources.Load("plates/PlatedChickenTomato")) as GameObject;
                        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                        PlateType = "PlatedChickenTomato";
                        break;
                    case "PlatedPotatoes":
                        childObject = Instantiate(Resources.Load("plates/PlatedChickenPotatoes")) as GameObject;
                        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                        PlateType = "PlatedChickenPotatoes";
                        break;
                    case "PlatedMushroom":
                        childObject = Instantiate(Resources.Load("plates/PlatedChickenMushroom")) as GameObject;
                        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                        PlateType = "PlatedChickenMushroom";
                        break;
                    case "PlatedChickenTomato":
                        childObject = Instantiate(Resources.Load("plates/PlatedChickenTomatoMushroom")) as GameObject;
                        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                        PlateType = "PlatedChickenTomatoMushroom";
                        break;
                    default:
                        childObject = Instantiate(Resources.Load("plates/" + PlateType)) as GameObject;
                        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                        break;
                }
                break;
            case "PlatedOnion":
                switch (PlateType)
                {
                    case "PlatedBurger":
                        childObject = Instantiate(Resources.Load("plates/PlatedOnionBurger")) as GameObject;
                        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                        PlateType = "PlatedOnionBurger";
                        break;
                    case "Plate":
                        childObject = Instantiate(Resources.Load("plates/PlatedOnion")) as GameObject;
                        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                        PlateType = "PlatedOnion";
                        break;
                    case "PlatedTomato":
                        childObject = Instantiate(Resources.Load("plates/PlatedOnionTomato")) as GameObject;
                        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                        PlateType = "PlatedOnionTomato";
                        break;
                    case "PlatedTomatoBurger":
                        childObject = Instantiate(Resources.Load("plates/OnionTomatoBurger")) as GameObject;
                        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                        PlateType = "OnionTomatoBurger";
                        break;
                    default:
                        childObject = Instantiate(Resources.Load("plates/" + PlateType)) as GameObject;
                        childObject.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
                        break;
                }
                break;
            default:

                break;
        }
    }
}
