using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PointsController : MonoBehaviour
{
    public Text pointsText;
    private int points;
    // Start is called before the first frame update
    void Start()
    {
        points = 0;
    }

    // Update is called once per frame
    void Update()
    {
        string spoints = points.ToString();
        pointsText.text = spoints;
    }

    public void addPoints(int pts)
    {
        points += pts;
    }
}
