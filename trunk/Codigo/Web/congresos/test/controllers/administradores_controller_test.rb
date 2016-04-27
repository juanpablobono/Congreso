require 'test_helper'

class AdministradoresControllerTest < ActionController::TestCase
  setup do
    @administrador = administradores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:administradores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create administrador" do
    assert_difference('Administrador.count') do
      post :create, administrador: { activo: @administrador.activo, apellido: @administrador.apellido, email: @administrador.email, nombre: @administrador.nombre, password: 'secret', password_confirmation: 'secret', telefono: @administrador.telefono, tipo: @administrador.tipo, usuario: @administrador.usuario }
    end

    assert_redirected_to administrador_path(assigns(:administrador))
  end

  test "should show administrador" do
    get :show, id: @administrador
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @administrador
    assert_response :success
  end

  test "should update administrador" do
    patch :update, id: @administrador, administrador: { activo: @administrador.activo, apellido: @administrador.apellido, email: @administrador.email, nombre: @administrador.nombre, password: 'secret', password_confirmation: 'secret', telefono: @administrador.telefono, tipo: @administrador.tipo, usuario: @administrador.usuario }
    assert_redirected_to administrador_path(assigns(:administrador))
  end

  test "should destroy administrador" do
    assert_difference('Administrador.count', -1) do
      delete :destroy, id: @administrador
    end

    assert_redirected_to administradores_path
  end
end
