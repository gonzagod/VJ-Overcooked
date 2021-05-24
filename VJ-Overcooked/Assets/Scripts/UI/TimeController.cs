using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class TimeController : MonoBehaviour
{
    public Text timerText;
    private float startTime;
    AudioSource timesUpSound;
    private bool m_Play;
    private bool m_ToggleChange;
    float elapsedTime;
    // Start is called before the first frame update
    void Start()
    {
        timesUpSound = GetComponent<AudioSource>();
        m_Play = false;
        elapsedTime = 0f;
        startTime = 150f;
    }

    // Update is called once per frame
    void Update()
    {
        elapsedTime += Time.deltaTime;
        float t = startTime - elapsedTime;
        if (t < 0f)
        {
            SceneManager.LoadScene(1);
        }

        string minutes = ((int)t / 60).ToString("00");
        string seconds = (t % 60).ToString("00");

        timerText.text = minutes + ":" + seconds;

        if (t <= 10f)
        {
            if (!m_Play)
            {
                timesUpSound.Play();
                m_Play = true;
            }
        }

        
    }
}
