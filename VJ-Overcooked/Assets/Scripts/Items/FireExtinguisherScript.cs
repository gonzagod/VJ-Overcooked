using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class FireExtinguisherScript : MonoBehaviour
{

    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {

    }

    void OnTriggerStay(Collider other){
        if(other.gameObject.tag == "CookingUtensil"){
            PotScript potsc = other.gameObject.GetComponent<PotScript>();
            if(potsc.burningCount > 0f){
                potsc.burningCount -= Time.deltaTime;
            }
        }
    }
}
