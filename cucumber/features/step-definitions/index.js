var {Given} = require('cucumber');
var {When} = require('cucumber');
var {Then} = require('cucumber');
var {expect} = require('chai');

Given('I go to losestudiantes home screen', () => {
  browser.url('/');
  if($('button=Cerrar').isDisplayed()) {
    $('button=Cerrar').click();
  }
});

When('I open the login screen', () => {
  $('button=Ingresar').waitForExist(5000);
  $('button=Ingresar').waitForDisplayed(5000);
  $('button=Ingresar').click();
});

When('I fill a wrong email and password', () => {
  var cajaLogIn = $('.cajaLogIn');

  var mailInput = cajaLogIn.$('input[name="correo"]');
  mailInput.click();
  mailInput.setValue('wrongemail@example.com');

  var passwordInput = cajaLogIn.$('input[name="password"]');
  passwordInput.click();
  passwordInput.setValue('123467891');
});

When('I try to login', () => {
  var cajaLogIn = $('.cajaLogIn');
  cajaLogIn.$('button=Ingresar').click();
});
When(/^I fill registration with (.*), (.*), (.*), (.*) and (.*)$/ , (name, last_name, terms, email, password) => {
 var cajaSignUp = $('.cajaSignUp');
 browser.pause(1000);
 var nameInput = cajaSignUp.$('input[name="nombre"]');
 nameInput.click();
 nameInput.keys(name);
 var lastNameInput = cajaSignUp.$('input[name="apellido"]');
 lastNameInput.click();
 lastNameInput.keys(last_name);
 var mailInput = cajaSignUp.$('input[name="correo"]');
 mailInput.click();
 mailInput.keys(email);
 var facultyInput = cajaSignUp.$('select[name="idPrograma"]');
 facultyInput.click();
 facultyInput.$('option[value="66"]').click();
  browser.pause(1000);
 var termsInput = cajaSignUp.$('input[name="acepta"]');
 if(termsInput.value != terms)
 {
     termsInput.click();
 }
 var passwordInput = cajaSignUp.$('input[name="password"]');
 passwordInput.click();
 passwordInput.keys(password)
});

When(/^I fill with (.*) and (.*)$/ , (email, password) => {
  var cajaLogIn = $('.cajaLogIn');

 var mailInput = cajaLogIn.$('input[name="correo"]');
 mailInput.click();
 mailInput.keys(email);

 var passwordInput = cajaLogIn.$('input[name="password"]');
 passwordInput.click();
 passwordInput.keys(password)
});
When('I try to register', () => {
  var cajaLogIn = $('.cajaSignUp');
  cajaLogIn.$('button=Registrarse').click();
});
Then('I expect to see {string}', error => {
 $('.aviso.alert.alert-danger').waitForDisplayed(5000);
 var alertText = browser.$('.aviso.alert.alert-danger').getText();
 expect(alertText).to.include(error);
});

Then('I expect to be registered', () => {
  $('.sweet-alert').waitForDisplayed(5000);
});
Then('I expect to log in', () => {
  $('div[title="cuenta"]').waitForDisplayed(5000);
});

Then('I expect to not be able to login', () => {
  $('.aviso.alert.alert-danger').waitForDisplayed(5000);
});

