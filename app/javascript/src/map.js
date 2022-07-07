let marker = [];
let infoWindow = [];
let contentString = [];

function initMap() {
    const center_of_the_map = {
      lat: parseFloat(gon.landmarks[0]['latitude']),
      lng: parseFloat(gon.landmarks[0]['longitude'])
    };
    const map = new google.maps.Map(document.getElementById("map"), {
      zoom: 6,
      center: center_of_the_map
    });
    for (let i = 0; i < gon.landmarks.length; i++) {
      markerLatLng = new google.maps.LatLng(gon.landmarks[i]['latitude'], gon.landmarks[i]['longitude']);
      marker[i] = new google.maps.Marker({
        position: markerLatLng,
        map
      });
      // マーカーをクリックした時に表示する内容
      contentString[i] =
      '<div name="marker" class="map">' +
        gon.landmarks[i]['name'] +
      '</div>';
      //infoWindowを定義
      infoWindow[i] = new google.maps.InfoWindow({
        content: contentString[i],
      });
      markerEvent(i); 
    }
}
//マーカーをクリックした時のイベントを設定
function markerEvent(i) {
  marker[i].addListener("click", () => {
    infoWindow[i].open({
      anchor: marker[i],
      map,
      shouldFocus: false,
    });
  });
}
window.initMap = initMap;
