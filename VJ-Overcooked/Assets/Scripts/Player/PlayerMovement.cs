using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMovement : MonoBehaviour
{
    public Animator animator;
    public float speed;
    public float rotationSpeed ;
    public CharacterController player_controller;
    public GameObject target = null;
    private Vector3 gravityVector = new Vector3(0,-10,0);

    private void Start ()
    {
        animator = GetComponent<Animator>();
        target = gameObject.GetComponent<TargetHighlight>().target;
    }

    // Update is called once per frame
    void Update()
    {
        float horizontalInput = Input.GetAxis("Horizontal");
        float verticalInput = Input.GetAxis("Vertical");
        Vector3 movementDirection = new Vector3(horizontalInput, 0f, verticalInput);
        player_controller.Move(movementDirection * speed * Time.deltaTime);

        if (movementDirection.magnitude >= 0.1f){
          transform.rotation = Quaternion.Slerp(transform.rotation, Quaternion.LookRotation(movementDirection), 0.1F);
          animator.SetBool("isWalking", true);
          if (animator.GetBool("isCutting")){
              animator.SetBool("isCutting", false);
              gameObject.transform.Find("Chef_Body/Hand_Open_R").gameObject.SetActive(true);
              gameObject.transform.Find("Chef_Body/Hand_Grip_R").gameObject.SetActive(false);
              gameObject.transform.Find("Chef_Body/Knife").gameObject.SetActive(false);

          }

        }
        else animator.SetBool("isWalking", false);
        player_controller.Move(gravityVector * Time.deltaTime);
    }
}
