using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class MenuButton : MonoBehaviour
{
    [SerializeField]
    MenuButtonController menuButtonController;
    [SerializeField]
    int thisIndex;
    [SerializeField]
    Pause Pause;
    private Image myImage;
    // Start is called before the first frame update
    void Start()
    {
        myImage = GetComponent<Image>();
        myImage.enabled = false;
    }

    // Update is called once per frame
    void Update()
    {
        if (menuButtonController.index == thisIndex)
        {
            myImage.enabled = true;
            if (Input.GetKeyDown("space"))
            {
                switch (thisIndex)
                {
                    case 1:
                        Pause.resume();
                        break;
                    case 2:
                        Pause.controls();
                        break;
                    case 3:
                        Pause.resume();
                        Pause.restart();
                        break;
                    case 4:
                        Pause.resume();
                        Pause.quit();
                        break;
                } 
            } else
            {
                
            }
        } else
        {
            myImage.enabled = false;
        }
    }
}
