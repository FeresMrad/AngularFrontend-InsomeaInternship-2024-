import { bootstrapApplication } from '@angular/platform-browser';
import { provideHttpClient } from '@angular/common/http'; 
import { appConfig } from './app/app.config';
import { AppComponent } from './app/app.component';

bootstrapApplication(AppComponent, {
  ...appConfig,
  providers: [
    ...appConfig.providers ?? [], // Ensure existing providers are included
    provideHttpClient() // Add provideHttpClient to the providers
  ]
})
.catch((err) => console.error(err));
