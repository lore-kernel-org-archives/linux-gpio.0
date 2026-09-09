Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2110.outbound.protection.partner.outlook.cn [139.219.146.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E25C52E078;
	Wed,  9 Sep 2026 10:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788950694; cv=fail; b=e8pVIkhYt5re7oyx0NTxJHrA/FK//NnHgru4+hPlYVDDWtF1vG40uHofVrxAKMO8R+l1fJpeyLqqxMHxHmDT9eb28Pxu34m4K9EkhRk/QnG+mg8oT2w6uPW8GtiIKGUnAK+AKUnGEFWV5Il1RyBqXbLcIMsRb74IzqIjgkDYlCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788950694; c=relaxed/simple;
	bh=WcJkeS5NnyIpgQf/XhTnNnn70PyG+SCtqrHeFmG8vts=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bR1TI4BfuoaXpNV2ME8L214EWrILSiv6CiCnNfeXCSbAf+o9wzrt7xDHFAI2s5KUaP81rLNqSJoaglhr39JMhTk12GXjVoN3aB5WvLyk2C45+VnlrPclxrSH0gmIrV88/e3oQb6aoSEiJ6idF817GrX5+bb7jQ4c9WDRnh8KpXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TqusbrJpXG0iL37glqXStJWNtwGHtngoAH5rYZQznlSehhOYIX47VV6hNlSrK55xFoKYABq8LCZikvftCgkPEFKXIkpRK8oxHIiTAq8rEq5mDaguQ8qYIqIrRqF5ctPOK/Otay8nzQlQIZPlXj1kqwIoPNL22WhVDEkKcZ049ujav0CS44sGuEXRghsiSp/8nNGQkk5bbols1d8sNBjct4Re/2H9qFOz3U8mn3NK5EwNY5e/8RrqZD0eCXrmTCXoxtN1ZTV2SQstJU+lPrPZ0Kf6XrkVzOaYG91Px4Xlw9fcvkZj8z4BbqVlvDXagXc6bbX++csooBwYRWtvmKfZUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WcJkeS5NnyIpgQf/XhTnNnn70PyG+SCtqrHeFmG8vts=;
 b=NjuvTbZBabiU08i8UoZz7bhim7e6RnwilO8zE6Dn2b7e5dAZN0XqExLkXLWKhvlShdABMpgMfqqoGa/hEByiYZUuFt+h5SNncAzA+y1lqcZr/wJuHHggnqQNJbu1tNDjNtcr7O8eH4U7EyNgu6+7IQrFXodKyI+xCl/V/a+vmLE39THBT1L0+nZ/5NZzv0unL8FGHMnMz88ximaljDo497F1khihin6yqRtikwg+3wx8DIgNPIhxsAuUO5GvmMotZoUUDAmwC5w6cRgJgip6z9PgQNUqARuS9j8f75ClvQjEJEx6ZSL401eY38c3ZeVFRebeb4s51GZiMJhTArIyWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1138.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.18; Wed, 9 Sep
 2026 07:11:23 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0339.017; Wed, 9 Sep 2026 07:11:23 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Palmer
 Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel
	<p.zabel@pengutronix.de>, Bartosz Golaszewski <brgl@kernel.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Lianfeng
 Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v6 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Thread-Topic: [PATCH v6 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Thread-Index:
 AQHdN2ImqvaIx8mSbUaeHyzzD+v1QLa0qs+AgAEkaZCAAHWtgIAAA1cAgAABZ4CAAAK9MIAPhrWAgAANmpCAAALtAIAAAnYw
Date: Wed, 9 Sep 2026 07:11:23 +0000
Message-ID:
 <ZQ4PR01MB120207262566081D353BBB71F2B02@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260829025720.23915-1-changhuang.liang@starfivetech.com>
 <20260829025720.23915-4-changhuang.liang@starfivetech.com>
 <f474f659-8234-4dfb-85cc-06d2cc295107@kernel.org>
 <ZQ4PR01MB1202DDBD0436E8F580EB6575F2AA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <ac4c6b24-02c7-4dc3-89e4-45aa335255d3@kernel.org>
 <ZQ4PR01MB120205984FB23C0776BD0D0AF2AA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <08c6dad7-8b0d-4daf-908e-5af875306f0f@kernel.org>
 <ZQ4PR01MB1202123864865439817E1549F2AA2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <95b7ad43-9c68-4830-a35c-7cb29ca9b75f@kernel.org>
 <ZQ4PR01MB1202D6E0502B941B170D1C56F2B02@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <1b7ad739-a46c-4505-a5eb-71789dc6e9b2@kernel.org>
In-Reply-To: <1b7ad739-a46c-4505-a5eb-71789dc6e9b2@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1138:EE_
x-ms-office365-filtering-correlation-id: 25d35aa7-228c-4801-9a12-08df0e418e9e
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|56012099006|4143699003|38070700021|10067099003|921020|18002099003|22082099003;
x-microsoft-antispam-message-info:
 A0u8Y59J9KZTGMrBOiqqKL8bdV2tMawijNqlrU8ijkQVpkI7ZNcPnUkRhDaznbKArcdZ6vHZhX6UDtnVtbORDV+xhqN5WbLsqZ0MdRhJwfdc2VAZh6L0K7gj+7WqSy+kYIpf2wx3paRr1TxtlJppX18J7Y9enVsYgPrVwXWVBzc3SefjXtjs9VmJ3DhtmMEfTpnB5QmFubnZ6TyCfVnTm4uQ0tvWr8mbWdXUfqDc2WjZgE/OgXTO+rRAofjyEzLra6NGk2orsAPFNbUPB3pmNlTBxHcGoIX69GDZ/m189vaeOx2z7De8pJ6UV21wHOQS7uQVPcZIF75yG3GIkYhb86MImOfTVUdhjZBNOLc5AtIxKGRklP/usnLIXxS/h+MadqQHxQfSXGOguUrZVJ5s4I/XgNlRn0q6u62xsX0yC8K4svrNZgIePKEDy5f+tF2J4fIKmGK9u1Rq8xZ7PQQF/1P3oMy3sZ7MTj0/0tQyFtJchjP8GNUapuo4uBbOOUJ2/VaDAzYujpBDrO9rpn6aQN/Rl1Al90oJt5fAcy47BOEpcFkFNVdK0Yu7Nl1Fd+gs
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(56012099006)(4143699003)(38070700021)(10067099003)(921020)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MG5JbnRodGRWSlRoM2NIRHR6NXFraUhUSDA3RVN1RjlQUHRhN1ZKOFljYlMy?=
 =?utf-8?B?eHBvblVKVE80amM5LzI5UHF1RnR5bnRPeHFRSGZwSnBnR01JOXYzUDhhRnVO?=
 =?utf-8?B?TnFSQzRkdXhGMnpBRS8wd0NwcmIwb0tnbXk0VUJzdjRpdlVuckd0UlphSGxY?=
 =?utf-8?B?S2cwNE9IUWlGSXBTc2lOZ3hBUHNoc25xUXhZekpyQ2czQkI5bXptT1kwQnc5?=
 =?utf-8?B?RzdiaS8vamhTZnNPRFJjUEF6aFRMWkcvdFJWQ0c0YndpWlBxTFJyL3NsakM1?=
 =?utf-8?B?c2ZZNDBnbktoTXh0VzM3YU5nVThqSm1aMVZOZEMzZzhyZFhueHozVldId0dW?=
 =?utf-8?B?N3FVdkNsMXpjZVBieURxM082RG1zWkcwNzg4ZUNvd2VJb3FPSzhoTnF1aFdw?=
 =?utf-8?B?S1M3UHRUMTJUZWRGNFRZalpkc1JUZW42eHk4K0JYWkM1K3IzQjhGRVVyeEhp?=
 =?utf-8?B?TlQraWRWd2lmOVlFZ09aMjBCeENtaEtodmxUZkhEQTB5US9CRW5yQW4wUnVF?=
 =?utf-8?B?NXppL3lVNTBLNXlmUlhUbjlOZ3dFQUNHRWd5Y1pkVXZjTHJ6YzdubTllSkNr?=
 =?utf-8?B?cVkrblovUklnZTgwcnBUSlF4NUZNbE9pV1p1WjlKem14eVVlU2tMMUF3aU42?=
 =?utf-8?B?enpQME9XUnFjcFJnV1RRdEFmckVoNFZaWFlSUWRPMmhNVEtFMW84bEtGdC92?=
 =?utf-8?B?dHhkd050UlhCTzZMcTBTM25lZkQwU3dkWG5UdUp1dXk3OVZTdEFOelFPc1d2?=
 =?utf-8?B?ZmVJVjV2ZUx3NkYvemhGSUtoZlBiNWxyS1kxa0hzZWRSdmxVZE9xQWoydG1l?=
 =?utf-8?B?emsyYS85dGNBdHlpZkFGTStLM2lHU2Y4bDJWelViSmw0c1N4aHpXVlpvdHlF?=
 =?utf-8?B?ZEZnUkU3RTFQcUZLVUdYbTVRTFpTcE9LR1dRbGtCRElVVDVMcm0zNGlLaHhN?=
 =?utf-8?B?UUtqNjVYakU0dHM0eGl6dmpCb044c3FqM2R4Ly8xbTk2WUFsc3RERGZnQUg2?=
 =?utf-8?B?WnRoV29LZ3FtWk8xZXFCbUVCc2NPcllFL1I0Ullua2tUWDNmVnZHMi83Mm9U?=
 =?utf-8?B?N0Z4Y0hkQVgvQ3RUWU8rSG52Um9EMlhhaC85RFMvZ2U5OEQ3eFRlOGRHQjFS?=
 =?utf-8?B?d3JIVlFJQ213TEpvWjdTcWk4a3pmTysyQjJLdXFrVzZrZ1Y5cHFCdm9pL0FM?=
 =?utf-8?B?eUFKcGxVSkNLZ3BMRms1SXRnQytMYWtiMU81U01QcTBIY3dNSEFEUkl0ZkNs?=
 =?utf-8?B?WVRRenJ6MFJFeXBZYTgzR2wyQlBHZGVzbjltNkVpNVhCMVJ0U2JISWNSZFpv?=
 =?utf-8?B?UWJTLzg3V0NpN0ZnUTI1NDQ5RFZqb0tPOXlRbVpJaERteWgwdmRFdFZoZGRi?=
 =?utf-8?B?SlF3VTg2aC9NendubFMyY2hZWkJlWmNBRk9YZDR1STR2VUhDWGxGc0pYR1pl?=
 =?utf-8?B?amw2d0VqSlNGZzAxMjA3WUNlWEpCYmM4bis4d1JHMHZSUHJEZzlKb3p4VTJD?=
 =?utf-8?B?Y2dSNSszUXN5czkxaUpmdEsxdDhuY2tFcFIxWTNPS2paQ21JS2xWNWRrc0Rn?=
 =?utf-8?B?VjhvYUE3WXRGeWJFZXRSeG8vYUpETXdmMGUwQ0lUbWxwRGlUeFlGZVd5dVJq?=
 =?utf-8?B?T2lveTJMR09TUnBGeTRmVHdPVXJsL0hJV0ZtNXNvcGhwVHJQUFh5L0hMd1Z2?=
 =?utf-8?B?dmVpdGM1QVFVR2E2ODd3bFRoTTRmY28xOW0zM3RpZGNoVTN5dUo4OVh4c2FE?=
 =?utf-8?B?cUNhRHorN0J5bjFjS2xwbkh1NGZKdVduM3crQ2h1ODBHM0xsQTA4Z2ZsWVYz?=
 =?utf-8?B?YVlEd251MlQ2c1hsUXJrbENPN1diNUVad2JvS0Y2bGdBTjlYL0Z4N3R0b1BI?=
 =?utf-8?B?US93Qno3OFVJcFVXWmwzZzAzc0hNVGhXVW1nVExUdTBERWNQSGNGM2R6ZURH?=
 =?utf-8?B?Y0k5MHBGME9qQVRBbVJWZ1E0TUI1bUwwRktReVV6ZmtTY25qdHBzRmtleE1q?=
 =?utf-8?B?WlkrU20ySGtHaEdWOGhHaHRCd3FrZ2lGckFyV0g5bzN5TWd4bkNZMW9ud2Uy?=
 =?utf-8?B?OXJGZytWRlVnOVFUVFJWNFdnd1ZzUUpQcjEveDhvazZvRCs3QUMyT1lDczI4?=
 =?utf-8?B?YWNIMXpnQUxzRFo1NHE0cjBpSzMzV3M3V0trcldWT2xHTDNlN05RUDg1ZXB5?=
 =?utf-8?B?WFFoYnB3S0pUMllJR2tqVDA2TjF5QUo1MmE0R0JYeURZUm9mZFNvQlIyRmRk?=
 =?utf-8?B?T0hrak9rZ1ZnOUg1SVZsMkZYNTE1emJ0S2E4ZXBubTFyeGZUSXRKVFk0dHpW?=
 =?utf-8?B?d204TUg0NnV2YTBUU25FQVo4WGZDR1dncElENVNpUGNhSnJSREpESmNLQ0di?=
 =?utf-8?Q?S226IPJd0IS/DtTg=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 25d35aa7-228c-4801-9a12-08df0e418e9e
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 07:11:23.7800
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g4ZS3SD89PYVMNNwyFVRwFYrnIiTuHifxi4xA+8InhwigYRxOaBXaGV5VkAolKsc+Nzn41Krewt59AJ48uHiYbT61iz4IIBu7oalUXbFsAlyt4cvWiOC9wMlFyRDtZuq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1138

SGksIEtyenlzenRvZg0KDQo+IE9uIDA5LzA5LzIwMjYgMDg6NTIsIENoYW5naHVhbmcgTGlhbmcg
d3JvdGU6DQo+ID4+Pg0KPiA+Pj4gVGhlIHBpbnMgcHJvcGVydHkgY29ycmVzcG9uZHMgdG8gdGhl
IHNwZWNpZmljIEdQSU8gb2Zmc2V0LCBzbw0KPiA+PiBQQUROVU1fU1lTMF9HUElPX0EyIGNhbm5v
dCBzdGFydCBhdCBpbmRleCAwLg0KPiA+Pg0KPiA+PiBEaWQgeW91IGV2ZW4gcmVhZCBteSByZXBs
eT8gT3IgeW91IGp1c3QgcmVzcG9uZCB3aGF0ZXZlciB0byB0aWNrIHRoZQ0KPiA+PiBjaGVja2Jv
eCBvZiByZXNwb25kaW5nIHRvIG1haW50YWluZXI/DQo+ID4+DQo+ID4+IEFHQUlOOg0KPiA+PiAi
WW91IGRvIG5vdCBuZWVkIHRvIHN0b3JlIHRoZXJlIGhhcmR3YXJlIHZhbHVlcyINCj4gPj4NCj4g
Pj4gRG8geW91IHVuZGVyc3RhbmQgdGhlIHRlcm0gQUJJIGJldHdlZW4gc29mdHdhcmUgYW5kIERU
Uz8gSXMgaW4gdGhpcw0KPiA+PiB0ZXJtIGFueXRoaW5nIGFib3V0IHlvdXIgYWN0dWFsIGhhcmR3
YXJlIG51bWJlcnM/IE5vLg0KPiA+DQo+ID4gWW91IGFyZSByaWdodCwgYW5kIEkgbm93IHNlZSBJ
IHdhcyBhbnN3ZXJpbmcgYSBkaWZmZXJlbnQgcXVlc3Rpb24gdGhhbg0KPiA+IHRoZSBvbmUgWW91
IGFza2VkLg0KPiA+DQo+ID4gU28gSSdkIGxpa2UgdG8gZG91YmxlLWNoZWNrOiBpbiB0aGUgbmV4
dCB2OCB2ZXJzaW9uLCBJJ2xsIHBsYWNlIHRoZQ0KPiA+IGN1cnJlbnRseSB1bm1vZGlmaWVkIGBz
dGFyZml2ZSxqaGIxMDAtcGluY3RybC5oYCB1bmRlcg0KPiA+IGBhcmNoL3Jpc2N2L2Jvb3QvZHRz
L3N0YXJmaXZlL2AuIEZvciB0aGUgbWFjcm8gZGVmaW5pdGlvbnMgdXNlZCBieSB0aGUNCj4gPiBk
cml2ZXIgKGUuZy4sIGBQQUROVU1fU1lTMF9HUElPX0EyYCwgYFBBRE5VTV9TWVMwX0dQSU9fQTNg
KSwgSSdtIG5vdA0KPiA+IGVudGlyZWx5IHN1cmUgd2hlcmUgdG8gcHV0IHRob3NlIGRyaXZlci11
c2VkIGRlZmluaXRpb25zIG5vdy4gTXkgcGxhbiBpcyB0bw0KPiBwbGFjZSB0aGVtIGRpcmVjdGx5
IGludG8gdGhlIHJlbGV2YW50IGRvbWFpbiAoYHN5czBgKSBmaWxlDQo+IGBwaW5jdHJsLXN0YXJm
aXZlLWpoYjEwMC08ZG9tYWluPi5jYC4NCj4gPiBXb3VsZCB0aGlzIGNoYW5nZSBiZSBhY2NlcHRh
YmxlPw0KPiANCj4gWW91ciBkcml2ZXIgaGFzIGFscmVhZHkgYnVuY2ggb2YgbWFnaWMgbnVtYmVy
cyBhbGwgb3Zlciwgc28gSSBkb24ndCBnZXQgd2h5DQo+IHRoaXMgdmFsdWUgaXMgc29tZWhvdyBz
cGVjaWFsLCBidXQgaWYgaXQgaXMsIHlvdSBjYW4gaGF2ZSBkZWZpbmVzIGluIHRoZSBkcml2ZXIN
Cj4gZGlyZWN0bHkgb3IgaW4gdGhlIGRyaXZlciBoZWFkZXIuDQoNClNvbWUgZG9tYWlucyBoYXZl
IHRoZSBzYW1lIHBpbiBmdW5jdGlvbiwgYnV0IHRoZSByZWdpc3RlciBwaW5tdXggdmFsdWVzIG1h
eSBkaWZmZXIuIA0KVGhlc2UgbmVlZCB0byBiZSBncm91cGVkIGFjY29yZGluZyB0byBkaWZmZXJl
bnQgR1BJT3MuDQoNCk9rYXksIHRoZSBuZXh0IHZlcnNpb24gd2lsbCBiZSBzZW50IG91dCBiYXNl
ZCBvbiB0aGlzIGRpc2N1c3Npb24uDQoNCkJlc3QgUmVnYXJkcywNCkNoYW5naHVhbmcNCg==
