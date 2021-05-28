using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraLookBook : MonoBehaviour
{

    public Transform target;
    private Animator myAnimator;
    private bool finished;
    private ManagerScript manager;

    void Start() {
        target = GameObject.Find("BookStatic").transform;
        myAnimator = gameObject.GetComponent<Animator>();
        finished = false;
        manager = GameObject.Find("GameManager").GetComponent<ManagerScript>();
    }

    void LateUpdate()
    {
        transform.LookAt(target);
    }

    void Update(){
        if (myAnimator.GetCurrentAnimatorStateInfo(0).normalizedTime > 1 && !myAnimator.IsInTransition(0) && ! finished){
            finished = true;
            manager.cameraFixed();
        }
    }

}
