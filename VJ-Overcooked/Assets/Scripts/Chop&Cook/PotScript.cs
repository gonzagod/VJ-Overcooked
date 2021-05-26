using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PotScript : MonoBehaviour
{

    public int numIngredients = 0;
    public List<string> ingredientNames = new List<string>();
    public float timeCooked = 0;
    public float maxTimeToCook = 10;
    public bool burned = false;
    private GameObject parentPlace = null;
    private GameObject content = null;
    private GameObject soup = null;
    private GameObject steam = null;
    private GameObject burnedContent = null;

    // Start is called before the first frame update
    void Start()
    {
        content = gameObject.transform.Find("Content").gameObject;
        soup = content.transform.Find("Soup").gameObject;
        steam = content.transform.Find("PFX_PotSteam").gameObject;
        burnedContent = content.transform.Find("Burned").gameObject;
    }

    // Update is called once per frame
    void Update()
    {
        if(numIngredients < 1) desactivateContent();
        if(numIngredients > 0) activateContent();
        checkBurned();
        soup.GetComponent<Animator>().SetInteger("numIngredients", numIngredients);
        parentPlace = gameObject.transform.parent.gameObject;
        if(parentPlace.name == "AttachPoint"){
            if(parentPlace.transform.parent.gameObject.tag == "CookingStation"){
                if(numIngredients > 0) timeCooked += Time.deltaTime;
            }
        }
        if(timeCooked >= 15f && !burned) burnPot();
    }

    public void addIngredient(string foodName){
        ingredientNames.Add(foodName);
        numIngredients++;
        switch(numIngredients){
            case 1:
                soup.transform.position = soup.transform.position + new Vector3(0,-0.34f, 0);
                break;
            case 2:
                soup.transform.position = soup.transform.position + new Vector3(0, 0.15f, 0);
                break;
            case 3:
                soup.transform.position = soup.transform.position + new Vector3(0, 0.19f, 0);
                break;
            default:
                break;
        }
        updateIcons();
        if(numIngredients > 1) timeCooked /= 2;
    }

    public void cleanPot(){
        numIngredients = 0;
        ingredientNames.Clear();
    }

    private void updateIcons(){
        string iconUsed = "";
        if(!burned){
            switch(numIngredients){
                case 1:
                    transform.Find("OneIcon").gameObject.SetActive(true);
                    transform.Find("TwoIcons").gameObject.SetActive(false);
                    transform.Find("ThreeIcons").gameObject.SetActive(false);
                    iconUsed = "OneIcon";
                    break;
                case 2:
                    transform.Find("OneIcon").gameObject.SetActive(false);
                    transform.Find("TwoIcons").gameObject.SetActive(true);
                    transform.Find("ThreeIcons").gameObject.SetActive(false);
                    iconUsed = "TwoIcons";
                    break;
                case 3:
                    transform.Find("OneIcon").gameObject.SetActive(false);
                    transform.Find("TwoIcons").gameObject.SetActive(false);
                    transform.Find("ThreeIcons").gameObject.SetActive(true);
                    iconUsed = "ThreeIcons";
                    break;
                default:
                    transform.Find("OneIcon").gameObject.SetActive(false);
                    transform.Find("TwoIcons").gameObject.SetActive(false);
                    transform.Find("ThreeIcons").gameObject.SetActive(false);
                    break;
            }
            SpriteRenderer iconRenderer = null;
            if(iconUsed != ""){
                Sprite mushroomSprite = gameObject.GetComponent<PotMaterials>().Mushroom;
                Sprite tomatoSprite = gameObject.GetComponent<PotMaterials>().Tomato;
                Sprite onionSprite = gameObject.GetComponent<PotMaterials>().Onion;
                Sprite burnedSprite = gameObject.GetComponent<PotMaterials>().Burned;
                int i = 0;
                foreach(Transform icon in transform.Find(iconUsed)){
                    if(icon.tag == "Icon"){
                        iconRenderer = icon.gameObject.GetComponent<SpriteRenderer>();
                        if(ingredientNames[i] == "Mushroom") iconRenderer.sprite = mushroomSprite;
                        else if(ingredientNames[i] == "Tomato") iconRenderer.sprite = tomatoSprite;
                        else if(ingredientNames[i] == "Onion") iconRenderer.sprite = onionSprite;
                        else if(ingredientNames[i] == "Burned") iconRenderer.sprite = burnedSprite;
                        ++i;
                    }
                }
            }
        } else{
            transform.Find("OneIcon").gameObject.SetActive(false);
            transform.Find("TwoIcons").gameObject.SetActive(false);
            transform.Find("ThreeIcons").gameObject.SetActive(false);
            transform.Find("BurnedIcon").gameObject.SetActive(true);
        }
    }

    private void burnPot(){
        cleanPot();
        burned = true;
        updateIcons();
    }

    private void activateContent(){
        //content.SetActive(true);
        soup.SetActive(true);
        steam.SetActive(true);
    }

    private void desactivateContent(){
        //content.SetActive(false);
        soup.SetActive(false);
        steam.SetActive(false);
    }

    private void checkBurned(){
        if(burned) burnedContent.SetActive(true);
        else burnedContent.SetActive(false);
    }
}
