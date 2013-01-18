import dto.ReporteChequeDTO
import org.codehaus.groovy.grails.plugins.jasper.JasperReportDef
import org.springframework.dao.DataIntegrityViolationException

class ChequeController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def reporteChequeService
    def jasperService

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [chequeInstanceList: Cheque.list(params), chequeInstanceTotal: Cheque.count()]
    }

    def create() {
        [chequeInstance: new Cheque(params)]
    }

    def save() {
        def chequeInstance = new Cheque(params)
        if (!chequeInstance.save(flush: true)) {
            render(view: "create", model: [chequeInstance: chequeInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'cheque.label', default: 'Cheque'), chequeInstance.id])
        redirect(action: "show", id: chequeInstance.id)
    }

    def show(Long id) {
        def chequeInstance = Cheque.get(id)
        if (!chequeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cheque.label', default: 'Cheque'), id])
            redirect(action: "list")
            return
        }

        [chequeInstance: chequeInstance]
    }

    def edit(Long id) {
        def chequeInstance = Cheque.get(id)
        if (!chequeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cheque.label', default: 'Cheque'), id])
            redirect(action: "list")
            return
        }

        [chequeInstance: chequeInstance]
    }

    def update(Long id, Long version) {
        def chequeInstance = Cheque.get(id)
        if (!chequeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cheque.label', default: 'Cheque'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (chequeInstance.version > version) {
                chequeInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'cheque.label', default: 'Cheque')] as Object[],
                          "Another user has updated this Cheque while you were editing")
                render(view: "edit", model: [chequeInstance: chequeInstance])
                return
            }
        }

        chequeInstance.properties = params

        if (!chequeInstance.save(flush: true)) {
            render(view: "edit", model: [chequeInstance: chequeInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'cheque.label', default: 'Cheque'), chequeInstance.id])
        redirect(action: "show", id: chequeInstance.id)
    }

    def delete(Long id) {
        def chequeInstance = Cheque.get(id)
        if (!chequeInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cheque.label', default: 'Cheque'), id])
            redirect(action: "list")
            return
        }

        try {
            chequeInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'cheque.label', default: 'Cheque'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cheque.label', default: 'Cheque'), id])
            redirect(action: "show", id: id)
        }
    }

    def impresionCheque = {

        ReporteChequeDTO reporteChequeDTO = reporteChequeService.reporteChequeDTO();
        def reportDef = jasperService.buildReportDefinition([_name: "Cheque-[${reporteChequeDTO.getFolio()}]", _format: "PDF", _file: "printCheque", data: [reporteChequeDTO]],
                request.getLocale(),
                null
        )
        generateResponse(reportDef)
    }

    private void generateResponse(JasperReportDef reportDef) {
        if (!reportDef.fileFormat.inline && !reportDef.parameters._inline) {
            response.setHeader("Content-disposition", "attachment; filename=" + (reportDef.parameters._name ?: reportDef.name) + "." + reportDef.fileFormat.extension);
            response.contentType = reportDef.fileFormat.mimeTyp
            response.characterEncoding = "UTF-8"
            response.outputStream << reportDef.contentStream.toByteArray()
        } else {
            render(text: reportDef.contentStream, contentType: reportDef.fileFormat.mimeTyp, encoding: reportDef.parameters.encoding ? reportDef.parameters.encoding : 'UTF-8');
        }
    }
}
