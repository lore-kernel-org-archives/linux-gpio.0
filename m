From: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: RE: [RFC PATCH 2/2] pinctrl: sh-pfc: r8a7791: Add can_clk function
Date: Tue, 14 Nov 2017 15:40:00 +0000
Message-ID: <TY1PR06MB08951DD2EFFBE3B463E303ABC0280@TY1PR06MB0895.apcprd06.prod.outlook.com>
References: <CAMuHMdV=8rAE5z2VmCjL-M_MXY6TsKM_+0c-bsqDsjDZYWU1FA@mail.gmail.com>
 <1510334189-8942-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1510334189-8942-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <CAMuHMdVLAdyrqecJmn09qLBY5=vA7YY-Opu79SvaDNdLp5DXtA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdVLAdyrqecJmn09qLBY5=vA7YY-Opu79SvaDNdLp5DXtA@mail.gmail.com>
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij <linus.walleij@linaro.org>, Simon Horman <horms@verge.net.au>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Chris Paterson <Chris.Paterson2@renesas.com>, Biju Das <biju.das@bp.renesas.com>, Ramesh Shanmugasundaram <ramesh.shanmugasundaram@bp.renesas.com>
List-Id: linux-gpio@vger.kernel.org

SGVsbG8gR2VlcnQsDQoNCnRoYW5rIHlvdSBmb3IgeW91ciBjb21tZW50cy4NCg0KPg0KPiBBcyB0
aGUgcGluIGdyb3VwcyBhbmQgZnVuY3Rpb25zIGFyZSBwYXJ0IG9mIHRoZSBzdGFibGUgRFQgQUJJ
LCB5b3UgY2Fubm90IGp1c3QNCj4gcmVtb3ZlIHRoZSBjYW5fY2xrKiBwaW5zIGZyb20gY2FuMF9n
cm91cHNbXSwgYXMgdGhhdCB3b3VsZCBicmVhayBleGlzdGluZyB1c2Vycy4NCj4NCj4gSSB3b3Vs
ZCBrZWVwIHRoZW0sIGJ1dCBhZGQgYSBjb21tZW50ICIvKiByZXRhaW5lZCBmb3IgYmFja3dhcmRz
DQo+IGNvbXBhdGliaWxpdHkgKi8iLg0KPg0KPiBBZGRpbmcgYSBuZXcgY2FuX2Nsa19ncm91cHNb
XSAuLi4NCj4NCj4gYW5kIGNhbl9jbGsgZnVuY3Rpb24gaXMgT0ssIHRob3VnaC4NCj4NCj4gTXkg
Y29tbWVudHMgYXBwbHkgdG8geW91ciByOGE3Nzk0IHBhdGNoLCB0b28uIEV4Y2VwdCB0aGF0IG9u
IHI4YTc3OTQgd2UNCj4gZGlkbid0IGhhdmUgQ0FOIHN1cHBvcnQgaW4gcGZjLXI4YTc3OTQuYyBi
ZWZvcmUsIGJ1dCBJIHdvdWxkIGxpa2UgdG8gdHJlYXQgYWxsDQo+IFItQ2FyIEdlbjIgYW5kIFJa
L0cxIFNvQ3MgaW4gdGhlIHNhbWUgd2F5Lg0KDQpJJ2xsIHNlbmQgYSB2MiB0byBmaXggdGhpcy4N
Cg0KVGhhbmtzLA0KRmFiDQoNCj4NCj4gR3J7b2V0amUsZWV0aW5nfXMsDQo+DQo+ICAgICAgICAg
ICAgICAgICAgICAgICAgIEdlZXJ0DQo+DQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBU
aGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcN
Cj4NCj4gSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRoIHRlY2huaWNhbCBwZW9wbGUsIEkg
Y2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dA0KPiB3aGVuIEknbSB0YWxraW5nIHRvIGpvdXJuYWxp
c3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGluZyBsaWtlIHRoYXQuDQo+ICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9ydmFsZHMNCg0KDQoNClJl
bmVzYXMgRWxlY3Ryb25pY3MgRXVyb3BlIEx0ZCwgRHVrZXMgTWVhZG93LCBNaWxsYm9hcmQgUm9h
ZCwgQm91cm5lIEVuZCwgQnVja2luZ2hhbXNoaXJlLCBTTDggNUZILCBVSy4gUmVnaXN0ZXJlZCBp
biBFbmdsYW5kICYgV2FsZXMgdW5kZXIgUmVnaXN0ZXJlZCBOby4gMDQ1ODY3MDkuDQo=
