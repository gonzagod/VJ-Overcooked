using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using System;
using UnityEngine.SceneManagement;

public class TakeOutFood : MonoBehaviour
{
    public GameObject Food;
    public GameObject SpaceIcon;
    public GameObject Player;
    private ItemSwitch itemSwitch;
    private Vector3 pos;
    public Animator myAnimatorController;
    AudioSource[] pickup;
    // Start is called before the first frame update

    void Start()
    {
        pickup = transform.GetComponents<AudioSource>();
        myAnimatorController.SetBool("Open", false);
        itemSwitch = Player.transform.Find("player_no_anim/Item").GetComponent<ItemSwitch>();

    }

    // Update is called once per frame
    void Update()
    {
        myAnimatorController.SetBool("Open", false);
        GameObject playerTarget = Player.transform.Find("player_no_anim").GetComponent<TargetHighlight>().target;
        if ( playerTarget != null && playerTarget.name == gameObject.name)
        {
            if(itemSwitch.selectedItemOnHands == null && SceneManager.GetActiveScene().name == "Nivell 1") gameObject.transform.Find("Keyboard_Space").gameObject.SetActive(true);
            if (Input.GetKeyUp("space"))
            {
                if (itemSwitch.selectedItemOnHands == null){
                    myAnimatorController.SetBool("Open", true);
                    GameObject foodInstant = Instantiate(Food) as GameObject;
                    itemSwitch.setItemOnHands(foodInstant);
                    int rand = UnityEngine.Random.Range(0, 4);
                    pickup[rand].Play();
                }
            }
        } else {
            if(SceneManager.GetActiveScene().name == "Nivell 1") gameObject.transform.Find("Keyboard_Space").gameObject.SetActive(false);
        }
    }
}
