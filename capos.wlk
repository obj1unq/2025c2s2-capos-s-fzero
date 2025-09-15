object rolando {
 const mochila = #{}
 var   capacidadDeMochila = 2
 method equiparArtefacto(artefacto){ //Equipar y quitar artefacto de la mochila.
    self.validarEspacioDeMochila()
    mochila.add(artefacto)
 }
 method quitarArtefacto(artefacto) {
   mochila.remove(artefacto)
 }
 method validarEspacioDeMochila() {
   if (mochila.count() > capacidadDeMochila){
    self.error("Tienes demasiados elementos en la mochila.")
   }
 }
}

object castillo{
 const vaul = []
 method agregarArtefacto(artefacto) {
   vaul.add(artefacto)
 }
}

object espadaDelDestino {
  
}

object libroDeHechizos{

}

object collarDivino{
  
}

object ArmaduraDeAceroValnyo {
  
}