//
//  PaymentViewModel.swift
//  Marketplace
//
//  Created by Jin Zhang on 11/3/25.
//


import Foundation
import PassKit

class PaymentViewModel: NSObject, ObservableObject {
    private var controller: PKPaymentAuthorizationController?

    func startApplePay(total: Double = 9.99) {
        // Create the payment request
        let paymentRequest = PKPaymentRequest()
        paymentRequest.merchantIdentifier = "merchant.com.Jinping.Marketplace"
        paymentRequest.supportedNetworks = [.visa, .masterCard, .amex]
        paymentRequest.merchantCapabilities = .capability3DS
        paymentRequest.countryCode = "US"
        paymentRequest.currencyCode = "USD"

        // Define what the user will pay for
        paymentRequest.paymentSummaryItems = [
            PKPaymentSummaryItem(label: "Cool Product", amount: NSDecimalNumber(string: "9.99")),
            PKPaymentSummaryItem(label: "Total", amount: NSDecimalNumber(value: total))
        ]

        // Create and retain controller
        controller = PKPaymentAuthorizationController(paymentRequest: paymentRequest)
        controller?.delegate = self

        // Present the sheet
        controller?.present { presented in
            if presented {
                print("✅ Apple Pay sheet presented")
            } else {
                print("❌ Failed to present Apple Pay sheet")
            }
        }
    }
}

extension PaymentViewModel: PKPaymentAuthorizationControllerDelegate {
    func paymentAuthorizationController(_ controller: PKPaymentAuthorizationController,
                                        didAuthorizePayment payment: PKPayment,
                                        handler completion: @escaping (PKPaymentAuthorizationResult) -> Void) {
        print("✅ Payment authorized: \(payment.token.transactionIdentifier)")
        // Here you can send the token to your server or confirm success
        completion(PKPaymentAuthorizationResult(status: .success, errors: nil))
    }

    func paymentAuthorizationControllerDidFinish(_ controller: PKPaymentAuthorizationController) {
        controller.dismiss {
            print("🧾 Apple Pay sheet dismissed")
        }
    }
}
