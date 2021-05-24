using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class TimeBar : MonoBehaviour
{
    public float maxTime;
    float elapsedTime;
    float startTime;
    float fillAmount;
    bool timeStop;
    private GameObject bar;
    void Start()
    {
        bar = GameObject.FindGameObjectWithTag("BarFill");
        elapsedTime = 0f;
        // Default to an empty bar
        var newScale = bar.transform.localScale;
        newScale.x = 0;
        bar.transform.localScale = newScale;
    }

    // Update is called once per frame
    void Update()
    {
        if (!timeStop)
        {
            elapsedTime += Time.deltaTime;
            float t = maxTime - elapsedTime;
            fillAmount = elapsedTime / maxTime;
            if (fillAmount > 1f) Destroy(gameObject);
            var newScale = bar.transform.localScale;
            newScale.x = fillAmount;
            bar.transform.localScale = newScale;
        }

    }

    void StartTiming()
    {
        elapsedTime = 0f;
    }

    void StopTime()
    {
        timeStop = true;
    }

    void ResumeTime()
    {
        timeStop = false;
    }
}
