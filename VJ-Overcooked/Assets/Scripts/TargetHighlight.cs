using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TargetHighlight : MonoBehaviour
{

    public GameObject target;


    // Start is called before the first frame update
    void Start()
    {
        target = null;
    }

    // Update is called once per frame
    void Update()
    {

    }

    public void ChangeTarget(Transform newTarget) {
        if (target != null && newTarget.gameObject != target){
          highlightTarget(target, false);
        }
        target = newTarget.gameObject;
        highlightTarget(target, true);
    }

    public void IgnoreTarget(){
      if(target != null) {
        highlightTarget(target, false);
        target = null;
      }
    }

    private void highlightTarget(GameObject target, bool highlight){
      if (!highlight) {
          if (target.tag == "Table") {
              MeshRenderer renderer = target.transform.Find("Worktop").GetComponent<MeshRenderer>();
              Material[] mats = renderer.materials;
              Material tableDefaultMaterial = target.transform.GetComponent<TableMaterials>().table;
              mats[0] = tableDefaultMaterial;
              renderer.materials = mats;

          } else if (target.tag == "Crate"){
              SkinnedMeshRenderer renderer = target.transform.Find("Crate").Find("Crate_mesh").GetComponent<SkinnedMeshRenderer>();
              Material[] mats = renderer.materials;
              Material crateDefaultMaterial = target.transform.GetComponent<CrateMaterials>().crate;
              mats[0] = crateDefaultMaterial;
              renderer.materials = mats;

              Transform crateType = target.transform.Find("Crate").Find("CrateLid_mesh");
              SkinnedMeshRenderer topRenderer = crateType.gameObject.GetComponent<SkinnedMeshRenderer>();
              if(crateType.tag == "Onion Crate"){
                  Material[] topMats = topRenderer.materials;
                  Material onionCrateDefaultMaterial = target.transform.GetComponent<CrateMaterials>().onion_crate;
                  topMats[0] = onionCrateDefaultMaterial;
                  topMats[1] = onionCrateDefaultMaterial;
                  topRenderer.materials = topMats;
              }
          } else if (target.tag == "ChoppingStation"){
              MeshRenderer renderer = target.transform.Find("Worktop").GetComponent<MeshRenderer>();
              Material[] mats = renderer.materials;
              Material tableDefaultMaterial = target.transform.GetComponent<TableMaterials>().table;
              mats[0] = tableDefaultMaterial;
              renderer.materials = mats;

              MeshRenderer knifeRenderer = target.transform.Find("Knife").GetComponent<MeshRenderer>();;
              Material[] knifeMats = knifeRenderer.materials;
              Material knifeDefaultMaterial = target.transform.GetComponent<KnifeMaterials>().knife;
              knifeMats[0] = knifeDefaultMaterial;
              knifeRenderer.materials = knifeMats;
          }
          else if (target.tag == "CookingStation"){
              MeshRenderer renderer = target.transform.Find("Worktop").GetComponent<MeshRenderer>();
              Material[] mats = renderer.materials;
              Material cookerDefaultMaterial = target.transform.GetComponent<CookerMaterials>().cooker;
              mats[0] = cookerDefaultMaterial;
              renderer.materials = mats;

              /* MeshRenderer knifeRenderer = target.transform.Find("Knife").GetComponent<MeshRenderer>();;
              Material[] knifeMats = knifeRenderer.materials;
              Material knifeDefaultMaterial = target.transform.GetComponent<KnifeMaterials>().knife;
              knifeMats[0] = knifeDefaultMaterial;
              knifeRenderer.materials = knifeMats; */
          }
      } else {
        if (target.tag == "Table") {
            MeshRenderer renderer = target.transform.Find("Worktop").GetComponent<MeshRenderer>();
            Material[] mats = renderer.materials;
            Material tableHighlightedMaterial = target.transform.GetComponent<TableMaterials>().table_highlighted;
            mats[0] = tableHighlightedMaterial;
            renderer.materials = mats;
        } else if (target.tag == "Crate"){
            SkinnedMeshRenderer renderer = target.transform.Find("Crate").Find("Crate_mesh").GetComponent<SkinnedMeshRenderer>();
            Material[] mats = renderer.materials;
            Material crateHighlightedMaterial = target.transform.GetComponent<CrateMaterials>().crate_highlighted;
            mats[0] = crateHighlightedMaterial;
            renderer.materials = mats;

            Transform crateType = target.transform.Find("Crate").Find("CrateLid_mesh");
            SkinnedMeshRenderer topRenderer = crateType.gameObject.GetComponent<SkinnedMeshRenderer>();
            if(crateType.tag == "Onion Crate"){
                Material[] topMats = topRenderer.materials;
                Material onionCrateHighlightedMaterial = target.transform.GetComponent<CrateMaterials>().onion_crate_highlighted;
                topMats[0] = onionCrateHighlightedMaterial;
                topMats[1] = onionCrateHighlightedMaterial;
                topRenderer.materials = topMats;
            }
        } else if (target.tag == "ChoppingStation"){
            MeshRenderer renderer = target.transform.Find("Worktop").GetComponent<MeshRenderer>();
            Material[] mats = renderer.materials;
            Material tableHighlightedMaterial = target.transform.GetComponent<TableMaterials>().table_highlighted;
            mats[0] = tableHighlightedMaterial;
            renderer.materials = mats;

            MeshRenderer knifeRenderer = target.transform.Find("Knife").GetComponent<MeshRenderer>();;
            Material[] knifeMats = knifeRenderer.materials;
            Material knifeHighlightedMaterial = target.transform.GetComponent<KnifeMaterials>().knife_highlighted;
            knifeMats[0] = knifeHighlightedMaterial;
            knifeRenderer.materials = knifeMats;
        }
        else if (target.tag == "CookingStation"){
            MeshRenderer renderer = target.transform.Find("Worktop").GetComponent<MeshRenderer>();
            Material[] mats = renderer.materials;
            Material cookerHighlightedMaterial = target.transform.GetComponent<CookerMaterials>().cooker_highlighted;
            mats[0] = cookerHighlightedMaterial;
            renderer.materials = mats;

            /* MeshRenderer knifeRenderer = target.transform.Find("Knife").GetComponent<MeshRenderer>();;
            Material[] knifeMats = knifeRenderer.materials;
            Material knifeDefaultMaterial = target.transform.GetComponent<KnifeMaterials>().knife;
            knifeMats[0] = knifeDefaultMaterial;
            knifeRenderer.materials = knifeMats; */
        }
      }
    }
}
