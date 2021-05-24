using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MovementCloud : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (transform.position.x < -5f) transform.position = new Vector3(60f, transform.position.y, transform.position.z);
        else transform.position = new Vector3(transform.position.x - 0.0005f, transform.position.y, transform.position.z);
    }
}
