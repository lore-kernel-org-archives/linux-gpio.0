Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.116
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793094484;
	b=5XD2SLuuX7kLL9fpcLfGJjQS8KyxOXBO8l79nczYCljBPjarvrSACAd+AmoUthvRAIMa
	 iSpyy1S6DPa9wh1JIWrztW1ErMlRSfA3kRT3pBuyV9fAUe9oLHeNGqVfxOiSP1fa+gFRm
	 c+szygwvkpiJoXSd2jqH6j3eOiggbPYSZkrkYLmNQplhPT/rXnkbXIr8uZT3aYEGGqicq
	 +4fEpzBx9PTQ+M+rRzG4zL7QZgP4/RA5OYifrNzx4/Gtw/ieGkwZE2OCj2NCTb5xGeeqG
	 mk1RO8+VRQdLC/HFSF5Rqu8MlVX2OC69ot+vwVnMNsEEUaANIs9YNIo989br+AqThaQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793094484;
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
	bh=V+/t3r/OUvVLGS60/I8sfQn47zddunctJ06rCDM+NqE=;
	b=k8vRChYNLpbEDbSonmg8YoUnZAYnU2Z1Zg1MSo0TlKyC+bCpBzVrNuveVfRte+DL4+aw
	 S1K+JAVytpZhGXbjxyE1awJPmBHfUaAY76LZ1vCZzR1LYZ0c6oITMMooeX2UsJa+ruRbw
	 CnCh3zWzvb+8y61VSFf9oXTCh1eOom0De1+2de2ZX5hv7fwoNW31AR6yg/zElkcJCdzC8
	 nszaTZZSRl9JcH06McYkqfZ/xxUbCDFbqwQmm9i3lK6rwAGTFOjSNFRk4XouJTum/RpDq
	 xNdeokm9ZCUOer8WMOoFwZbE4flEIsHgdnKU72mHEsqJu1rEqFS1d0gR/xVpm39EZbA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=starfivetech.com;
	spf=pass smtp.mailfrom=starfivetech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=139.219.17.116
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2116.outbound.protection.partner.outlook.cn [139.219.17.116])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F506606A31A;
	Tue, 27 Oct 2026 09:48:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F506606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UctuXad5q14ObmS7I2rW+e/Ufyld5OfjYV6EzRNYRn6AFYsU1PlIZXzw9jAAJBc9a7l78ESlle507l1ZsYW1iFaufWb5G0xlNANAusNMtutLHc4Og1TA2Ush1M/jUpu1t9BbG1w0PjiX6TikO/GlzB5o5qDqTPIgVNU9CblFrfNkFhODDXvgEw9NUEqvcbp+fP/HlTCva+CCsXY7QyKWE23c8LWflvdWDQ80rRqxpyHd+QVIpr7Z7Uv63f1RGdgtTfCfv6s37ki2hP0DiBRionIV/JLPDU1duLMeSMQ+jpKKa+VChJoUKF1XU7dHOMN2OCEpspFYyLXDKFVKmmvnqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V+/t3r/OUvVLGS60/I8sfQn47zddunctJ06rCDM+NqE=;
 b=KdIFQPqmrxQwG1UMXTm0LF/Z74UkbHbPlo678oD5hkEAs1yqqAUxk0bCTsl27ZpjIxxNGgnP/dprldRJK5YlH1sWWyC7I1OvIGAyPzX0KtaOuft+Ocjj1axO2NbuGRjKNDs5U9XnXzq9X9QR/6B0Ia6dEeVMQMqACoSCTNZsxlPFpsTIJaRUC7fJtXAgypwF+oGGlPcNPFKd3Ezq2tXjdOsAAQlqukNjZnFqJkiPw2pDGVUtJFEBZvCJ80C85UPpziScM9R64IfdFE+VbjeqlrcwqX1+tQEDCYYEE3FnZnNNxJc3QkAzZm1BkJmnyTc2sUhl3pyywkBQ92pqZ/bMtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1331.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Tue, 27 Oct
 2026 09:47:51 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0546.021; Tue, 27 Oct 2026 09:47:51 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Linus Walleij <linusw@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Bartosz
 Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, Lianfeng Ouyang
	<lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v1 5/8] dt-bindings: pinctrl: Add
 starfive,jhb100-emmc-pinctrl
Thread-Topic: [PATCH v1 5/8] dt-bindings: pinctrl: Add
 starfive,jhb100-emmc-pinctrl
Thread-Index: AQHdXff33JGJ8uAJv0aE4UqIpQgkH7cLIduAgAYSqVA=
Date: Tue, 27 Oct 2026 09:47:50 +0000
Message-ID:
 <ZQ4PR01MB1202E9A5F49FEB5BB7BCE6D6F2602@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20261017052534.115203-1-changhuang.liang@starfivetech.com>
 <20261017052534.115203-6-changhuang.liang@starfivetech.com>
 <CAD++jLny5p_UNj0BYPy-tU8aPrS2MvpaxS04jKyPH=fWtO+okA@mail.gmail.com>
In-Reply-To:
 <CAD++jLny5p_UNj0BYPy-tU8aPrS2MvpaxS04jKyPH=fWtO+okA@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1331:EE_
x-ms-office365-filtering-correlation-id: 6fe33b61-2d20-4275-0977-08df340f5da0
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|366016|1800799024|261026140227099003|38070700021|4143699003|56012099006|261026121527099003|261021123027099003|261022105027099003|10067099003|22082099003|18002099003;
x-microsoft-antispam-message-info:
 FAqHc7YrOgjguCuHSoMqWL59LkJYqPgrYwvm/+Tdt/C88fXIIuXQIIjvZOOKWzZ8RpuhD5dnAGxjQJMWQJbZkHn3rrUzprkw3S6rjhtcxjUtvJNo8zRR9zoIfwB/6rUyL/yNwKdAZdbMPaHEkyKHdZGGjHQdJCL+vL62UrajOO1GX3w+R8dRj0DBWXj7pTDBdoMZlFYY5FarRo8nPtufUze9/ayH/bFLVbetBjdsNh94845gOhzNVfFLjGhwqA1dHfqjYk1e40O9aEdztU3EY/zqKefKuihx6ULROiuT6+b9JSqb3idPlnRYKsFkLPuLXSzQWmhlaWOJn7Jd1ntGvRS2uRb5FDp9z9JhuqpFpTAhgZTcBw0FTv56z3DfOAN2PNwwIPeEzfACKWZ5A3NL6pbbfD1gJvkFuUK7UoBdD+uTn4gBdpfyEHnj3T7N1oNk+IJAI1uDKs5qTGUfEi4YF9bh91Q2uSHEP+cqd/YEzECKdO8hW5vKMd2a27B/z56oLEDnkSJPNNaar4j2JXxohQ92ZBFrT1S8isJwq1AKxRoLuR0TZsgT2aI3/dIySxJg
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-cn;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(366016)(1800799024)(261026140227099003)(38070700021)(4143699003)(56012099006)(261026121527099003)(261021123027099003)(261022105027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Nk1lRlIrbnlzY05qelp2VjI3TWFCOE5ZeWp1TXFVcG5GcjltQkNLMC9UWWFS?=
 =?utf-8?B?T1dMVk9jUFBYaGs1ZW4vYjRob2c2WXk0YWtlNTdVMm4ybTFjb2NXMHAzYUFQ?=
 =?utf-8?B?LzRhVW1QcFVFblFBQzB6M0RhVkM5UzlwS3AzalpxZ3hORlZIdFFrb3dZaGQ1?=
 =?utf-8?B?K0o1NzJqS3ppVGZVczg4Y1EzUUluNllHekduT3J2NXc4Ym1wMGdGTS9wdHoy?=
 =?utf-8?B?aGJ3ajJkanUxdjJHMHVGa2sxOHh0YXBRRFdSeExUeGU1aG9yemZ0YlJINUZz?=
 =?utf-8?B?TnRPbklnV3hLVUxJWjhVQWVwNFhZcCsxWkQ3UmpxVXdvb2lDOEZTU3lIYngw?=
 =?utf-8?B?R0hkaDZjTjYrV0VVd0x5VGtNN0hxMy9Dc1VteS9semxKQlVrU3cyOTQ0eHRE?=
 =?utf-8?B?Yk5mK2RaaTQzejJZZVhYMUpNS3o2RjI4QUM3c0xtTGlRdEtPRkNlWmRpSFB6?=
 =?utf-8?B?MEYyb0hVVGNZMmxhbjArcFZodEtpY0xST1NaZlAxUGhwRjlVQy9IbStmY0ZZ?=
 =?utf-8?B?ODhYaDV4ay9KQzZscmdHb2t2TVIrbXBTOHhQbmxnZWdxbURJa21KTFRJSzh4?=
 =?utf-8?B?aTl5TUYzV0VodEFKS2ppWWFxRDltaUQ5dVpLRGZETnVML1l5MGJILy9UZ3JJ?=
 =?utf-8?B?THJRZkJZRGVIRmF1U0JuL1YwaXU0WlI4bTdTMGkvRG1lUUFWdFBkRUluYnF3?=
 =?utf-8?B?MmFhN1ZMaXl2eEZVVmtOaVlNOUxiWDZ0Tm91LzlqN3dJUG9XcmwzNjY5NFdK?=
 =?utf-8?B?bHNxTENUaDYrcUEwYmZQc1Z0QXJrSWpveEZmeURhMG9hdzQ1aFNKUG9IQ0Uy?=
 =?utf-8?B?ZWVDYzlnVHplL2hMV3NIYURrYTB3dytHRytuemZPdzRMWjRXbm9KR1RwdlFk?=
 =?utf-8?B?TjNyejJIT21DNSs3dFdYRFdPcXRITUM2SGx3RS9mRytnU3N1OXNsWi8vZWFJ?=
 =?utf-8?B?Njgva2swRkZZYmVPckhqeGtiajBuNENFUFVEMWcyb2RzMXZjOUp0MWxDNWNv?=
 =?utf-8?B?bnFucVlkL1lBMC92S1BRM0FRRDRxTjdjazZrM1RBSnljd25WNWVrdlpRYkVF?=
 =?utf-8?B?QWVkOUJXcDJrOHdPMmEvNVZENytOV3NXVlA0dVBGbEFjZmc5K0kvakNxS09u?=
 =?utf-8?B?NUprVHgxTmpHOEhlUk1RbmwrZmNkUUw0Y1Azd0FRRGxrMkE3NWJoZ096ZkZU?=
 =?utf-8?B?NEszSklVMjFQQTY5Q05OdDlUN3VyazBzaDBOMjducGhzeXNtUjBvaXdpKy9k?=
 =?utf-8?B?UjZTMjlvaDhydHBSRnZqVm5NejBORlpBdHlsUXdqOHBkTGtyWGVvMEQ1N2tF?=
 =?utf-8?B?bVptdVBJb2ZPOXoyTzVtK1VYUU1DK0I3WFBZSEpGZTVPWEYvMWkxVmoydktJ?=
 =?utf-8?B?ZjdiYm44Z2Z5YjZiVFNScjRIekxQSG1IL2VHMjBBd3FvS3J4RGp5RWN5Um1G?=
 =?utf-8?B?UE5IdzVXWmw3WEZzd3ovT0RNbWlmalRlZVdrOTNlRGUrVmtIaHJhWWUyWENq?=
 =?utf-8?B?bDF5dXA4ZS9ETHRObzMwWHIycTJwUVZ6dWRXd005WXZqalU2NUNTOXdFV3BI?=
 =?utf-8?B?U1R0YVpaa2g1V0NINy8xT20vVkw2THlyckpNVGVrWlVsZWpESVo0VFIwbDRK?=
 =?utf-8?B?VDMvQUZHb3U0Q0poZTRqNGxya1VHQmpVekRKQzczZmR1ajVkRmR5QkFFcVhL?=
 =?utf-8?B?bWhTNWVYKzl2MUdTVkVUbXdRbXdidGZDTkIzSjFEUkpsL3Y5MVZpOUV6Mmp5?=
 =?utf-8?B?djVlVFJVbFprZFR4Ti9pS3ZvSWNMN3B3L3NQZUhvUnlDRFZ4aFUwZ21QWHdH?=
 =?utf-8?B?Z2lNTk1xZkdoSHhoQkwzMDFJanR5OXpXQ2o1TTJHYzB2TkxGbFI2QnluRXZy?=
 =?utf-8?B?SjJSWUJQcFFHUW5QUENtQ1crMFBnazhZeGh1b3Q0WkpOb0JCendYSmlEWk5i?=
 =?utf-8?B?UWhkeVVyVUtXYVdYQ2NmTWJ6QTBBWlB5UGR0V2xoTVk2MktJUXBtNzlZL1Fk?=
 =?utf-8?B?U1dFMzRvSGxSSVpqQ1lmVi9pOXJHMzRBS3RBWE9xOHRzUzZYcEpJS1FPR3pi?=
 =?utf-8?B?QjVIMzlGVEdHbVd4ODFYRXRIOEIrM0ViaUUwWTc1UnVqWFJoUFRPUDdGWkVI?=
 =?utf-8?B?SHo5SUZRL0RPdVJ0RmJzYVY1TnZWdzlhOFRxN0lLc2h3TkJUOVM2bGVLcGdU?=
 =?utf-8?B?YlZ2MklVZTlxUzFteVZPTEd6N29SSFlENnE1a2FHbnd3UE90YW1JQTlZQVlY?=
 =?utf-8?B?aFJzQkRRcVgraTIwVUU5YW0wYy9mOSsxOVliT083V3pKV3c1OVkvM1lqRjQ3?=
 =?utf-8?B?Ykg0VDRGOXk2SWIvZFAzYmNmVkdPTU1YdHp1RmhoTWpoWG9DYUc4SFNvME5D?=
 =?utf-8?Q?Ufg/ZsuaXF8W1rnA=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fe33b61-2d20-4275-0977-08df340f5da0
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2026 09:47:50.9577
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 8L5apM7S7ddniQZMwpyJ2O3gin2yH8CF0TcbL54RubVBN5hmoB+sEizv8pmEOS12BQQUmos0wR4yi49H372p2l4y94s7W4SdAok19hJeIZX56nEYGom9pKk+R4U4Foqp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1331

SGksIExpbnVzDQoNCj4gT24gU2F0LCBPY3QgMTcsIDIwMjYgYXQgNzoyNuKAr0FNIENoYW5naHVh
bmcgTGlhbmcNCj4gPGNoYW5naHVhbmcubGlhbmdAc3RhcmZpdmV0ZWNoLmNvbT4gd3JvdGU6DQo+
IA0KPiA+ICsgIFBpbmN0cmwgYmluZGluZ3MgZm9yIEpIQjEwMCBSSVNDLVYgU29DIGZyb20gU3Rh
ckZpdmUgVGVjaG5vbG9neSBMdGQuDQo+ID4gKw0KPiA+ICsgIFRoZSBKSEIxMDAgU29DIGhhcyAx
MyBwaW5jdHJsIGRvbWFpbnMgLSBzeXMwLCBzeXMwaCwgc3lzMSwgc3lzMiwNCj4gPiArIHBlcjAs
IHBlcjEsICBwZXIyLCBwZXIycG9rLCBwZXIzLCBhZGMwLCBhZGMxLCBlbW1jLCBhbmQgdmdhLg0K
PiA+ICsgIFRoaXMgZG9jdW1lbnQgcHJvdmlkZXMgYW4gb3ZlcnZpZXcgb2YgdGhlICJlbW1jIiBw
aW5jdHJsIGRvbWFpbi4NCj4gDQo+IEkgbm90aWNlZCBpbiB0aGUgcHVsbCByZXF1ZXN0IHRvIFRv
cnZhbGRzIHRoYXQgdGhpcyBpcyBhIGZpcnN0LCB1c3VhbGx5IHRoZSBTb0NzDQo+IGhhdmUgb25l
IHBpbiBjb250cm9sbGVyLCBvciB0d28gKGxpa2UgUXVhbGNvbW1zIFRMTU0gYW5kIExQQVNTKS4N
Cj4gDQo+IEJ1dCB0aGlzIG9uZSBoYXMgMTMuLi4NCj4gDQo+IFlvdXIgc2lsaWNvbiBwZW9wbGUg
YXJlIG9idmlvdXNseSB0aGlua2luZyBkaWZmZXJlbnRseSBmcm9tIGV2ZXJ5b25lIGVsc2Ugd2l0
aA0KPiB0aGlzIGRpc3RyaWJ1dGVkIHBpbiBjb250cm9sbGVyIG1vZGVsLiBJZiB5b3Uga25vdyBz
b21ldGhpbmcgYWJvdXQgdGhlDQo+IHRoaW5raW5nIGdvaW5nIG9uIGhlcmUgSSdkIGJlIGN1cmlv
dXMuDQoNCkkndmUgYmVlbiBhc2tpbmcgdGhlIHJlbGV2YW50IHBlcnNvbm5lbCByZWNlbnRseS4N
CkhlcmUsIGVhY2ggZG9tYWluIGlzIGJhc2ljYWxseSBoYW5kbGVkIGJ5IG9uZSBwZXJzb24sIGFu
ZCBkaWZmZXJlbnQgcGVvcGxlIGdlbmVyYWxseSANCmNob29zZSBkaWZmZXJlbnQgSU8gYWRkcmVz
c2VzIHRvIG1hbmFnZSBkaWZmZXJlbnQgcGluY3RybHMsIHNvIGl0IG9ubHkgYnJpbmdzIA0KY29u
dmVuaWVuY2UgdG8gdGhlIFNvQyBwZXJzb25uZWwuIFRoZXJlJ3Mgbm8gcGFydGljdWxhciBiZW5l
Zml0Lg0KDQpCZXN0IFJlZ2FyZHMsDQpDaGFuZ2h1YW5nDQoNCg==
