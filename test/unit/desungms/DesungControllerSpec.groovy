package desungms



import grails.test.mixin.*
import spock.lang.*

@TestFor(DesungController)
@Mock(Desung)
class DesungControllerSpec extends Specification {

    def populateValidParams(params) {
        assert params != null
        // TODO: Populate valid properties like...
        //params["name"] = 'someValidName'
    }

    void "Test the index action returns the correct model"() {

        when:"The index action is executed"
            controller.index()

        then:"The model is correct"
            !model.desungInstanceList
            model.desungInstanceCount == 0
    }

    void "Test the create action returns the correct model"() {
        when:"The create action is executed"
            controller.create()

        then:"The model is correctly created"
            model.desungInstance!= null
    }

    void "Test the save action correctly persists an instance"() {

        when:"The save action is executed with an invalid instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'POST'
            def desung = new Desung()
            desung.validate()
            controller.save(desung)

        then:"The create view is rendered again with the correct model"
            model.desungInstance!= null
            view == 'create'

        when:"The save action is executed with a valid instance"
            response.reset()
            populateValidParams(params)
            desung = new Desung(params)

            controller.save(desung)

        then:"A redirect is issued to the show action"
            response.redirectedUrl == '/desung/show/1'
            controller.flash.message != null
            Desung.count() == 1
    }

    void "Test that the show action returns the correct model"() {
        when:"The show action is executed with a null domain"
            controller.show(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the show action"
            populateValidParams(params)
            def desung = new Desung(params)
            controller.show(desung)

        then:"A model is populated containing the domain instance"
            model.desungInstance == desung
    }

    void "Test that the edit action returns the correct model"() {
        when:"The edit action is executed with a null domain"
            controller.edit(null)

        then:"A 404 error is returned"
            response.status == 404

        when:"A domain instance is passed to the edit action"
            populateValidParams(params)
            def desung = new Desung(params)
            controller.edit(desung)

        then:"A model is populated containing the domain instance"
            model.desungInstance == desung
    }

    void "Test the update action performs an update on a valid domain instance"() {
        when:"Update is called for a domain instance that doesn't exist"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'PUT'
            controller.update(null)

        then:"A 404 error is returned"
            response.redirectedUrl == '/desung/index'
            flash.message != null


        when:"An invalid domain instance is passed to the update action"
            response.reset()
            def desung = new Desung()
            desung.validate()
            controller.update(desung)

        then:"The edit view is rendered again with the invalid instance"
            view == 'edit'
            model.desungInstance == desung

        when:"A valid domain instance is passed to the update action"
            response.reset()
            populateValidParams(params)
            desung = new Desung(params).save(flush: true)
            controller.update(desung)

        then:"A redirect is issues to the show action"
            response.redirectedUrl == "/desung/show/$desung.id"
            flash.message != null
    }

    void "Test that the delete action deletes an instance if it exists"() {
        when:"The delete action is called for a null instance"
            request.contentType = FORM_CONTENT_TYPE
            request.method = 'DELETE'
            controller.delete(null)

        then:"A 404 is returned"
            response.redirectedUrl == '/desung/index'
            flash.message != null

        when:"A domain instance is created"
            response.reset()
            populateValidParams(params)
            def desung = new Desung(params).save(flush: true)

        then:"It exists"
            Desung.count() == 1

        when:"The domain instance is passed to the delete action"
            controller.delete(desung)

        then:"The instance is deleted"
            Desung.count() == 0
            response.redirectedUrl == '/desung/index'
            flash.message != null
    }
}
