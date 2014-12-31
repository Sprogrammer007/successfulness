Successfulness.SessionController = Ember.ObjectController.extend({ 
  needs: ['currentUser'],
  email: '',
  password: '',
  ers: '',
  errors: [],

  actions: {
    logIn: function() {
      var controller = this;
      var loginSuccess = function(respond) {


        var user = controller.store.createRecord('user', {
          id: respond.id,
          email: respond.email
        });
        console.log(respond);
        controller.get('controllers.currentUser').set('content', user);
      };
      Ember.$.post("/users/sign_in",
        { 
          user: {
            email: this.get('email'), 
            password: this.get('password')  
          }
        },
        loginSuccess,
        'json'
      ).error(function(respond) {
        controller.set('errors', respond.responseJSON.message);
        return
      });
    },

    logOut: function() {
      var controller = this;
      var user = controller.get('controllers.currentUser').get('content');
      
      Ember.$.ajax({
        url: "/users/sign_out", 
        type: 'DELETE',
        success: function(respond) {
          user.deleteRecord();
          controller.get('controllers.currentUser').set('content', null);
        },
        dataType: 'json'
      });   
    }
  }
});

