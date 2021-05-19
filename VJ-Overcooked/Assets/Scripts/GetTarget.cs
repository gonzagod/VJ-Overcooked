using System.Collections;
using System.Collections.Generic;
using System.Linq;
using UnityEngine;

public class GetTarget : MonoBehaviour
{

    private Transform [] tableColliders;
    private Component targetInteraction;
    private Transform lastTarget;

    // Start is called before the first frame update
    void Start()
    {
      Transform tables = GameObject.Find("Blocks").GetComponent<Transform>();
      tableColliders = tables.Cast<Transform>().ToArray();
    }

    // Update is called once per frame
    void Update()
    {
        Vector3 playerPos = transform.Find("player_no_anim/PlayerDetector").position;
        Transform target = GetClosestTable(playerPos, tableColliders);
        if(target != null && target != lastTarget) {
          GetComponentInChildren<TargetInteraction>().ChangeTarget(target);
          lastTarget = target;
        } else if(target == null) {
          GetComponentInChildren<TargetInteraction>().IgnoreTarget();
        }
    }

    Transform GetClosestTable(Vector3 playerPos, Transform [] tableColliders){
        float bestDistance = 99999.0f;
        Transform closestTable = null;
        foreach (Transform table in tableColliders)
     {
         float distance = Vector3.Distance(playerPos, table.position);

         if (distance < bestDistance)
         {
             bestDistance = distance;
             closestTable = table;
         }
     }
     if (bestDistance <= 1.8f) return closestTable;
     else return null;
    }
}
