using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class FoodScript : MonoBehaviour
{
    int estat;
    GameObject Player;
    private Vector3 pos;

    void Carry()
    {
        estat = 1;
        transform.position = new Vector3(Player.transform.position.x, Player.transform.position.y, Player.transform.position.z + 0.8f);

    }
    // Start is called before the first frame update
    void Start()
    {
        estat = 0;
        Player = GameObject.Find("Player 1");
    }

    // Update is called once per frame
    void Update()
    {
        if (estat == 0 & Input.GetKeyDown("space")) Carry();
        if (estat == 1) Carry();
    }
}
