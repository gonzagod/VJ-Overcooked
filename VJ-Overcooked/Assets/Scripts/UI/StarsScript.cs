using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class StarsScript : MonoBehaviour
{
    public int puntuation;
    public Text Text2;
    private int puntuationToNextLevel;
    // Start is called before the first frame update
    void Start()
    {
        Text2 = GameObject.Find("Canvas/Text2").GetComponent<Text>();
        foreach (Transform child in gameObject.transform)
        {
            child.GetComponent<SpriteRenderer>().enabled = false;
        }
    }

    // Update is called once per frame
    void Update()
    {
        if (puntuation >= 100)
        {
            foreach(Transform child in gameObject.transform)
            {
                child.GetComponent<SpriteRenderer>().enabled = true;
                Text2.text = "";
            }
        }
        else if (puntuation >= 60)
        {
            foreach (Transform child in gameObject.transform)
            {
                if (child.name != "3") child.GetComponent<SpriteRenderer>().enabled = true;
                puntuationToNextLevel = 100 - puntuation;
                Text2.text = "Next Star " + puntuationToNextLevel.ToString();
            }
        }
        else if (puntuation >= 20)
        {
            foreach (Transform child in gameObject.transform)
            {
                if (child.name != "3" && child.name != "2") child.GetComponent<SpriteRenderer>().enabled = true;
                puntuationToNextLevel = 60 - puntuation;
                Text2.text = "Next Star " + puntuationToNextLevel.ToString();
            }
        }
        else
        {
            puntuationToNextLevel = 20 - puntuation;
            Text2.text = "Next Star " + puntuationToNextLevel.ToString();
        }
    }
}
