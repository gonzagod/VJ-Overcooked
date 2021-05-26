using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class TimeBar : MonoBehaviour
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
        bar = transform.Find("BarFill").gameObject;
        placedParent = gameObject.transform.parent.gameObject;

        // Default to an empty bar
        bar.SetActive(false);
        var newScale = bar.transform.localScale;
        newScale.x = 0f;
        bar.transform.localScale = newScale;
    }

    // Update is called once per frame
    void Update()
    {
        if(placedParent.tag == "ChoppingStation"){
            elapsedTime = placedParent.GetComponent<ChoppingTableItem>().timeChopping;
        }

        if(placedParent.name.Contains("Pot")){
            elapsedTime = placedParent.GetComponent<PotScript>().timeCooked;
        }

        if(elapsedTime <= 0){
            foreach(Transform child in gameObject.transform) child.gameObject.SetActive(false);
        }
        else foreach(Transform child in gameObject.transform) child.gameObject.SetActive(true);
        if(elapsedTime > 0) {
            float t = maxTime - elapsedTime;
            fillAmount = elapsedTime / maxTime;
            if (fillAmount > 1f) gameObject.SetActive(false);
            var newScale = bar.transform.localScale;
            newScale.x = -fillAmount;
            bar.transform.localScale = newScale;
        }
    }
}
