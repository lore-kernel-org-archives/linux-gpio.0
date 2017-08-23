From: Bart Van Assche <Bart.VanAssche@wdc.com>
Subject: Re: [PATCH 1/4] bitops: Introduce assign_bit()
Date: Wed, 23 Aug 2017 17:09:48 +0000
Message-ID: <1503508187.2484.9.camel@wdc.com>
References: <cover.1503319573.git.lukas@wunner.de>
         <5487a5f7d1a4be1bb13e7d1f392281d18c0e935e.1503319573.git.lukas@wunner.de>
         <CACRpkdaa7JXhjgGxG=eMZxh2kfC3MJ4O_Sc5h5qZsmL5sWNVmg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:47624 "EHLO
        esa1.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932204AbdHWRKg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 23 Aug 2017 13:10:36 -0400
In-Reply-To: <CACRpkdaa7JXhjgGxG=eMZxh2kfC3MJ4O_Sc5h5qZsmL5sWNVmg@mail.gmail.com>
Content-Language: en-US
Content-ID: <B7AE542FF969DC4AB1C676A92327BD3D@namprd04.prod.outlook.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "lukas@wunner.de" <lukas@wunner.de>, "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Cc: "agk@redhat.com" <agk@redhat.com>, "phil@raspberrypi.org" <phil@raspberrypi.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "m.duckeck@kunbus.de" <m.duckeck@kunbus.de>, "snitzer@redhat.com" <snitzer@redhat.com>

T24gV2VkLCAyMDE3LTA4LTIzIGF0IDA5OjMyICswMjAwLCBMaW51cyBXYWxsZWlqIHdyb3RlOg0K
PiBDYW4gc29tZW9uZSBleHBsYWluIHdoZW4gSSB1c2UgdGhlIGJpdG9wX2ZvbygpIGFuZCB3aGVu
IEkNCj4gdXNlIHRoZSBfX2JpdG9wX2ZvbygpLiBJIGFtIGFza2luZyBzbyBJIGNhbiB1bmRlcnN0
YW5kIHBhdGNoDQo+IDIvNCBpbiB0aGlzIHNlcmllcy4NCg0KVGhhdCdzIGVhc3kuIEZyb20gRG9j
dW1lbnRhdGlvbi9jb3JlLWFwaS9hdG9taWNfb3BzLnJzdDoNCg0KLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KRmlu
YWxseSwgdGhlcmUgYXJlIG5vbi1hdG9taWMgdmVyc2lvbnMgb2YgdGhlIGJpdG1hc2sgb3BlcmF0
aW9ucw0KcHJvdmlkZWQuICBUaGV5IGFyZSB1c2VkIGluIGNvbnRleHRzIHdoZXJlIHNvbWUgb3Ro
ZXIgaGlnaGVyLWxldmVsIFNNUA0KbG9ja2luZyBzY2hlbWUgaXMgYmVpbmcgdXNlZCB0byBwcm90
ZWN0IHRoZSBiaXRtYXNrLCBhbmQgdGh1cyBsZXNzDQpleHBlbnNpdmUgbm9uLWF0b21pYyBvcGVy
YXRpb25zIG1heSBiZSB1c2VkIGluIHRoZSBpbXBsZW1lbnRhdGlvbi4NClRoZXkgaGF2ZSBuYW1l
cyBzaW1pbGFyIHRvIHRoZSBhYm92ZSBiaXRtYXNrIG9wZXJhdGlvbiBpbnRlcmZhY2VzLA0KZXhj
ZXB0IHRoYXQgdHdvIHVuZGVyc2NvcmVzIGFyZSBwcmVmaXhlZCB0byB0aGUgaW50ZXJmYWNlIG5h
bWUuIDo6DQoNCgl2b2lkIF9fc2V0X2JpdCh1bnNpZ25lZCBsb25nIG5yLCB2b2xhdGlsZSB1bnNp
Z25lZCBsb25nICphZGRyKTsNCgl2b2lkIF9fY2xlYXJfYml0KHVuc2lnbmVkIGxvbmcgbnIsIHZv
bGF0aWxlIHVuc2lnbmVkIGxvbmcgKmFkZHIpOw0KCXZvaWQgX19jaGFuZ2VfYml0KHVuc2lnbmVk
IGxvbmcgbnIsIHZvbGF0aWxlIHVuc2lnbmVkIGxvbmcgKmFkZHIpOw0KCWludCBfX3Rlc3RfYW5k
X3NldF9iaXQodW5zaWduZWQgbG9uZyBuciwgdm9sYXRpbGUgdW5zaWduZWQgbG9uZyAqYWRkcik7
DQoJaW50IF9fdGVzdF9hbmRfY2xlYXJfYml0KHVuc2lnbmVkIGxvbmcgbnIsIHZvbGF0aWxlIHVu
c2lnbmVkIGxvbmcgKmFkZHIpOw0KCWludCBfX3Rlc3RfYW5kX2NoYW5nZV9iaXQodW5zaWduZWQg
bG9uZyBuciwgdm9sYXRpbGUgdW5zaWduZWQgbG9uZyAqYWRkcik7DQoNClRoZXNlIG5vbi1hdG9t
aWMgdmFyaWFudHMgYWxzbyBkbyBub3QgcmVxdWlyZSBhbnkgc3BlY2lhbCBtZW1vcnkNCmJhcnJp
ZXIgc2VtYW50aWNzLg0KLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KDQpCYXJ0Lg==
