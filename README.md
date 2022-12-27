# Fake_Store_flutter

This is simple e commerce flutter application which has two screens- Homepage,Product details page.


### App architecture pattern -> MVVM [Model View ViewModel]
 
[Model:Holds backend logic,
 View:The user interface where all the visible views and animations are housed.
 This is the layer where users interacts with app.
 Viewmodel: It is the ui adapter/controller which sits in between other two.
 In our case bloc plays the role as viewmodel. 
]

State Management System -> Bloc[Business logic component ...

This is a flutter application where products are fetched from fakestoreapi.com API.

In the app the clean architecture is maintained...So there is  seperation of concerns.
The app is mainly architected into three layers..

1.Data layer (consists of Remote data source,local data source(Hive - a lightweight nosql local database),models and repositories(implementation).

2.Domain layer (consists of Entities,Repository(contract)interface,Use cases)

3.Presentation layer (Bloc,views)

This project maintains the ### solid principles ### and di.So loose coupling is achieved through dependency inversion principle.
which also facilitates unit testing.

For network calls Dio package is used and also for ###intercepting### the http requests which facilitates us using ApiInterceptor(for network exception handling) and LoggingInterceptor ...


### Mechanism:
In the home page ProductsBloc triggers fetchProducts event which then invokes call method of use case(callablle class) which has the repository as dependency.Then though it it calls the getProducts method. of repository implementation class.This class have three dependencies(remote database,
local database,network info. By network info instance internet connection is checked...If there is internet the getProducts method of remote datasource is called which ultimately gets the json response.Finaly after decoding it returns the List<ProductModel> to repository which then caches the product in the local database after encoding. If there is no internet internet connection it gets the encoded products from Local database.Then after decoding it retuns the data to usecase which further gets reciebed by bloc which finally emit states to ui.  

### Functional error handling by Dartz ###

By using the dartz package we are able to write a method which can hold two data types at the same type(failure,success).
The exceptions are handled in the repository implementation class.If it gets the the success it returns the List of products in the use case which returns it to bloc.
In case of catching exceptions the repository implementation class convert it to failures and the error flow is then continued to usecase and bloc.
In bloc we have the result which needs to handle the both scenario (failure and succcess).
The result has a method named fold which can handle the both scenario.So based on the result bloc will emit the succcesState or errorState.    


If user presses any of the list item...It will take him to corresponding products details page.

### <<<<<<<<<<<<< Dependency injection>>>>>>>>>>>>>>>>

In stead of making the classes construct their dependencies directly(as the classes should not construct theit dependencies directly because doing so if there is a modification in a class it's dependant class will be affected(also need to be modified.So it is good to constuct them somewhere outside and then pass the instances so it will not break the system.
I've used the <<<<<< service locator >>>>>>>>> design pattern 
where all the dependencies are registered in a centralized place in a method before the app starts.More specifically the method inside
service locator where all the dependencies are registered is called before runApp() method...Then the dependencies are registered 
before starting the app unless it is registered lazily..In case of lazy singleton or lazy factory the dependencies are registered when they are called(Thus facilitates reducing unnecssary memry leaks and reduce the start up time).

Service locator hides the creation logic of instances and also facilitates unit testing...

We registerd the core,data sources , repositories and use cases as singletons so that it returns the existing instance everytime it is called 
which reduces space complexity. But I've registered bloc as factory because registering it as singletons might invove a closed stream which
is disposed in the stateful widgets. 
