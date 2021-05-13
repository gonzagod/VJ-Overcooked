using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MenuButtonController : MonoBehaviour
{
    public int index;
    [SerializeField]
    int maxIndex;

    // Start is called before the first frame update
    void Start()
    {
    }

    // Update is called once per frame
    void Update()
    {
            if (Input.GetKeyUp(KeyCode.DownArrow)) {
                if (index < maxIndex) ++index;
            }
            else if (Input.GetKeyUp(KeyCode.UpArrow))
            {
                if (index > 1) --index;
            }
    }
}