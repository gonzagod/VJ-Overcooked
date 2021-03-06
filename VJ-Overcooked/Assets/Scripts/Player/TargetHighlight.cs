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
              if(crateType.tag == "Top Crate"){
                  Material[] topMats = topRenderer.materials;
                  Material topCrateDefaultMaterial = target.transform.GetComponent<CrateMaterials>().top_crate;
                  topMats[0] = topCrateDefaultMaterial;
                  topMats[1] = topCrateDefaultMaterial;
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
          } else if (target.tag == "CookingStation"){
              MeshRenderer renderer = target.transform.Find("Worktop").GetComponent<MeshRenderer>();
              Material[] mats = renderer.materials;
              Material cookerDefaultMaterial = target.transform.GetComponent<CookerMaterials>().cooker;
              mats[0] = cookerDefaultMaterial;
              renderer.materials = mats;

              GameObject utensil = target.GetComponent<CookingStationScript>().utensilOnTop;
              if(utensil != null){
                  string utensilName = target.GetComponent<CookingStationScript>().utensilOnTopString;
                  if(utensilName == "Pot"){
                      MeshRenderer utensilRenderer = utensil.transform.Find("Pot/Pot").GetComponent<MeshRenderer>();
                      Material[] utensilMats = utensilRenderer.materials;
                      Material utensilDefaultMaterial = utensil.transform.GetComponent<PotMaterials>().pot;
                      utensilMats[0] = utensilDefaultMaterial;
                      utensilRenderer.materials = utensilMats;
                  }else if(utensilName == "Pan"){
                      MeshRenderer utensilRenderer = utensil.transform.Find("Pan/Pan").GetComponent<MeshRenderer>();
                      Material[] utensilMats = utensilRenderer.materials;
                      Material utensilDefaultMaterial = utensil.transform.GetComponent<PanMaterials>().pan;
                      utensilMats[0] = utensilDefaultMaterial;
                      utensilRenderer.materials = utensilMats;
                  }
              }
          } else if (target.tag == "PlateStation")
            {
                MeshRenderer renderer = target.transform.Find("Worktop").GetComponent<MeshRenderer>();
                Material[] mats = renderer.materials;
                Material tableDefaultMaterial = target.transform.GetComponent<TableMaterials>().table;
                mats[0] = tableDefaultMaterial;
                renderer.materials = mats;
            }

            else if (target.tag == "PlateReturn")
            {
                MeshRenderer renderer = target.transform.Find("Worktop").GetComponent<MeshRenderer>();
                Material[] mats = renderer.materials;
                Material tableDefaultMaterial = target.transform.GetComponent<TableMaterials>().table;
                mats[0] = tableDefaultMaterial;
                renderer.materials = mats;
            } else if(target.tag == "Bin"){
                MeshRenderer renderer = target.transform.Find("Cube").GetComponent<MeshRenderer>();
                Material[] mats = renderer.materials;
                Material binDefaultMaterial = target.transform.GetComponent<BinMaterials>().bin;
                mats[0] = binDefaultMaterial;
                renderer.materials = mats;
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
                if(crateType.tag == "Top Crate"){
                    Material[] topMats = topRenderer.materials;
                    Material topCrateHighlightedMaterial = target.transform.GetComponent<CrateMaterials>().top_crate_highlighted;
                    topMats[0] = topCrateHighlightedMaterial;
                    topMats[1] = topCrateHighlightedMaterial;
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

                GameObject utensil = target.GetComponent<CookingStationScript>().utensilOnTop;
                if(utensil != null){
                    string utensilName = target.GetComponent<CookingStationScript>().utensilOnTopString;
                    if(utensilName == "Pot"){
                        MeshRenderer utensilRenderer = utensil.transform.Find("Pot/Pot").GetComponent<MeshRenderer>();
                        Material[] utensilMats = utensilRenderer.materials;
                        Material utensilHighlightedMaterial = utensil.transform.GetComponent<PotMaterials>().pot_highlighted;
                        utensilMats[0] = utensilHighlightedMaterial;
                        utensilRenderer.materials = utensilMats;
                    } else if(utensilName == "Pan"){
                        MeshRenderer utensilRenderer = utensil.transform.Find("Pan/Pan").GetComponent<MeshRenderer>();
                        Material[] utensilMats = utensilRenderer.materials;
                        Material utensilHighlightedMaterial = utensil.transform.GetComponent<PanMaterials>().pan_highlighted;
                        utensilMats[0] = utensilHighlightedMaterial;
                        utensilRenderer.materials = utensilMats;
                    }
                }
            } else if (target.tag == "PlateStation"){
                MeshRenderer renderer = target.transform.Find("Worktop").GetComponent<MeshRenderer>();
                Material[] mats = renderer.materials;
                Material tableHighlightedMaterial = target.transform.GetComponent<TableMaterials>().table_highlighted;
                mats[0] = tableHighlightedMaterial;
                renderer.materials = mats;
            } else if (target.tag == "PlateReturn"){
                 MeshRenderer renderer = target.transform.Find("Worktop").GetComponent<MeshRenderer>();
                 Material[] mats = renderer.materials;
                 Material tableHighlightedMaterial = target.transform.GetComponent<TableMaterials>().table_highlighted;
                 mats[0] = tableHighlightedMaterial;
                 renderer.materials = mats;
            } else if (target.tag == "Bin"){
                 MeshRenderer renderer = target.transform.Find("Cube").GetComponent<MeshRenderer>();
                 Material[] mats = renderer.materials;
                 Material binHighlightedMaterial = target.transform.GetComponent<BinMaterials>().bin_highlighted;
                 mats[0] = binHighlightedMaterial;
                 renderer.materials = mats;
            }
        }
    }
}
