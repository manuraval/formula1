/**
 * 
 */

$(function () {

                $("#mod").on("click", function () {

                    $.validator.addMethod("metodonombre", function (value, element) {
                        return this.optional(element) || /^[a-zA-Z," "]+$/i.test(value);
                    }, "No se Permitan numeros");

                    $.validator.addMethod("metodonumero", function (value, element) {
                        return this.optional(element) || /[0-9]{2}\$/g.test(value);
                    }, "El formato es 00");

                    $("#formulario").validate({
                        // Reglas
                        rules: {
                            numPiloto: {required: true, metodonumero: true},
                            nombre: {required: true, metodonombre: true, maxlength: 20},
                            debut: {required: true, metodonumero: true, maxlength: 25},
                            mundiales: {required: true, metodonumero: true, maxlength: 25},
                            sueldo: {required: true, metodonumero: true},
                            temporada: {required: true, maxlength: 15}

                        },
                        messages: {
                            //Mensajes 
                            numPiloto: {required: 'El campo es obligatorio', errorClass: "error"},
                            nombre: {required: 'El campo es obligatorio', errorClass: "error"},
                            debut: {required: 'El campo es obligatorio', errorClass: "error"},
                            mundiales: {required: 'El campo es obligatorio', errorClass: "error", },
                            sueldo: {required: 'el campo es obligatorio', errorClass: "error"},
                            temporada: {required: 'el campo es obligatorio', errorClass: "error"}
                        }
                    });
                });
            });