using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TimeBarGenerator : MonoBehaviour
{
    public GameObject TBar;
    public ChoppingTableItem Table;
    public TimeBar timeBar;
    bool generated;
    // Start is called before the first frame update
    void Start()
    {
        generated = false;
        timeBar.maxTime = 4.5f;
        
    }

    // Update is called once per frame
    void Update()
    {
        if (Table.Chopping == true && !generated) Generate();
        else if (Table.Chopping == false) generated = false;
    }

    void Generate()
    {
        generated = true;
        GameObject childObject = Instantiate(TBar, new Vector3(0, 2, 0), Quaternion.Euler(0, 180, 0));
        childObject.transform.SetParent(GameObject.FindGameObjectWithTag("ChoppingStation").transform, false);
    }
}
