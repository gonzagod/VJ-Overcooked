using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;

public class TakeOutFood : MonoBehaviour
{

    public GameObject Food;
    public GameObject SpaceIcon;
    public GameObject Player;
    private Vector3 pos;
    // Start is called before the first frame update

    bool playerNear()
    {
        if (Math.Abs(transform.position.x - Player.transform.position.x) < 0.75 & Math.Abs(transform.position.z - Player.transform.position.z) < 1.5) return true;
        else return false;
    }
    void Start()
    {


    }

    // Update is called once per frame
    void Update()
    {
        //Debug.Log("Posició Capsa x " + transform.position.x);
        //Debug.Log("Posició Capsa z " + transform.position.z);
        //Debug.Log("Posició PJ x " + Player.transform.position.x);
        //Debug.Log("Posició PJ z " + Player.transform.position.z);
        if (playerNear())
        {
            pos = new Vector3(transform.position.x, (transform.position.y + 0.5f), transform.position.z);
            GameObject clone = Instantiate(SpaceIcon, new Vector3(pos.x, pos.y + 1f, pos.z), Quaternion.identity);
            Destroy(clone, 0.1f);
            if (Input.GetKeyDown("space"))
            {
                Instantiate(Food, pos, Quaternion.identity);
            }
        }
    }
}
