using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ChoppingSound : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {

    }

    void onTriggerEnter(Collider other){
        Debug.Log("Entra");
        if(other.name.Contains("ChoppingBoard")){
            Debug.Log("Chop");
        }
    }
}
