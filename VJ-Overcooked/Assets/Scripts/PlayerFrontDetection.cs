using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerFrontDetection : MonoBehaviour
{
    public BoxCollider frontDetector;
    // Start is called before the first frame update
    void Start()
    {
    }

    // Update is called once per frame
    void Update()
    {

    }

    private void OnTriggerEnter(Collider other)
    {
        //if(other.name != "Worktop") gameObject.GetComponent<TargetInteraction>().ChangeTarget(other);
    }

    private void OnTriggerExit(Collider other)
    {
      if(other.tag == "Table") {
        MeshRenderer tableRender = other.GetComponent(typeof(MeshRenderer)) as MeshRenderer;
        tableRender.enabled = false;
      }
    }
}
