using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class PlateStationItem : MonoBehaviour
{
    public GameObject utensilOnTop = null;
    public string utensilOnTopString = "";
    private PlateReturnTopItem plateReturn;
    public RecipeOrder recipes;
    private float time = 0.5f;
    private float timeElapsed;
    private bool delivered;
    private GameObject Plate;
    // Start is called before the first frame update
    void Start()
    {
        timeElapsed = 0f;
        delivered = false;
        plateReturn = GameObject.Find("PlateReturn").GetComponent<PlateReturnTopItem>();
    }

    // Update is called once per frame
    void Update()
    {
        if (delivered)
        {
            timeElapsed += Time.deltaTime;
            if (timeElapsed > time)
            {
                delivered = false;
                timeElapsed = 0f;
                cleanPlateStation();
            }
        }
    }
    public void setPlateOnTop(string potName)
    {
        Plate = Instantiate(Resources.Load("Plate")) as GameObject;
        Plate.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
        utensilOnTop = Plate;
        utensilOnTopString = "Plate";
        delivered = true;
    }

    public void cleanPlateStation()
    {
        utensilOnTop = null;
        utensilOnTopString = "";
        Destroy(Plate);
        plateReturn.InstantiatePlate();
    }

}
