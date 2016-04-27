package arquitecturasmoviles.basico.webservice;

import arquitecturasmoviles.basico.webservice.pojo.CursosResponse;
import arquitecturasmoviles.basico.webservice.pojo.EventosResponse;
import arquitecturasmoviles.basico.webservice.pojo.GenericResponse;
import arquitecturasmoviles.basico.webservice.pojo.LoginResponse;
import retrofit.http.Field;
import retrofit.http.FormUrlEncoded;
import retrofit.http.GET;
import retrofit.http.POST;


public interface ApiService {


    @FormUrlEncoded
    @POST("/usuarios/login")
    public LoginResponse login(@Field("email") String email, @Field("contrasenia") String contrasenia);

    @FormUrlEncoded
    @POST("/usuarios/nuevo")
    public GenericResponse registro(@Field("nombre") String nombre,
                               @Field("apellido") String apellido,
                               @Field("email") String email,
                               @Field("contrasenia") String contrasenia);


    @GET("/eventos/todos")
    public EventosResponse getEventos();

    @GET("/cursos/todos")
    public CursosResponse getCursos();


    /*@FormUrlEncoded
    @POST("/Api/productos/todos")
    public ProductosResponse getProductos(@Field("usuario") int user);

    @FormUrlEncoded
    @POST("/Api/gustos/todos")
    public SaboresResponse getSabores(@Field("usuario") int user);

    @FormUrlEncoded
    @POST("/Api/clientes/crear_nuevo")
    public RegistroUsuarioResponse crearCliente(@Field("email") String email,
                                                @Field("nombre") String nombre,
                                                @Field("apellido") String apellido,
                                                @Field("contrasenia") String contrasenia);

    @GET("/Api/usuarios/todos")
    public UsuariosResponse getUsuarios();

    @FormUrlEncoded
    @POST("/api/pedidos/nuevo")
    public GenericResponse enviarPedido(@Field("pedido") String pedido);

    @GET("/api/pedidos/obtenerPendientes")
    public VentasResponse getPedidosPendientes();

    /*@GET("/Api/impresoras/todas")
    public ImpresorasResponse getImpresoras();

    @FormUrlEncoded
    @POST("/api/gustos/descontar_stock")
    public GenericResponse descontarStock(
            @Field("id") long id,
            @Field("stock") int stock
    );*/
}

