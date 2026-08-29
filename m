Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2109.outbound.protection.partner.outlook.cn [139.219.146.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148D82C11EE;
	Sat, 29 Aug 2026 03:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787972925; cv=fail; b=J8sx+4LFkCit+7jfNrsyrDkYpPtL/M1e/XcVMEZqLCdQtTJ6mt2XABDtR5VqFnF6oYZpvb/ZRKIfU/B2Ql0zGyQhR1C4++NMNU4+ujSVN3tfeJ8GR8rTyj4dWYyMAtxxaWRn++cYkZtp0dN1ENcgrIHYRDwJXTx0Kwsr232tGIQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787972925; c=relaxed/simple;
	bh=9IsoxvYny+CaHfGwl3w9GVrmL2dwb7dq22335WVgcd0=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=rcBNt8sdosuNg93wjBIeGk4NueOYd5wiRyZB6v58HHYIW7CnoFECFYTFHnuWwCeOZL26ukbEavFhcfXsy7m6o+TBauPD0BY1eu8ixrPsNoqQVflDUroQtk0aKjnpYO+zRLebrZXTqv1vuo9C1cuxY+YQvsPUsEqY0YmgMoep06s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mtrnL/yQNW/f42qM6BY/GhrOel3x6EMDAlnwDNX3gw4ljpFMkUWiR8J2hZ68amztotd9uvUjWn3F6iG9Z4OxJzOYTiqugreldHXCmmExQFlZD2F8jiIiuhiYrDZMWinG7oHeMuCr6xpgO7dfXx0lHBnf7OJeCu02l/MTFqk2iBDEvrQxtKvUD6Rtgne0J7GXlImtHyXatY/fYO11r89LnMUg2H/9y0P6ncWddplviNrsMyLXJgTxGchNra8W4vsPK8RwaetJlztYjP4IMhVMq9/eFUDKn+9wTWVaWuTGRWRf4E1Q+A7+2vCyMx/SJWw7ubvYM69j200YTh2AXziS3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9IsoxvYny+CaHfGwl3w9GVrmL2dwb7dq22335WVgcd0=;
 b=fzuXu1NRAZdRG4dJMEOdaPjv75YKoTbnzmhxTaoxbzsv0cBzKlGVctOCTvWmEbrRfcFigr/mBnd7NnbHUC+0b7kH1PeTBuaQDPMoFjmM5c3mdSgEJnVInsEw9Slf8+YYXF1m+0Qc/zx7Bznvtd9elbiYgQ2Z6A0jV+Fb9Xt0P1lHFuFbXIzFrb8KOqz97TsdeSpMBPh/pz10MId5YSzAxFURM81PGg76UhkbKnB8t4y5kxTxqDWGSl/5S+zPapF3+tJReX7ll5Sgak4aR14rfRY/rN1Q2T/ITJR1blWpeWRJVOSI1OQ9angXNbxvvXOZV7zH+91thkok0uPoT3CiUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1233.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.19; Sat, 29 Aug
 2026 03:08:36 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0315.011; Sat, 29 Aug 2026 03:08:36 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Rob Herring <robh@kernel.org>, Linus Walleij <linusw@kernel.org>
CC: Krzysztof Kozlowski <krzk@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Emil Renner Berthing <kernel@esmil.dk>, Alexandre Ghiti
	<alex@ghiti.fr>, Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>, Albert
 Ou <aou@eecs.berkeley.edu>, Bartosz Golaszewski <brgl@kernel.org>
Subject: Re: [PATCH v5 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Thread-Topic: [PATCH v5 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Thread-Index:
 AQHdKJKmmncLFStLcUOAd2EEccdBl7aW8JiAgAAZydCAAFDGAIAA0XrAgASfjJCAAFQugIAATPHggATOFwCAABFKgIASKYnQ
Date: Sat, 29 Aug 2026 03:08:36 +0000
Message-ID:
 <ZQ4PR01MB1202CB0BB258ED52179F3DF4F2AB2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260810063650.239303-1-changhuang.liang@starfivetech.com>
 <20260810063650.239303-4-changhuang.liang@starfivetech.com>
 <178634991918.1014951.7989635238440361454.robh@kernel.org>
 <ZQ4PR01MB120202070B9006984B8677EAF2DE2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260810144012.GA1574021-robh@kernel.org>
 <ZQ4PR01MB12020D2031C400FF805791B7F2DD2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <ZQ4PR01MB120275B9C0CF6BCE8C88261CF2DA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260814-shapeless-onyx-pronghorn-d423a9@quoll>
 <ZQ4PR01MB12022F6D6F71542033CF857BF2DA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <CAD++jL=Q38HwraN1NEOxLf_hE+k=3Q6JP+DUgQsThfYve0t0RA@mail.gmail.com>
 <20260817134715.GA18207-robh@kernel.org>
In-Reply-To: <20260817134715.GA18207-robh@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1233:EE_
x-ms-office365-filtering-correlation-id: 739ddd83-84bc-4b2c-3561-08df057ad167
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|10067099003|38070700021|56012099006|4143699003|5023799004|22082099003|18002099003;
x-microsoft-antispam-message-info:
 sJp7ZF9xPUoqVPy53vBNtG0LQipxGH1g9Vfyxbhao0u9zjujKphHh4WCcAOBJO53r4vKvNAyCSXi7emwwdSUR3IVeIpovqYwl4I++SZS3KfRQn1PGciy3wLwkqnCFcZ81I+LUM35z5+TiOiFvJJjNqnL0MPHShC7xHK84UkoZI6ZV/fQr/mABfIVapz8WtUI9Rb4Q/l8+axpmdqX7XKXfBtWX1pZLaSfKWlQUdxQDXSyIZs1kqfiwdfEbHIFia2uo7O03uCyNfF8T2Y0T0MW3R1ym12D02XKfJb8OQvUYKDqQqcSc4Df1SyJ0PBUQf3ESrJAcTICokpx3t7H6kSoLYQ+3S2vQxRR5OCEsec+GYjPMBdjEdqy4HqEeUf+3QbOX6vv5RA/yI/gQwfUPXw7wqFOviUBMDF5zBQWJI3qaNqd0j6P31epQWyYZdAuPuyTksIvn8qt510xmVJzCtuAdbyVt+x6fJzZeJ7oTXyj+GsKlM7Tqqg7phxrThpLzc+HF+woimEhkb4qMGlbB0fgaDg5YfXir3zsdD5VJcP0KlbUq9CYFWbKJVHsb7/Y8QjS
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(10067099003)(38070700021)(56012099006)(4143699003)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dEhYd2pzODJhWXJjcm5QbndIWGxHb05DcEEyNmMyUVc0RXNMaVJucDdtZUd1?=
 =?utf-8?B?N000ZnpmaFI1QkdHOXA5MDYxYkRERDlOOVpWcFV5cFdaNVQrbWVoVGsra2JW?=
 =?utf-8?B?b3FLNHJRc0k3OVV6L3RudDAyeGt0NzN3d3B3Q3FHT29aT1ZhMmJTdGtkeTFl?=
 =?utf-8?B?VkR4aEpWL2J3a0RXZUwyMlJPdkVuMjJwWHF4SVQvUitlenYzZ2tyWHFXMXB1?=
 =?utf-8?B?bUcwMVZ3RDNNMVRMdnNtSis4SGJCN1UrUGNsck1MMWRIZzJzc3NUZGNLWHlT?=
 =?utf-8?B?OCtJZmdkd1FsTUdKYThMOTcxZU1ReTA1Nm5wWURhWkdicEJMelRzSndWYVVG?=
 =?utf-8?B?aDBQTEI0WXN2dThnU1RPODBkNW5aejdlU3pjbklnN29NZFBOYUM0cFdnMHlh?=
 =?utf-8?B?RmYzelhEVXQra2ZRZ2pWdFRYd1kzRlQ0bDF6MXZ3aDk3QVBFSFpVQk5WSVBo?=
 =?utf-8?B?TWRManJDZ21ZRE9iMnVpa3h4TmdjL1MreFlUd1pvbkNzeVE2aVNESGNOdTRr?=
 =?utf-8?B?Q3B3YXJmK1ZhOGhFQXlzYWcrc0UvZU9LeUU5b3BvZWJUeTRxdlJZeVk0VW1E?=
 =?utf-8?B?dlpyNDdIOGg2cEJqTDNQNUVnWHRWM3ZUZlpWNjRSWEV1ck1hUHJpckZnM1pn?=
 =?utf-8?B?R3hPWXhSbzViS2wxelZ6UDdzUmpxdFZUdjUvcGxTRm1UUitxUGpXbHIwY1BT?=
 =?utf-8?B?YVBXdG9ZbEVXQnNnN1dnMVhoRUpiVzBPMkNKVHZtTUs2eklXMGwybnpmYTZD?=
 =?utf-8?B?d25nck1BZkNqQ3B0S3ZzdEV5MTNuSG14dG5kT0Z6dE5sNi9wR1VDNmdQbkR0?=
 =?utf-8?B?TWtsR01zU3hEU3haOUp2aGN3UmptTXcwbUVndXJYRHBTYnNBN093U3FPMnpl?=
 =?utf-8?B?aVYzeXk4QVJmTEZnb29JRTRpc3hqVHBuZkRjc1M2aS9JZDk1enpIMDRYRENX?=
 =?utf-8?B?Nk9CUlRhOCs2allFb3lTNEFzK0wwc3ZWYmVZT3BsdHhwM2ltSmVZSno3UTh0?=
 =?utf-8?B?NTE3ekQzbVBqYTduTDBvVjRnRjFMLzFkbW9rdXZuT0c2eU1aYTJCSUlHT0xl?=
 =?utf-8?B?TjBta25aY05JdWR6V2VoR2s4YXlTeEZ2NFdHWG1hUmppd3BEUjByR3RJZ2xo?=
 =?utf-8?B?dUdEa2xxWjBjeHJ0VDVIT3p6NFdwSUYvUFBtNDhZOUU3cTlZT00vRmFYQ0ZS?=
 =?utf-8?B?RmZhZWxSNTNuNkNuTjJZbjNWamdNMm1YL3VReEFvbjZRUUVRTzgza3d2WklV?=
 =?utf-8?B?WEhJVWU2bnVuMFlYaDM1dE9xUGNhMkEzZ3lrb2V4VzBNWXNjNkhIZFVseHdO?=
 =?utf-8?B?dFJqRDZtVDlGdHJjbmY2bzVZZzRiV2ZjQlROUTA5NDFITGJ1NndxZ0NvTmFp?=
 =?utf-8?B?cWNUY3RYWmpHZGVsd1I4L3VZU1lXdVZBYnpzakF3UkdUZmtSN201M0wzeWll?=
 =?utf-8?B?YnQvcGVCK0Jpb2ZSTlIwRzVPTnB6L1BVNklTQS91ZGpOeE4zOXhER3V5K21F?=
 =?utf-8?B?SWJoQ1JZRWptc0pKNU5FaElhRHRCZFlhM1V6VlU0NjR6eUJpL25LT2haUUtS?=
 =?utf-8?B?YmZCNzBoUDl0ZzBRYVltNmtjOTk4SE1EMm1ObnFpbXlkY2ZzSHN2cnplQnB5?=
 =?utf-8?B?TTdmNHUxZXRuSEFkcnEzU1V4UXV1bEhwT1NxNG1YUENLOHZicUZRWXIxbDdJ?=
 =?utf-8?B?UDVORnRzYldnS2wrNG01UEVVQU9GbDRaQU9PeDhsaEpnZElqYUlGeXBZSDMr?=
 =?utf-8?B?cE9rVmZvZENVekcvNXhPOFJHUnBudGZzQ0hGVlF6QURNVHJONWZGUDMxZG5u?=
 =?utf-8?B?czB5anZIUHdDUnlLVE9DTjlCV3R5ZU9nWEJRNk4wWGpaSnUyc1JFWEZscnJm?=
 =?utf-8?B?S2R5bHY4TjBJUWtTMHhyMTUwYmpXTTJBQlhRa1llb3hRRUowVEZLclVXZktQ?=
 =?utf-8?B?KzB5M0VuU21tYldTTjE1L2tlNVZjSlUyOGVSUHVtMEx2REhOWDgrWGRqUkFC?=
 =?utf-8?B?cmN1TU84VkIvQTlFbVB0TTlCVk15bDI2QzVEOTJGSUxDVWUzVFI2SnF1aG5V?=
 =?utf-8?B?a2ZJczBGR28vdWhjNGtzOXJhZFhyaWl1Ny9vSFNmY3kvbWVib25SaWgwakEx?=
 =?utf-8?B?RHU2RGh2cFpTcHEwZk9XVzR2MGxtWFlPMXVEdkVlTStrUWRrNFJnUzMreGE4?=
 =?utf-8?B?MWFtS0VNZW9jMk5XNmRzSTRHS1U2NTZpTURrWXFVK242U1NySVBXcHZLV040?=
 =?utf-8?B?eXdyZWhLS0xiYU9LeUt1dCtiZ0FkRTEyRU43SEhjaGpDbjVLdGFRT08xaG1m?=
 =?utf-8?B?SlFRa0ZZMlVjTmNVTk55RW16dFhTMmpiVXRuWGc2ZWcvRmVYcmtDY2t2Nm9L?=
 =?utf-8?Q?HrVCwc86J/oxoQdg=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 739ddd83-84bc-4b2c-3561-08df057ad167
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Aug 2026 03:08:36.6602
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ipRR+SsUMyafLfF0SXywyORHxZ6+4U0nN04GuEQTga3zaxe0azV0YTgsTepe9kThLZ0rmX/nrn2jOrkFeJqXoDtYxabXJDdS2BFzGy58m5iqQUIS2vbMGA9tIahJCDdg
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1233

SGksIFJvYiwgS3J6eXN6dG9mLCBDb25vcg0KDQo+IE9uIE1vbiwgQXVnIDE3LCAyMDI2IGF0IDAy
OjQ1OjIyUE0gKzAyMDAsIExpbnVzIFdhbGxlaWogd3JvdGU6DQo+ID4gT24gRnJpLCBBdWcgMTQs
IDIwMjYgYXQgMToyMuKAr1BNIENoYW5naHVhbmcgTGlhbmcNCj4gPiA8Y2hhbmdodWFuZy5saWFu
Z0BzdGFyZml2ZXRlY2guY29tPiB3cm90ZToNCj4gPg0KPiA+ID4gPiBZb3Ugc3RpbGwgZGlkIG5v
dCBleHBsYWluIHRoZSBjZWxscyAtIG5laXRoZXIgaW4gcmVwbHkgbm9yIGluDQo+ID4gPiA+IGNv
bW1pdCAtIHRodXMgc3RhcnQgd2l0aCB0aGF0LiBXaHkgZG8geW91IG5lZWQgaXQ/IE11bHRpcGxl
DQo+ID4gPiA+IGNvbnRyb2xsZXJzIGhhdmUgZ3JvdXBwZWQgcGlucyBvciBHUElPcyBpbiByZWdp
c3RlcnMsIHNvIGV4cGxhbmF0aW9uDQo+ICJldmVyeSAzMiBHUElPcyBjb3JyZXNwb25kIHRvIG9u
ZSByZWdpc3RlciINCj4gPiA+ID4gdGVsbHMgbWUgbm90aGluZy4gV2h5IHdvdWxkIHRoYXQgbWF0
dGVyIGhvdyBtYW55IEdQSU9zIGlzIGluIG9uZQ0KPiByZWdpc3Rlcj8NCj4gPiA+DQo+ID4gPiBT
aW5jZSBldmVyeSAzMiBHUElPcyBjb3JyZXNwb25kIHRvIG9uZSByZWdpc3RlciwgTGludXMgc3Vn
Z2VzdGVkIGF0IHRoZQ0KPiB0aW1lIHRoYXQgSSBjb3VsZCB0cnkgdXNpbmc6DQo+ID4gPiBncGlv
cyA9IDwmZ3BpbyBbaW5zdGFuY2VdIG9mZnNldCBmbGFncz47IGdwaW8tcmFuZ2VzID0gPCZwaW5j
dHJsDQo+ID4gPiBbZ3Bpb19pbnN0YW5jZV0gZ3Bpb19vZmZzZXQgcGluX29mZnNldCBjb3VudD47
DQo+ID4gPg0KPiA+ID4gVGhlIGFkdmFudGFnZSBvZiB1c2luZyB0aGlzIGlzIHRoYXQgaW4gYSBH
UElPIGNvbnRyb2xsZXIgd2l0aCBtb3JlDQo+ID4gPiB0aGFuIDMyIEdQSU9zLCBldmVyeSAzMiBH
UElPcyBjYW4gYmUgdHJlYXRlZCBhcyBvbmUgR1BJTyBiYW5rLiBUaGlzDQo+ID4gPiB3YXksIGlu
IHRoZSBkcml2ZXIsIGNvbnZlcnRpbmcgcGluX29mZnNldCB0byBncGlvX29mZnNldCBkb2VzIG5v
dCByZXF1aXJlIGENCj4gbGFyZ2UgbnVtYmVyIG9mIC8zMiBhbmQgJTMyIG9wZXJhdGlvbnMuDQo+
ID4gPg0KPiA+ID4gdGhlIGZvbGxvd2luZyBpcyBMaW51cydzIG9yaWdpbmFsIHN1Z2dlc3Rpb24g
YXQgdGhlIHRpbWUNCj4gPiA+DQo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC9DQUQrK2pM
PXR2REJXSkhSR0dKdzRubm94X2tjSktuNWh3dnd6OXp4DQo+ID4gPiBhZE1SZWR5dlJod0BtYWls
LmdtYWlsLmNvbS8NCj4gPg0KPiA+IEp1c3QgY29weSB0aGlzIGV4cGxhbmF0aW9uIGludG8gdGhl
IGNvbW1pdCBzbyBpdCBpcyBjbGVhciB3aHkgeW91IG5lZWQNCj4gPiB0aHJlZSBjZWxscyBmb3Ig
dGhpcy4NCj4gDQo+ICJDYW4gdXNlIGdwaW9saWIiIGlzIG5vdCByZWFsbHkganVzdGlmaWNhdGlv
bi4gTmVpdGhlciBpcyBhdm9pZGluZyBhIHNoaWZ0IGFuZC9vcg0KPiBtYXNrLiBJIHN1cHBvc2Ug
dGhlcmUncyBzb21lIGgvdyBhdHRyaWJ1dGUgaGVyZSB0byBqdXN0aWZ5IGl0Pw0KDQpJJ2xsIGdv
IGFoZWFkIGFuZCBzZW5kIG91dCBhIG5ldyB2ZXJzaW9uIHBlciBMaW51cydzIHN1Z2dlc3Rpb24u
IEluIHRoZSBtZWFudGltZSwgDQppZiBhbnlvbmUgaGFzIGFueSBhZGRpdGlvbmFsIHRob3VnaHRz
IG9yIGZ1cnRoZXIgZmVlZGJhY2ssIEknZCBiZSBtb3JlIHRoYW4gaGFwcHkgDQp0byBpbmNvcnBv
cmF0ZSB0aGVtLiBQbGVhc2UgZG9uJ3QgaGVzaXRhdGUgdG8gbGV0IG1lIGtub3chDQoNCkJlc3Qg
UmVnYXJkcywNCkNoYW5naHVhbmcNCg0K
