<template>
  <ZApp v-if="!errors">
    <div class="container">
      <h1>Zoov</h1>
      <ul class="list">
        <li>
          <img
            src="~/assets/pins-selected.png"
          >
          <span>
            Bike selected
          </span>
        </li>
        <li>
          <img
            src="~/assets/pins-full.png"
          >
          <span>
            Bike battery > 60%
          </span>
        </li>
        <li>
          <img
            src="~/assets/pins-middle.png"
          >
          <span>
            Bike battery between 25% & 60%
          </span>
        </li>
        <li>
          <img
            src="~/assets/pins-low.png"
          >
          <span>
            Bike battery &lt; 25%
          </span>
        </li>
      </ul>
      <GMap
        ref="gMap"
        :cluster="{options: {styles: clusterStyle}}"
        :center="{lat: 48.866667, lng: 2.333333}"
        :options="{fullscreenControl: true, streetViewControl: false, mapTypeControl: false, zoomControl: true, gestureHandling: 'cooperative', styles: mapStyle}"
        :zoom="6"
        @bounds_changed="checkForMarkers"
      >
        <GMapMarker
          v-for="bike in bikes"
          :key="bike.id"
          :position="{lat: bike.lat, lng: bike.lng}"
          :options="{icon: bike === currentLocation ? pins.selected : bike.battery_level > 60 ? pins.full : bike.battery_level <= 60 && bike.battery_level >= 25 ? pins.middle : pins.low}"
          @click="currentLocation = bike"
        >
          <GMapInfoWindow :options="{maxWidth: 500}">
            <b>{{ bike.serial_number }}</b>
            <br>
            <br>
            <ul class="window_info">
              <li>
                Availability:
                <ZIcon
                  v-if="bike.service_status == 1"
                  v-text="'check-circle'"
                />
                <ZIcon
                  v-else-if="bike.service_status == 2"
                  v-text="'minus-circle'"
                />
                <ZIcon
                  v-else-if="bike.service_status == 3"
                  v-text="'circle-slash'"
                />
              </li>
              <li>
                Battery level:
                {{ bike.battery_level }}
                <ZIcon
                  v-text="'battery-bolt'"
                />
              </li>
              <li>
                Order:
                <ZIcon
                  v-if="bike.in_order == 1"
                  v-text="'check-circle'"
                />
                <ZIcon
                  v-else
                  v-text="'circle-slash'"
                />
              </li>
              <li>
                <ZButton
                  tiny
                  @click.native="deleteBike(bike.id)"
                >
                  Delete
                </ZButton>
              </li>
            </ul>
          </GMapInfoWindow>
        </GMapMarker>
      </GMap>
    </div>
  </ZApp>
  <ZApp v-else>
    <div class="container">
      Fetch error
    </div>
  </ZApp>
</template>

<script>

export default {

  asyncData ({ $axios }) {
    return $axios.$get('http://localhost:8081/bikes/')
      .then((res) => {
        return { bikes: res }
      })
      .catch((err) => {
        return { error: err }
      })
  },

  data () {
    return {
      currentLocation: {},
      pins: {
        selected:
          require('~/assets/pins-selected.png'),
        full:
          require('~/assets/pins-full.png'),
        low:
          require('~/assets/pins-low.png'),
        middle:
          require('~/assets/pins-middle.png')
      },
      clusterStyle: [
        {
          url:
            'https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m1.png',
          width: 56,
          height: 56,
          textColor: '#fff'
        }
      ],
      mapStyle: [
        {
          featureType: 'all',
          elementType: 'labels.text.fill',
          stylers: [
            {
              color: '#ffffff'
            }
          ]
        },
        {
          featureType: 'all',
          elementType: 'labels.text.stroke',
          stylers: [
            {
              visibility: 'on'
            },
            {
              color: '#3e606f'
            },
            {
              weight: 2
            },
            {
              gamma: 0.84
            }
          ]
        },
        {
          featureType: 'all',
          elementType: 'labels.icon',
          stylers: [
            {
              visibility: 'off'
            }
          ]
        },
        {
          featureType: 'administrative',
          elementType: 'geometry',
          stylers: [
            {
              weight: 0.6
            },
            {
              color: '#313536'
            }
          ]
        },
        {
          featureType: 'landscape',
          elementType: 'geometry',
          stylers: [
            {
              color: '#44a688'
            }
          ]
        },
        {
          featureType: 'poi',
          elementType: 'geometry',
          stylers: [
            {
              color: '#13876c'
            }
          ]
        },
        {
          featureType: 'poi.attraction',
          elementType: 'geometry.stroke',
          stylers: [
            {
              color: '#f5e4e4'
            },
            {
              visibility: 'off'
            }
          ]
        },
        {
          featureType: 'poi.attraction',
          elementType: 'labels',
          stylers: [
            {
              visibility: 'on'
            },
            {
              lightness: '14'
            }
          ]
        },
        {
          featureType: 'poi.park',
          elementType: 'geometry',
          stylers: [
            {
              color: '#13876c'
            },
            {
              visibility: 'simplified'
            }
          ]
        },
        {
          featureType: 'road',
          elementType: 'geometry',
          stylers: [
            {
              color: '#067372'
            },
            {
              lightness: '-20'
            }
          ]
        },
        {
          featureType: 'transit',
          elementType: 'geometry',
          stylers: [
            {
              color: '#357374'
            }
          ]
        },
        {
          featureType: 'water',
          elementType: 'geometry',
          stylers: [
            {
              color: '#004757'
            }
          ]
        }
      ]
    }
  },

  methods: {
    checkForMarkers () {
      this.bikes.forEach((bike, i) => {
        bike.visible = this.$refs.gMap.map
          .getBounds()
          .contains(this.$refs.gMap.markers[i].getPosition())
      })
    },

    deleteBike (id) {
      return this.$axios.delete(`http://localhost:8081/bikes/${id}`)
        .then((res) => {
          window.location.reload()
        })
        .catch((err) => {
          return err
        })
    }
  }
}

</script>

<style>
.container {
  text-align: center;
}

.list li {
  list-style-type: none;
}

.window_info li {
  display: flex;
  align-items: center;
}
</style>
