#Sitecore Virtual Users

## Create Virtual User
```
Sitecore.Security.Accounts.User user = Sitecore.Security.Authentication.AuthenticationManager.BuildVirtualUser("{username}", true);
Sitecore.Security.Authentication.AuthenticationManager.LoginVirtualUser(user);
```

## Setting Out Of The Box properties
```
user.Profile.{Property Name}
```

Example types of {Property Name} available:
- Email
- Name
- UserName 
- etc

## Setting Custom Properties
```
user.Profile.SetCustomProperty("UserAge", 22);
user.Profile.Save();
```

** .Save() is mandatory. In some instances, without Save() will work. Hence best practices to use Save() regardless.

## Retrieve Custom Properties
```
user.Profile.GetCustomProperty("UserAge");
```

## Retrieve Virtual User 
```
Sitecore.Security.Authentication.AuthenticationManager.LoginVirtualUser(Sitecore.Context.User);
Sitecore.Security.Accounts.User user = Sitecore.Security.Authentication.AuthenticationManager.GetActiveUser();
```

** Do note that 'Sitecore.Security.Authentication.AuthenticationManager.LoginVirtualUser(Sitecore.Context.User);' is required as without this line, it failed in Sitecore v9.0, but worked in Sitecore 8. Without this, custom properties will disappear.

** Especially during redirection

## Verifying if a user is a virtual user and authenticated
```
Sitecore.Context.User.IsAuthenticated && Sitecore.Context.User.RuntimeSettings.IsVirtual;
```

## Logout Virtual User
```
Sitecore.Security.Authentication.AuthenticationManager.Logout();
```