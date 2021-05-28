using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class MenuButton : MonoBehaviour
{
    [SerializeField]
    MenuButtonController menuButtonController = null;
    [SerializeField]
    int thisIndex = 0;
    [SerializeField]
    Pause Pause = null;
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
        if (menuButtonController.index == thisIndex && Pause.paused)
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
                        Pause.resume();
                        Pause.restart();
                        break;
                    case 3:
                        Pause.resume();
                        if (SceneManager.GetActiveScene().name != "Mapa") Pause.quit();
                        else Pause.mapaQuit();
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
