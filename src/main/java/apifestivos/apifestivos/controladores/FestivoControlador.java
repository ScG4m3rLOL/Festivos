package apifestivos.apifestivos.controladores;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import apifestivos.apifestivos.entidades.Festivo;
import apifestivos.apifestivos.interfaces.IFestivoServicio;

@RestController
@RequestMapping("/festivos")
public class FestivoControlador {

    @Autowired
    private IFestivoServicio festivoServicio;

    @CrossOrigin(origins = "*")
    @GetMapping("verificar/{year}/{month}/{day}")
    public String verificarFestivo(
            @PathVariable Integer year,
            @PathVariable Integer month,
            @PathVariable Integer day) {

        try {
            String fecha = String.format("%04d/%02d/%02d", year, month, day);

            SimpleDateFormat formatoFecha = new SimpleDateFormat("yyyy/MM/dd");
            Date fechaParseada = formatoFecha.parse(fecha);
            return festivoServicio.esFestivo(fechaParseada) ? "Es festivo." : "No es festivo.";

        } catch (NumberFormatException | ParseException e) {
            return "Solicitud inválida. Por favor, revise el formato. Debe seguir el patrón yyyy/MM/dd.";
        }
    }

    @CrossOrigin(origins = "*")
    @GetMapping("listar/{year}")
    public List<Festivo> listar(@PathVariable Integer year) {
        return festivoServicio.obtenerFestivos(year);
    }
}
