using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;
using UnityEngine.SceneManagement;

public class PointsScene : MonoBehaviour
{
    public int points;
    public Text Text;
    public StarsScript stars;
    // Start is called before the first frame update
    void Start()
    {

    }

    // Update is called once per frame
    void Update()
    {
        if (SceneManager.GetActiveScene().name == "Puntuation")
        {
            Text = GameObject.Find("Canvas/Text").GetComponent<Text>();
            Text.text = "Total: " + points.ToString();
            stars = GameObject.Find("Stars").GetComponent<StarsScript>();
            stars.puntuation = points;

        }
    }

    public void AddPoints(int pts)
    {
        points += pts;
    }
}
