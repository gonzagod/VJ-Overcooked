using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;

public class CameraFollow : MonoBehaviour
{

    public Transform target;
    public float smoothSpeed = 0.125f;
    public Vector3 offset;
    public float distance;

    void Start() {
        distance = 7f;
        target = GameObject.Find("Player_1").transform;
        if(SceneManager.GetActiveScene().name == "Nivell 1") offset = new Vector3(0f, distance+2.5f, -distance+1);
        else offset = new Vector3(0f, distance, -distance);
    }

    void LateUpdate()
    {
        Vector3 desiredPosition = target.position + offset;
        Vector3 smoothedPosition = Vector3.Lerp(transform.position, desiredPosition, smoothSpeed);
        transform.position = smoothedPosition;
        Vector3 lookAtPosition = target.position;
        lookAtPosition.x = transform.position.x;
        transform.LookAt(lookAtPosition);
    }

}
