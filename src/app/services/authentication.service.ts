import {Injectable} from '@angular/core';
import {IonicAuth} from '@ionic-enterprise/auth';
import {Router} from '@angular/router';
// import {IdentityService} from './identity.service';
import {Capacitor} from '@capacitor/core';
import {auth0NativeConfig, auth0WebConfig} from '../../environments/environment';
import {decodeToken} from '../../decode-jwt';

@Injectable({
    providedIn: 'root'
})
export class AuthenticationService extends IonicAuth {
    // private identityService: IdentityService;
    private router: Router;
    private loadingIndicator: HTMLIonLoadingElement;

    private idToken;

    // constructor(router: Router, identityService: IdentityService) {
    constructor(router: Router) {
        // Determine whether to run on mobile or the web
        const selectedConfig = Capacitor.isNativePlatform() ? auth0NativeConfig : auth0WebConfig;
        console.log('in AuthenticationService selectedConfig', selectedConfig);
        // selectedConfig.tokenStorageProvider = identityService.vault;
        super(selectedConfig);

        this.router = router;
        // this.identityService = identityService;
    }

    async login(loadingIndicator) {
        this.loadingIndicator = loadingIndicator;

        await super.login();
    }

    // Event fired by Auth Connect upon successful login to auth provider.
    async onLoginSuccess(response: any) {
        console.log('auth service, success', response);

        this.idToken = decodeToken(response.idToken);

        console.log('onLoginSuccess isAccessTokenAvailable', await super.isAccessTokenAvailable());
        console.log('onLoginSuccess isAccessTokenExpired', await super.isAccessTokenExpired());
        console.log('onLoginSuccess getRefreshToken', await super.getRefreshToken());

        await this.router.navigate(['tabs/employees']);

        // Implicit login: POPUP flow
        if (this.loadingIndicator) {
            this.loadingIndicator.dismiss();
        }
    }

    // Called as part of CURRENT implicit login flow only
    async callback(url, loadingIndicator) {
        loadingIndicator.dismiss();

        await super.handleLoginCallback(url);
    }

    // Log out of auth provider, then automatically redirect to the app page
    // specified in the `logoutUrl` property
    async logout() {
        // this.identityService.logout();

        await super.logout();
    }

    async onLogout() {
        await this.router.navigate(['login']);
    }

    async isAuthenticated() {
        console.log('isAuthenticated isAccessTokenAvailable', await super.isAccessTokenAvailable());
        console.log('isAuthenticated isAccessTokenExpired', await super.isAccessTokenExpired());
        console.log('isAuthenticated getRefreshToken', await super.getRefreshToken());
        console.log('isAuthenticated getIdToken', await super.getIdToken());
        return await super.isAuthenticated();
    }

    async getUserInfo() {
        return await super.getIdToken();
    }
}
