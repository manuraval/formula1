/**
 * 
 */

$(function () {

                $("#mod").on("click", function () {

                    $.validator.addMethod("metodonombre", function (value, element) {
                        return this.optional(element) || /^[a-zA-Z," "]+$/i.test(value);
                    }, "No se Perminten Numeros");

                    $.validator.addMethod("metodonumerocolegiado", function (value, element) {
                        return this.optional(element) || /^[0-9]{2}\/[0-9]{2}\/[0-9]{5}$/.test(value);
                    }, "El formato es 00/00/00000");

                    $("#formulario").validate({
    				// Reglas
                        rules: {
                            nColegiado: {required: true, metodonumerocolegiado: true},
                            nombre: {required: true, metodonombre: true, maxlength: 20},
                            apellidos: {required: true, metodonombre: true, maxlength: 25},
                            especialidad: {required: true, lettersonly: true, maxlength: 25},
                            password: {required: true, maxlength: 15}

                        },
                        messages: {
    				//Mensajes
                            nColegiado: {required: 'El campo es obligatorio', errorClass: "error"},
                            nombre: {required: 'El campo es obligatorio', errorClass: "error"},
                            apellidos: {required: 'El campo es obligatorio', errorClass: "error"},
                            especialidad: {required: 'El campo es obligatorio', lettersonly: 'Solo se permiten letras', errorClass: "error"},
                            password: {required: 'el campo es obligatorio', errorClass: "error"}
                        }
                    });
                });
            });