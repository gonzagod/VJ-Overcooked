using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CoverScript : MonoBehaviour
{

    private Animator myAnimator;
    private bool finished;
    private ManagerScript manager;

    // Start is called before the first frame update
    void Start()
    {
        myAnimator = gameObject.GetComponent<Animator>();
        finished = false;
        manager = GameObject.Find("GameManager").GetComponent<ManagerScript>();
    }

    // Update is called once per frame
    void Update()
    {
        if (myAnimator.GetCurrentAnimatorStateInfo(0).IsName("CoverFlip_anim") && myAnimator.GetCurrentAnimatorStateInfo(0).normalizedTime > 1 && !myAnimator.IsInTransition(0) && ! finished){
            finished = true;
            manager.coverTurned();
        }
    }
}
