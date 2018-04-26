import * as THREE from 'three'

var camera, scene, renderer
var geometry, material, mesh

function init (elem) {
  camera = new THREE.PerspectiveCamera(70, window.innerWidth / (window.innerHeight / 2), 0.01, 10)
  camera.position.z = 1

  scene = new THREE.Scene()

  geometry = new THREE.BoxGeometry(0.5, 0.5, 0.5)
  material = new THREE.MeshNormalMaterial()

  mesh = new THREE.Mesh(geometry, material)
  scene.add(mesh)

  renderer = new THREE.WebGLRenderer({ antialias: true })
  renderer.setSize(window.innerWidth, window.innerHeight / 2)
  elem.appendChild(renderer.domElement)
}

function animate () {
  requestAnimationFrame(animate)
  mesh.rotation.x += 0.01
  mesh.rotation.y += 0.02

  renderer.render(scene, camera)
}

export default {
  start (elem) {
    init(elem)
    animate()
  }
}
