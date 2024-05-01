package apifestivos.apifestivos.entidades;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "festivo")
public class Festivo {
    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Integer id;

    @Column(name = "nombre", length = 100)
    private String nombre;

    @Column(name = "dia")
    private Integer dia;

    @Column(name = "mes")
    private Integer mes;

    @Column(name = "diaspascua")
    private Integer diasPascua;

    @JsonFormat(pattern = "yyyy/MM/dd")
    private Date fecha;

    @ManyToOne
    @JoinColumn(name = "idtipo", referencedColumnName = "id")
    private Tipo tipo;

    public Festivo(Date fecha, String nombre, Tipo tipo) {
        this.nombre = nombre;
        this.tipo = tipo;
        this.fecha = fecha;
    }
}
