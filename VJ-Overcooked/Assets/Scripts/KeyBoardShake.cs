using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class KeyBoardShake : MonoBehaviour
{
    private Vector3 pos;
    private int x;
    private int y; 
    // Start is called before the first frame update
    void Start()
    {
        x = 100;
        y = 1;
    }

    // Update is called once per frame
    void Update()
    {
        if (x > 0)
        {
            pos = new Vector3(transform.position.x, (transform.position.y + 0.001f), transform.position.z);
            transform.position = pos;
            --x;
        }
        else if (x == 0) {
            y = -y;
            x = 100 * y;
        }
        else {
            pos = new Vector3(transform.position.x, (transform.position.y - 0.001f), transform.position.z);
            transform.position = pos;
            ++x;
        }
    }
}
