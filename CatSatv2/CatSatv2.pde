import googlemapper.*;


PImage map;
GoogleMapper gMapper;

 
 float mapCenterLat = 21.8857347;
 float mapCenterLon = -102.2912996;
 float latitud;
 float longitud;
 float minlatCatSatY;
 float maxlatCatSatY;
 float minlongCatSatX;
 float maxlongCatSatX;
 int zoomLevel = 10;
 String mapType = GoogleMapper.MAPTYPE_HYBRID;
 float CatSatLatitud;
 float CatSatLongitud;
 int mapWidth = 900;
 int mapHeight = 600;
 FloatList coordenadasX;
FloatList coordenadasY;
void setup() {
  
 size(1080,600);
 minlatCatSatY = 22.2683885;
 maxlatCatSatY = 21.4986971;
 minlongCatSatX = -102.9348029;
 maxlongCatSatX = -101.6658820;
 CatSatLatitud = mapCenterLat;
 CatSatLongitud = mapCenterLon;
   
   gMapper = new GoogleMapper(mapCenterLat, mapCenterLon, zoomLevel, mapType, mapWidth, mapHeight);
  map = gMapper.getMap();
      coordenadasX = new FloatList();
    coordenadasY= new FloatList();
}


void draw(){
  
  background(0);
  image(map, 0, 0);
  
  CatSatLatitud = CatSatLatitud +random(-0.0001,0.0005);
  CatSatLongitud = CatSatLongitud - random(-0.002,0.002);
  latitud = map(CatSatLatitud,minlatCatSatY, maxlatCatSatY, 0.0, mapHeight);
  longitud = map(CatSatLongitud,minlongCatSatX,maxlongCatSatX, 0.0, mapWidth);
  coordenadasX.append(longitud);
  coordenadasY.append(latitud);
   
    for(int i = 0; i< coordenadasX.size() ; i++) {
  if(i>0){
  strokeWeight(3);
  stroke(255);
  line(coordenadasX.get(i), coordenadasY.get(i),coordenadasX.get(i-1),coordenadasY.get(i-1));
  }
 }
 noStroke();
 ellipse(longitud,latitud, 30,30);
  
}