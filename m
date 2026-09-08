Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011033.outbound.protection.outlook.com [40.107.74.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4929656C62C;
	Tue,  8 Sep 2026 13:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873295; cv=fail; b=RFLQl5yV0kRPtzCq7N28TLZiSg5zPd/o2QAVYGPSXiaVck+OOyodHIEGDWYiUxb2NnWuUQAPUHrO/aGXlhMIz9L1udeqvF3JJ6vJs7ag9vQd/OhGGypd74FD+yJE1KV6KXgepGyRiM/nSUVB9LYdICh1usCn0QRji3d65YoCDLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873295; c=relaxed/simple;
	bh=dNVMPPQBh6GNNqZIAOMpyiJf0c2XM9JWMl8bgcVmNt4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=a4793v+B7Y9nf12Ha8RFIxx0ARIzPOqafHwOwlnabzDwpiqsB2C4NMbShPLvx1lxpHHm8mtdyoNtnKXqIunlJnzSW/BzfdOxcODv02+YCy0/D+6ZUD/4kDd3CkT/UXNPKlMwvZYvVyhvrGvdsye75FA80NLCMfJJmcUflFtTmn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hTwlkMF9; arc=fail smtp.client-ip=40.107.74.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hTwlkMF9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TityGcICLdHmpPBLDMwch59aztH480ia8THAnQ9SNKxMmbqxbpobMEABFJ1DytMCK5m8jstFKwe7GRI27t5x5l2ZoY8jziFkh6AefvFE/s5HODaSub0+wxgo6k2xh7T+5SNbp0qHbiYmDSqqBEJzQJRIA6PDhvEd+fFtPtwlcPry1GlbjxTGW40wjSa3S5vHWW44jMvSrLk65SmQZSfaOgeC+y6cakCx+tSr+bt4OzBdPogWum6/jXvwpFZ65QC89xX87x8YJWFeBC1z2DD1/9soxPasmK4PCafeKGHYqmgZ9sWKUDp7o2VrByqXG5rTNkc7xH2J40Z30zoTsU8C5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dNVMPPQBh6GNNqZIAOMpyiJf0c2XM9JWMl8bgcVmNt4=;
 b=snu8PrFA62u9qSYBr+a02gkVLCkcwWuQAMrZGpL3Ins233TPooeDXvT8wYwEhFrdniH7G9u/i9anEer9ISggpezVknXO8dlDid89R0PH528yXMb1bidAtdlPY4k8QCU5VMYzHJvX58tKf/UDZcOT6Th6KHBguOdm0C0onn3Rko8J8kNY5lcaEVrwsaly0tRDq7VxqxdQonF8knAsLt0FxRuL737zHapdWRYWMD4fmb/DGU8XScK13Up9NTsw8PpucGEFtDc/t0l4lhweS3eIZGRPhdie18p/4LmoSwYzYa8XAVHIFG7GcBH/HF5zn7gLIkR0o+j3Xc5l+/+Bl49iJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dNVMPPQBh6GNNqZIAOMpyiJf0c2XM9JWMl8bgcVmNt4=;
 b=hTwlkMF9ljPOCKpND0gdGC5zznLByx5vIkD/p7ri5BvgjAx1Xdj0XHDMhhr66V9WvlYwWaBCeOZFjqvn31VuGQ39RCemJslgXPXQSu7IJv1adxEqoETJGd6iKyWUaG0dN+WXiUNOKU+8Pv6rca6mIpjbB6Myq9amenT4vdzl9ZA=
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 (2603:1096:405:29b::10) by TYCPR01MB11899.jpnprd01.prod.outlook.com
 (2603:1096:400:38c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 13:14:39 +0000
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::a68f:5c9:9de8:4fa4]) by TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::a68f:5c9:9de8:4fa4%3]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 13:14:33 +0000
From: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: geert <geert@linux-m68k.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 5/7] pinctrl: renesas: rzt2h: wire up struct
 gpio_chip::set_config
Thread-Topic: [PATCH 5/7] pinctrl: renesas: rzt2h: wire up struct
 gpio_chip::set_config
Thread-Index: AQHdLnpj1rLyS9eBwka2vYV/1P12UbbElGOAgAA2VKA=
Date: Tue, 8 Sep 2026 13:14:33 +0000
Message-ID:
 <TYRPR01MB156193B43692AF9CA1E80A11385B12@TYRPR01MB15619.jpnprd01.prod.outlook.com>
References: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260817185700.322370-6-cosmin-gabriel.tanislav.xa@renesas.com>
 <CAMuHMdWJ_4jBADsQLMCnhspGG8EWO0yUujFqh=31gpUoNydJhg@mail.gmail.com>
In-Reply-To:
 <CAMuHMdWJ_4jBADsQLMCnhspGG8EWO0yUujFqh=31gpUoNydJhg@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB15619:EE_|TYCPR01MB11899:EE_
x-ms-office365-filtering-correlation-id: cf123422-f343-4662-9a46-08df0dab201f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|3023799007|22082099003|18002099003|11063799006|56012099006|4143699003|38070700021;
x-microsoft-antispam-message-info:
 lo5S1CTlWEdV5iqHY7E863vccJyK5CYLiZjGOAwn+jwQu4HYUf80a7jgnV25M8ROPT0UI6GFGhKZbcm/vLxdgK9cfqXVKE1VQMYCylYoichVBeIJUjx5/argHgSt+d+FkgcqzP0twVCiu9ZR6lrjFH9yujIbl8psRTW0zKPAsW297Gv4UcPHJkG6jMSy4scJ47Tr9hDHp3gwcs+bmzC3s5drCL44YpscpLOrXCHg288j8/su+kpkmjv8un9umyQkAjKjsI8F1rYs10rE0Xuj76VKN9omp8j2DT+/SaC478A2sedrsZUu2b3bfAbmFfiDyegHCXf1MNBQveffHz5dyJ0ZOY8WSS0H6NrUWHaN2srYRR/ET7cPaqV53hw9bx7SI+mcHEA8cVIIzj8LHnTAaWo4Xm/0p8cwxR2oVLRvO2DXGs3XHN52Dq+aM5vzuKRfTdiBzyAoTmvtVKE9S5k1uBwxKmWHVx1k4EU68yEmWcV3Dxygkokl6xfUVDlekatF+S0yWemlEnbmTohaof4QhKR20jykMMMgkrC6hDox8UTjMlDZ0LoWA1bFoYBXINMPgK9S4LIiQnRsShqp0tA9wjOomNn3uUrU3HvVLV1D/NqQDaJahSQ/UHVshf7Ps6cgyByo5qBuwWOWANq6qvXMdrLVnS7oWS9iYWMGmzciVzZE17S/bFs/VxeU1vf+CaV+rjoFqFtG/siGB9ZbsdhBSENny4JOOt0RzUOb/5nmD3c=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB15619.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(3023799007)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UWZBWjdEYVFYNkxQQ05BYjRObW9oU2pLeTVnd3lIWWZIdHY0NWFoaGJ1dGpt?=
 =?utf-8?B?SE9GK1huNVVqdWdPNGU4ZTdHM0JQZzFVVDVxaGd3UlBSa2ozUE9GUDFvMVZi?=
 =?utf-8?B?Tm5rS2hrdmVWcEdnWnR4cEFtRzM2OVpNSGtZYm9yNk00clgxc2I0UkdPcW9n?=
 =?utf-8?B?VkZ1Qy8yWERuRkcydlFaVi9sUFdESytDOFVhT2hESXYzSDlpVk1ZdlVNVCtO?=
 =?utf-8?B?d1d6b21IWURJb052TzZWTDN5VGRSUERnT0k3cHo5dGNlVWw0T0NjSkU1L0RM?=
 =?utf-8?B?OUZiSm16b3lhSC9ndGo4VFlGVU5BbDRhbWVtak5pdzV4QTNLRXFyY3gvbFJ3?=
 =?utf-8?B?N2xuNkk2SHB2NGNQQmh4UmdLWXpPWnlIMEs2Q2M5c1VtVVcxb1hQWUhIU1Nr?=
 =?utf-8?B?R1VNSTI4TEhTQ0FvZENkQnFmRjNJNUt5MUJqRmxVaGRzajNtWWZNYklFSFpi?=
 =?utf-8?B?OVhhbU5CSjBYMlRhTE5CQXBORENEN1gwRDN6Q0VwUVhUUWQyQldYY1RMM0RO?=
 =?utf-8?B?SSt0Nmc4RlpZL3BTUjVyNzdCWm11SUdnOEZKcGk5S1ZrZDVtdVFZSysrb3lK?=
 =?utf-8?B?YWYrdWpNUndCQjM4WVNRUXd2bzMrSU9xR3VVU1dvd1g1dWtIaGNFZ3BkK0Ju?=
 =?utf-8?B?ZnlpQmFmQjZSWWVSeUVoRS9nTURoWWdaM0xpK0hYcWxkbEtoWWIrOG5HTjVH?=
 =?utf-8?B?WVhQNTVPVVIxcjlaOFNJa2x4UUZFTVNibldLdGZNM3VDUS9ZQmUxMGFZZjlU?=
 =?utf-8?B?ZE8xRHZBQloyMEZubm82YWJwVnlRRTVWZ1dKN0JkNHdoMXVHNEljQVlJd1dj?=
 =?utf-8?B?NUtsUHFQWHB5VnVsMVAwQnhYY21MeFJ6S29xL3VFQS9CNkdrbDRIQmJVMTJH?=
 =?utf-8?B?bGZSTDdGR3VqSGl5N3NOOEF0dVh0WS9FOGh5NlIxNWtUdUVSeGNpVkk3Vjlh?=
 =?utf-8?B?OWxJcDdDTThjYytYRWpvWHJJWkh3VDNNeW5HelJWbkNVcFdNRTQ5cy9JTkR4?=
 =?utf-8?B?cERObmtFbFZVNVBzb3JVM0VLSHdLc3R0ZS9BclhhVU9zZWtIL2gza1Rtd1pR?=
 =?utf-8?B?Sk1YbjQ2eGt1b3E4RThVeXBySTI4YVhJVzZSeS9nanBHU3RlaS9NYkxpMzhk?=
 =?utf-8?B?ZXZGTHNKSk5UckVOWi9kVUJKQVhVU3hLMUFUMVF4T3FxOHdGQzM5aWpRN2Rt?=
 =?utf-8?B?Qk5uQTVIVWNJb2l5TyttOFlXRGlHVGpYSUFJVnZ5N3F6UjZvaE9kZEFsczNv?=
 =?utf-8?B?VndMUGJCK3kxMjIzSnZNQXZwNWN0NFRyWXpjbG55KzBZZWdLTmt3MHZadm1y?=
 =?utf-8?B?UURzbm5KKzFxdWlBYVFWbU5STVNVa2JDS1VQdFQvdENsVzc3WW1RcGRTOU9Y?=
 =?utf-8?B?ejQ0OFMvT0JQcENzZ3BGVk9pRTczeVdvcVZqWEUvczZkOFNzTG9WblJ4Tkdv?=
 =?utf-8?B?anlTMnYxbmk1Zm9qTTVxYmFZdGRvM3ova3pkVHZhbVJWdzdmNU1QRUdYUjFa?=
 =?utf-8?B?bmQzU2prVEl2Mnpia3VGVTVsaWI3Y1BtZ1lzNDFPMDdtb0ZOTURjczMxZE9V?=
 =?utf-8?B?NUIyMEVPNkVFeTAxa0hNTDAyS25NTWVSV090U0RkTlNCRmZ4andoV0h2WjFn?=
 =?utf-8?B?SVkzOTZscmQ5Sm1xOC8zajZNV1pHazBPUWJVc2c3T0RSeVdabXVyRTFrb3ky?=
 =?utf-8?B?U3VjSU1yTUJRM3VvU3l1MC9RdVZLdW5LUXlBbEQ0UG1nSHMzT0RXN2NsTDRG?=
 =?utf-8?B?eDNBaGxiL1UrWitvK2Q1dVkyRFhKcC83QXhZR0JCa1NDYnBPMlFkaEE4a0VH?=
 =?utf-8?B?NnlCeFY4eUZFMjJtblk0TmlsUkRpV0xSZmd0OTNOZkp4N2ZrVVBRa1NPOGxG?=
 =?utf-8?B?RUZFTHVTSHI0eXRraEptYjVnekorWUxkUkdQTmZnWGVkZlhoQ25kQzYwSGtG?=
 =?utf-8?B?UnE5anpuUzRUK2x3QVJVV3VBMFZpRy9ZWnBReFkzYWp0SnhJWC8ySnRMNC9M?=
 =?utf-8?B?eVpjR0NIdDU2QWg1N2h1c09jTXlGVXlUS0FacDVDZTZ3MS8rcXVRV1hYRDNh?=
 =?utf-8?B?VGUxL3AyNDFTYmFuTTNXY2RMRTgzclpqQXpsSTN4d2UyZzZGUkJITTJQQXlw?=
 =?utf-8?B?NGhFSW56OFduRDdYR3hQYlFFUGRDL1A5WmlsUHlCVkJsVXFkZEFPQzJtamFQ?=
 =?utf-8?B?NVBSNkVRYzdNTFVjZ0NJQVQzaVFnNVFPY0pVVCtyMmRyRDhRV1orZVNUb1Nm?=
 =?utf-8?B?YjRzZThsRTFneG81MFE4NldMdUFJZGIvZG5tR3hvRjhPeTdrZkE1YmJMQ3F2?=
 =?utf-8?B?aDdLajJpeEZndWZUaEJ0ZXBHWWtzVUZMaUp5M2hiNERpamdvVjhRcHBMQnY3?=
 =?utf-8?Q?Tw8HSOUR8+/IIQb0VudSMIwlfHdn+cgtL7q2K?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cf123422-f343-4662-9a46-08df0dab201f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2026 13:14:33.8845
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: t2HPxbD05bWFancB9IKA3Lr8ArHZINMBTKv4PYiC8In02dMKm4s0RNxV0ij62F0XOrog378F+o6VX9iT/ucNm9FjgBcYjet36vSNmFGdQh8x8QTXWwH/ZYmB0bSMv8ya
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11899

PiBGcm9tOiBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0QGxpbnV4LW02OGsub3JnPg0KPiBTZW50
OiBUdWVzZGF5LCBTZXB0ZW1iZXIgOCwgMjAyNiAxMjo1OSBQTQ0KPiANCj4gSGkgQ29zbWluLA0K
PiANCj4gT24gTW9uLCAxNyBBdWcgMjAyNiBhdCAyMDo1OCwgQ29zbWluIFRhbmlzbGF2DQo+IDxj
b3NtaW4tZ2FicmllbC50YW5pc2xhdi54YUByZW5lc2FzLmNvbT4gd3JvdGU6DQo+ID4gV2lyZSB1
cCBzdHJ1Y3QgZ3Bpb19jaGlwOjpzZXRfY29uZmlnIHRvIGFsbG93IEdQSU8gc2V0dGluZ3Mgdmlh
IHBpbmN0cmwuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBDb3NtaW4gVGFuaXNsYXYgPGNvc21p
bi1nYWJyaWVsLnRhbmlzbGF2LnhhQHJlbmVzYXMuY29tPg0KPiANCj4gVGhhbmtzIGZvciB5b3Vy
IHBhdGNoIQ0KPiANCj4gUmV2aWV3ZWQtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVu
ZXNhc0BnbGlkZXIuYmU+DQo+IA0KPiA+IC0tLSBhL2RyaXZlcnMvcGluY3RybC9yZW5lc2FzL3Bp
bmN0cmwtcnp0MmguYw0KPiA+ICsrKyBiL2RyaXZlcnMvcGluY3RybC9yZW5lc2FzL3BpbmN0cmwt
cnp0MmguYw0KPiA+IEBAIC0xMTkyLDYgKzExOTIsNyBAQCBzdGF0aWMgaW50IHJ6dDJoX2dwaW9f
cmVnaXN0ZXIoc3RydWN0IHJ6dDJoX3BpbmN0cmwgKnBjdHJsKQ0KPiA+ICAgICAgICAgY2hpcC0+
ZGlyZWN0aW9uX291dHB1dCA9IHJ6dDJoX2dwaW9fZGlyZWN0aW9uX291dHB1dDsNCj4gPiAgICAg
ICAgIGNoaXAtPmdldCA9IHJ6dDJoX2dwaW9fZ2V0Ow0KPiA+ICAgICAgICAgY2hpcC0+c2V0ID0g
cnp0MmhfZ3Bpb19zZXQ7DQo+ID4gKyAgICAgICBjaGlwLT5zZXRfY29uZmlnID0gZ3Bpb2NoaXBf
Z2VuZXJpY19jb25maWc7DQo+ID4gICAgICAgICBjaGlwLT5sYWJlbCA9IGRldl9uYW1lKGRldik7
DQo+ID4NCj4gPiAgICAgICAgIGlmIChvZl9wcm9wZXJ0eV9wcmVzZW50KG5wLCAiaW50ZXJydXB0
LWNvbnRyb2xsZXIiKSkgew0KPiANCj4gSSBiZWxpZXZlIHRoaXMgZG9lcyBub3QgZGVwZW5kIG9u
IGFueSBvZiB0aGUgcHJldmlvdXMgcGF0Y2hlcyBpbiB0aGlzDQo+IHNlcmllcywgc28gSSBjYW4g
anVzdCBxdWV1ZSB0aGlzIGluIHJlbmVzYXMtcGluY3RybCBmb3IgdjcuND8NCj4gDQoNCkkgYWdy
ZWUsIGl0IHNob3VsZCBiZSBmaW5lIHRvIHBpY2sgaXQgdXAgaW5kZXBlbmRlbnQgb2YgdGhlIHJl
c3Qgb2YgdGhlDQpwYXRjaGVzLg0KDQo+IEdye29ldGplLGVldGluZ31zLA0KPiANCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgR2VlcnQNCj4gDQo+IC0tDQo+IEdlZXJ0IFV5dHRlcmhvZXZlbiAt
LSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5v
cmcNCj4gDQo+IEluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxl
LCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQNCj4gd2hlbiBJJ20gdGFsa2luZyB0byBqb3Vy
bmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0Lg0K
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzDQo=
