using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerMovement : MonoBehaviour
{
    public Animator animator;
    public float speed;
    public float gravity;
    public float rotationSpeed ;
    //public GameObject player;
    public CharacterController player_controller;
    public Rigidbody rb_player;

    private void Start ()
    {
        animator = GetComponent<Animator>();
    }

    // Update is called once per frame
    void Update()
    {
        float horizontalInput = Input.GetAxis("Horizontal");
        float verticalInput = Input.GetAxis("Vertical");
        Vector3 movementDirection = new Vector3(horizontalInput, 0f, verticalInput);
        player_controller.Move(movementDirection * speed * Time.deltaTime);

        if (movementDirection.magnitude >= 0.1f){
          transform.rotation = Quaternion.Slerp(transform.rotation, Quaternion.LookRotation(movementDirection), 0.15F);
          animator.SetBool("isWalking", true);
        }
        else animator.SetBool("isWalking", false);
    }
}
