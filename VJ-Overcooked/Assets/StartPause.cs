using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class StartPause : MonoBehaviour
{
    private float pauseTime;
    void Start()
    {
        Pause();
    }
    public void Pause()
    {
        // how many seconds to pause the game
        StartCoroutine(PauseGame(1f));
    }
    public IEnumerator PauseGame(float pauseTime)
    {
        Time.timeScale = 0f;
        float pauseEndTime = Time.realtimeSinceStartup + pauseTime;
        while (Time.realtimeSinceStartup < pauseEndTime)
        {
            yield return 0;
        }
        Time.timeScale = 1f;
        PauseEnded();
    }

    public void PauseEnded()
    {
        GameObject.Find("GameEnviroment 1/Canvases/HUDCanvas/Start/Image").GetComponent<Image>().enabled = false;
    }
}
