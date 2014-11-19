From: "=?utf-8?B?6ZmI5Y2O5omN?=" <chenhc@lemote.com>
Subject: Re: [PATCH V4 2/6] MIPS: Move Loongson GPIO driver to drivers/gpio
Date: Wed, 19 Nov 2014 22:25:59 +0800
Message-ID: <tencent_15D766A360D879F4553C1872@qq.com>
References: <1415891560-8915-1-git-send-email-chenhc@lemote.com>
	<CAAVeFuKYgXhV_372FBQnArEFT4xEVB73P+yurJ9mF0CkKCx7eQ@mail.gmail.com>
	<CAAVeFuJoo3X9aNYdrn5TJ-PjTzvFuEm5QTPmKYMy9NyWFy1_WA@mail.gmail.com>
	<20141119101157.GB7213@linux-mips.org>
Mime-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtpbg62.qq.com ([103.7.29.139]:40823 "EHLO smtpbg64.qq.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1752950AbaKSO0Z (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 19 Nov 2014 09:26:25 -0500
In-Reply-To: <20141119101157.GB7213@linux-mips.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?utf-8?B?UmFsZiBCYWVjaGxl?= <ralf@linux-mips.org>, =?utf-8?B?QWxleGFuZHJlIENvdXJib3Q=?= <gnurou@gmail.com>
Cc: =?utf-8?B?Sm9obiBDcmlzcGlu?= <john@phrozen.org>, =?utf-8?B?U3RldmVuIEouIEhpbGw=?= <Steven.Hill@imgtec.com>, =?utf-8?B?bGludXgtbWlwcw==?= <linux-mips@linux-mips.org>, =?utf-8?B?RnV4aW4gWmhhbmc=?= <zhangfx@lemote.com>, =?utf-8?B?d3V6aGFuZ2ppbg==?= <wuzhangjin@gmail.com>, =?utf-8?B?bGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc=?= <linux-gpio@vger.kernel.org>

SGksIFJhbGYgYW5kIEFsZXhhbmRyZSwNCg0KU28sIEkgbmVlZCB0aHJlZSBwYXRjaGVzOiBj
bGVhbiB1cCwgbW92ZSB0byBkcml2ZXJzL2dwaW8sIGFuZCBpbXByb3ZlIGl0IHRvIHN1cHBv
cnQgTG9vbnNvbi0zQS8zQj8NCg0KSHVhY2FpDQogDQogDQotLS0tLS0tLS0tLS0tLS0tLS0g
T3JpZ2luYWwgLS0tLS0tLS0tLS0tLS0tLS0tDQpGcm9tOiAgIlJhbGYgQmFlY2hsZSI8cmFs
ZkBsaW51eC1taXBzLm9yZz47DQpEYXRlOiAgV2VkLCBOb3YgMTksIDIwMTQgMDY6MTEgUE0N
ClRvOiAgIkFsZXhhbmRyZSBDb3VyYm90IjxnbnVyb3VAZ21haWwuY29tPjsNCkNjOiAgIkh1
YWNhaSBDaGVuIjxjaGVuaGNAbGVtb3RlLmNvbT47ICJKb2huIENyaXNwaW4iPGpvaG5AcGhy
b3plbi5vcmc+OyAiU3RldmVuIEouIEhpbGwiPFN0ZXZlbi5IaWxsQGltZ3RlYy5jb20+OyAi
bGludXgtbWlwcyI8bGludXgtbWlwc0BsaW51eC1taXBzLm9yZz47ICJGdXhpbiBaaGFuZyI8
emhhbmdmeEBsZW1vdGUuY29tPjsgInd1emhhbmdqaW4iPHd1emhhbmdqaW5AZ21haWwuY29t
PjsgImxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnIjxsaW51eC1ncGlvQHZnZXIua2VybmVs
Lm9yZz47DQpTdWJqZWN0OiAgUmU6IFtQQVRDSCBWNCAyLzZdIE1JUFM6IE1vdmUgTG9vbmdz
b24gR1BJTyBkcml2ZXIgdG8gZHJpdmVycy9ncGlvDQogDQpPbiBXZWQsIE5vdiAxOSwgMjAx
NCBhdCAwNToyMTo1NlBNICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90ZToNCg0KPiA+
IE9uIEZyaSwgTm92IDE0LCAyMDE0IGF0IDEyOjEyIEFNLCBIdWFjYWkgQ2hlbiA8Y2hlbmhj
QGxlbW90ZS5jb20+IHdyb3RlOg0KPiA+PiBNb3ZlIExvb25nc29uLTIncyBHUElPIGRyaXZl
ciB0byBkcml2ZXJzL2dwaW8gYW5kIGFkZCBLY29uZmlnIG9wdGlvbnMuDQo+ID4NCj4gPiBB
Y2tlZC1ieTogQWxleGFuZHJlIENvdXJib3QgPGFjb3VyYm90QG52aWRpYS5jb20+DQo+ID4N
Cj4gPiBHdWVzcyB0aGlzIHNob3VsZCBnbyB0aHJvdWdoIHRoZSBHUElPIHRyZWUgb25jZSB0
aGUgcGxhdGZvcm0NCj4gPiBtYWludGFpbmVycyBoYXZlIGFja2VkIHRoaXM/DQo+IA0KPiBP
dWNoLiBBZnRlciBsb29raW5nIGF0IHRoaXMgZHJpdmVyJ3MgaW1wbGVtZW50YXRpb24gSSB0
aGluayBJIGhhdmUgdG8NCj4gdGFrZSBteSBBY2sgYmFjay4gVGhpcyBkcml2ZXIgY29tZXMg
d2l0aCBjdXN0b20gZGVmaW5pdGlvbnMgb2YNCj4gZ3Bpb19nZXRfdmFsdWUoKSBhbmQgb3Ro
ZXIgZnVuY3Rpb25zLCB3aGljaCB3ZSB3aWxsIHdhbnQgdG8gZ2V0IHJpZCBvZg0KPiBiZWZv
cmUgbW92aW5nIHRoaXMgaW50byBkcml2ZXJzL2dwaW8uIENhbiB5b3UgcG9ydCB0aGlzIHRv
IGEgcHJvcGVyDQo+IGdwaW9saWIgZHJpdmVyIGJlZm9yZSBkb2luZyB0aGUgbW92ZT8NCg0K
QXMgdGhlIGFyY2ggbWFpbnRhaW5lciBJJ20gaGFwcHkgdG8gc2F5IGZhcmV3ZWxsIHRvIGRy
aXZlciBjb2RlIGluIGFyY2gvbWlwcy4NCg0KQWxzbywgY2FuIHdlIHNwbGl0IHRoZSB3aG9s
ZSBwcm9jZWR1cmUgaW50byB0d28gcGF0Y2hlcywgb25lIGZvciB0aGUgY2xlYW51cA0KYW5k
IG9uZSBmb3IgdGhlIG1vdmU/ICBJIGRvbid0IGNhcmUgaW4gd2hpY2ggb3JkZXIuDQoNCiAg
UmFsZg==

