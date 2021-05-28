using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;
using System;

public class CheatScript : MonoBehaviour
{

    private KeyCode[] keyCodes = {
         KeyCode.Alpha1,
         KeyCode.Alpha2,
         KeyCode.Alpha3,
         KeyCode.Alpha4,
         KeyCode.Alpha5,
         KeyCode.Alpha6,
         KeyCode.Alpha7,
         KeyCode.Alpha8,
         KeyCode.Alpha9,
     };

    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {
        for(int i = 0 ; i < keyCodes.Length; i ++ ){
           if(Input.GetKeyDown(keyCodes[i])){
                  int numberPressed = i+1;
                  if(numberPressed > 0 && numberPressed < 6){
                      SceneManager.LoadScene("Nivell " + numberPressed);
                  }
           }
       }
    }
}
