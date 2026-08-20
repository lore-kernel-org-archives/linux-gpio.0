Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012022.outbound.protection.outlook.com [40.107.75.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5F5540D57F
	for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2026 10:04:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.22
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787220262; cv=fail; b=oiQRKfdTZBqV2xbXeXqF51W+JWRuOKSr6UaenE01jfx/f0f0JTG0x6lxme+QNgBmgWsHSiYw0oY5880ZhCj5UIz8YIiziS5YGL6xtToP6VYbbA4sbmrcf0+9Ghy6Si2ZjO9cZdwevBXtJDcDa3Aab+LLZM0N+r1OCDsEywl0y9Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787220262; c=relaxed/simple;
	bh=j7mQ9yweZXWpfAoGvldVBEfuHTlMH0l0AvqGE1falfA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=brYSM3V90j0WXyrWPlSdnRvB5N5JVKeQQyghGvBX86Mj4Fg7iyshecQf6K65CQ6QpEnzAm5iDcdQc046F1fQqBytEVUoboJysgVV9iB7HzCs/z6mPwycpIJsLE6lyiSrON/P7tbBFt0VpEfumcxjxDcoV6HV1c5OvSXYSi7R3t0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aaeon.com.tw; spf=pass smtp.mailfrom=aaeon.com.tw; dkim=pass (1024-bit key) header.d=AAEON.COM.TW header.i=@AAEON.COM.TW header.b=eOH3kEy2; arc=fail smtp.client-ip=40.107.75.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aaeon.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aaeon.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=AAEON.COM.TW header.i=@AAEON.COM.TW header.b="eOH3kEy2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S/sLvRmho2ebwKHxtSZtgkwvhB+M7IjG8KGJNHLPHAzIj1a2YdkJUKXP+s07DvHVA56MOnS/kG4AN90LyIv5iQKbTU0pK44y8LvsfIrxARlNkiggTBRBzd6oWTZQQFalW5tfNIwhrG+6QGhLpiqFypOIYkLyVybkoeS4r+A8Ol3lgfSV6050GzFdS6fAOuP0d/ku3eLI9trehpMhpWSJLSbbbsDaHbhJl52OWr/W02iQqwCQcZ+/mTMLwwIAp9g2AG11fi/ONZAh6DDxCi+PE1g0P8T1q6SyUSglwibfDP74KcON6JUdrFlrp+4p50NligigAaB9H8sLf/aOcLY83Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j7mQ9yweZXWpfAoGvldVBEfuHTlMH0l0AvqGE1falfA=;
 b=SuRy0V4xrKIQK9nh0G12S9r9jya+42JVKFgEwi2P/afm+0b77EzyzvTvjoIK50eqW9/DWO7WGZQtkrZx1ljVtz8ARenoYaeIpjBHm2v6ocu4HI0Hx361ynvwY4aU5MOrzuka0yVW4X4zPU5D5/6aAbTl3vQwwKCckQX1yvHdBTwFe1hKNrcU5o36AXEG1GCNKUJT4hG2+Z3OCwNTV0xhMXdqpm2Qsx33xDex5ECxIJl7aJUQ2UB1HZ4bH1ReW0vXFU00GxJW+7pFweKoXruHmR0M7gnKGXUMXUGFacTEpqD0UWI3g/oGqMAq3ie31J1wpJK3Tpd5gvbOkqlUOWJzHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aaeon.com.tw; dmarc=pass action=none header.from=aaeon.com.tw;
 dkim=pass header.d=aaeon.com.tw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=AAEON.COM.TW;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j7mQ9yweZXWpfAoGvldVBEfuHTlMH0l0AvqGE1falfA=;
 b=eOH3kEy2rjfXUpwMXflcjuYFXNq1fc0SzV19juBTucKEWzHkoqRry6Pg3nLARDaRRgJqA8qxASUhBAkZy2dxkBQcbm9TWpdx9Em5wyFpxJ0XRnsZ1DLjYUMkVBP9DjZKFO90B8Wvd2v/mJG3x2szdgxXlM247j5G9k2lwlfIAkA=
Received: from KL1PR02MB7239.apcprd02.prod.outlook.com (2603:1096:820:127::10)
 by SEZPR02MB7327.apcprd02.prod.outlook.com (2603:1096:101:1f1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 10:04:13 +0000
Received: from KL1PR02MB7239.apcprd02.prod.outlook.com
 ([fe80::2d6:2245:ecbc:ca26]) by KL1PR02MB7239.apcprd02.prod.outlook.com
 ([fe80::2d6:2245:ecbc:ca26%4]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 10:04:13 +0000
From: =?utf-8?B?QmlsbHlDaG91IOWRqOWNmuWAqw==?= <BillyChou@aaeon.com.tw>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
CC: GaryWang <is0124@gmail.com>, =?utf-8?B?SnVuWWluZ0xhaSDos7Tkv4rnqY4=?=
	<JunYingLai@aaeon.com.tw>, Thomas Richard <thomas.richard@bootlin.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	=?utf-8?B?SmFzb25IdWFuZyDpu4Pku4HmnbA=?= <JasonHuang@aaeon.com.tw>
Subject: RE: Up Squared Pro 7000 (UPN-ADLN01) broken BIOS?
Thread-Topic: Up Squared Pro 7000 (UPN-ADLN01) broken BIOS?
Thread-Index:
 AQHdEEdyeHj2H5neCk2cagLOPz7GorZmd4OAgBRGIkCAHBwdcIAAN80AgA+PiZCAABc5gIAAADeAgAA8XZA=
Date: Thu, 20 Aug 2026 10:04:13 +0000
Message-ID:
 <KL1PR02MB7239A0882DE535296B4ED5249FA42@KL1PR02MB7239.apcprd02.prod.outlook.com>
References: <alAJJr5ATEZdHBBA@ashevche-desk.local>
 <CANYHO6rgn19uxjmc+1xv-pmadZQ1EaePmwvC3Kfy-E6ckwcYqA@mail.gmail.com>
 <alC3Kc2BcjkmUVwV@ashevche-desk.local>
 <TY1PPFA4928F5D95D0BFF5F087E44F8B166F0C02@TY1PPFA4928F5D9.apcprd02.prod.outlook.com>
 <KL1PR02MB723976B817F54AEB9785B51D9FDE2@KL1PR02MB7239.apcprd02.prod.outlook.com>
 <anl8TtJweGgob1kp@ashevche-desk.local>
 <KL1PR02MB7239DF2E12270CC4B58F55429FA42@KL1PR02MB7239.apcprd02.prod.outlook.com>
 <aoadazG84iGSWCuI@ashevche-desk.local> <aoadmbnFae8C4y3q@ashevche-desk.local>
In-Reply-To: <aoadmbnFae8C4y3q@ashevche-desk.local>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aaeon.com.tw;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR02MB7239:EE_|SEZPR02MB7327:EE_
x-ms-office365-filtering-correlation-id: 8d98751e-af15-4dcc-203c-08defea26315
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|4133799003|38070700021|56012099006|4143699003|11063799006|10067099003|55112099003|6133799003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 PS/A5sq4Sf0+D2qfI5OFmeUO4aAJC2b4m3Hu1ERWO2tLT/OjZ0108DqHLDwR0U8OVUlIASF6FBce4mAmF5YBtgrnZAmkHhJUAq0cAz0nnjA29dgTVehe1sjCsKIfVaG2sSMTZIyhS8kb0GwP13DPzk4rckVZGhF27RlwVKcuzlNmlO1VmrP9pewfw6IKgLf7Vb9Dy3R6w3oq6kECcniIgIdIkrBJGinp4cfeXjp5JHOuhqxAH5O0OBCKMuVabJ00N9kyFi/i1n0wKdrKVcVP6dQcKAkLi77mPw5ST7QExcViVNrPVv1fOJOkFH6+2AwyivSEKr7ganhroVz/i4cignL3K9IDlJhtGv4JGXsEDu9oXHdbixcvMwLRT5+fNI2f6v/+fo7tA4WGfLdxJMSIY38O22BxyTgQD+mISq9g3L+GHkmvcM5FhunIFWHTdcN6EgBaKPsH+D5OTg34ITdTPGNLsYjvMf+rOWeaMJvxAVAMYXs+05XCkOf0XLjePtfdxkUNRQnCIKSrm08aBf1PydGNS16PEs9M0a+knqrVjguAIwPtEiXKOF4Mn4oWd5pCE7EWaN5ZUL+p2ktg78DdMcRQiGHZ1Os4z9czClTn0G8KUeA4NW/Jn5hEcPxp3FTd4OBZ6ls5IArWzw7lzZPKm/HOFUgu8AT2JKuWqXAzqmE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR02MB7239.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(4133799003)(38070700021)(56012099006)(4143699003)(11063799006)(10067099003)(55112099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Y0tHSXh3emVwb1QrVitiQWw1MmY0ZHplNEV0b0JMZXlBYWErL3Btb0NmazBj?=
 =?utf-8?B?SUg0eWtzMVkvYnU0bFRDQi9VdUFia29yN09WR2k2VnZRQkJsOTFWc0hTZElj?=
 =?utf-8?B?Uk02SFlDdmVsa2tkdXUyUTdiNnU5S2FiYkVlQWZjRTR4UnVCK2xGNDVyUVNW?=
 =?utf-8?B?L2szZTZYREl6c0JXZGJRcDh2N0tmYUx2bW1ZeWtvUHlzdEYzdmtQL3o3MHdw?=
 =?utf-8?B?Kzg5Q0oxL1lSbWRxSGlaUFgzQWNaZy9RdDV6WElnRHF3eFdDOStDT3pQK3ZV?=
 =?utf-8?B?OVhCR211dmVhMmVWeEdHbnVTeDhMLzRqdzNNMVJjais3emVWM0FySUNIckM0?=
 =?utf-8?B?YnpwaVI4TDlkVmNnY2Nsc2VyY0kvQmovVzRvclNjcGZzSzkxcXZQa0I2VGc5?=
 =?utf-8?B?SjcwZW9yWmVHcE5iQUVDajk5Rmc5TFhiTE9SZVJ3T25rV1pSTEMzcUJoQ1NQ?=
 =?utf-8?B?QzExOHBwRlp0TmhVZ1FxYUVCMlhCZ1lBK1NPR0I1Y2xDRFdySkFkdGtmM2xP?=
 =?utf-8?B?TkRSeVBJVFhqYnpoaThnajRIeGNNUGg5U2pmTGk3a2JPT3h0Z1g0dnUyVTNC?=
 =?utf-8?B?NGIxNUgxRUhFMGpqaVVOdFU5cDVlTmcwcFVDQkp2U2t3TGkyM2lYOGcyT0pk?=
 =?utf-8?B?UmJxYlhKUFpoOW5SQTYrY1B0YjVlQWpVR085RHR3eTFxMHlYVFJaSlpJemd2?=
 =?utf-8?B?aWVDcTFVMGdpMlJKL05oMFNWeEw1dVczNnJXT2VhcEo2d2hzMDZ3L3RnQm1K?=
 =?utf-8?B?c0hwd2VSWGE4dDY4WkpRUStzU244NTZUUUdqVmV0SC9pLzJKNksyTkh3T2tO?=
 =?utf-8?B?czRlZUJXbUFpbE9jVkJ4TU5YcHExWWt1VE5FRytDVlB6Nk9LdTNERmlBSEoz?=
 =?utf-8?B?c3RMYkh4a0ljZWM0Qk1qK3diSTN5UVJFZmNTK1Vlblh4UUl1R1NmNm0xWmx0?=
 =?utf-8?B?YzB3YVNvUUhrQXRzbWJoUDRPVEZRc3lSUWlxZFpxUlJSQVZpZHVyK0hNL3BG?=
 =?utf-8?B?d0VxOE9jVVgzUEpQUGwwY1d0eTRrLzVDa2pTU1BnRy9hQmRnUjBKeWY3Mmdl?=
 =?utf-8?B?RnBBOC84blpZRjZ4UmJlczZZaTc2YTVVblVKeEt5SG8vZUx3RGRTMm11VmxI?=
 =?utf-8?B?Y1FPRGlFUWRzZlZqSk0vM2hZeG85RDM0V09KRktzcXVad3BCZzdUYjQ0T2VU?=
 =?utf-8?B?dnY3NzBLdUZxMjlGcEFOMWszQ215WDNUQXFMd3ZOVE5FZExlSUw5U2daQmlj?=
 =?utf-8?B?cEdlM1BqVUkrWFpvYnNXdmVBaUhWdXFMeHBvUW5rb2hvYkJscVkxbEJMQ3FD?=
 =?utf-8?B?UytDNEJuMHVWSHV3RDB6bGwxS2xma1ErQlJQQi9OSzVrUGZIdHJkc0dKemo2?=
 =?utf-8?B?b3NYd0MyYzc0aERtVDk1dWF2a0NkTWc3MmltTFFMVEVHL1QzaUN1VVlxUkQ2?=
 =?utf-8?B?WXZTZXRQZldUaHMvM1hjUGh0ZkltbUc3QXVMdmwwNnoyYlNYa0c4c3RNSkJa?=
 =?utf-8?B?V2dnL2grdmtTM0xHZzJyazR5cVdRWG0vM2VsN0UrakM5RzdyNFJqbXcwWFFm?=
 =?utf-8?B?NnQzcUtNTUdOTjg0Q3hwMEZCZW81YzBwbi9xYnFVNlE5YlVsZFpwNUg1Q2Ja?=
 =?utf-8?B?am92dFIxYXRmUmVnZXFaVlM5ZnZOb3dSQWMzYjNKL3luSEZURHl5SHhyNGVY?=
 =?utf-8?B?cXFrNkg2bmFxc2Q2V0RUM2RFekF6M3M1WlpXc21VeVFkSDJydjZCTy9PWEVQ?=
 =?utf-8?B?anZIcENzSVB1WU9IKy9Ec2ZzVWZDM0N5WGUvdmt6M2xTRnpkZUxud0pSSkZi?=
 =?utf-8?B?K05VcGM3TnAxQkxhYllVQUdLdnN5eWhROW03ZWIwZGkvNGVjL3Q2M0VzY3Jy?=
 =?utf-8?B?WElvU0xHWDIwSVpZdG0vV21wZ2tmV1FuaHIwbVRKS3dTWDdZNmZtOGszY2NY?=
 =?utf-8?B?TVEzSWthRHZEMk9jdW5NbW5HOUVtWkxQU1M2Q0FsLytrSFRKYmRYVXJ6bTFM?=
 =?utf-8?B?bGI2N0FBSXdNTEhYelJlMkpTZmh6b2xFUTltYWNvc1dQSEkyVG1UWUR1OW5P?=
 =?utf-8?B?cnBYdEhCSUNRM3dzWkJkZ2Z2S0ZSZkpxOW95ck12L1ZRNTA0RWd5TDlmY2ZZ?=
 =?utf-8?B?UW1tL0p3anpBMTVhTXoyZkNncXlIOUtkRmZDL2JxUkJUSGhLMGxNc1BmMXBZ?=
 =?utf-8?B?Q29hdzZOMENjbjR0YitLMHgyT1FmejNGS1Vmakd1cDBPejVpdHFVK0xuM1JG?=
 =?utf-8?B?REN4TlkvMUY2OWFlZlhxci9FS1RhR2laQUNPNkx6aWEwR200cE1HMTZZRzMv?=
 =?utf-8?B?RjZVdW5rSWsxY3NEQ0ErZUx2TW9jK052N3V0emlqekhmaGk1Q1FCUT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: AAEON.COM.TW
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KL1PR02MB7239.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d98751e-af15-4dcc-203c-08defea26315
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2026 10:04:13.3103
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 56a2d4be-9fe3-430e-b539-7e13a4744857
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: rP6xGEMCZ6Ry4NJtEXXQIZ817oAiVB0QRCjgJ8WRRW7NPp8jeDUrEItyO0j8DzCDwiNCGGeR8REDs0g8CDWZWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB7327

PiBPbiBUaHUsIEF1ZyAyMCwgMjAyNiBhdCAwOToyMzo0M0FNICswMzAwLCBBbmR5IFNoZXZjaGVu
a28gd3JvdGU6DQo+ID4gT24gVGh1LCBBdWcgMjAsIDIwMjYgYXQgMDU6MTk6MDZBTSArMDAwMCwg
QmlsbHlDaG91IOWRqOWNmuWAqyB3cm90ZToNCj4gPiA+ID4gT24gTW9uLCBBdWcgMTAsIDIwMjYg
YXQgMDQ6MTc6NDNBTSArMDAwMCwgQmlsbHlDaG91IOWRqOWNmuWAqyB3cm90ZToNCj4gPiA+ID4g
PiBEZWFyIEFuZHksDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBUaGFuayB5b3UgZm9yIHlvdXIgZmVl
ZGJhY2ssIGFuZCB3ZSBzaW5jZXJlbHkgYXBvbG9naXplIGZvciB0aGUgZGVsYXkuDQo+ID4gPiA+
ID4NCj4gPiA+ID4gPiBXZSBhcmUgY3VycmVudGx5IHVwZGF0aW5nIHRoZSBCSU9TIHRvIGNvbmZp
Z3VyZSB0aGUgSEFUDQo+ID4gPiA+ID4gY29ubmVjdG9yIHBpbnMgdG8gR1BJTy9HUE8gbW9kZSwg
d2hpY2ggd2lsbCBlbnN1cmUgaW50ZXJydXB0IHN1cHBvcnQNCj4gb24gdGhlIE9TIHNpZGUuDQo+
ID4gPiA+ID4gV2Ugd2lsbCB1cGRhdGUgdGhlIEJJT1MgYXMgc29vbiBhcyBwb3NzaWJsZSBhbmQg
c2hhcmUgaXQgd2l0aCB5b3UgZm9yDQo+IHRlc3RpbmcuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBU
aGFua3MgYWdhaW4gZm9yIHlvdXIgcGF0aWVuY2UgYW5kIHN1cHBvcnQuDQo+ID4gPiA+DQo+ID4g
PiA+IFRoYW5rcyBmb3IgdGhlIGdvb2QgbmV3cywgSSdtIGxvb2tpbmcgZm9yd2FyZCB0byB0ZXN0
IGl0IQ0KPiA+ID4gPg0KPiA+ID4gVGhlIHVwZGF0ZWQgQklPUyBmb3IgdGhlIFVQTi1BRExOMDEg
cHJvamVjdCB3aXRoIHRoZSBIQVQgY29ubmVjdG9yIHBpbg0KPiBjb25maWd1cmF0aW9ucyBpcyBy
ZWFkeS4gS2luZGx5IGRvd25sb2FkIGl0IGhlcmUgZm9yIHRlc3Rpbmc6DQo+ID4gPiBodHRwczov
L2FhZW9uMzY1LW15LnNoYXJlcG9pbnQuY29tL3BlcnNvbmFsL25hc19hYWVvbl9jb21fdHcvX2xh
eW91dA0KPiA+ID4NCj4gcy8xNS9vbmVkcml2ZS5hc3B4P2lkPSUyZnBlcnNvbmFsJTJmbmFzX2Fh
ZW9uX2NvbV90dyUyZkRvY3VtZW50cyUyZjANCj4gPiA+DQo+IDA3JUU4JUJCJTlGJUU5JUFCJTk0
JUU5JTk2JThCJUU3JTk5JUJDJUU4JTk5JTk1JTJmQklPUyUyZg0KPiBfUmVsZWFzZWRfQg0KPiA+
ID4NCj4gSU9TJTJmVVBOLUFETE4wMSUyZlVOQVNBTTM2LnppcCZwYXJlbnQ9JTJmcGVyc29uYWwl
MmZuYXNfYWFlb25fY28NCj4gbV90DQo+ID4gPg0KPiB3JTJmRG9jdW1lbnRzJTJmMDA3JUU4JUJC
JTlGJUU5JUFCJTk0JUU5JTk2JThCJUU3JTk5JUJDJUU4DQo+ICU5OSU5NSUyZkINCj4gPiA+DQo+
IElPUyUyZl9SZWxlYXNlZF9CSU9TJTJmVVBOLUFETE4wMSZnYT0xJkxPRj0xJnhzZGF0YT1NRFY4
TURKOFENCj4gbWxzYkhsRA0KPiA+ID4NCj4gYUc5MVFHRmhaVzl1TG1OdmJTNTBkM3c1TURVMVpU
aGpObUU1TmpRMFlqQTFaV1F4WWpBNFpHVm1aVGd6DQo+IFlqSmlaSHcxDQo+ID4gPg0KPiBObUV5
WkRSaVpUbG1aVE0wTXpCbFlqVXpPVGRsTVROaE5EYzBORGcxTjN3d2ZEQjhOak01TWpJNE1ETQ0K
PiA0T1RrMk5qazMNCj4gPiA+DQo+IE1qWTVmRlZ1YTI1dmQyNThWRmRHY0dKSFduTmlNMlE0Wlhs
S1JtSllRakJsVlRGb1kwZHJhVTl1VW5sa1YxVnoNCj4gU1d4Wg0KPiA+ID4NCj4gYVU5cFNYZE1h
a0YxVFVSQmQwMURTWE5KYkVGcFQybEtXR0ZYTkhwTmFVbHpTV3RHVDBscWIybFVWMFp3WWsNCj4g
TkpjMGxzDQo+ID4gPg0KPiBaRlZKYW05NVpsRTlQWHd3Zkh4OCZzZGF0YT1VbGRITWxoRk5XeFhN
M2h0YURGQ01HZEtWM3BaVFRaMU16DQo+IFpPTUZCelcNCj4gPiA+IEdkU05tdGhNMlJzTm5GelNU
MCUzZA0KPiA+DQo+ID4gSG1tLi4uIEkgY2FuJ3QgbG9naW4gdGhlcmUgd2l0aCBteSBAaW50ZWwu
Y29tIGFjY291bnQuIEkgc3VwcG9zZSB0aGF0DQo+ID4gc2hhcmUgaXMgb25seSBmb3IgeW91ciBj
b21wYW55LiBNYXliZSBNUyBUZWFtcyB3aWxsIHdvcmsgYmV0dGVyPw0KPiANCj4gT3IganVzdCBz
ZW50IGFuIGFyY2hpdmUgcHJpdmF0ZWx5IHRvIG15IEBpbnRlbC5jb20gYWRkcmVzcz8NCj4gDQpT
b3JyeSBhYm91dCB0aGF0ISBJ4oCZdmUgdXBkYXRlZCB0aGUgZG93bmxvYWQgbGluayBhbmQgZml4
ZWQgdGhlIHBlcm1pc3Npb25zLiBDb3VsZCB5b3UgcGxlYXNlIGdpdmUgaXQgYW5vdGhlciB0cnk/
IFRoYW5rcyENCmh0dHBzOi8vYWFlb24zNjUtbXkuc2hhcmVwb2ludC5jb20vOnU6L2cvcGVyc29u
YWwvYmlsbHljaG91X2FhZW9uX2NvbV90dy9JUUFkc1RkV1VRaHZRcEFvUzhsRUxUZThBWks3ME9S
bDZGQi1OZGNmMGxYVXd1cz9lPVpWME12Uw0KDQo+ID4gPiA+ID4gLS0tLS1PcmlnaW5hbCBNZXNz
YWdlLS0tLS0NCj4gPiA+ID4gPiBGcm9tOiBKdW5ZaW5nTGFpIOiztOS/iuepjiA8SnVuWWluZ0xh
aUBhYWVvbi5jb20udHc+DQo+ID4gPiA+ID4gU2VudDogVGh1cnNkYXksIEp1bHkgMjMsIDIwMjYg
Mjo0OCBQTQ0KPiA+ID4gPiA+IFRvOiBCaWxseUNob3Ug5ZGo5Y2a5YCrIDxCaWxseUNob3VAYWFl
b24uY29tLnR3Pg0KPiA+ID4gPiA+IFN1YmplY3Q6IEZXOiBVcCBTcXVhcmVkIFBybyA3MDAwIChV
UE4tQURMTjAxKSBicm9rZW4gQklPUz8NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IEZZSQ0KPiA+ID4g
PiA+DQo+ID4gPiA+ID4gQmVzdCBSZWdhcmRzLA0KPiA+ID4gPiA+IEp1bllpbmcgTGFpDQo+ID4g
PiA+ID4NCj4gPiA+ID4gPiBKdW5ZaW5nIExhaQ0KPiA+ID4gPiA+IEFBRU9OIFRlY2hub2xvZ3kg
SW5jLg0KPiA+ID4gPiA+IDVGLCBOby4gMTM1LCBMYW5lIDIzNSwgUGFvIENoaWFvIFJkLg0KPiA+
ID4gPiA+IEhzaW4tVGllbiBEaXN0LCBOZXcgVGFpcGVpIENpdHksIDIzMSBUYWl3YW4sIFIuTy5D
Lg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBURUw6ICs4ODYtMi04OTE5LTEyMzQg
RXh0LjE4OTENCj4gPiA+ID4gPg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4NCj4gPiA+ID4gPiAtLS0t
LU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+ID4gPiA+IEZyb206IEFuZHkgU2hldmNoZW5rbyA8
YW5kcml5LnNoZXZjaGVua29AaW50ZWwuY29tPg0KPiA+ID4gPiA+IFNlbnQ6IEZyaWRheSwgSnVs
eSAxMCwgMjAyNiA1OjExIFBNDQo+ID4gPiA+ID4gVG86IEdhcnlXYW5nIDxpczAxMjRAZ21haWwu
Y29tPg0KPiA+ID4gPiA+IENjOiBKdW5ZaW5nTGFpIOiztOS/iuepjiA8SnVuWWluZ0xhaUBhYWVv
bi5jb20udHc+OyBUaG9tYXMgUmljaGFyZA0KPiA+ID4gPiA+IDx0aG9tYXMucmljaGFyZEBib290
bGluLmNvbT47IGxpbnV4LWdwaW9Admdlci5rZXJuZWwub3JnOw0KPiBKYXNvbkh1YW5nDQo+ID4g
PiA+ID4g6buD5LuB5p2wIDxKYXNvbkh1YW5nQGFhZW9uLmNvbS50dz4NCj4gPiA+ID4gPiBTdWJq
ZWN0OiBSZTogVXAgU3F1YXJlZCBQcm8gNzAwMCAoVVBOLUFETE4wMSkgYnJva2VuIEJJT1M/DQo+
ID4gPiA+ID4NCj4gPiA+ID4gPiDpgJnmmK/lpJbpg6jpg7Xku7bvvJrlnKjmiZPplovpgKPntZDl
kozpmYTku7bkuYvliY3vvIzoq4vnorrkv53pm7vlrZDpg7Xku7bmmK/lronlhajnmoTjgIINCj4g
VGhpcw0KPiA+ID4gPiBpcyBhbiBleHRlcm5hbCBlbWFpbDogcGxlYXNlIG1ha2Ugc3VyZSB0aGUg
ZW1haWwgaXMgc2VjdXJlIGJlZm9yZQ0KPiBvcGVuaW5nIGxpbmtzDQo+ID4gPiA+IGFuZCBhdHRh
Y2htZW50cy4NCj4gPiA+ID4gPg0KPiA+ID4gPiA+IE9uIEZyaSwgSnVsIDEwLCAyMDI2IGF0IDA0
OjM3OjU2UE0gKzA4MDAsIEdhcnlXYW5nIHdyb3RlOg0KPiA+ID4gPiA+ID4gQWRkIEFBRU9OIHNv
ZnR3YXJlIEp1bllpbmcuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBUaGFua3MsIHdhaXRpbmcgZm9y
IHRoZSByZXNwb25zZSENCj4gPiA+ID4gPg0KPiA+ID4gPiA+ID4geWVhaCB0aGUgQUNQSSBmbGFn
IHNob3VsZCBub3Qgc2V0IGZvciBIQVQgcGlucywgSnVuWWluIGtub3dzIGl0LA0KPiA+ID4gPiA+
ID4gVGhleSBjbGVhciB0aGUgQUNQSSBmbGFnIGZyb20gdGhlIGRyaXZlciBub3csIHRoZWlyIEJJ
T1MgdXNlcyB0aGUNCj4gPiA+ID4gPiA+IGRlZmF1bHQgZnJvbSBDUkIsIGJ1dCB0aGV5IHNob3Vs
ZCBmaXggaXQgZnJvbSB0aGUgQklPUyB0byBtYXRjaCB0aGUNCj4gcmlnaHQNCj4gPiA+ID4gdXNh
Z2UuDQo+ID4gPiA+ID4NCj4gPiA+ID4gPiBIb3cgZG8gdGhleSBjbGVhbiBpdCBmcm9tIHRoZSBk
cml2ZXI/IElJUkMgdGhlIG93bmVyc2hpcCByZWdpc3RlcnMgYXJlDQo+ID4gPiA+ID4gbG9ja2Vk
IHdoZW4gQklPUyBoYW5kcyBvdmVyIHRvIHRoZSBPUy4gVGVjaG5pY2FsbHkgYW55IHBpbiB0aGF0
DQo+IG1hcmtlZA0KPiA+ID4gPiA+IGFzIEdQSU8gaW5wdXQgbXVzdCBub3QgYmUgb3duZWQgYnkg
QUNQSSB0byBhbGxvdyB1c2VycyB0byBjb25uZWN0DQo+ID4gPiA+ID4gd2hhdGV2ZXIgdGhleSB3
YW50IHRoZXJlIGFuZCBnZXQgYW4gaW50ZXJydXB0cy4gTWFueSBvZiB0aGVtIGFsc28NCj4gaGF2
ZQ0KPiA+ID4gPiA+ICJMb2NrZWQgZnVsbCIgcGVybWlzc2lvbnMsIHRoYXQncyBhbHNvIG1heSBu
b3QgYmUgY29udmVuaWVudC4gQW5vdGhlcg0KPiA+ID4gPiA+IHRoaW5nIGlzIHRoZSBhYnNlbmNl
IG9mIGJpLWRpIEdQSU8gY29uZmlndXJhdGlvbiAob3IgZGlkIEkgbWlzcw0KPiA+ID4gPiA+IHRo
YXQ/KSwgd2hpY2ggcGVvcGxlIG1heSB3YW50IHRvIGhhdmUgKG15IHVzZSBjYXNlLCBmb3IgaW5z
dGFuY2UpLg0KPiA+ID4gPiA+DQo+ID4gPiA+ID4gSW4gYW55IGNhc2UgSSBoYXZlIGxhdGVzdCBh
bmQgZ3JlYXRlc3QgQklPUyB2ZXJzaW9uIChyMy41IG9mIHRoaXMNCj4gPiA+ID4gPiB5ZWFyKSBh
bmQgcHJvYmxlbSBzdGlsbCBwZXJzaXN0cy4gQ2FuIEFBRU9OIHNoYXJlIGEgQklPUyBmb3IgdGVz
dGluZz8NCj4gPiA+ID4gPiAoTm90ZSwgaWYgeW91IHdhbnQsIGl0IGNhbiBiZSBkb25lIHVuZGVy
IG91ciBJbnRlbC1BQUVPTiBleGlzdGluZyBOREEsDQo+ID4gPiA+ID4gSSBiZWxpZXZlLikNCj4g
PiA+ID4gPg0KPiA+ID4gPiA+ID4gT24gRnJpLCBKdWwgMTAsIDIwMjYgYXQgNDo0OOKAr0FNIEFu
ZHkgU2hldmNoZW5rbw0KPiA+ID4gPiA+ID4gPGFuZHJpeS5zaGV2Y2hlbmtvQGludGVsLmNvbT4g
d3JvdGU6DQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+ID4gPiA+IFNpbmNlIEkgaGF2ZSBiZWVuIHBs
YXlpbmcgd2l0aCB0aGUgJFN1YmplY3QgYm9hcmQsIEkgd29uZGVyaW5nIGlmDQo+ID4gPiA+ID4g
PiA+IEkgbWlzcyBzb21ldGhpbmcgb3IgdGhlIEJJT1MgY29uZmlndXJhdGlvbiBpcyB1dHRlcmx5
IGJyb2tlbi4gVGhlDQo+ID4gPiA+ID4gPiA+IHByb2JsZW0gd2hhdCBJIHNlZSBpcyB0aGF0IG1v
c3Qgb2YgdGhlIHBpbnMgb24gdGhlIFNvQyBhcmUgbWFya2VkDQo+ID4gPiA+ID4gPiA+IHdpdGgg
W0FDUEldIGlmIHlvdSBsb29rIGF0IHRoZSBkZWJ1Z2ZzICdwaW5zJyBmaWxlIGZvciBJTlRDMTA1
NzowMA0KPiBkZXZpY2UNCj4gPiA+ID4gaW5zdGFuY2UuDQo+ID4gPiA+ID4gPiA+DQo+ID4gPiA+
ID4gPiA+IFRoaXMgbWVhbnMgKm5vbmUqIG9mIHRoZW0gKHdoaWNoIGFyZSB1c2VyIHZpc2libGUg
dmlhIEhBVA0KPiA+ID4gPiA+ID4gPiBjb25uZWN0b3IpIG1heSBzZXJ2ZSBhcyBhbiBpbnRlcnJ1
cHQgcmVzb3VyY2UgdG8gdGhlIE9TLiBIb3cgdGhlDQo+ID4gPiA+ID4gPiA+IE9TIHNob3VsZCBy
ZXF1ZXN0IGludGVycnVwdHMgb24gdGhvc2UgcGlucz8NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4g
PiA+ID4gQXMgZmFyIGFzIEkgdW5kZXJzdGFuZCB0aGF0IHRoZSBCSU9TIGRvZXMgaW5pdGlhbCBz
ZXR0aW5ncyBvZiBDUExEDQo+ID4gPiA+ID4gPiA+IGFuZCBiYXNpY2FsbHkgSSBjYW4gdXNlIHRy
YW5zcGFyZW50bHkgdGhlIHBpbnMgYXMgcGVyIHRoZWlyDQo+ID4gPiA+ID4gPiA+IGNvbmZpZ3Vy
YXRpb24gZG9uZSBpbiBCSU9TLiBSaWdodD8NCj4gPiA+ID4gPiA+ID4NCj4gPiA+ID4gPiA+ID4g
QnR3LCBkbyB3ZSBoYXZlIGFueSBjb250YWN0cyB0byBlbmdpbmVlcnMgaW4gQUFFT04gb3Igd2hv
ZXZlcg0KPiB3aG8NCj4gPiA+ID4gPiA+ID4gZG9lcyB0aGVzZSBVUCBib2FyZHMgbm93YWRheXM/
DQo+ID4NCj4gPiAtLQ0KPiA+IFdpdGggQmVzdCBSZWdhcmRzLA0KPiA+IEFuZHkgU2hldmNoZW5r
bw0KPiA+DQo+ID4NCj4gDQo+IC0tDQo+IFdpdGggQmVzdCBSZWdhcmRzLA0KPiBBbmR5IFNoZXZj
aGVua28NCj4gDQoNCg==
