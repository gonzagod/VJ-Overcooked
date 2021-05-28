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
    bool visibleTimeBar = false;
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
            float burningCount = placedParent.GetComponent<PotScript>().burningCount;
            if(burningCount > 0f) {
                elapsedTime = burningCount;
                maxTime = 2.5f;
            } else {
                elapsedTime = placedParent.GetComponent<PotScript>().timeCooked;
                maxTime = 10f;
            }
            visibleTimeBar = placedParent.GetComponent<PotScript>().visibleTimeBar;
        }

        if(placedParent.name.Contains("Pan")){
            float burningCount = placedParent.GetComponent<PanScript>().burningCount;
            if(burningCount > 0f) {
                elapsedTime = burningCount;
                maxTime = 2.5f;
            } else {
                elapsedTime = placedParent.GetComponent<PanScript>().timeCooked;
                maxTime = 10f;
            }
            visibleTimeBar = placedParent.GetComponent<PanScript>().visibleTimeBar;
        }

        if(elapsedTime <= 0){
            foreach(Transform child in gameObject.transform) child.gameObject.SetActive(false);
        }
        else foreach(Transform child in gameObject.transform) child.gameObject.SetActive(true);
        if(elapsedTime > 0 || visibleTimeBar) {
            float t = maxTime - elapsedTime;
            fillAmount = elapsedTime / maxTime;
            if (fillAmount >= 1f) disableTimeBar();
            else if(fillAmount >= 0) enableTimeBar();
            var newScale = bar.transform.localScale;
            newScale.x = -fillAmount;
            bar.transform.localScale = newScale;
        }
    }

    private void disableTimeBar(){
        foreach(Transform child in transform) child.gameObject.SetActive(false);
    }

    private void enableTimeBar(){
        foreach(Transform child in transform) child.gameObject.SetActive(true);
    }
}
