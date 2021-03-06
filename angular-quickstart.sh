echo "[Angular QuickStart]"
echo "-Diretório do projeto:"
read project_folder

mkdir $project_folder

if [ "$?" = "1" ]; then
	echo "Caminho inválido!"
	exit 1
fi

cd    $project_folder

if [ "$?" = "1" ]; then
	echo "Invalid Path!"  
	exit 1
fi


echo "/**
 * System configuration for Angular 2 samples
 * Adjust as necessary for your application needs.
 */
(function(global) {
  // map tells the System loader where to look for things
  var map = {
    'app':                        'app', // 'dist',
    '@angular':                   'node_modules/@angular',
    'angular2-in-memory-web-api': 'node_modules/angular2-in-memory-web-api',
    'rxjs':                       'node_modules/rxjs'
  };
  // packages tells the System loader how to load when no filename and/or no extension
  var packages = {
    'app':                        { main: 'main.js',  defaultExtension: 'js' },
    'rxjs':                       { defaultExtension: 'js' },
    'angular2-in-memory-web-api': { main: 'index.js', defaultExtension: 'js' },
  };
  var ngPackageNames = [
    'common',
    'compiler',
    'core',
    'forms',
    'http',
    'platform-browser',
    'platform-browser-dynamic',
    'router',
    'router-deprecated',
    'upgrade',
  ];
  // Individual files (~300 requests):
  function packIndex(pkgName) {
    packages['@angular/'+pkgName] = { main: 'index.js', defaultExtension: 'js' };
  }
  // Bundled (~40 requests):
  function packUmd(pkgName) {
    packages['@angular/'+pkgName] = { main: '/bundles/' + pkgName + '.umd.js', defaultExtension: 'js' };
  }
  // Most environments should use UMD; some (Karma) need the individual index files
  var setPackageConfig = System.packageWithIndex ? packIndex : packUmd;
  // Add package entries for angular packages
  ngPackageNames.forEach(setPackageConfig);
  var config = {
    map: map,
    packages: packages
  };
  System.config(config);
})(this);" > systemjs.config.js

echo "h1 {
  color: #369;
  font-family: Arial, Helvetica, sans-serif;
  font-size: 250%;
}
body {
  margin: 2em;
}
 /*
  * See https://github.com/angular/angular.io/blob/master/public/docs/_examples/styles.css
  * for the full set of master styles used by the documentation samples
  */" > style.css

echo "{
  \"globalDependencies\": {
    \"core-js\": \"registry:dt/core-js#0.0.0+20160602141332\",
    \"jasmine\": \"registry:dt/jasmine#2.2.0+20160621224255\",
    \"node\": \"registry:dt/node#6.0.0+20160621231320\"
  }
}" > typings.json

echo "{
  \"compilerOptions\": {
    \"target\": \"es5\",
    \"module\": \"commonjs\",
    \"moduleResolution\": \"node\",
    \"sourceMap\": true,
    \"emitDecoratorMetadata\": true,
    \"experimentalDecorators\": true,
    \"removeComments\": false,
    \"noImplicitAny\": false
  }
}" > tsconfig.json

echo "{
  \"name\": \"angular2-quickstart\",
  \"version\": \"1.0.0\",
  \"scripts\": {
    \"start\": \"tsc && concurrently \\\"npm run tsc:w\\\" \\\"npm run lite\\\" \",
    \"lite\": \"lite-server\",
    \"postinstall\": \"typings install\",
    \"tsc\": \"tsc\",
    \"tsc:w\": \"tsc -w\",
    \"typings\": \"typings\"
  },
  \"license\": \"ISC\",
  \"dependencies\": {
    \"@angular/common\": \"2.0.0-rc.4\",
    \"@angular/compiler\": \"2.0.0-rc.4\",
    \"@angular/core\": \"2.0.0-rc.4\",
    \"@angular/forms\": \"0.2.0\",
    \"@angular/http\": \"2.0.0-rc.4\",
    \"@angular/platform-browser\": \"2.0.0-rc.4\",
    \"@angular/platform-browser-dynamic\": \"2.0.0-rc.4\",
    \"@angular/router\": \"3.0.0-beta.1\",
    \"@angular/router-deprecated\": \"2.0.0-rc.2\",
    \"@angular/upgrade\": \"2.0.0-rc.4\",
    \"systemjs\": \"0.19.27\",
    \"core-js\": \"^2.4.0\",
    \"reflect-metadata\": \"^0.1.3\",
    \"rxjs\": \"5.0.0-beta.6\",
    \"zone.js\": \"^0.6.12\",
    \"angular2-in-memory-web-api\": \"0.0.14\",
    \"bootstrap\": \"^3.3.6\"
  },
  \"devDependencies\": {
    \"concurrently\": \"^2.0.0\",
    \"lite-server\": \"^2.2.0\",
    \"typescript\": \"^1.8.10\",
    \"typings\":\"^1.0.4\"
  }
}" > package.json

mkdir app

echo "<html>
  <head>
    <title>Angular 2 QuickStart</title>
    <meta charset=\"UTF-8\">
    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">
    <link rel=\"stylesheet\" href=\"styles.css\">
    <!-- 1. Load libraries -->
     <!-- Polyfill(s) for older browsers -->
    <script src=\"node_modules/core-js/client/shim.min.js\"></script>
    <script src=\"node_modules/zone.js/dist/zone.js\"></script>
    <script src=\"node_modules/reflect-metadata/Reflect.js\"></script>
    <script src=\"node_modules/systemjs/dist/system.src.js\"></script>
    <!-- 2. Configure SystemJS -->
    <script src=\"systemjs.config.js\"></script>
    <script>
      System.import('app').catch(function(err){ console.error(err); });
    </script>
  </head>
  <!-- 3. Display the application -->
  <body>
    <my-app>Loading...</my-app>
  </body>
</html>" > index.html

echo "import { bootstrap }    from '@angular/platform-browser-dynamic';
import { AppComponent } from './app.component';
bootstrap(AppComponent);" > app/main.ts

echo "import { Component } from '@angular/core';
@Component({
  selector: 'my-app',
  template: '<h1>My First Angular 2 App</h1>'
})
export class AppComponent { }" > app/app.component.ts

echo "Finalizado!"
sleep 2
