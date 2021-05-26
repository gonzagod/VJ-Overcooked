using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlateSample : MonoBehaviour
{
    public GameObject OnionSoup;
    public GameObject MushroomSoup;
    public GameObject TomatoSoup;
    public GameObject TomatoBurger;
    public GameObject OnionBurger;
    private GameObject childObject;
    private string PlateName;
    // Start is called before the first frame update
    void Start()
    {
        PlateName = "OnionSoup";
        //InstantiateIngredientsInPlate();
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void InstantiateIngredientsInPlate()
    {
        switch (PlateName) {
            case "OnionSoup":
                childObject = Instantiate(OnionSoup, new Vector3(0, 0.065f, 0), Quaternion.Euler(0, 0, 0));
                childObject.transform.SetParent(gameObject.transform, false);
                break;
            case "MushroomSoup":
                childObject = Instantiate(MushroomSoup, new Vector3(0, 0.065f, 0), Quaternion.Euler(0, 0, 0));
                childObject.transform.SetParent(gameObject.transform, false);
                break;
            case "TomatoSoup":
                childObject = Instantiate(TomatoSoup, new Vector3(0, 0.065f, 0), Quaternion.Euler(0, 0, 0));
                childObject.transform.SetParent(gameObject.transform, false);
                break;
            case "TomatoBurger":
                childObject = Instantiate(TomatoBurger, new Vector3(0, 0.1f, 0), Quaternion.Euler(0, 0, 0));
                childObject.transform.SetParent(gameObject.transform, false);
                break;
            case "OnionBurger":
                childObject = Instantiate(OnionBurger, new Vector3(0, 0.1f, 0), Quaternion.Euler(0, 0, 0));
                childObject.transform.SetParent(gameObject.transform, false);
                break;
            default:

                break;
        }
    }
}
