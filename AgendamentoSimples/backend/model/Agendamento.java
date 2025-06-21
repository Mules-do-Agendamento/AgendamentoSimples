package model;

import java.time.LocalDateTime;

public class Agendamento {
    private int idAgendamento;
    private LocalDateTime dataHora;
    private String status;
    
    private int idCliente;
    private int idProfissional;
    private int idServico;

    // Construtores, Getters e Setters devem ser implementados aqui.

    public void confirmar() {
        this.status = "Confirmado";
    }

    public void cancelar() {
        this.status = "Cancelado";
    }
}