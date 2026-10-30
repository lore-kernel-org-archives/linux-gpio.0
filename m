Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.100
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793322401;
	b=AeeyP75svHJ+YbEfG8lrf7SpuisKKbJgP83vA1qadi45XmaFVR7jBB+PT+XlWsYzLWBj
	 vdBYPSx+RO6HafTe/kdWqECSbeMpzPOVgfFzeewyiaJCabI+d2tqhFwEBt7o+fA/ft8RD
	 iLbk/BuXTS/+JJeiBNS9tue81PSTb7Z1FaY70sZ7O9KPTBFE//Z4hqzqYoCxsMsPp7gxb
	 rmdEyiO+PgY55rnOZD+W1oghEayBR3eGppWkNzsQyUx7TfdKlP53suDaEb+kXmQiSF2vC
	 TD7OwfN6OLfMphCkGCudKsl1x9FxQ2SADwzXrDpX04pWbT9HllmzXSh+f4zULWiiP9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793322401;
	h=DMARC-Filter:Received:Received:From:To:CC:Subject:Thread-Topic:
	 Thread-Index:Date:Message-ID:References:In-Reply-To:Accept-Language:
	 Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:x-ms-exchange-senderadcheck:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=uy1BP/z/1iwouwiqXH4itqLb/MmjN7H+EmIsJ6KYHjI=;
	b=LzzWRz8MuJJsm30OTzN/T1y5Wfm3GjMdNAbga5PlSS+6sSgpsQ0kwoqb+nHChEAiutD9
	 Mnhqi3Ii4Yv/uVcS7KghFplNC3VFEiDiWwbPUhD7E3tvaKyPCNErhVhtDVkBfVRASRSYJ
	 K/v7RgJ2kF8bTrKpumwjrtWGhHnRj60T1+Q6rRvM8GMbnnVcILh32FcqE0GXv2jNc+zdX
	 ab39+a5qxKL/AoGSRP7lXcn1AFPYHYhl6AXyPveUnzVNnaGhE7dK++bD/fmSnNo21qXiw
	 j7YLFfULEQ6/qB0jQ5XkMpYGiMQN51vlhrhnDUVXP3F6cs4wE1/3yoiScnLJ3DJxYYw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.100
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2100.outbound.protection.partner.outlook.cn [139.219.17.100])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F44606A31C;
	Fri, 30 Oct 2026 01:06:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88F44606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ll1fphk4VJF/f6oA4NrwFAmAUz3R+0oRIPJ2Zs4hTodjZHQAQ6LyM0KDdaShuxPFIA/fYUVYeVsIZYdds188I0lt0K0e+OYzlJONnmvnP12mAdu/fVz1RvS5BKR8KtJHyRcCeHkkCHVM8/m3NFsvOdtQUjXhRvozSZ+kHCgfDVFGObTVCVQivFdN4jKgg07yDRrH1CSXBukfmAzKI4EZE/i38aiQKCxVVBUwEITcK++gbwY7Zwt4JurWebABrr9HwjYA7NGpPLUoe90g0RkSWmDr2x6ZYq/sKV8Elo/sDdfE+PwhHRCiBdJLm9k0xEhN4OV/jw7A0+qxGJ9JgYZyCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uy1BP/z/1iwouwiqXH4itqLb/MmjN7H+EmIsJ6KYHjI=;
 b=kwBvwUqT+wqcHb/Gdhd7Cwypao+z2IZqwU+ihdaGyV7UTNaCAF13gLukr21maqp9C8MAe6aDkkK3j8IbMbvF/GrP7tKmkvx+nF4jaRA1PMAn+lskvuYXRTltTb3l9oddb2qMS1vEAu3vLvceB3Zgp51pCnc9LKYUBqZXi6ua3u8GIuR2+gpm3PhkEOB7+y17PBg34aA/bam/cc6bFaYFds9oUp2tphzKRi+qwpDYi3NI+d2HeU5vTnMj3eVSmUJ9ejFt+kd8pwXtkz4As0QuTPIJWIrMRW+i0/gr0ftTzrHFRz4W5dIrFaSdPYXjhtrg26L1E4hKM33kb5OaLOyEvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1201.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:13::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.9; Fri, 30 Oct
 2026 01:06:28 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0569.008; Fri, 30 Oct 2026 01:06:28 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Linus Walleij <linusw@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Bartosz
 Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Lianfeng Ouyang
	<lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v1 6/8] pinctrl: starfive: Add StarFive JHB100 emmc
 controller driver
Thread-Topic: [PATCH v1 6/8] pinctrl: starfive: Add StarFive JHB100 emmc
 controller driver
Thread-Index: AQHdXff3MLQEsB7Aa0qNDpNd5DKM97cUjviAgADK3vA=
Date: Fri, 30 Oct 2026 01:06:27 +0000
Message-ID:
 <ZQ4PR01MB1202E5FC8229FF60B53B495EF26D2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20261017052534.115203-1-changhuang.liang@starfivetech.com>
 <20261017052534.115203-7-changhuang.liang@starfivetech.com>
 <CAD++jLmtOcNMZsXWgH5Q1fHk1A3vAZx3OnX3=RDvOjKpcefCcA@mail.gmail.com>
In-Reply-To:
 <CAD++jLmtOcNMZsXWgH5Q1fHk1A3vAZx3OnX3=RDvOjKpcefCcA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1201:EE_
x-ms-office365-filtering-correlation-id: f31110c0-58e1-4b4a-ea6e-08df362206c4
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|22082099003|18002099003|56012099006|4143699003|10067099003|38070700021;
x-microsoft-antispam-message-info:
 gDFaTtjt+V+4UBNCQdzhUF8xtbhJLmj5ff4h1Kalm2BU22iXYOHRRAAe7b4r44TfRTMcY2lPe9RpSHiurl5b7ciaCbmWXx4utSpx/C6y5iycAQ/aWddt1MEMSeRmv8vAFIGqLV+VQt9t+/0xjxVj7AQFllHb/Z2iIBhAYfkqvOOBL5aZ5szPMZgCDGp9uUvx1nxFKeGP6L8I57Q1tiPmHT8F3oc80fVqbjm9juvGkyR917RwlxlqIgAbCWu255a84JVCbBtiNW/JKyaiYqSRNNdv3SwqFFa7VE9/K6ba3fq4au2eAwJ7ocHJZkQrs0zfUXLHj3O7vBlIQt7T6DiOOwkYKwb4/k078vhEZPQ2Cucg3mczWP+r1rqyPyv+Fws6ErV8cJkpUUuY7InJCaMw9/Gm1crJr3Rf7F/w1900qvRER/LVz7J137I+6YDbaDrWFJqdrJR61ob23jE74jq8pUDwnIxMAe59o4QZXQCppBsGHesSW8+Sbk/0go0dE9VXGasqQ1BIPayLKLA+6sRZbzUvbx8A0+vSFUbj4zoRTQpxgWXw9vV9X3F/TLEDX8Mi
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(22082099003)(18002099003)(56012099006)(4143699003)(10067099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cTdsOUtSRENVbEcrdTFvZFNRSzBRR0hYK2RhYlI4ZkFTVHJWaEkyYVZYenVK?=
 =?utf-8?B?a0RhV2FpUXJpellZbHJTMHhjSGtYbFVtUVhxQ1JjdWVEMFN5UlVleENKYkpx?=
 =?utf-8?B?UjJ0Mkx3cVpFU29MMVVsd2NCT3FFbGpXdW5rUC94d2tpOHhwcy9uOEJ3M2tJ?=
 =?utf-8?B?VzBoejE1cHJuVStjaTZ0ZXNOK0MvZEFHb21zbU5mUUZHaVM2MUZPUnI2Nldj?=
 =?utf-8?B?OFdXSGorb1ZjWG1aaUVWLzhjaTFwUEJlSEMzU2dJQlBNKzNIU0hMWFdPalV2?=
 =?utf-8?B?WkMzazYxZ3JtdFBreW84ajhVSk16bHJ3REg3TGlrZWdOWjVudnZrZisxd2tZ?=
 =?utf-8?B?RzdxcGMyVXI4YS8vcVVURkFzWEY5VElIYk0vTWpMV2NRK0Jsd1hKMDhmMlpF?=
 =?utf-8?B?ZThjcE9zeVJicklid0R0ZzNLbkNwY3lSRDlYckZ6VkwwS1ZWcE1uNUJWam1I?=
 =?utf-8?B?bjJTeE53aTZCR1hZeUdSaHZvd2xPS1dJbkp4NFhmR3pOWXhLdEtzdlZZYkov?=
 =?utf-8?B?S0VhMkZMYjZ2UFN5aGdveTFBZjUreFpCRUxSamE2eGRvV0dBQVA0VFJnVmM0?=
 =?utf-8?B?cStLa0dZeE51eXZWdWJvMXhmekFldHBhZU1icUNDenF4ZlFtQUtYWGljMnVR?=
 =?utf-8?B?VEs4MGVsQmZvN0V5d0tpdzlsN2MvbE5tZGZ2Y1hoS3VEd2JrRGRwZGZUZlRq?=
 =?utf-8?B?TWlOVHNncnAzK25YeWMyU2dvNmtHY2xuRHZRZi9MVE02NkYwYU02TXJUMTd4?=
 =?utf-8?B?Um9JVFZFdk4wVlh6OWJhVVh4bW9qVTN1R1hzNjMwZDdoM0p6STRxdHRWVWV3?=
 =?utf-8?B?V1c4NVEvcE9NbW0vMFNibTNWZFU4b0ROREJzNUpQcEl0ZFltVWQxdE0rYTJ4?=
 =?utf-8?B?UmExdmZQSVJUeE9jSTU1Misvb0ZVaFMyWUJTeVN3bko2dlFaOTZzNW12YWlK?=
 =?utf-8?B?andIV01ONDFXM1FJZHJpdFFMeVBnVm9TVFJhMjd2bFNjd29vWlpPMVcyTkFT?=
 =?utf-8?B?NVZyWTNmc250aW5iNWhRVEZMZ0NZOHlqY0Y2SDZYL0dGai90RVliZzM5cmNH?=
 =?utf-8?B?VnpRaTlvQkpDNEh1UFNJWW9LTE1lMzQrdWtIYkpTakQvN3dzMFo0THY0clNz?=
 =?utf-8?B?VlFValFtYUphdEo1MFJVTXRadlNlbTUyeE5jV1hwRUVNZTFrazB5OG5QelBj?=
 =?utf-8?B?VWtZSVNnYXhjNjZjb0ErL2kxNkJFeFRkbVJRYVN6S3UyOWhrTVEyNlVrWDVq?=
 =?utf-8?B?b2xwbTN5dzQ3VGp6RzJUQVVVTnlIVERWdFJyODNrWmI1dDhuMnIxQU5MWnRZ?=
 =?utf-8?B?enJHL280TmdEOHQwR1RjNnNFOHAxc0gxTnBBSU0vSUFBc1ZwWWRSMkFId2k5?=
 =?utf-8?B?VGFhbDJKRE84ZHc2UTBmVEpvMGNWRlJxZzJxcWoraEFvejZjOU42Wmh2M2dU?=
 =?utf-8?B?cUZDYkY5T3ZLSDdVZDBoekE5MUp2UVcwQ0Z0a0o1c0lMdHB6dzRvSkRPNWhh?=
 =?utf-8?B?VlJBUG9ndzFCNi8vdVNYZkhVK0lOdDNSV0IzZkE1bDljRnQ4NGkzR1Voalln?=
 =?utf-8?B?MFQ5R3N6WFRib1BRVFBaOWZzOEZnUDJ5d2RtYUpBeEh5SXhYR2luQSs4dDk0?=
 =?utf-8?B?aU5TU1BnKzJOdHRzNU1rUVRSZU5SeHQ1T0E1dlBValdIZjZlNTRHNWxlMnVw?=
 =?utf-8?B?bTFEVmJ5OG9OcThIZHVTaWpOeGdMS1pmb084ckdnQUx3NlI0WGJJU3NlaFZu?=
 =?utf-8?B?amxyakNRd1ZBRmd1UnJiRGRaS3BPYzZ2b28vK0ZhTlMrSjVsNitWcEJIU0lU?=
 =?utf-8?B?T1dXSDk5TnEwQVhSMEk3THVHVkZBY1V0a0cwdXorZUViTzRPVC9PaWJmUWQr?=
 =?utf-8?B?M1BlNlljbWdOOU5oUFA4RExhdktqc0p6Y252aEZGaXVnNkxXUlRrUmgyKzM4?=
 =?utf-8?B?V3dWandnT0J0NjNCUXZlbldPTzN1cGZjcjQyL2RiMFlnd25ac3dRTHhFeWJk?=
 =?utf-8?B?bVBFSWE0cHJSdm1XcFE1cUppbkRiUm1yL1lXQk5wb0RhT3ZHU0w3S1VsNVZY?=
 =?utf-8?B?V1ozb0ZXT3NWK1plNXpPd1RRdmw3VERXRnJUc2hYV3VaSWdSczJKc3JVUmd2?=
 =?utf-8?B?anMxbVFydmYyNHNzd0dGbUY1R0ZRVVZCKzdWajBzQ1R4T2lUc0FFVS9FMDJM?=
 =?utf-8?B?dHpCQzRkaEJ1N1VjMzl6S29sNEphcEI2WisxMExZWFQzd1VJUGlHS1ZoRkxR?=
 =?utf-8?B?cHcxUU9UUlYwSDBSZGRSSm9hUUF5aEsvWUZ1RWc1VElDeTB3NlJiSGpqSjc3?=
 =?utf-8?B?VUlrSGJja204QmlzbHoxSU5LZWkvaHd1d2tqNlJUdG51QUNRWC9ucnViWmY5?=
 =?utf-8?Q?Jx6BMHIQICSMxtWw=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: f31110c0-58e1-4b4a-ea6e-08df362206c4
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Oct 2026 01:06:27.9449
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rAQSJQFvtv0qIw6StPCtqCdokJy9cy4JrUfOOOtFplQ2NHo7JNZUC6hPcDFrATr1KED8vxyZCQE5OIsrvhT09Fnn5dPo/R7pd7Rlpuj1p/LfYY7Da9xYlKPnKi63ljXb
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1201

SGksIExpbnVzDQoNCj4gT24gU2F0LCBPY3QgMTcsIDIwMjYgYXQgNzoy4oCvQU0gQ2hhbmdodWFu
ZyBMaWFuZw0KPiA8Y2hhbmdodWFuZy5saWFuZ0BzdGFyZml2ZXRlY2guY29tPiB3cm90ZToNCj4g
DQo+ID4gQWRkIHBpbmN0cmwgZHJpdmVyIGZvciBTdGFyRml2ZSBKSEIxMDAgU29DIGVNTUMoZW1t
YykgcGluY3RybA0KPiA+IGNvbnRyb2xsZXIuDQo+ID4NCj4gPiBDby1kZXZlbG9wZWQtYnk6IExp
YW5mZW5nIE91eWFuZyA8bGlhbmZlbmcub3V5YW5nQHN0YXJmaXZldGVjaC5jb20+DQo+ID4gU2ln
bmVkLW9mZi1ieTogTGlhbmZlbmcgT3V5YW5nIDxsaWFuZmVuZy5vdXlhbmdAc3RhcmZpdmV0ZWNo
LmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IFNvbyA8eXVrbGluLnNvb0BzdGFyZml2ZXRl
Y2guY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IENoYW5naHVhbmcgTGlhbmcgPGNoYW5naHVhbmcu
bGlhbmdAc3RhcmZpdmV0ZWNoLmNvbT4NCj4gDQo+IE92ZXJhbGwgTEdUTQ0KPiBXaWxsIHlvdSBy
ZXNlbmQgdGhlIHBhdGNoIHNlcmllcyBhZnRlciB2Ny40LXJjMT8NCg0KWWVzLCBJJ2xsIHJlc2Vu
ZCB0aGUgcGF0Y2ggc2VyaWVzIGFmdGVyIHY3LjQtcmMxIGlzIG91dC4NCg0KQmVzdCBSZWdhcmRz
LA0KQ2hhbmdodWFuZw0K
