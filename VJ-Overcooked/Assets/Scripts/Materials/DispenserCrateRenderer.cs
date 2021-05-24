using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class DispenserCrateRenderer : MonoBehaviour
{
    // Start is called before the first frame update
    void Start()
    {
        Component[] skinnedmeshes;
        skinnedmeshes = GetComponentsInChildren<SkinnedMeshRenderer>();
        foreach (SkinnedMeshRenderer skinnedmesh in skinnedmeshes){
          // Debug.Log("skinnedmesh");
        }
    }

    // Update is called once per frame
    void Update()
    {

    }
}
