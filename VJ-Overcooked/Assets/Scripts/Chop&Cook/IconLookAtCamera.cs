using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class IconLookAtCamera : MonoBehaviour
{

    private Camera MainCamera;

    // Start is called before the first frame update
    void Start()
    {
        MainCamera = Camera.main;
    }

    // Update is called once per frame
    void Update()
    {

        if(gameObject.tag != "Time Bar"){
            gameObject.transform.LookAt(MainCamera.transform);
        }
        else {
            Vector3 lookAtPosition = MainCamera.transform.position;
            lookAtPosition.x = transform.position.x;
            transform.LookAt(lookAtPosition);

        }

    }
}
