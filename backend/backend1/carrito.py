class Carrito:
    #aca inicializo el carrito
    def __init__(self, request):
        self.request = request
        self.session = request.session
        carrito = self.session["carrito"] # defino la variable carrito
        if not carrito:
            carrito = self.session["carrito"] = {} #el if not es para comprobar que sino existe la igualamos y va a ser un diccionario
        
        self.carrito = carrito

    # def agregar(self,total ):
    #     id = str(total.id)
    #     if id not in self.carrito.keys():
    #         self.carrito[id]={
    #             "total_id :" total.id,
    #             "nombre": nombre_cochera

    #         }
    #     else:
    #         self.carrito[id]["cantidad"] +=1
    #         self.carrito

