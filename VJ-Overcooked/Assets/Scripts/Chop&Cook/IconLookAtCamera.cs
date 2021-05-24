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
        gameObject.transform.LookAt(MainCamera.transform);
    }
}
