Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2099.outbound.protection.partner.outlook.cn [139.219.146.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4814134A795;
	Thu, 30 Jul 2026 11:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.99
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785411083; cv=fail; b=T4LZqNte0/bSw/0v3bp9eHreugIdMoCWZfNBaFIVWBl/O4qzOnMyHyjXzr89wRog32waPXoOXEY14V4yzPN9JvwivKtBjpR/IvXMz1cfQEe+jocOV0f4Yah2aZORjPb3HxHNSIgOmClQMjg0zFHCcGI+wc6ak5koB19q7NdnP98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785411083; c=relaxed/simple;
	bh=YVuioIc3uy5p7a3ZziMo2OgwxTTIy0i3st4Fvp24ohw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ee5C56+kDlbOwMOM/XRvmarehcMg4yoeqVD8WJ5mXL2UYRb0zhRaOpOsCYiQyzS/IIx3KKoyxGNBtsNc+Tpma00fEkhrEcl2o4VQtCEt9L0Ma8AvgIBu+7wzlPHMB6kMj3DxZ9inK3Op+dBWGL/sIunMM/tdnNfij8CSoVvnKOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jiXMd+G9mCyRQa9VSA5CyPcl7doHvCvQXtWuwApPfQ/Qthvc493ahaUT/2dcAV+rBNM8tDs8x2PdGhWpTC1xnNu70yNI2GG6mcqILDsMGErtJMc7Mt/IbqhaTySBogOaIGSjX2EN6X20ajYHfbdgUVg0afRbrqkAAy3pIM4HIdOoGvTUYIEY3+4Q2rRUN8odKkJ9ypNiP1nSIreDlAOiD5tx5lnfyTj1FhAbKU7fs79//DO1jp5H+8ForeqvWWaraFShgcLiBdjeiOMMrWYoU9cCYM0Ymzo4LR+3hS/7yHJ6s7ryvadKHeLWm3oJNcocOVrvgNI6Vbd+QMD81+dXXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVuioIc3uy5p7a3ZziMo2OgwxTTIy0i3st4Fvp24ohw=;
 b=DHrTGNHo2AqgyGZXNURUWsClXkfIsZA5ros4ge9yNFlzRxT721kNKLFB1vy93CbYk68bEDCRjB8sKK+emqxXtTiP5tg+tN9qJk4HZakojcfzCfewvmZN6US5mo5WsPxNAm0MQ2ky7kyTNcCAGpVb5UI8XnVnSbkvoDy1Y4xAocPvh9ZC16WQzrAUCvzOU9t0euSk0QA9T3Px9wnDqnvKj7uQ/yE12aGwLPhKcCSlxFsu2VyaoQnsnjrw02VJkYg4g21L50Neb4kh+d5k1qo66seVTeV4IrnCL2VTRqvqlQ620cWcy7q1/EWNHFrxXxfWmU3zvNoMQVGJNXy88aGo2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ2PR01MB1210.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:11::6) by ZQ2PR01MB1179.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:7::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Thu, 30 Jul
 2026 10:58:24 +0000
Received: from ZQ2PR01MB1210.CHNPR01.prod.partner.outlook.cn
 ([fe80::373f:26e:7d1b:38b7]) by ZQ2PR01MB1210.CHNPR01.prod.partner.outlook.cn
 ([fe80::373f:26e:7d1b:38b7%4]) with mapi id 15.21.0270.012; Thu, 30 Jul 2026
 10:58:24 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Linus Walleij <linusw@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Palmer
 Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel
	<p.zabel@pengutronix.de>, Bartosz Golaszewski <brgl@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Lianfeng
 Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v3 04/21] pinctrl: starfive: Add StarFive JHB100 sys0
 controller driver
Thread-Topic: [PATCH v3 04/21] pinctrl: starfive: Add StarFive JHB100 sys0
 controller driver
Thread-Index: AQHc8x1jj1AWoBKzsESqiyGUJQ5KXbY5RwGAgEUSdKCAAEHjAIAHoxrg
Date: Thu, 30 Jul 2026 10:58:24 +0000
Message-ID:
 <ZQ2PR01MB121089A3224D22A573A0875BF2C92@ZQ2PR01MB1210.CHNPR01.prod.partner.outlook.cn>
References: <20260603055347.66845-1-changhuang.liang@starfivetech.com>
 <20260603055347.66845-5-changhuang.liang@starfivetech.com>
 <CAD++jL=Qd8ADR_kX2Q7msM4Dd0xFayPGM4ZzB3uv2ufvkuybtQ@mail.gmail.com>
 <ZQ4PR01MB120228AD03507B4836EFE19DF2CE2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <CAD++jLnNa6HsS5q5aYHxCLkQdZ3eh09PspO=eZx-4=p4EFr4PA@mail.gmail.com>
In-Reply-To:
 <CAD++jLnNa6HsS5q5aYHxCLkQdZ3eh09PspO=eZx-4=p4EFr4PA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ2PR01MB1210:EE_|ZQ2PR01MB1179:EE_
x-ms-office365-filtering-correlation-id: 36bf660c-f4fc-452f-5459-08deee297a0c
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|7416014|23010399003|18002099003|22082099003|38070700021|6133799003|56012099006|4143699003|10067099003;
x-microsoft-antispam-message-info:
 qEX5POb3mjvaO0B3kz9qgXyPMIRKNR6/sEG4ia8hdFNGEsT56onxkCoOn7BGHWiJfuMEo55FvGijN9TyJ2zhBvyFQz2ivLWrYZrmePMKXLXDHvqTShBKuew3ze/0EIBpBDFZZkhmCknZzjhEIYicshdBfZ+LU1MbieqjtgNOHQEu7PopMAZ+ue3bnnd0/x/C9g8y6EvtGKpEOt83Je/9nsl3RSdpDlRTlLVVOsmHwX7bXeh2PrYe6p6re0e/WnPPwA/CIlXbBvar2VIzKZSypMzW6CXkUQJ9mrzUoDWF62BOML6/3XbI9sWrtlVEcfMoc3qs7pE3TiY32IuhxuivHCCjezi/rd3zWKIteopJMUjGfR0S52CrAOZtZeM7B9poYh6Pg5RMTkNEJ1Mf8SnNAvCxgpeFh/VA5MqmQfDbJguRhmj7ytEfkZayQVPnYWDUArSYoz1XEHPXwmzqehhgYVN9XN+LHgyr3WDDX297FFVfi/UF10Qhkds/vT5WohtCJxzMKVwqyx2UxjK4ZIte7SUxoTJpwe0so8va2wrQ69f7Hvk6w9/jhD2SSS5SHqU/
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ2PR01MB1210.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7416014)(23010399003)(18002099003)(22082099003)(38070700021)(6133799003)(56012099006)(4143699003)(10067099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Wi9mQXRmRzBIZ1Q2eHFlbDd5bTlXYTNiNjZNWitEK1AzWG5BdytoMTllYklF?=
 =?utf-8?B?TEFiYm80b0hvMExvMlBkWGhVSXlNYVYyT0wvUXVMQ0JYOFQyT1NJaXVBOWxz?=
 =?utf-8?B?ek9HUSs4aUh1aDNtRitYRktPNGlqclpFcm56QnFSb2JRalN0RHNzeUdiMzUv?=
 =?utf-8?B?a0RsRGRNS0JmVU82NXNIQis5UHRiVnBDajZvM1NDMVdIUEVpMkY4QXlVNWNP?=
 =?utf-8?B?czBCRDVQOC9PTm5iOFk1TFdZRysrbW1NTkQrTzJVU2dwUThFOEg2bUxBcWhK?=
 =?utf-8?B?Z3d4SUV2NnNvb2E1RHJIQnJ5RENZMXNwSlQxd2R6Q3RLN1R3TzVBTDB5VGw0?=
 =?utf-8?B?SkhZQ3IrKzdCTmFzWmdEYUZ3TGlrL0NIT3NqL2lCbkZNOVlTc2ZoN3FpWHJ0?=
 =?utf-8?B?OFJRL3g5YTRyV3VLejNhdHdLOEFyeW9mOFBrTURRdnBaMWM2OHJWK29HNEJS?=
 =?utf-8?B?ZzJqUnBMTS9rMjJBbzZzTkVnWWlheTNEZC9YSzBZTEIxU3BCV0VjYU15SFBX?=
 =?utf-8?B?TlhQYTVIektPYVJxbEMxbnFtdnZZU0FNTVEwa3NCT3YvMUQwVWVTMVBsL2Ju?=
 =?utf-8?B?V1ZWTENsTmVJUC9hc1dEUHl6V1ZpZWN3U29pZUZjdWxZS3kxd1ovUHNEckJT?=
 =?utf-8?B?ZGZTUTY4Z2x5dHY3TmtEN1VoejdCajZBYlhrZnpIa0w1bWg3cGFsMzU5Z0Js?=
 =?utf-8?B?UUpSMnBSOVNWQlFSWTJmV3JHYTlhd2pnbi9HVG1yNTBBSUhGdUhHRDVhY0FE?=
 =?utf-8?B?YXlhM3V2ZEFRb2ozN3NmZjFTRCthazBaTlNFUzA0b2ZtVDEzeTZVemdmVW1U?=
 =?utf-8?B?MzRyVmxoQW0zOFpmL3dzVW1tZktua0wwVDhIOXBHSDJNRmFpWGl2WTE2L0Jy?=
 =?utf-8?B?bERaYXlIYWtOVHM2N1J0MmcxQ0k5dFJ5b21PblFXOHB1Wll1U0k1cm9icmtP?=
 =?utf-8?B?UkFHTjhmMzRabzNPMDdRUVdWQzNMNjR2L29yazk1Ny92VCtDTnFOdjhrWVFq?=
 =?utf-8?B?c2hLRmYxUitpeWNZQkJPWm1EU0dMZTY0RFR4dGw2QUJydHJySjlZYWFpZTJz?=
 =?utf-8?B?eUJ6WmJ0U3VxdmhOa0R6aVBDdlpTQ2ZYUys2UlpaU2hiaG5wbFdUU09iVFE5?=
 =?utf-8?B?MGtHYlpqMmlZYms5ZTMwRG1pV3hPWGFZN3ZCaG1FK3hQek1NeXVweXNyWlRz?=
 =?utf-8?B?R0gvWkcwMHE2OVpEQUpLYjUxNDFUYm5kdUxET2s0NEIvZTZMdXRxVkUrN05j?=
 =?utf-8?B?Sm91QkFEa1pqdFBaaWYvQXkwbTFnNS8wcDBwTUlkVm9iRWt2N1hjYTI4WGdC?=
 =?utf-8?B?SExCRFVDY0lreCtlZDI0MldtVzhJWW5YbUhXLzdhaExGWUJKU1A4OTFsQkN0?=
 =?utf-8?B?b3NoTitjRm9weGx1OGNqOEZzMG1SRC9iV3NPS1J5Zm8xWlFYV0I1Ny9MaDll?=
 =?utf-8?B?WHpWdGNPb3JkUGxRK0E2K1k2a0JiZ3lvRWRBTjBFRWkyRWxTaWoza29BbnJs?=
 =?utf-8?B?L1owcVpDNys1YUZzbzZxQmlZc0xqaENtVVRGelJIelBkVzhHaDJQbmRrWVl0?=
 =?utf-8?B?VHhjMGZkR3pudk9hWVdabmgxeURZcEl6K0tNRGMrem5sTkJsa293Z2VVcWww?=
 =?utf-8?B?azBqeld6VlBCR1QvaVNWeVV4eGdkYm80NjRIVHByRDdla29mOXQ2MDlVc2xP?=
 =?utf-8?B?dkZZYXMvcmhTSWNTWlFURXZxL25Na3FkWjlvZDg3dXN0eUprN0pERDZQbjc0?=
 =?utf-8?B?MGtkb3c5MFpXSnRaRHZxOWhTS01SOEdVckUwS05pK2RXek83SnY0a1pJc1E2?=
 =?utf-8?B?bklRTytYWml4U1h5VFVWc1luaWJ0d044elFVb0FUcm8veFlpb0JxQzNxL1Vs?=
 =?utf-8?B?ajgrUXpwdFZjSDRDTFhMMGZ6SHJkb3NjMzhLNkxTa1hFNXB0MTdWWnR5ZlJO?=
 =?utf-8?B?YU54Q3ptN2xQK3VHb0g3MkgyVVZhUCtpMVJXa1hsNGVicGFHV3IwTjhiZTNr?=
 =?utf-8?B?VHp4UmxqYWJ0WGxWLzJYamdFeW1DaXdHRXp5TUIyMUcxeEF2Tmx0TlBaUjVH?=
 =?utf-8?B?ZDN2N1laQ1FVZGk2ZVJEOUd5VXVqaU14QUlRYTJqNjFJM2ZycHRsNU8vWXdO?=
 =?utf-8?B?bDllRXBXWHhjR3VuenJqb3R4cEFpaVFYaGt4c3FvTjRRV20rNzA5bU1SMmZ1?=
 =?utf-8?B?K0pwZ0xFeUMvM0xsby9EL0Y0VEEyb0xGdFdXYnJQTjVDODZaWGRPQ0hRYURt?=
 =?utf-8?B?cDRnUHphc2VHQkN1UTFBcmdEbjhPNDByL21sUWhPMnBtT2gwMGtEeUlUMjRx?=
 =?utf-8?B?SnJQc2lValRoY2VmcjVGeWVYYW8vNjA5OFZxQlMyTEc0TWRjYXdzOWl6N3V3?=
 =?utf-8?Q?/q7d8LwXQcwibJBc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ2PR01MB1210.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 36bf660c-f4fc-452f-5459-08deee297a0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2026 10:58:24.1790
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ZfGBpyznHgkoh/JkrQChe+Lr98d+oN3Z9tELf2v32EPE6hdmAyGSxFse3TQu8gMFoAKR8ZItY4pVSfCc2+TwL2B6HeaH1GasN+6fokpYnw9Czr3Qdbok7jh4XtPGDoqK
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ2PR01MB1179

SGksIExpbnVzDQoNCj4gT24gU2F0LCBKdWwgMjUsIDIwMjYgYXQgMTI6MjXigK9QTSBDaGFuZ2h1
YW5nIExpYW5nDQo+IDxjaGFuZ2h1YW5nLmxpYW5nQHN0YXJmaXZldGVjaC5jb20+IHdyb3RlOg0K
PiA+ID4gT24gV2VkLCBKdW4gMywgMjAyNiBhdCA3OjU04oCvQU0gQ2hhbmdodWFuZyBMaWFuZw0K
PiA+ID4gPGNoYW5naHVhbmcubGlhbmdAc3RhcmZpdmV0ZWNoLmNvbT4gd3JvdGU6DQo+IA0KPiA+
ID4gPiArc3RhdGljIHVuc2lnbmVkIGludCBqaGIxMDBfZ3Bpb190b19waW4oc3RydWN0IGdwaW9f
Y2hpcCAqZ2MsDQo+ID4gPiA+ICt1bnNpZ25lZCBpbnQgZ3Bpbykgew0KPiA+ID4gPiArICAgICAg
IHN0cnVjdCBqaGIxMDBfZ3Bpb19iYW5rICpiYW5rID0gamhiMTAwX2djX3RvX2JhbmsoZ2MpOw0K
PiA+ID4gPiArDQo+ID4gPiA+ICsgICAgICAgcmV0dXJuIGJhbmstPmlkICogSkhCMTAwX05SX0dQ
SU9TX1BFUl9CQU5LICsgZ3BpbzsgfQ0KPiA+ID4NCj4gPiA+IFRoaXMgdXN1YWxseSB0ZWxscyBt
ZSB0aGF0IEdQSU9fR0VORVJJQyBjYW4gYmUgdXNlZCBidXQgbWF5YmUgdGhpcw0KPiA+ID4gaGFz
IGJlZW4gZGlzY3Vzc2VkIGJlZm9yZS4uLg0KPiA+DQo+ID4gSGVyZSwgdGhlIG1haW4gcHVycG9z
ZSBpcyB0byBjb252ZXJ0IEdQSU9zIGludG8gcGlucyBmb3IgY29uZmlndXJpbmcNCj4gPiBjZXJ0
YWluIHBpbmN0cmwgc2V0dGluZ3MuIEkgaGF2ZW4ndCBmb3VuZCB0aGUgcGFydCB3aGVyZSBHUElP
X0dFTkVSSUMgY2FuDQo+IGFzc2lzdCB3aXRoIHRoaXMuDQo+ID4gQ2FuIHlvdSBwb2ludCBpdCBv
dXQgZm9yIG1lPyBUaGFuayB5b3UgdmVyeSBtdWNoLg0KPiANCj4gTm9ybWFsbHkgR1BJTyBjaGlw
cyB1c2UgdGhlIC5jb25maWcoKSBjYWxsYmFjayB3aGVuIHlvdSB3YW50IHRvIHNldCBwaW4NCj4g
Y29uZmlnIGZvciBhIGNlcnRhaW4gcGluIGluIGEgcGluY3RybCBiYWNrZW5kLg0KPiANCj4gU2Vl
IERvY3VtZW50YXRpb24vZHJpdmVyLWFwaS9ncGlvL2RyaXZlci5yc3Q6DQo+IA0KPiAiVGhlIC5z
ZXRfY29uZmlnKCkgY2FsbGJhY2sgdXNlcyB0aGUgc2FtZSBlbnVtZXJhdG9ycyBhbmQgY29uZmln
dXJhdGlvbg0KPiBzZW1hbnRpY3MgYXMgdGhlIGdlbmVyaWMgcGluIGNvbnRyb2wgZHJpdmVycy4g
VGhpcyBpcyBub3QgYSBjb2luY2lkZW5jZTogaXQgaXMNCj4gcG9zc2libGUgdG8gYXNzaWduIHRo
ZSAuc2V0X2NvbmZpZygpIHRvIHRoZSBmdW5jdGlvbiBncGlvY2hpcF9nZW5lcmljX2NvbmZpZygp
DQo+IHdoaWNoIHdpbGwgcmVzdWx0IGluIHBpbmN0cmxfZ3Bpb19zZXRfY29uZmlnKCkgYmVpbmcg
Y2FsbGVkIGFuZCBldmVudHVhbGx5DQo+IGVuZGluZyB1cCBpbiB0aGUgcGluIGNvbnRyb2wgYmFj
ay1lbmQgImJlaGluZCIgdGhlIEdQSU8gY29udHJvbGxlciwgdXN1YWxseQ0KPiBjbG9zZXIgdG8g
dGhlIGFjdHVhbCBwaW5zLiBUaGlzIHdheSB0aGUgcGluIGNvbnRyb2xsZXIgY2FuIG1hbmFnZSB0
aGUgYmVsb3cNCj4gbGlzdGVkIEdQSU8gY29uZmlndXJhdGlvbnMuDQo+IA0KPiBJZiBhIHBpbiBj
b250cm9sbGVyIGJhY2stZW5kIGlzIHVzZWQsIHRoZSBHUElPIGNvbnRyb2xsZXIgb3IgaGFyZHdh
cmUNCj4gZGVzY3JpcHRpb24gbmVlZHMgdG8gcHJvdmlkZSAiR1BJTyByYW5nZXMiIG1hcHBpbmcg
dGhlIEdQSU8gbGluZSBvZmZzZXRzIHRvDQo+IHBpbiBudW1iZXJzIG9uIHRoZSBwaW4gY29udHJv
bGxlciBzbyB0aGV5IGNhbiBwcm9wZXJseSBjcm9zcy1yZWZlcmVuY2UgZWFjaA0KPiBvdGhlci4i
DQoNCkkgdHJpZWQgdGhpcyBjaGFuZ2UsIGJ1dCBpdCBkb2Vzbid0IHdvcmsuIEluIG15IG5ldyB2
ZXJzaW9uLCB0aGUgR1BJTyBkaXJlY3Rpb24gaXMgc2V0IA0KdmlhIHRoZSBgc3RydWN0IHBpbm11
eF9vcHMgLmdwaW9fc2V0X2RpcmVjdGlvbmAgY2FsbGJhY2ssIHdoaWNoIGlzIGV4ZWN1dGVkIGFm
dGVyIA0KYG11dGV4X2xvY2soJnBjdGxkZXYtPm11dGV4KTtgLiBJIG5lZWQgdG8gY29uZmlndXJl
IHNvbWUgcGluY29uZiBzZXR0aW5ncyB3aGlsZSANCnNldHRpbmcgdGhlIEdQSU8gZGlyZWN0aW9u
IGluc2lkZSBgLmdwaW9fc2V0X2RpcmVjdGlvbmAsIGZvciBleGFtcGxlOg0KDQogICAgY29uZmln
ID0gcGluY29uZl90b19jb25maWdfcGFja2VkKFBJTl9DT05GSUdfSU5QVVRfRU5BQkxFLCAwKTsN
CiAgICByZXQgPSBwaW5jdHJsX2dwaW9fc2V0X2NvbmZpZyhnYywgZ3BpbywgY29uZmlnKTsNCg0K
SG93ZXZlciwgYHBpbmN0cmxfZ3Bpb19zZXRfY29uZmlnYCB3aWxsIGFnYWluIGFjcXVpcmUgdGhl
IGxvY2sgd2l0aCANCmBtdXRleF9sb2NrKCZwY3RsZGV2LT5tdXRleCk7YC4NCg0KU28gdGhpcyBh
cHByb2FjaCBtYXkgbm8gbG9uZ2VyIHdvcms/DQoNCj4gTWF5YmUgdGhpcyBpcyB3aGF0IHlvdSdy
ZSBsb29raW5nIGZvcj8NCj4gDQo+IElmIHlvdSBkZWZpbmUgZ3Bpby1yYW5nZXMgaW4geW91ciBk
ZXZpY2UgdHJlZSwgdGhlIEdQSU8gYW5kIHBpbiBjb250cm9sIGNvcmUNCj4gZGVhbHMgd2l0aCB0
aGUgY3Jvc3MtcmVmZXJlbmNpbmcgZm9yIHlvdS4NCj4gDQo+ID4gPiA+ICsgICAgICAgc2ZwLT5u
dW1fYmFua3MgPSBESVZfUk9VTkRfVVAoc2ZwLT5uZ3Bpb3MsDQo+ID4gPiA+ICsgSkhCMTAwX05S
X0dQSU9TX1BFUl9CQU5LKTsNCj4gPiA+ID4gKw0KPiA+ID4gPiArICAgICAgIGZvciAodW5zaWdu
ZWQgaW50IGkgPSAwOyBpIDwgc2ZwLT5udW1fYmFua3M7IGkrKykgew0KPiA+ID4gPiArICAgICAg
ICAgICAgICAgaWYgKHNmcC0+bmdwaW9zID4gKGkgKyAxKSAqDQo+ID4gPiBKSEIxMDBfTlJfR1BJ
T1NfUEVSX0JBTkspDQo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHNmcC0+YmFua3Nb
aV0uZ2MubmdwaW8gPSAoaSArIDEpICoNCj4gPiA+IEpIQjEwMF9OUl9HUElPU19QRVJfQkFOSzsN
Cj4gPiA+ID4gKyAgICAgICAgICAgICAgIGVsc2UNCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgc2ZwLT5iYW5rc1tpXS5nYy5uZ3BpbyA9IHNmcC0+bmdwaW9zIC0gaSAqDQo+ID4gPiA+
ICsgSkhCMTAwX05SX0dQSU9TX1BFUl9CQU5LOw0KPiA+ID4NCj4gPiA+IFRoaXMgbG9va3MgY29t
cGxldGVseSBiYW5hbmFzLCBzaG91bGRuJ3QgdGhpcyBiZSBzaW1wbHk6DQo+ID4gPg0KPiA+ID4g
c2ZwLT5iYW5rc1tpXS5nYy5uZ3BpbyA9IEpIQjEwMF9OUl9HUElPU19QRVJfQkFOSzsNCj4gPg0K
PiA+IFRoZSBKSEIxMDAgR1BJTyBkb21haW4gaXMgbm90IGZ1bGx5IGFsaWduZWQgdG8gMzIuIEZv
ciBleGFtcGxlLCBpbiB0aGUNCj4gPiBwZXIwIGRvbWFpbiwgdGhlcmUgYXJlIDYwIEdQSU9zLCBz
byBJIHNwbGl0IGl0IGludG86DQo+ID4gYmFuazA6IDMyIEdQSU9zDQo+ID4gYmFuazE6IDI4IEdQ
SU9zLg0KPiANCj4gQXQgbGVhc3QgYWRkIHRoYXQsIHdoYXQgeW91IGp1c3Qgd3JvdGUsIGFzIGEg
Y29tbWVudCByaWdodCBhYm92ZSB0aGlzIGxvb3AuDQo+IA0KPiBUaGVyZSBpcyBzb21ldGhpbmcg
d2l0aCB0aGlzIG1hdGggSSB0aGluayBjYW4gYmUgbWFkZSBzaW1wbGVyIHdpdGggYml0d2lzZQ0K
PiBhcnRpdGhtZXRpYy4gVGhpbmsgYWJvdXQgaXQuDQo+IA0KPiA+ID4gPiArICAgICAgICAgICAg
ICAgc2ZwLT5iYW5rc1tpXS5nYy5yZXF1ZXN0ID0gcGluY3RybF9ncGlvX3JlcXVlc3Q7DQo+ID4g
Pg0KPiA+ID4gVXNlDQo+ID4gPiBncGlvY2hpcF9nZW5lcmljX3JlcXVlc3QNCj4gPiA+DQo+ID4g
PiA+ICsgICAgICAgICAgICAgICBzZnAtPmJhbmtzW2ldLmdjLmZyZWUgPSBwaW5jdHJsX2dwaW9f
ZnJlZTsNCj4gPiA+DQo+ID4gPiBVc2UNCj4gPiA+IGdwaW9jaGlwX2dlbmVyaWNfZnJlZQ0KPiA+
ID4NCj4gPiA+IFRoZXNlIGNhbGxzIHdpbGwgZG8gd2hhdCB5b3Ugd2FudCwgYW5kIGFsc28gY2hl
Y2sgdGhhdCB0aGUgcmlnaHQNCj4gPiA+IGdwaW8gcmFuZ2VzIGFyZSBhdmFpbGFibGUuDQo+ID4g
Pg0KPiA+ID4gTWFrZSBzdXJlIHlvdSBhZGQgR1BJTyByYW5nZXMgKHRoZSBtYXBwaW5nIGJldHdl
ZW4gcGluIGNvbnRyb2wgcGlucw0KPiA+ID4gYW5kIGNvcnJlc3BvbmRpbmcgR1BJTyBvZmZzZXRz
KSBmb3IgdGhpcyB0byB3b3JrIHByb3Blcmx5Lg0KPiA+ID4NCj4gPiA+IEknbSBwcmV0dHkgc3Vy
ZSB5b3UgY2FuIGhhdmUgYSBnZW5lcmljIHBpbiBjb25maWcgYmFja2VuZCBhcyB3ZWxsLg0KPiA+
ID4NCj4gPiA+IHNmcC0+YmFua3NbaV0uZ2Muc2V0X2NvbmZpZyA9IGdwaW9jaGlwX2dlbmVyaWNf
Y29uZmlnOw0KPiANCj4gVGhpcyBpcyBwZXJ0YWluaW5nIHRvIHdoYXQgSSBzYWlkIGFib3ZlIGFi
b3V0IHVzaW5nIHRoZSBncGlvIHJhbmdlcyBhbmQgLmNvbmZpZw0KPiBldGMuDQo+IA0KPiA+ID4g
VGhpcyB3aWxsIG1ha2UgY29uZmlnIGNhbGxzIHRvIHRoZSBncGlvY2hpcCBjYWxsIGludG8gdGhl
IHBpbmN0cmwNCj4gPiA+IGJhY2tlbmQgPSB3aGF0IHlvdSB3YW50Lg0KPiANCj4gSSBzdGlsbCB0
aGluayB0aGlzIGlzIHdoYXQgeW91IHdhbnQuDQo+IA0KPiBZb3VycywNCj4gTGludXMgV2FsbGVp
ag0KDQpCZXN0IFJlZ2FyZHMsDQpDaGFuZ2h1YW5nDQo=
