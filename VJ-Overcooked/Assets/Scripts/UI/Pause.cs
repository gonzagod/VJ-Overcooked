using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class Pause : MonoBehaviour
{
    public Canvas ui;
    public bool paused = false;

    // Start is called before the first frame update
    void Start()
    {
        ui.enabled = false;
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Escape)) letspause();
    }

    public void letspause()
    {
        paused = true;
        Time.timeScale = 0;
        ui.enabled = true;

    }

    public void resume()
    {
        ui.enabled = false;
        Time.timeScale = 1;
        paused = false;
    }

    public void controls()
    {

    }

    public void restart()
    {
        SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex);
        paused = false;
    }

    public void quit()
    {
        SceneManager.LoadScene(1);
        paused = false;
    }
}
