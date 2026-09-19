Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2118.outbound.protection.partner.outlook.cn [139.219.146.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D223CC323;
	Sat, 19 Sep 2026 11:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789816169; cv=fail; b=BnAzatNfO6yuyBTXa0tvZwx9Rvy77gjj6RjzbEdGy3aQNZHPUWCuArCXu+LPCQjhXlqcsBbkwNCTllmN8qVjKS30pydceVMQ8t21QtllGXPK7LvlsOFngd/1rTAdKoNX+89nSI0pAyiTIa5oEqMu+ePofeashociZUdFwRiehuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789816169; c=relaxed/simple;
	bh=8rSQU+zarA/6rfKPxfMpSI5GEkMCnRknd245nOHy5do=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dJJfJPrTr6F/Z4/OKSoY2sS8lBugR9pOHZDiShnH1CgCFT6EPxSb7UmukAFK9crYQCiT/0qCy61iQ9MK0MS+BukIlzy30VYUx+c2Kmk6Qxyby1+OA+IFJMZiTlE3kQawsDxWHCNdRX1dAkGeetYrJ8c0HcE8Bf8x72H1bRhMQBc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d3RZkk/uto+thkPFMqxVocRIP37tGuHOJtRmr4NwQwZF9G2KMFJ3d5z975PeqDcEeiet0XdptAlkDrrzQn5JUdtSLDw6rBGSEU85lXeRm7IoICUeY6IB+hW3f8hugQsqo2+68j08ViLyHgTl8TAMz6VhrU2JVWjhtVDIN1T6jPqp0B3SSKiK/jCgUchw4BdynuELsRhQBipwMBVMDeXDCg2PLPE/AoO99eJ5Cs6awLfP8kM+yZdfSS9AFbk677u1cIPK+EBlFcrjd1hCxaLNHMQ8ieRVjrI2QFqB9BBrbBCm1m7J1ZE0ccIimsjrgJR0ocz6ASLW1/9Snttl6u2Lyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8rSQU+zarA/6rfKPxfMpSI5GEkMCnRknd245nOHy5do=;
 b=dcLb5BDhQVl+5iLavPTSabj+WLfosnuHQp8YP2vGYDFZYaMDe51O+1ANGkWsNrGbmueSzQwFjvOAml/CKKKcAaiQp6hQt8FwS2xBjBQtb5DLvT5V6cxi8RCz/x5r/mBGULp4s4tacZtk7Bi6bRwJu96lPPl2OFutZnoZQxy836htWmqKs/I8l+68lVvJptVlw5CpqGiaAru+6Xplou3jFiPYwCOtnHoLpV7h8AJ8ve6ZeAYFR4XjG6YgDUwTUP4EJ3iBTlCkTZYuAcfo5NZ6vlUJ3B0U8mK6KKgDII3Pp5plMNogNpY/XEgWTAsIOouYxNukYgR7ZqAaCJ4ZuXm43A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1220.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.14; Sat, 19 Sep
 2026 10:55:06 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0428.014; Sat, 19 Sep 2026 10:55:06 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Linus Walleij <linusw@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>
CC: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v1 2/2] soc: starfive: Add JHB100 UART Routing driver
Thread-Topic: [PATCH v1 2/2] soc: starfive: Add JHB100 UART Routing driver
Thread-Index:
 AQHdOEv9x2zENbRKZkCU2oev0UH3Y7a2RHqAgAEc0jCAAEiSAIAAAe4ggAC+rwCAAIoJsIADqQ6AgBSrsICABJDNQA==
Date: Sat, 19 Sep 2026 10:55:06 +0000
Message-ID:
 <ZQ4PR01MB1202BF18C8CC554CB79EB91AF2862@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260830065118.51551-1-changhuang.liang@starfivetech.com>
 <20260830065118.51551-3-changhuang.liang@starfivetech.com>
 <417251d0-c2cc-4e10-940d-b75ab20acdec@kernel.org>
 <ZQ4PR01MB12022D97EFD74D5A80DBBE34F2A92@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <5f99fc90-02e0-40ab-8d1f-c2e7bcce7a5e@kernel.org>
 <ZQ4PR01MB1202FB18CF51DB252C393D0FF2A92@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260831-dramatic-phrasing-beb1b360cd58@spud>
 <ZQ4PR01MB12029CCB91CB5673761C6F95F2A82@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <20260903-precise-diamond-loris-ae2da7@quoll>
 <CAD++jL=U6=YcS325TQEJCM6FJNaam=DQwXfv_TZcGusqBte_cg@mail.gmail.com>
In-Reply-To:
 <CAD++jL=U6=YcS325TQEJCM6FJNaam=DQwXfv_TZcGusqBte_cg@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1220:EE_
x-ms-office365-filtering-correlation-id: 3c1919c7-b6bd-4d97-3f79-08df163c7727
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|38070700021|10067099003|56012099006|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 V6QD5IGMVakUrujOdavvC87LGPcZVgkyjKGncV4mUhdfnx37arVmhDXETuLzlLQDE4Easq40usk317WPHowHtNYB+FjVtMSQQANjeB1zwqX5u3N44xbYa82PRiOhG6Es4tD0ptRW9CeRH7BPV8JHTCtyxy2cnp3al+WQEysN3aiVs+IhzBFSmbXxoCBvxmCP4AAXYrVeGdiQ1e9nKspLjMlZSemVU+OitwWAfPG8iLRQR/cdvX80VXjQ0jhBna0KAvEKxsTMCrJNh6OWNe1NuDe0o6NrrD6mRyq0UeGKsf6AGibbMGAOTgXKSLeDyfnTYmJ3thJj0eDGccabXzFD4+rbDjO56zYLkCBLmuE+aKcP6GxTigOpSUb1JhnZB9LAEzzdGIJuB9hRuCuf0nwpME2JOs1rlJxniQwaHYMhtKD+VujEj5/TSmYhrHm7Czx4uQw09VbrU8sgd/4eLEpchNmAxe+xAoyQ19J22cVoOEdi9em0l1fodBoMqvgQRuJ8ENSMe3escGeUPO1v80hwqDKG/f6peaboLQiW/y5iT3pGqQbKmflDmaHYs2C2+qQS
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(38070700021)(10067099003)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SDlHV2NobXZ1aEVDRzZTb0xzdndTYnZGM1h3K0Y2V2IrVDJvcVNLZjEwSEls?=
 =?utf-8?B?T0dZdVl5VFM5eXpoOFMvN0thM0FpR05YYnd2aWhnaXFEcTBac3NvSjErV0hj?=
 =?utf-8?B?enB5SS9PVXNWMW9wcmo0Rzg5aWVWRFNxcnlORGl3UnMvS1I4MmhFc0NyV09X?=
 =?utf-8?B?WGUrUEpWUEF3RW5uUmMvOERjdE1YQlp3RDJCTW95aTlqY0RRNzB5Z1ZoejBO?=
 =?utf-8?B?RVIrUG5nMGF0eEJnNnFQVHg2VlNqdGd2dDVWOFFWSHBwYm51dHUvUWdhNFhK?=
 =?utf-8?B?M2tRTkxQK2RsVDJVTmRpWkdaN3VrVERTYUsvSnFNc1IzdmxXRmN5V2pBK0Zk?=
 =?utf-8?B?UnVsZmloWU5PeTFlRzdFWEk1ZzVrM2M5dk92M3hJNzYrY1duL2xjTjhXczdr?=
 =?utf-8?B?WkFTeDdSWnd0dGtVNm4vYTNpNm9JYngrMlZZcUNBQmI4bHlYNG9qR25nU2pk?=
 =?utf-8?B?UVJWYW9takJERVN1a2VUZ080S2c4NmV3RTdjby9HRis0R3A2RHVRam56VkR4?=
 =?utf-8?B?VTNPL3l6MTBReHVtZSs2emUxNzFtRWd3dVhQazFjN09lY1huSVFRcWZ6MmlS?=
 =?utf-8?B?YnNKSFhBUEF6UUxDS1JIVG5uVVBBelRxS0xqOFFsM1Bha2o2eXAvZStMOWhG?=
 =?utf-8?B?ZDFGY20rZDQxSkp6QittMFZLVlgzMC9xMGVFVTFNMHJBUGJBaWpibU5nRVQv?=
 =?utf-8?B?ZGN1MWQzSzRONUVQd3BFdlpBTHRhU0FWUVRhNG1rWEZBN2dVVEVwNUR0b3VR?=
 =?utf-8?B?dXZTbWpuV1RJKzhUMkUxY3ZrS05DeVNYdEZrdVFwcTRud3BvWDhRNnphbStR?=
 =?utf-8?B?Tlp5bGpDNVdLSXVIbXRqamJoejRVWEpLUVUzdC9zcnFiMDUyR2xsVnVWeVJ0?=
 =?utf-8?B?NDJnYmphS0xFdERIcm8wU3FmRHc0Z3FUVGFGbzUwS3RPSW8wZ0tvUG95OTlz?=
 =?utf-8?B?cVdmYnJaZ3pQQ3BtNzBzaVFydDZzSVFHVkYwNGZ0ZURac0Fhc1dEb2pQdkF5?=
 =?utf-8?B?dExGMllUbWF5Um1GbXVwcTJoSXFRTjFLa2RTTHA4L1BPem5IdHFYTEp1LzM3?=
 =?utf-8?B?cldPRGZIa3dCdkx3UlZHQ2QrODBnUjg3eVM2MHREVEJGYzNtRWd0NTQ2RWh6?=
 =?utf-8?B?a0owZFd6UUhGRWhJME1xZy9Za2V5b24xUUFQTmhOWkZRTVhCOHZwbHRlS1p3?=
 =?utf-8?B?K3FUaTc5Mmk1N3VZZ0srUlVUMlByU2lNTVRzRHFLK1d2cmUrb0JNZVNhandh?=
 =?utf-8?B?cnZHN1MydjZGK0pDSU5iMUtrN2VDZGN6UjF5Z2xzQ0FJVFBOK1dCa0tkdzNu?=
 =?utf-8?B?YU0xWXhhQU1QdGx2WVlRam9ndTlPREVVd3VEZW1DeTNPbkNudzdPRGM1OXQ3?=
 =?utf-8?B?aWl3MWZyYUFFamo2eGdMMlNWV21OamJkR0huM3ZiZmJoMHkyVDhpT2RoNTJN?=
 =?utf-8?B?SUtwN05uL0tEbEN0bjlEZzM4Zk5zNzFXN0hCemhSajZOUWVzdE9CNy9XemFx?=
 =?utf-8?B?SHlyTHJURXUwLzVGRHVkTEwwcTgvcjJoSmdrUURvb2UyMFBQdVFxaHpmd3do?=
 =?utf-8?B?a2N5TEphYm1VK3pUZ1VaN3Baa0VLQWhYbHZCSDFQYXBHSGw1R0VJYWlYMkdD?=
 =?utf-8?B?WmxIL0hzUTFIaU50M1NzUDlkQmdxTWdYMkFlSHY5WnljWWRZSjJpU1lLcE1H?=
 =?utf-8?B?TXI1dXZhb3RONHdzcjY0cE1DZ0xGNGtzNkJ0RFJMZStsQk9PZkJUMFVSSmFr?=
 =?utf-8?B?TlN3RFozTjNXWDB3WmJnbjhCRFBXSWFvTWVCVDlqVjJsUGExMFFxMzNrSTJz?=
 =?utf-8?B?bU00QURvTTM5UU1Vb1QrOGFMK2ZZSkkrRkVLNVZHTE16OUU3eXdMMGV0VSty?=
 =?utf-8?B?M1JidXpBYkxOM1gvWGYvd3h5VFFKekZEdHdnZVpnamtMMi9hSUZOb0VJdGNB?=
 =?utf-8?B?djFnUjhsUGg4bEI1V1IzNGplZWZOckQwU25rK1dsdDZTVUtQSXRzRjJUR3A1?=
 =?utf-8?B?UUZlajNsQmNEdVl2UEFLdXUwYW9EN0hra1BqRXhMQ3EvSXRGbWR2RlEzVDJi?=
 =?utf-8?B?ZXZaNWs0OUNBaUQreDdPc2U5cHorY0RGSnlvY2FrOWNGMkFkS2JGeDJTQ3Nr?=
 =?utf-8?B?MGpHc0h5TGhYVGYwRFdwbzFieW5US0x6eXJ1V3FoejYwUkhXSlBXRjNESHgy?=
 =?utf-8?B?NG1zL2dGTXo0WTFoNzNqSWFScEFacGFWNW5qUUNNRFRFY2dmR0toalhSM0Zh?=
 =?utf-8?B?Vnc1bXZreTJ3M3JmeGlNOWJnU3RwRC9zdWhKcWlpK0toOW5zcU5iUmF6NjRx?=
 =?utf-8?B?WkdkUnp3QzkrUytXZnBHVXdlRnVubnEzakNFbWZpMTJ0UFFiaVRIb3Z3VnV6?=
 =?utf-8?Q?jWQS6BkaK59HBC0U=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c1919c7-b6bd-4d97-3f79-08df163c7727
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Sep 2026 10:55:06.2628
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nu0JiSh3nLfDKsDEy4/1hMKgQ/Mfp6TDbXhLHCFaRAR/STyKs4140JkPPltygWdjowQhHo/PPKfGu2TZeDl7qkUTmuHZ61VjdJwWF+KkAwIHnj6kAuIhx0yR84roSmVh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1220

SGksIExpbnVzDQoNClRoYW5rIHlvdSBmb3IgeW91ciBmZWVkYmFjay4NCg0KPiBPbiBUaHUsIFNl
cCAzLCAyMDI2IGF0IDExOjMy4oCvQU0gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6a0BrZXJuZWwu
b3JnPg0KPiB3cm90ZToNCj4gDQo+ID4gQW55d2F5LCBhcyB5b3UgcG9pbnRlZCBvdXQgdGhlcmUg
aXMgYWxyZWFkeSBvbmUgY29kZSBsaWtlIHRoaXMgLQ0KPiA+IEFzcGVlZA0KPiA+IC0gdGh1cyB0
aGlzIGlzIGEgc2Vjb25kIG9uZSBhbmQgdGhhdCBtYWtlcyBpdCByZWFzb25hYmxlIHRvIG1ha2Ug
YQ0KPiA+IHByb3BlciBjb21tb24gdXNlci1zcGFjZSBBUEkuDQo+IA0KPiBCcnJyIG15IHN0YW5j
ZSBhcyBwaW4gY29udHJvbCBtYWluYWluZXIgaXMgdGhhdCB0aGlzIHdhcyBtZXJnZWQgYmVoaW5k
IG15DQo+IGJhY2sgYW5kIHNob3VsZG4ndCBoYXZlIGJlZW4gZG9uZSBsaWtlIHRoYXQsIGFuZCB0
d28gd3JvbmdzIGRvZXMgbm90IFhPUg0KPiBhbmQgbWFrZSBvbmUgcmlnaHQuDQo+IA0KPiBJIHRo
aW5rIHdoYXQgd2Ugd2FudCBoZXJlIGlzIGEgd2F5IHRvIGZsYWcgc29tZSBzcGVjaWZpYyBwaW5j
dHJsIHN0YXRlcyBhcw0KPiB1c2Vyc3BhY2UgYWNjZXNzaWJsZSBhbmQgZGV2ZWxvcCBhbiBBQkkg
Zm9yIHRoYXQuDQoNCkluIHRoaXMgc2VyaWVzLCBJIGhhdmUgb3JnYW5pemVkIHYyIGFuZCBzb3J0
ZWQgb3V0IGEgY29tbW9uIGludGVyZmFjZSBmb3IgQXNwZWVkIGFuZCBTdGFyZml2ZTogDQpodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA5MDUxMDI5MDEuMTI2MDM1LTEtY2hhbmdodWFu
Zy5saWFuZ0BzdGFyZml2ZXRlY2guY29tLw0KDQpUaGlzIG5ldyBzZXJpZXMgZG9lcyBub3QgYWZm
ZWN0IHRoZSBwcmV2aW91cyB1c2FnZS4gSSBhbSBub3QgeWV0IHN1cmUgaG93IHRvIGltcGxlbWVu
dCB0aGlzIA0KZnVuY3Rpb25hbGl0eSBpbiBwaW5jdHJsLiBTbyBJIG1heSB0ZW1wb3JhcmlseSBw
cm9jZWVkIHdpdGggdGhpcyBzZXJpZXMgYmFzZWQgb24gbXkgdjIgYXBwcm9hY2guIA0KT2YgY291
cnNlLCBpZiBhbnlvbmUgaGFzIGFueSBuZXcgaWRlYXMsIGZlZWwgZnJlZSB0byBnaXZlIG1lIGZl
ZWRiYWNrLg0KDQpCZXN0IFJlZ2FyZHMsDQpDaGFuZ2h1YW5nDQo=
