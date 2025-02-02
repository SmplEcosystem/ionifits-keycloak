import {Injectable} from '@angular/core';
import {
    ApplePay,
    ApplePayMerchantCapability,
    ApplePaySummaryItem,
    ApplePaySupportedNetwork
} from '@ionic-enterprise/apple-pay';
import {Product} from '../models/product';
// import { IdentityService } from './identity.service';
export {ApplePaySummaryItem} from '@ionic-enterprise/apple-pay';

@Injectable({
    providedIn: 'root',
})
export class ApplePayService {
    private merchantIdentifier = 'merchant.io.ionic.ionifits.applepay';
    private supportedNetworks: ApplePaySupportedNetwork[] = [
        ApplePaySupportedNetwork.VISA,
        ApplePaySupportedNetwork.MASTERCARD,
        ApplePaySupportedNetwork.AMEX,
        ApplePaySupportedNetwork.DISCOVER,
    ];
    private merchantCapabilties: ApplePayMerchantCapability[] = [
        ApplePayMerchantCapability.DEBIT,
        ApplePayMerchantCapability.CREDIT,
        ApplePayMerchantCapability.THREEDS,
    ];
    private countryCode = 'US';
    private currencyCode = 'USD';
    private merchantValidationUrl =
        'https://ionifits.ionicframework.com/api/session/start';
    private authorizationUrl =
        'https://ionifits.ionicframework.com/api/session/authorize';

    // constructor(private identityService: IdentityService) {
    constructor() {
    }

    async isAvailable(): Promise<boolean> {
        const {canMakePayments} = await ApplePay.canMakePayments({
            merchantIdentifier: this.merchantIdentifier,
            supportedNetworks: this.supportedNetworks,
        });
        return canMakePayments;
    }

    async makePayment(products: Product[], total: number): Promise<boolean> {
        // Hide splash screen so it doesn't display when Apple Pay prompt appears
        // await this.identityService.toggleHideScreen(false);

        // Convert product items into Apple Pay items
        const apItems = products.map(product => {
            const applePayItem: ApplePaySummaryItem = {
                label: product.name,
                amount: product.price.toLocaleString(),
                type: 'final'
            };
            return applePayItem;
        });

        const apTotal: ApplePaySummaryItem = {
            amount: total.toLocaleString(),
            label: 'Total',
            type: 'final',
        };

        const {success} = await ApplePay.makePaymentRequest({
            version: 5,
            merchantValidation: {
                url: this.merchantValidationUrl,
                params: {
                    merchantIdentifier: this.merchantIdentifier,
                    displayName: 'Ionifits Test Store',
                    initiative: 'web',
                    initiativeContext: 'ionifits.ionicframework.com',
                },
            },
            paymentAuthorization: {
                url: this.authorizationUrl,
            },
            request: {
                countryCode: this.countryCode,
                currencyCode: this.currencyCode,
                merchantCapabilities: this.merchantCapabilties,
                supportedNetworks: this.supportedNetworks,
                lineItems: apItems,
                total: apTotal,
            },
        });

        // Turn hide screen back on
        // await this.identityService.toggleHideScreen(true);

        return success;
    }
}
