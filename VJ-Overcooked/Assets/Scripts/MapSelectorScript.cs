using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using System;

public class MapSelectorScript : MonoBehaviour
{
    public GameObject Player;
    public GameObject SpaceIcon;
    private Vector3 pos;
    public int level;
    private bool spaceIconClone = false;
    private GameObject clone;
    bool playerNear()
    {
        if (Math.Abs(transform.position.x - Player.transform.position.x) < 0.75 & Math.Abs(transform.position.z - Player.transform.position.z) < 1.5) return true;
        else return false;
    }
    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {
        if (playerNear())
        {
            pos = new Vector3(transform.position.x, (transform.position.y + 0.5f), transform.position.z);
            if (!spaceIconClone){
                clone = Instantiate(SpaceIcon, new Vector3(pos.x, pos.y + 1f, pos.z), Quaternion.identity);
                spaceIconClone = true;
              }
            if (Input.GetKeyDown("space"))
            {
                SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex + level);
            }
        } else {
          Destroy(clone);
          spaceIconClone = false;
        }
    }
}
