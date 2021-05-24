using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using System;

public class MapSelectorScript : MonoBehaviour
{
    public GameObject Player;
    public int level;
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
            gameObject.transform.Find("Keyboard_Space").gameObject.SetActive(true);
            if (Input.GetKeyDown("space"))
            {
                SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex + level);
                Debug.Log("SceneLoader map selector");
            }
        } else {
          gameObject.transform.Find("Keyboard_Space").gameObject.SetActive(false);
        }
    }
}
