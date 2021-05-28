using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ManagerScript : MonoBehaviour
{

    private Animator CoverAnimator;
    public GameObject menu;
    public GameObject instructions;
    public GameObject credits;
    private ArrowMenu arrow;

    // Start is called before the first frame update
    void Start()
    {
        CoverAnimator = GameObject.Find("RecipeBookController/RecipeBook_Front").GetComponent<Animator>();
        arrow = GameObject.Find("Arrow").GetComponent<ArrowMenu>();
    }

    // Update is called once per frame
    void Update()
    {

    }

    public void cameraFixed(){
        CoverAnimator.SetBool("pass", true);
    }

    public void coverTurned(){
        arrow.canMove = true;
        menu.SetActive(true);
    }

    public void showInstructions(){
        arrow.canMove = false;
        arrow.GetComponent<SpriteRenderer>().enabled = false;
        menu.SetActive(false);
        instructions.SetActive(true);
        arrow.showing = "Instructions";
    }

    public void showMainMenu(){
        arrow.GetComponent<SpriteRenderer>().enabled = true;
        instructions.SetActive(false);
        credits.SetActive(false);
        menu.SetActive(true);
        arrow.canMove = true;
        arrow.showing = "Main";
    }

    public void showCredits(){
        arrow.canMove = false;
        arrow.GetComponent<SpriteRenderer>().enabled = false;
        menu.SetActive(false);
        credits.SetActive(true);
        arrow.showing = "Credits";
    }
}
