using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class TimeBarRecipes : MonoBehaviour
{
    public float maxTime;
    public float elapsedTime;
    private GameObject placedParent;
    float startTime;
    float fillAmount;
    bool timeStop;
    private GameObject bar;

    void Start()
    {
        bar = transform.GetChild(0).gameObject;
        bar.SetActive(false);
    }

    // Update is called once per frame
    void Update()
    {
        if (elapsedTime == 0)
        {
            bar.SetActive(false);
        }
        else bar.SetActive(true);
        if (elapsedTime > 0)
        {
            elapsedTime -= Time.deltaTime;
            float fill = elapsedTime/maxTime;
            bar.GetComponent<Image>().fillAmount = fill;
            bar.GetComponent<Image>().color = new Color(1-fill,fill,0);
            if (elapsedTime >= maxTime) gameObject.SetActive(false);
        }
    }
}

