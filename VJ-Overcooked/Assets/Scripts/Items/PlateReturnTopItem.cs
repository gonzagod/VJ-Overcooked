using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlateReturnTopItem : MonoBehaviour
{
    public GameObject utensilOnTop = null;
    public string utensilOnTopString = "";
    private GameObject Player;
    private GameObject Plate;
    // Start is called before the first frame update
    void Start()
    {
        Player = GameObject.Find("Player_1");
    }

    // Update is called once per frame
    void Update()
    {
        GameObject playerTarget = Player.transform.Find("player_no_anim").GetComponent<TargetHighlight>().target;
    }

    public void CleanTable()
    {
       utensilOnTop = null;
       utensilOnTopString = "";
       Destroy(Plate);
    }

    public void InstantiatePlate()
    {
        Plate = Instantiate(Resources.Load("Plate")) as GameObject;
        Plate.transform.SetParent(gameObject.transform.Find("AttachPoint"), false);
        utensilOnTop = Plate;
    }
}
