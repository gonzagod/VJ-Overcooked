using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;


public class ArrowMenu : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        if (Input.GetKeyUp(KeyCode.DownArrow) & transform.position.z > 5.6f)
        {
            transform.position = new Vector3(transform.position.x, transform.position.y, transform.position.z - 0.28f);
        }

        if (Input.GetKeyUp(KeyCode.UpArrow) & transform.position.z < 6.3f)
        {
            transform.position = new Vector3(transform.position.x, transform.position.y, transform.position.z + 0.28f);
        }

        if (Input.GetKeyDown("space"))
        {
            if (transform.position.z == 6.36f) SceneManager.LoadScene(SceneManager.GetActiveScene().buildIndex + 1);
            //else if (transform.position.z == 6.08f) 
            //else if (transform.position.z == 5.80f)
            //else if (transform.position.z == 5.52f)
        }
    }
}
