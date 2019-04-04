From: "Singh, Sandeep" <Sandeep.Singh@amd.com>
Subject: [PATCH] pinctrl: Added IRQF_SHARED flag for amd-pinctrl driver
Date: Thu, 4 Apr 2019 13:16:26 +0000
Message-ID: <1554383739-16050-1-git-send-email-Sandeep.Singh@amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc: "Singh, Sandeep" <Sandeep.Singh@amd.com>"Singh, Sandeep" <Sandeep.Singh@amd.com>, "S-k, Shyam-sundar" <Shyam-sundar.S-k@amd.com>, "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>
List-Id: linux-gpio@vger.kernel.org

RnJvbTogU2FuZGVlcCBTaW5naCA8c2FuZGVlcC5zaW5naEBhbWQuY29tPg0KDQpTb21lIG9mIHRo
ZSBBTUQgcmVmZXJlbmNlIGJvYXJkcyB1c2VkIHNpbmdsZSBHUElPIGxpbmUgZm9yDQptdWx0aXBs
ZSBkZXZpY2VzLiBTbyBhZGRlZCBJUlFGX1NIQVJFRCBmbGFnIGluIGFtZCBwaW5jdHJsIGRyaXZl
ci4NCg0KDQpTaWduZWQtb2ZmLWJ5OiBTYW5kZWVwIFNpbmdoIDxTYW5kZWVwLlNpbmdoQGFtZC5j
b20+DQpTaWduZWQtb2ZmLWJ5OiBTaHlhbSBTdW5kYXIgUyBLIDxTaHlhbS1zdW5kYXIuUy1rQGFt
ZC5jb20+DQpjYzogTmVoYWwgU2hhaCA8TmVoYWwtYmFrdWxjaGFuZHJhLlNoYWhAYW1kLmNvbT4N
Ci0tLQ0KIGRyaXZlcnMvcGluY3RybC9waW5jdHJsLWFtZC5jIHwgNCArKy0tDQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCg0KZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvcGluY3RybC9waW5jdHJsLWFtZC5jIGIvZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtYW1k
LmMNCmluZGV4IDJhN2Q2MzguLmQ4MzRjMWUgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL3BpbmN0cmwv
cGluY3RybC1hbWQuYw0KKysrIGIvZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtYW1kLmMNCkBAIC05
MzAsOCArOTMwLDggQEAgc3RhdGljIGludCBhbWRfZ3Bpb19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1f
ZGV2aWNlICpwZGV2KQ0KIAkJZ290byBvdXQyOw0KIAl9DQogDQotCXJldCA9IGRldm1fcmVxdWVz
dF9pcnEoJnBkZXYtPmRldiwgaXJxX2Jhc2UsIGFtZF9ncGlvX2lycV9oYW5kbGVyLCAwLA0KLQkJ
CSAgICAgICBLQlVJTERfTU9ETkFNRSwgZ3Bpb19kZXYpOw0KKwlyZXQgPSBkZXZtX3JlcXVlc3Rf
aXJxKCZwZGV2LT5kZXYsIGlycV9iYXNlLCBhbWRfZ3Bpb19pcnFfaGFuZGxlciwNCisJCQkgICAg
ICAgSVJRRl9TSEFSRUQsIEtCVUlMRF9NT0ROQU1FLCBncGlvX2Rldik7DQogCWlmIChyZXQpDQog
CQlnb3RvIG91dDI7DQogDQotLSANCjIuNy40DQoNCg==
