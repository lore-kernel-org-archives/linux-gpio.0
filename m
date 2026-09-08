Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011009.outbound.protection.outlook.com [52.101.125.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0B15427F9;
	Tue,  8 Sep 2026 12:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872076; cv=fail; b=kff1onl0XHnC/KOS7nf6AJWvy/mJ0b0fFURGdPL5hv+RniMFyUh4MD2EEiHLkf8RWctRk3Y1752k3zy+C2N81rpeCqLIBOnsWpihaJ4vUj/Wk/Bg3sOQPHmaVZXGG6M5hfdVcGv85bx6C1du/2hNb4YOljjU3msf7Pz+XQD4DUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872076; c=relaxed/simple;
	bh=tKaCHAqmpIUEj6jbP3Jx2/rIYaZUwj36GCzV+UAM8ZI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=lu52vB/r+Za1kIs+qrPlMliyFaahVmBtacPy2ZOrnoGPg+xgZrwyEBVAJyrz+pnQW6OQoG6jKzWxKk4ewLKcaQLWSDWh1jgzQUqoeCdhMERO7vmbBSpb3urzwilXaGc2tDIRKm+EM12Y2A25y09AKjFarLnqFyBPh6iIoZlc07A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=XRaoEiaF; arc=fail smtp.client-ip=52.101.125.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="XRaoEiaF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XIx5ZjJbA8M3znZGvnJ52Fq3vfbt0Q6mikeb+1O6gK3KYh3Ii11tfn3wsRmyY2f/r4KBEgRXshkVn7c6Rmna49AFMuM2Ce+JJvRCcDL8cGADsS83VR4SC411q3GiOF42GVWMLMliyzXW9lBoSA48YH2lWm0643b6kFICAPdXdXxGYFyIsynNC1c9cUI88tHYbHugnR013fwujRusP0d9+lr/DchZnADjw8G9e9z//HyJUlA77JDvJWbEOdTzHRYTvZ2Vnl9/jnt8U6cE3GLb+AtC2wmvzGTvXsU+mGSaHeoUlq0CEkrH1XX9bPAAZol6YLAmr5eevKrkxxQbRfnolw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tKaCHAqmpIUEj6jbP3Jx2/rIYaZUwj36GCzV+UAM8ZI=;
 b=pE9l9uNDk1FMnSi684KHTKGVs7IvJlcDiUGJFuKk1949joQmSZfbnIEJnuvssRDPc3aAOkCnlyH0DDLPLHIYyFuKgWV2CTA7i4phWLXBAgL+IxGYTJFcVmgLjSZpahFVCauFL6QoxHy644ZU3Aq1uZsedbBgQn9QquazN5spq7uP2vCeN/5bmbLH5BsHYTl0iFbo3p7IQt3E2BJnUIl5vgHtwj1EOdUVLbppeAz03Yi3vM+MBtqxGQTN28wwxFBWE6RPfZQ5LCuQRvlZER/KKorw1oMxufUYo+rBbSH+rkHMSTzLUk8pz+aA0G8Cws0z6UKAHel2Q1icRgaIWx8yKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tKaCHAqmpIUEj6jbP3Jx2/rIYaZUwj36GCzV+UAM8ZI=;
 b=XRaoEiaF5O0u4wDkbFs5vZ8Z1WRU/vJjEoKCnU/YfCKOoWB73B4FUmpdpHFlyukyy3plJ41E6Lnfr7g4La5FXp1lDtJzFEa3NcB8fHYpw8snNbXjZs7pr383CB1zpjEanPtVHHxaDxI7Z39r1vUwlIV9IcUXIm6zXPORC4BbINo=
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 (2603:1096:405:29b::10) by OS9PR01MB17398.jpnprd01.prod.outlook.com
 (2603:1096:604:44d::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Tue, 8 Sep 2026
 12:54:29 +0000
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::a68f:5c9:9de8:4fa4]) by TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::a68f:5c9:9de8:4fa4%3]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 12:54:28 +0000
From: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: geert <geert@linux-m68k.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@kernel.org" <stable@kernel.org>
Subject: RE: [PATCH 2/7] pinctrl: renesas: rzt2h: restore correct pin mode on
 IRQ free
Thread-Topic: [PATCH 2/7] pinctrl: renesas: rzt2h: restore correct pin mode on
 IRQ free
Thread-Index: AQHdLnpb3dVWxvZ3w0G142Ky8N5QVLbEiwKAgAAMfpCAACMvgIAAAhdA
Date: Tue, 8 Sep 2026 12:54:28 +0000
Message-ID:
 <TYRPR01MB1561918EBEFA70E386C6862E585B12@TYRPR01MB15619.jpnprd01.prod.outlook.com>
References: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260817185700.322370-3-cosmin-gabriel.tanislav.xa@renesas.com>
 <CAMuHMdX+PArWcN9Xc5UiErWNUeGDEVoM6DoLgZQJOQHav9GZ+w@mail.gmail.com>
 <TYRPR01MB156193BED16FC87EBE4B2008885B12@TYRPR01MB15619.jpnprd01.prod.outlook.com>
 <CAMuHMdVNzUJjvzkipZZY7EP+-sCUC-vDndFrjAY50j=HMNB4fA@mail.gmail.com>
In-Reply-To:
 <CAMuHMdVNzUJjvzkipZZY7EP+-sCUC-vDndFrjAY50j=HMNB4fA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB15619:EE_|OS9PR01MB17398:EE_
x-ms-office365-filtering-correlation-id: 27edd7d6-7848-4bd6-ce01-08df0da8516f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|38070700021|6133799003|3023799007|10067099003|4143699003|56012099006|11063799006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 fjYzXVwUE/FKPhKrNFqLcC0aKJGlJNPqEsqwoNhwESJz6RPBSmyZYWnRmz/Naf/+rdcelq3sP4GQDMgi7LNkz4jdKdsbLqtzgHbhf6zcIL9/Ri52QIW6FgKO29BjQEmy0pq0ifhwm6VsE878olEQNzGujwqApVMunD2Jw+ZGbcVh4GiTIDiNvjPZpiclhWLLlW360a+T6sOfDSTnr9kVQN+liQjB+ZLq/9o0gNSpK7SS+hyv56IlbUMFaAVbCZKvkLt8weup5zDAsZKqR3BEjEhRxrwz2Zyy9aPFtWyQl4tXg4H0Rq00yoO/vIjFpozOyq7sBFp/NZGxR+NwCM21iO6s3JJtZM+4oLTtmhmaYiD/BEN/t3y9E1tzW5BkZJ4n8zALbWxORERCIypnZzdjleD/RlRWhE3WJ7zMrGsopxz9sRnKom7523nwhlud6Y/C6aIMg+5OdUu5MT71ZKN0vDrYGZoam6SHGZDdC3iiO7sk8NSw39lpWI3jw8QyBABoa0frA7YqM6zpySRDa08k7H0pgpRXDvILA7shgmmYtdYQJ4jVB+unyVSAriH0Mrc5fyeEkGY7ITTA8iO7exqzLXQ0f14cAgE0NDMfiT/Onm88SGMesf0tr4XTBvCBNdNxjkYSm0q16xnDLF+WHwTKPUtq9zOGCAdQDnw3kfp2Gl3N1wa9QG5njmg2Jdta+cjdkuXBlmZZ/FEFswkf57UqGPOaM4DwjQ8vbLoE1v5QpS0=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB15619.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(38070700021)(6133799003)(3023799007)(10067099003)(4143699003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eWRsN0o1RVZvRHZmR254dEptdGpBeXladHg0MzNqby9QVU9hMkdCVGtUNEVI?=
 =?utf-8?B?Slh6Tm1HSHByVkZXaWhldFFmRFVOdENoZWIvWkU3Y3Q5M2tZdnB5cmRvMVRE?=
 =?utf-8?B?clJLMjhmZklzNXhrenpva2FTRHRubTRybFNPZVBtQmFkK2U1ZlJIa00wMVA2?=
 =?utf-8?B?VGVDOHFuZ0NxOXhiVUJRbVVmdmg4MndtYWxQcTAvQ3RPalArYjZSbjd3S2VW?=
 =?utf-8?B?OERjdSs3OGxXZGt1WFd5R2dzb3FiU2x1UnlmNEZzenBoTWxmczdyclliVDEx?=
 =?utf-8?B?NHF2RllBVjNId2JsWTJRaDV5WGJYRzNHb3ZLTXR3Y3dVT1pnVzlKRDBRcTRY?=
 =?utf-8?B?NWw0REF1RDB4UWdtV055Wi85TEgwK29MYnJjQ2dzaGIwQlVLbTFVTC9QYk5R?=
 =?utf-8?B?Ym8zdmxHL2FxMnBsMVBOMnIyeDNXdXRmQjJxalFSWE9mVHlmZlpwaEpVVHV4?=
 =?utf-8?B?alRCQVE4RU5FejR0dUxzSW9DMC9qVXJGL29hWE9PdlNTb280Si9tUjI5T3lM?=
 =?utf-8?B?MXBzbFBuUTZYZlNtK2dYNllyZHNZK3pJZG02R3h4U0pYRXBmSE0xdDRoaUEx?=
 =?utf-8?B?cFR5dXJFY1hrYW15NS9BdUtaS1E4TEFpei9zZkpDN1BtL3NhYldpRmFaODVD?=
 =?utf-8?B?MFByZTl1TmRsSWNpdi95cWI1b1RObEZManNzNW1GOHdMT2ZMSmdtTjAxbFFa?=
 =?utf-8?B?Qk9Zd291aVIzNTdsbWpRdVE4YWhpLzlzdGNYNzJaUFpXTkVvN0Rvak42eGFB?=
 =?utf-8?B?eFlMWGdmeU5xNlQwdkpITW15NHdXcG5PbHhHdkU3cDN5TEJUYXBCM1BTNFVY?=
 =?utf-8?B?MEY3VkVWT1g2MGlYNVYxQW94L2xER2RPNGdwWjFGSVd3VGRndDlZQXFTcVpW?=
 =?utf-8?B?UTZTZHZJeGpGT0lTeTRZNnNORXpQWExKUGxqUzE4ajkxaGYzd1dkMnZ2NVF1?=
 =?utf-8?B?UGx3R081ZlZkQ20yWFVRM1R1NnZ5Vi8rWXV2TndFNFQvOUZOOVhWbi9UWEpD?=
 =?utf-8?B?L3JVeDZZMHlNZksyZ01SaG9JSkhmNUpJeUdLRHlKMFQxU2MybExUSnhRdVBP?=
 =?utf-8?B?U295U2lYaXJPMWRMS3FCdmRjUllzQjQ5REVXU1pHdGc1Z0htN1JVUy9zZXEz?=
 =?utf-8?B?cHFQWjNDR0ZvbVpoSFBUWlJHVFlJT0t3R0plYjMrdEtOOStGVkM5aGRFZnQ2?=
 =?utf-8?B?bjgrb1NUeXVWNTMwZVEyaFZrUHlpNUlhMmhYRTcwOVU3VEh0VVpZM1ZpR1h1?=
 =?utf-8?B?OENpVVUrR3Z0UGVoZUw3VkFoSi9JOXVWdzZ0aVNRUG5TMThyWGtFYWdHTHBP?=
 =?utf-8?B?SVNJeWZDbUNqUEUxa3hkcTlBYVljZzFBci9Jd25WRU5sR3FFOUg4WFEzUW9p?=
 =?utf-8?B?VnRqeC95TzZSTVNKcFRzQi96SWt4Z1FWcUlYN1pKbkpPT2s2UTcxS2JzZnF1?=
 =?utf-8?B?MTJJSzZFdmgza2syOU53OG5jNDNzbzlZMUozTTBOZGI5WEdkU1ZOMTlZTkNU?=
 =?utf-8?B?NFRiZ3piYVh4WmZSeDdpRHhwaG9aYmh4QTFPNTlzei95bTd1djlubXFBSitr?=
 =?utf-8?B?NFAyTzhib0hHUWZLcVp5NTBTYWVSdlVlV3VFT3g2ZWhwYkNab0lsTTBoSCtx?=
 =?utf-8?B?OWdqTjBMTmFhcGQ4cUxtQ0JzUXBsdXVvTTUvczhxcDM2WWI1NGY1SmNscGpO?=
 =?utf-8?B?RnNmZEgvQ044MFZXQlFoUEorbTZIQXVzYjZIVFUvczJwemo5UWI4djNNb2p1?=
 =?utf-8?B?bHdaTHdZRUtOS1JIeFZJcjQrVGxqbmdtSHRkekpqdWR1OC9OTElIUHVhMDhK?=
 =?utf-8?B?b2V5b1VsMWZ4WlNBYlNyU1VnQ2YvRndNRUluMWtFVklWalRZZGpENzdPZkIv?=
 =?utf-8?B?SnVseVB4RkpOT2kwNlBQdld3UFkycmJvS0VubFlPWnJMek43ZTNtbFc0cWY3?=
 =?utf-8?B?ZnNWdzFteCt3MUdaVXdGbTdEdDhWWFk0UW5uQjhXSUt1RU16cW9mT2VWVE0w?=
 =?utf-8?B?SFBNSDgzNFYwdTJqRVM3SnNLT3RxcDZVSXRTUEtnQmE2UzNPQlJ1Tno5UW9M?=
 =?utf-8?B?Z3I1anRyNjJWRXUvTWRhZGxiNWlZWHpURTRsanptcnArb21haHVwRE1xTmU1?=
 =?utf-8?B?NUszdkZVK2szZ29hVGphTkNOOEVzU3JnbkQ3UmhHV0wzekhTTzlnNWVwUmVq?=
 =?utf-8?B?bkcwY0luSkN3YmNDNG1uUExobG1ORE1sY3hRMnFHVkxVR09vaDNFeXlBVzVr?=
 =?utf-8?B?SzZHeUQ2bHEwZXRwZkk4czZNRys2QURPb0lXaC9Kd293MDRyZVpRR3dVWEw3?=
 =?utf-8?B?em4vWkRONVhQNDVlOUo5Rk1hZzdCWTZ2Smt6d2xDbnQrbFFsVEx5WGZlZDBQ?=
 =?utf-8?Q?40J3ECksgLnyvEUSyBk+ZJWL08yEKYrXqMH9O?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB15619.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27edd7d6-7848-4bd6-ce01-08df0da8516f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2026 12:54:28.1810
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: I5C3L3lhb3Fk3dLdfztW+rPs+mk20r+M/+lgEXmxC8wbutnhL8dF7F8EsiG0hkyI3g95Vf1VJqdfkCY3ZDPh955Gi++xCFyUbyubje+eYar1ItsyJpdr1N7VZ1GQtihC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9PR01MB17398

PiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50
OiBUdWVzZGF5LCBTZXB0ZW1iZXIgOCwgMjAyNiAzOjE2IFBNDQo+IA0KPiBIaSBDb3NtaW4sDQo+
IA0KPiBPbiBUdWUsIDggU2VwdCAyMDI2IGF0IDEzOjMzLCBDb3NtaW4tR2FicmllbCBUYW5pc2xh
dg0KPiA8Y29zbWluLWdhYnJpZWwudGFuaXNsYXYueGFAcmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+
ID4gRnJvbTogR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4NCj4gPiA+
IE9uIE1vbiwgMTcgQXVnIDIwMjYgYXQgMjA6NTgsIENvc21pbiBUYW5pc2xhdg0KPiA+ID4gPGNv
c21pbi1nYWJyaWVsLnRhbmlzbGF2LnhhQHJlbmVzYXMuY29tPiB3cm90ZToNCj4gPiA+ID4gcnp0
MmhfZ3Bpb19pcnFfZG9tYWluX2ZyZWUoKSBjYWxscyByenQyaF9waW5jdHJsX3NldF9ncGlvX2Vu
KCkgd2l0aA0KPiA+ID4gPiBmYWxzZSBsZWF2aW5nIHRoZSBwaW4gaW4gaW50ZXJydXB0IGZ1bmN0
aW9uIGluc3RlYWQgb2YgcmV0dXJuaW5nIGl0IHRvDQo+ID4gPiA+IEdQSU8gbW9kZS4NCj4gPiA+
DQo+ID4gPiBPSy4uLi4NCj4gPiA+DQo+ID4gPiA+IFBhc3MgdHJ1ZSB0byByenQyaF9waW5jdHJs
X3NldF9ncGlvX2VuKCkgdG8gdGFrZSB0aGUgcGluIG91dCBvZg0KPiA+ID4gPiBpbnRlcnJ1cHQg
ZnVuY3Rpb24gYWZ0ZXIgd2UncmUgZG9uZSB1c2luZyBpdCBhcyBhbiBJUlEuDQo+ID4gPiA+DQo+
ID4gPiA+IHJ6dDJoX3BpbmN0cmxfc2V0X3BmY19tb2RlKCkgc3dpdGNoZXMgdGhlIHBpbiB0byBI
aS1aLCBsb3NpbmcgdGhlDQo+ID4gPiA+IHByZXZpb3VzIFBNIHZhbHVlLg0KPiA+ID4gPg0KPiA+
ID4gPiBTYXZlIHRoZSBQTSB2YWx1ZSBiZWZvcmUgc3dpdGNoaW5nIHRvIEhpLVosIGFuZCByZXN0
b3JlIGl0IGFmdGVyIHRoZQ0KPiA+ID4gPiBJUlEgaXMgZnJlZWQuDQo+ID4gPg0KPiA+ID4gV2h5
IGlzIGl0IGEgcHJvYmxlbSBpZiB0aGUgcGluIGlzIGluIEhpLVogYWZ0ZXIgdGhlIGludGVycnVw
dCBoYXMgYmVlbiBmcmVlZD8NCj4gPiA+IElzbid0IHRoYXQgdGhlIHJpZ2h0IHN0YXRlIGZvciBh
biB1bnVzZWQgcGluPw0KPiA+DQo+ID4gSXQgd291bGRuJ3QgYmUgYW4gaXNzdWUgaWYgaXQgd2Fz
IGFjdHVhbGx5IHVudXNlZCBvbmNlIHRoZSBJUlEgaXMgZnJlZWQsDQo+ID4gYnV0IHRoYXQncyBu
b3QgdGhlIGNhc2UsIGJlY2F1c2UgeW91IGNhbiBjYWxsIGdwaW9kX3RvX2lycSgpIG9uIGEgR1BJ
TywNCj4gPiBhbmQgdGhlbiByZXF1ZXN0X2lycSgpIG9uIHRoZSBJUlEgcmV0dXJuZWQgYnkgaXQu
IElmIHlvdSB0aGVuIGNhbGwNCj4gPiBmcmVlX2lycSgpLCB5b3Ugb25seSBmcmVlIHRoZSBJUlEs
IG5vdCB0aGUgR1BJTyBpdHNlbGYuIEFmdGVyIHRoYXQgdGhlDQo+ID4gdXNlciBvZiB0aGVzZSBB
UElzIHNob3VsZCBzdGlsbCBiZSBhYmxlIHRvIGNvbnRpbnVlIHVzaW5nIHRoZSBHUElPLg0KPiAN
Cj4gT0suDQo+IA0KPiA+IElmIHRoZSBwaW4gaXMgbGVmdCBpbiBIaS1aIGFmdGVyIGZyZWVpbmcg
dGhlIElSUSwgcnp0MmhfZ3Bpb19nZXQoKSB3aWxsDQo+ID4gc2VlIHRoYXQgdGhlIHBpbiBpcyBu
b3QgaW4gcGVyaXBoZXJhbCBtb2RlIGFueW1vcmUsIGl0IHdpbGwgdGhlbiBzZWUNCj4gPiB0aGF0
IG5laXRoZXIgUE1fSU5QVVQgbm9yIFBNX09VVFBVVCBhcmUgc2V0LCBhbmQgd2lsbCByZXR1cm4g
LUVJTlZBTC4NCj4gDQo+IFRoYXQgaXMgZml4ZWQgYnkgIltQQVRDSCA0LzddIHBpbmN0cmw6IHJl
bmVzYXM6IHJ6dDJoOiBmaXggcmVhZGluZyBwaW4NCj4gdmFsdWUgaW4gSVJRIGZ1bmN0aW9uIiBh
bnl3YXksIHJpZ2h0Pw0KPiANCg0KUGF0Y2ggNCBmaXhlcyBnZXQoKSB1c2FnZSB3aGVuIHRoZSBw
aW4gaXMgaW4gUEZDIElSUSBtb2RlIG9ubHkuIFRoYXQncw0KcGFydGljdWxhcmx5IHVzZWZ1bCB3
aGVuIHVzaW5nIHRoZSBHUElPIGNoYXJhY3RlciBkZXZpY2UgdG9nZXRoZXIgd2l0aA0KR1BJT19W
Ml9MSU5FX0ZMQUdfRURHRV9CT1RIIHRvIGRldGVjdCBlZGdlIHRyYW5zaXRpb25zLCBhcyBnZXQo
KSBpcw0KdXNlZCB0byB0ZWxsIHdoZXRoZXIgdGhlIGVkZ2Ugd2FzIGZhbGxpbmcgb3IgcmlzaW5n
DQooc2VlIGVkZ2VfaXJxX3RocmVhZCgpKS4NCg0KVGhpcyBwYXRjaCBmaXhlcyB0aGUgc3RhdGUg
YWZ0ZXIgdGhlIElSUSBpcyBmcmVlZC4NCg0KT25jZSB0aGUgSVJRIGlzIGZyZWVkLCByenQyaF9w
aW5fbW9kZV9pc19wZXJpcGhlcmFsKCkgd2lsbCByZXR1cm4gZmFsc2UsDQpzbyB0aGUgUEZDIElS
USBzcGVjaWZpYyBsb2dpYyBpcyBub3QgcmVhY2hlZCwgYW5kIHRoZSBub3JtYWwgR1BJTyBtb2Rl
DQpsb2dpYyB3aWxsIGJlIHRha2VuLCB3aGljaCwgc2luY2Ugd2UgZGlkbid0IHJlc3RvcmUgUE0g
dG8gUE1fSU5QVVQgb3INClBNX09VVFBVVCwgd2lsbCByZXR1cm4gLUVJTlZBTC4NCg0KU29ycnkg
aWYgdGhpcyBpcyBoYXJkIHRvIHVuZGVyc3RhbmQsIGl0IHRvb2sgbWUgYSB3aGlsZSB0byBnZXQg
aG93IGl0DQp3b3JrcyB0b28uDQoNCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9waW5jdHJsL3JlbmVz
YXMvcGluY3RybC1yenQyaC5jDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9yZW5lc2Fz
L3BpbmN0cmwtcnp0MmguYw0KPiA+ID4NCj4gPiA+ID4gQEAgLTE3MCw2ICsxNzEsMjUgQEAgc3Rh
dGljIGludCByenQyaF92YWxpZGF0ZV9waW4oc3RydWN0IHJ6dDJoX3BpbmN0cmwgKnBjdHJsLCB1
bnNpZ25lZCBpbnQNCj4gb2Zmc2V0KQ0KPiA+ID4gPiAgICAgICAgIHJldHVybiAocGluY2ZnICYg
QklUKHBpbikpID8gMCA6IC1FSU5WQUw7DQo+ID4gPiA+ICB9DQo+ID4gPiA+DQo+ID4gPiA+ICtz
dGF0aWMgdTggcnp0MmhfcGluX3JlYWRfcG0oc3RydWN0IHJ6dDJoX3BpbmN0cmwgKnBjdHJsLCB1
OCBwb3J0LCB1OCBwaW4pDQo+ID4gPiA+ICt7DQo+ID4gPiA+ICsgICAgICAgdTE2IHJlZyA9IHJ6
dDJoX3BpbmN0cmxfcmVhZHcocGN0cmwsIHBvcnQsIFBNKHBvcnQpKTsNCj4gPiA+ID4gKw0KPiA+
ID4gPiArICAgICAgIHJldHVybiBmaWVsZF9nZXQoUE1fUElOX01BU0socGluKSwgcmVnKTsNCj4g
PiA+ID4gK30NCj4gPiA+ID4gKw0KPiA+ID4gPiArc3RhdGljIHZvaWQgcnp0MmhfcGluX3dyaXRl
X3BtKHN0cnVjdCByenQyaF9waW5jdHJsICpwY3RybCwgdTggcG9ydCwgdTggcGluLCB1OCBwbSkN
Cj4gPiA+ID4gK3sNCj4gPiA+ID4gKyAgICAgICB1MTYgcmVnOw0KPiA+ID4gPiArDQo+ID4gPiA+
ICsgICAgICAgZ3VhcmQocmF3X3NwaW5sb2NrX2lycXNhdmUpKCZwY3RybC0+bG9jayk7DQo+ID4g
PiA+ICsNCj4gPiA+ID4gKyAgICAgICByZWcgPSByenQyaF9waW5jdHJsX3JlYWR3KHBjdHJsLCBw
b3J0LCBQTShwb3J0KSk7DQo+ID4gPiA+ICsgICAgICAgcmVnICY9IH5QTV9QSU5fTUFTSyhwaW4p
Ow0KPiA+ID4gPiArICAgICAgIHJlZyB8PSAodTE2KXBtIDw8IChwaW4gKiAyKTsNCj4gPiA+DQo+
ID4gPiBHZW5lcmFsIHJlbWFyazogdGhlIG5lZWQgZm9yIHRoaXMgY2FzdCBpcyBvbmUgcmVhc29u
IHdoeSBmdW5jdGlvbg0KPiA+ID4gcGFyYW1ldGVycyBzaG91bGQgdXNlICJ1bnNpZ25lZCBpbnQi
IGluc3RlYWQgb2YgdTguICBUaGUgb3RoZXIgcmVhc29uIGlzDQo+ID4gPiB0aGF0IHRoZSBjb21w
aWxlciBtYXkgYWRkIGNvZGUgdG8gbWFzayB0aGUgcGFyYW1ldGVycyB0byA4IGJpdHMsDQo+ID4g
PiBkZXBlbmRpbmcgb24gdGhlIENQVSBhcmNoaXRlY3R1cmUuDQo+ID4NCj4gPiBTaG91bGQgSSBz
d2l0Y2ggdGhlIHBtIHBhcmFtZXRlciB0byB1bnNpZ25lZCBpbnQgZm9yIFYyIHRoZW4/DQo+IA0K
PiBZZXMgcGxlYXNlLg0KPiANCg0KV2lsbCBkbyBpbiBWMi4NCg==
