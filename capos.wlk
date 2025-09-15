object rolando {
 const poderBase = 10
 const mochila   = #{}
 var   hogar     = castillo
 var   estaEnElHogar = false
 var   capacidadDeMochila        = 2
 var   historialDeObjetos        = []
 var   cantUsosEspadaDD          = 0
 var   cantDeBatallasConCollar   = 0
 //consultas
 method poderBase() {
   return poderBase
 }
 method mochila() {
   return mochila
 }
 method historialDeObjetos() {
   return historialDeObjetos
 }

 //setters
 method capacidadDeMochila(_capacidadDeMochila) {
   capacidadDeMochila = _capacidadDeMochila
 }
 method hogar(_hogar) {
   hogar = _hogar
 }
 method estaEnElHogar(_bool) {
   estaEnElHogar = _bool
 }

 // comportamientos.
 method poderDePelea() {
   return poderBase + espadaDelDestino.poder(self) + collarDivino.poder(self) + ArmaduraDeAceroValynio.poder()
 }
 method artefactosDeRolando() {
   return mochila.union(hogar.vaul())
 }

 method equiparArtefacto(artefacto){ //Equipar y quitar artefacto de la mochila.
    historialDeObjetos.add(artefacto)
    self.validarEspacioDeMochila()
    mochila.add(artefacto)
 }
 method quitarArtefacto(artefacto) {
   mochila.remove(artefacto)
 }
 method validarEspacioDeMochila() {
   if (mochila.size() == capacidadDeMochila){
    self.error("Tienes demasiados elementos en la mochila.")
   }
 }
 method tieneArtefacto(artefacto) {
   return self.artefactosDeRolando().contains(artefacto)
 }
 method guardarObjetos() {
   self.validarQueRolandoEstaEnElCastillo()
   hogar.guardarEnVaul(mochila)
   mochila.clear()
 }
 method validarQueRolandoEstaEnElCastillo() {
   if (not estaEnElHogar){
    self.error("Rolando no se encuentra en el castillo")
   }
 }
}

object castillo{
 const vaul = #{}
 method vaul() {
   return vaul
 }
 method agregarArtefacto(artefacto) {
   vaul.add(artefacto)
 }
 method guardarEnVaul(artefactos) {
   vaul.addAll(artefactos)
 }
}

object espadaDelDestino {
  method poder(personaje) {
    var poder = personaje.poderBase()
    if (personaje.cantUsosDeEspada() > 1){
      poder = poder - (personaje.poderBase() % 50)
    }
    return poder
  }
}

object libroDeHechizos{
  method name() {
    
  }
}

object collarDivino{
 const poder = 3 
 method poder(personaje) {
  var poderBase = poder
   if (personaje.poderBase() > 6){
    poderBase = + personaje.cantBatallas() 
   }
  return poderBase
 } 
}

object ArmaduraDeAceroValynio {
  const poder = 6
  method poder() {
    return poder
  }
}