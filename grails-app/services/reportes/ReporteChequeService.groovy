package reportes

import dto.ReporteChequeDTO

class ReporteChequeService {

    def serviceMethod() {}

    ReporteChequeDTO reporteChequeDTO() {
        ReporteChequeDTO reporteChequeDTO = new ReporteChequeDTO();
        Long folio = 51
        String fecha = "2 Enero 2013"
        BigDecimal monto = 1.00
        String titulo = "Al portador"
        String totalMoneda = "Un dolares americanos 00/100 USD"
        String piePagina = "Inical"

        reporteChequeDTO.setFolio(folio);
        reporteChequeDTO.setFecha(fecha);
        reporteChequeDTO.setMonto(monto);
        reporteChequeDTO.setTitulo(titulo);
        reporteChequeDTO.setTotalMoneda(totalMoneda);
        reporteChequeDTO.setPiePagina(piePagina);

        return reporteChequeDTO
    }
}
