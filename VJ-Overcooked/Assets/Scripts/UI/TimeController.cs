using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class TimeController : MonoBehaviour
{
    public Text timerText;
    private float startTime;
    AudioSource[] timesUpSound;
    private bool m_Play;
    private bool m_ToggleChange;
    float elapsedTime;
    public GameObject TimesUp;
    // Start is called before the first frame update
    void Start()
    {
        timesUpSound = GetComponents<AudioSource>();
        m_Play = false;
        elapsedTime = 0f;
        startTime = 5f;
    }

    // Update is called once per frame
    void Update()
    {
        elapsedTime += Time.deltaTime;
        float t = startTime - elapsedTime;
        if (t <= 0f)
        {
            if (m_Play)
            {
                timesUpSound[1].Play();
                m_Play = false;
            }
            timesUpSound[0].Stop();
            Time.timeScale = 0f;
            transform.parent.parent.GetComponent<Animator>().enabled = true;
            TimesUp.SetActive(true);
            TimesUp.transform.GetChild(0).gameObject.SetActive(true);

            if (Input.GetKeyDown("space"))
            {
                Time.timeScale = 1f;
                GameObject points = GameObject.Find("PointsSurvivor");
                DontDestroyOnLoad(points);
                SceneManager.LoadScene(7);
            }

        }
        else if (t <= 10f)
        {
            string minutes = ((int)t / 60).ToString("00");
            string seconds = (t % 60).ToString("00");

            timerText.text = minutes + ":" + seconds;
                if (!m_Play)
                {
                    timesUpSound[0].Play();
                    m_Play = true;
                }
        }
    }
}
