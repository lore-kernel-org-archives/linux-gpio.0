Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11012060.outbound.protection.outlook.com [40.107.75.60])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D82481B1
	for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2026 05:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.60
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787203154; cv=fail; b=t05I9Mh0af7vJZQV6yIj/CIaD5zxfnkzyuVmjYPEuEnHUAWX+fDjzyEMy1dLjXDXNs85FBUNpvJ6ciWeT/nb6rpsi+kLrPeYS2OLHUrUAQRKlj04+mjZLMz2UWuiimV5L0+12NB325xBsXC9KyXNMzWaxP7xfvGklejZI4MqTsg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787203154; c=relaxed/simple;
	bh=TUzizhr39NA/jNyPVqSr13ggG16o6aUN7F0AvoA+zkQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=a9hhhgTjYDW7dulhB0ca58ILrp9eFSoIU0E1FD1BWx8PpWpfo1TACiUIqW3dXUkWbiqz8/vYZmDGEUEB68uVwpAVtAeNAAt42ddnGjSMGkTsUo9qD5C3FRiXMx2vb1kO96mINYdvY4RC0u0rwxVnycXBYiBvGiRHCff4fDku2fY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aaeon.com.tw; spf=pass smtp.mailfrom=aaeon.com.tw; dkim=pass (1024-bit key) header.d=AAEON.COM.TW header.i=@AAEON.COM.TW header.b=KrSoDJJp; arc=fail smtp.client-ip=40.107.75.60
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aaeon.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aaeon.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=AAEON.COM.TW header.i=@AAEON.COM.TW header.b="KrSoDJJp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e1InEGjWig/2ikPvT7/cfxn7aO2bSMPq7qYMItV5hJ8UflTaQYsDZQBNTHZ1059i35BdR9GBjrOvfVYxayEXMnzNeHkosW+Toq4QvJx10+T2UPl77lQ8vUynm/uvwdH8JshoOzSU4Gv+H9dIvLqoJztCp24e5shjjypXhGBkJU179ycDjXm4Gq+haQezilgc6u7+tkAsBOJmTWNMdCH4IXNnVY8g+YslQsyh5MUQyvEKOYEe/keVhjDlIGA/HfOah3ki5NOzlKmAbGeIOANW4i6E3L4L8rLHfTdswjV5C8VhzoVIZIonmNOKUNT41Kb9ClHbQORg37wTl/k9sECl/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TUzizhr39NA/jNyPVqSr13ggG16o6aUN7F0AvoA+zkQ=;
 b=hrBkSHuCk6PNoqqPDhveI4CHjHhIK7qDaRNd+uTqdsxQMRr4EVqeu1oFd0gcEBE/6E/OfgqmyOBgExH+XdRsJopxFrlA5qbuKP9vsY8yccoNk6x2mjAz+vFETfNgkkM3Wr4tetWrXwbjglQWlBeMNRX4XoOjpOF1imNI/HKTzPnHmCeMA8u5+qvCTujqJ+xjbE07pNihxPVMJlvscZ2PU/p1l4WEeJ/r/4eNAobJW6gZtGZJxZz2GWyMySyi8gaaS3nmBVNnvpUzukWhYNThCeaWkp6nOhRB24LUGMEcYgn6UryHVtyDVOHxiWPgDdakh06CwtCE1z6aOPbeziPjiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aaeon.com.tw; dmarc=pass action=none header.from=aaeon.com.tw;
 dkim=pass header.d=aaeon.com.tw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=AAEON.COM.TW;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TUzizhr39NA/jNyPVqSr13ggG16o6aUN7F0AvoA+zkQ=;
 b=KrSoDJJp9vRqYKo/ra6H9+9e2OcdPVzlIIiQvxTRwaVLcAWn/b165v9+iP/ZiRHis4IwZEms8FAv8DZjKXl7Tu1mKKhg4dPcXhMFlRf4tF8axH1A9WtsqE6EksMDEt4bodIn/UAkPmXhgU9+1Ezh0lrDtKCQiF73e5kJCbD9TKs=
Received: from KL1PR02MB7239.apcprd02.prod.outlook.com (2603:1096:820:127::10)
 by SEYPR02MB7735.apcprd02.prod.outlook.com (2603:1096:101:200::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 05:19:07 +0000
Received: from KL1PR02MB7239.apcprd02.prod.outlook.com
 ([fe80::2d6:2245:ecbc:ca26]) by KL1PR02MB7239.apcprd02.prod.outlook.com
 ([fe80::2d6:2245:ecbc:ca26%4]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 05:19:07 +0000
From: =?utf-8?B?QmlsbHlDaG91IOWRqOWNmuWAqw==?= <BillyChou@aaeon.com.tw>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
CC: GaryWang <is0124@gmail.com>, =?utf-8?B?SnVuWWluZ0xhaSDos7Tkv4rnqY4=?=
	<JunYingLai@aaeon.com.tw>, Thomas Richard <thomas.richard@bootlin.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	=?utf-8?B?SmFzb25IdWFuZyDpu4Pku4HmnbA=?= <JasonHuang@aaeon.com.tw>
Subject: RE: Up Squared Pro 7000 (UPN-ADLN01) broken BIOS?
Thread-Topic: Up Squared Pro 7000 (UPN-ADLN01) broken BIOS?
Thread-Index: AQHdEEdyeHj2H5neCk2cagLOPz7GorZmd4OAgBRGIkCAHBwdcIAAN80AgA+PiZA=
Date: Thu, 20 Aug 2026 05:19:06 +0000
Message-ID:
 <KL1PR02MB7239DF2E12270CC4B58F55429FA42@KL1PR02MB7239.apcprd02.prod.outlook.com>
References: <alAJJr5ATEZdHBBA@ashevche-desk.local>
 <CANYHO6rgn19uxjmc+1xv-pmadZQ1EaePmwvC3Kfy-E6ckwcYqA@mail.gmail.com>
 <alC3Kc2BcjkmUVwV@ashevche-desk.local>
 <TY1PPFA4928F5D95D0BFF5F087E44F8B166F0C02@TY1PPFA4928F5D9.apcprd02.prod.outlook.com>
 <KL1PR02MB723976B817F54AEB9785B51D9FDE2@KL1PR02MB7239.apcprd02.prod.outlook.com>
 <anl8TtJweGgob1kp@ashevche-desk.local>
In-Reply-To: <anl8TtJweGgob1kp@ashevche-desk.local>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aaeon.com.tw;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR02MB7239:EE_|SEYPR02MB7735:EE_
x-ms-office365-filtering-correlation-id: 90c6ba17-83eb-42ef-af6c-08defe7a8ed8
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|376014|366016|1800799024|6133799003|10067099003|56012099006|11063799006|4143699003|55112099003|18002099003|22082099003|38070700021;
x-microsoft-antispam-message-info:
 A9E1U8YGNXkHW7W9u7jxdo5SAyf9r/ucEbAEaXNb7tgI7UjB+wWrKCC9eIJ4Wxyxeu9VMZD/+Z1Gfb3DJH+U/82yHNp7VbCpBn+BT05h/g+v7Mptu9ZEM5kP6mNKgjyRLfywlx9NZlAv9n/zHjv1+GIV61x2ZOUEBb+0YnPj9A8JnGuc3yz7fNSoQ8TKryBwvVPiqluaGNHjDQmmQn0ei8Vr143/RuhyOwrpnWGH8OtveY0PE0iNVV04cltmnlV4ErvIv0asuWKBumCQgYtKDJW8TFxlUVB0yPrind88LhUctavoyNjdk+qRXIHQEerWIhVSNxig3BfTUqfPy8pAuTrCfdJ+2dGMJP8hc6raPGN0RUI0F0JSpPeuz5kSRtgNfc7XbQjRrV+Tth7hT8DaLnJROHEY84R6LuWaXk0xu4DHd5JlsXNks9uM9rCH1F9FsJy623d4BnWd3/4YWSGXaZQr9NGYlegebph9iMq14hi/kOqZfiXA2v1BleOomcXCEOoXi+KVS6qHjjTTJ+DwNOY2Ua6SoAA3W0+WfoL6J7NfFdGTlFCdaPdV3LD7MeXPsVST5eHVQ8MEFQnV8HD56GHs53noxn/Tmzrk4h0+OwnreKXjVEUf5oBceCqa9WuN8s/hgzuFdubopKiLODCMNM8jGqFPUrG1UaToA4OuCIQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR02MB7239.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(366016)(1800799024)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(55112099003)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?MlVMeVhXUWpubjFzTW1IakZNd1g1NmxDK3lScWtpSlk0TngxL0Q2SzFjY0JU?=
 =?utf-8?B?TVNUMFp4TEFvMVRTVWZzdTVHMk1zejdHSFRLaTNUZmprd3NBNFp5NkcwUUR4?=
 =?utf-8?B?MHNyODIzdDJvRXF5R2o2eE95MjhyVUtsVjZDZks5ek40MjFkamFxWEtaVWlW?=
 =?utf-8?B?TXg0RExuQndDQ0tremVPSGtsQzl1cVlJV1o3WDdxWWRzNHpGZDNWZUVVb0ph?=
 =?utf-8?B?TzZIeTZ6U3lnR3cvSDduMXllZ2pwa0hkeVBpbGc1eThhUnRocXVkN285WmZu?=
 =?utf-8?B?aWtvVkl1YWhTTGNOMnI5QWEzTHVuZUc0SnVndTNsdWo0MG1RQ1hZQ1BkRmg2?=
 =?utf-8?B?R1kzYk5XVlJxRkdNOUJEbHpqRkpkaVlvQzBxNHNqczEvVWJVV1BhdUFCNWR5?=
 =?utf-8?B?TXJ6K0c5QmdFaWJINHJEdUJsMkhNcUtWNjRwNUUrYWo3bVVpU0VJN3R1Umsy?=
 =?utf-8?B?VFFwU0xBS0grbU5LM1NGMVdGeDNZczVrdU43MmtESlNTdlc1SjNlK2pidFJI?=
 =?utf-8?B?UE9MVFdkRE11eFFyL05scXZkT09YcVc3UEJLOW1WNzE2UW84bmJZNy91Qjhi?=
 =?utf-8?B?eGF2b3U5c295bS96bDk1MEhkZXV4eFdaSVdKQ0luMWdUN0hVQ2VqWm80ZHov?=
 =?utf-8?B?N1UyVXJYVVpNakE2dXd6OW1RTHdoOFZCZHBha1NRSlNZVS9Kb3UvUEJ3ckRG?=
 =?utf-8?B?OE0rQnYxaTdNNkc2c3NsMU1jcGZnNVl6U1NVRjBmVXQvUFJlUVBYUnZLZWhS?=
 =?utf-8?B?K1p5TXFZdlZYdVB5VlF5NDlubHpkZloxdGdDdVQwT3FBN1I2OWIzSGx0eWdS?=
 =?utf-8?B?RCszOVBkeUduTWsrUzhBYllXa050TUlGVy91Z1IvQUJZdlBvOWo2T25jUm5y?=
 =?utf-8?B?Zmd3Rk9XMEhUM1oxOVpRUzR4akU5RXYxZFlDY0QwWHZuTWh1SzV6ZkZiVFE2?=
 =?utf-8?B?d3hDTzZNeWF3UXp2NUdObzFuZEdyL1daU3JwNUZQeW1iQmE0NDgwb0tWRzJ0?=
 =?utf-8?B?d1dMQ2JaVHR1dWRsOTUyaCtRbGRtVzRGL3FyV1RtcmZXWmhwa2EzZkZOWW1n?=
 =?utf-8?B?ZlNSZTJiM3ZTeDRmdXhTS1oxTFRkanduT1Z1VXpSR3pZdEo0cUdFaFhIOXgz?=
 =?utf-8?B?WjBYWDMzMTVXem5nZ0FRaGNFNG1lMWRLQWxsbkNJSjIrSjF5OVJVZndhNzBj?=
 =?utf-8?B?US9wUm9pR2h1WjFJNkRlOUlTNjQwYUxuYUhxdWJJTmNFU2hPbGVVc2JlWkFC?=
 =?utf-8?B?QnZuMGlDeXpaUHgzUVFpS3VqR2tpOXRZcG5FMHhkOEVlL205ajg0aXpEamhY?=
 =?utf-8?B?dnZwMGorUFpmMXc2c0szMkhnVzl3OVphallOVHNCckppV0NhaUF5M1BhOHNv?=
 =?utf-8?B?ZStxeTJTQVQrbm5MUVJ1ZVNzeVpJY2JOSldTd01aWTdBM1llTSszK0Vqdmk4?=
 =?utf-8?B?QTd5ZkxTRUI0VEFlU2VNQjF1M3hHSmVsRjhLNGZscGIvcmE1RWx5dGFxZVky?=
 =?utf-8?B?TXhNd2VROE5QK3JzMVRlSWY1ZE1YT3p5RHhyb21LQ1U1UHRJN2JEcGxGemVq?=
 =?utf-8?B?WkhpK2hwZTJOMk9MV3BMWDhhWlRwUG9UYTFmaS9wV25IZVNjTTVIN0pxaWly?=
 =?utf-8?B?T2Rncm1Sb05YODYzdFdaRE11NDU1L1B2ZUlnYWs1K0FsaW1nZUM3SFhJNUZt?=
 =?utf-8?B?UlN3eHVlclowaFpWSUlObnNuYU01T0NtZmNPS2xlTmhJVm15c0RIVkY2b2Zx?=
 =?utf-8?B?amJqZ2hXdFJwOFM3MXZBZlJyVUN1cFVqUkpwQlhIVTFSdndnOHNYblhRbkRE?=
 =?utf-8?B?blNoVmlzbmZwUjk1U293SXlLN1VHbVptVTlwaDBUbTI4eGNLUDdsY0hlbE1Q?=
 =?utf-8?B?ZC9oRmxMcUh4ZDFjdVc0eUl4MGhmUVdsYVNVMmlKQVFhMkJKeXBtd2xWVjlj?=
 =?utf-8?B?VVVYODcwb1Fld0NVQmZrWU52MEFVYnMxYWtZT3JNdForYWxmV2UrNkgxaDZI?=
 =?utf-8?B?MHlYblpvZGZMSWcrT3JpcHRRM3JzR1I2dEFQdytvdUtSK2tlQ293OUpKMlFn?=
 =?utf-8?B?b0VvR1UyR0ZoZE1FVFE3STlqM2ZoN1o4emhzcVY4WGlBaFhLa0s4Smd4c1Ns?=
 =?utf-8?B?YVBmRDh0QjRyd25zVnQrd1Bzd2dib24ySVJ2QUtoNUJlM1pkOFVuYTE3by9k?=
 =?utf-8?B?czNVYzZ2WEl1L3o5QjMzb2Q0VlNqUW8rMHEzN0tweUVLZmUvakhwYzJjZURD?=
 =?utf-8?B?ci9sQWtxbEJxMG95bGJzd3ZQaXRPUDlsRTM1Nkl3d0pxd3hJdldBOVpNelRq?=
 =?utf-8?B?d2E4MGIrUjZGYk5HcXo4UU10RXZCY3NyS1l4QXljd2tZRFlvTzV2dz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 90c6ba17-83eb-42ef-af6c-08defe7a8ed8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Aug 2026 05:19:06.8990
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 56a2d4be-9fe3-430e-b539-7e13a4744857
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DEVNZQ/ZiVUWD5urMdJlfNFe4Gsp/61qwbKZjO0jDIr1vZcSTZEyF+ibLfnzmw0ZO3DWKXAxO+FIz1Kf5pU1iQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR02MB7735

PiBPbiBNb24sIEF1ZyAxMCwgMjAyNiBhdCAwNDoxNzo0M0FNICswMDAwLCBCaWxseUNob3Ug5ZGo
5Y2a5YCrIHdyb3RlOg0KPiA+IERlYXIgQW5keSwNCj4gPg0KPiA+IFRoYW5rIHlvdSBmb3IgeW91
ciBmZWVkYmFjaywgYW5kIHdlIHNpbmNlcmVseSBhcG9sb2dpemUgZm9yIHRoZSBkZWxheS4NCj4g
Pg0KPiA+IFdlIGFyZSBjdXJyZW50bHkgdXBkYXRpbmcgdGhlIEJJT1MgdG8gY29uZmlndXJlIHRo
ZSBIQVQgY29ubmVjdG9yIHBpbnMNCj4gPiB0byBHUElPL0dQTyBtb2RlLCB3aGljaCB3aWxsIGVu
c3VyZSBpbnRlcnJ1cHQgc3VwcG9ydCBvbiB0aGUgT1Mgc2lkZS4NCj4gPiBXZSB3aWxsIHVwZGF0
ZSB0aGUgQklPUyBhcyBzb29uIGFzIHBvc3NpYmxlIGFuZCBzaGFyZSBpdCB3aXRoIHlvdSBmb3Ig
dGVzdGluZy4NCj4gPg0KPiA+IFRoYW5rcyBhZ2FpbiBmb3IgeW91ciBwYXRpZW5jZSBhbmQgc3Vw
cG9ydC4NCj4gDQo+IFRoYW5rcyBmb3IgdGhlIGdvb2QgbmV3cywgSSdtIGxvb2tpbmcgZm9yd2Fy
ZCB0byB0ZXN0IGl0IQ0KPiANClRoZSB1cGRhdGVkIEJJT1MgZm9yIHRoZSBVUE4tQURMTjAxIHBy
b2plY3Qgd2l0aCB0aGUgSEFUIGNvbm5lY3RvciBwaW4gY29uZmlndXJhdGlvbnMgaXMgcmVhZHku
IEtpbmRseSBkb3dubG9hZCBpdCBoZXJlIGZvciB0ZXN0aW5nOg0KaHR0cHM6Ly9hYWVvbjM2NS1t
eS5zaGFyZXBvaW50LmNvbS9wZXJzb25hbC9uYXNfYWFlb25fY29tX3R3L19sYXlvdXRzLzE1L29u
ZWRyaXZlLmFzcHg/aWQ9JTJGcGVyc29uYWwlMkZuYXMlNUZhYWVvbiU1RmNvbSU1RnR3JTJGRG9j
dW1lbnRzJTJGMDA3JUU4JUJCJTlGJUU5JUFCJTk0JUU5JTk2JThCJUU3JTk5JUJDJUU4JTk5JTk1
JTJGQklPUyUyRiU1RlJlbGVhc2VkJTVGQklPUyUyRlVQTiUyREFETE4wMSUyRlVOQVNBTTM2JTJF
emlwJnBhcmVudD0lMkZwZXJzb25hbCUyRm5hcyU1RmFhZW9uJTVGY29tJTVGdHclMkZEb2N1bWVu
dHMlMkYwMDclRTglQkIlOUYlRTklQUIlOTQlRTklOTYlOEIlRTclOTklQkMlRTglOTklOTUlMkZC
SU9TJTJGJTVGUmVsZWFzZWQlNUZCSU9TJTJGVVBOJTJEQURMTjAxJmdhPTEmTE9GPTENCg0KPiA+
IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+ID4gRnJvbTogSnVuWWluZ0xhaSDos7Tkv4rn
qY4gPEp1bllpbmdMYWlAYWFlb24uY29tLnR3Pg0KPiA+IFNlbnQ6IFRodXJzZGF5LCBKdWx5IDIz
LCAyMDI2IDI6NDggUE0NCj4gPiBUbzogQmlsbHlDaG91IOWRqOWNmuWAqyA8QmlsbHlDaG91QGFh
ZW9uLmNvbS50dz4NCj4gPiBTdWJqZWN0OiBGVzogVXAgU3F1YXJlZCBQcm8gNzAwMCAoVVBOLUFE
TE4wMSkgYnJva2VuIEJJT1M/DQo+ID4NCj4gPiBGWUkNCj4gPg0KPiA+IEJlc3QgUmVnYXJkcywN
Cj4gPiBKdW5ZaW5nIExhaQ0KPiA+DQo+ID4gSnVuWWluZyBMYWkNCj4gPiBBQUVPTiBUZWNobm9s
b2d5IEluYy4NCj4gPiA1RiwgTm8uIDEzNSwgTGFuZSAyMzUsIFBhbyBDaGlhbyBSZC4NCj4gPiBI
c2luLVRpZW4gRGlzdCwgTmV3IFRhaXBlaSBDaXR5LCAyMzENCj4gPiBUYWl3YW4sIFIuTy5DLg0K
PiA+DQo+ID4NCj4gPiBURUw6ICs4ODYtMi04OTE5LTEyMzQgRXh0LjE4OTENCj4gPg0KPiA+DQo+
ID4NCj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IEFuZHkgU2hldmNo
ZW5rbyA8YW5kcml5LnNoZXZjaGVua29AaW50ZWwuY29tPg0KPiA+IFNlbnQ6IEZyaWRheSwgSnVs
eSAxMCwgMjAyNiA1OjExIFBNDQo+ID4gVG86IEdhcnlXYW5nIDxpczAxMjRAZ21haWwuY29tPg0K
PiA+IENjOiBKdW5ZaW5nTGFpIOiztOS/iuepjiA8SnVuWWluZ0xhaUBhYWVvbi5jb20udHc+OyBU
aG9tYXMgUmljaGFyZA0KPiA+IDx0aG9tYXMucmljaGFyZEBib290bGluLmNvbT47IGxpbnV4LWdw
aW9Admdlci5rZXJuZWwub3JnOyBKYXNvbkh1YW5nDQo+ID4g6buD5LuB5p2wIDxKYXNvbkh1YW5n
QGFhZW9uLmNvbS50dz4NCj4gPiBTdWJqZWN0OiBSZTogVXAgU3F1YXJlZCBQcm8gNzAwMCAoVVBO
LUFETE4wMSkgYnJva2VuIEJJT1M/DQo+ID4NCj4gPiDpgJnmmK/lpJbpg6jpg7Xku7bvvJrlnKjm
iZPplovpgKPntZDlkozpmYTku7bkuYvliY3vvIzoq4vnorrkv53pm7vlrZDpg7Xku7bmmK/lronl
hajnmoTjgIIgVGhpcw0KPiBpcyBhbiBleHRlcm5hbCBlbWFpbDogcGxlYXNlIG1ha2Ugc3VyZSB0
aGUgZW1haWwgaXMgc2VjdXJlIGJlZm9yZSBvcGVuaW5nIGxpbmtzDQo+IGFuZCBhdHRhY2htZW50
cy4NCj4gPg0KPiA+IE9uIEZyaSwgSnVsIDEwLCAyMDI2IGF0IDA0OjM3OjU2UE0gKzA4MDAsIEdh
cnlXYW5nIHdyb3RlOg0KPiA+ID4gQWRkIEFBRU9OIHNvZnR3YXJlIEp1bllpbmcuDQo+ID4NCj4g
PiBUaGFua3MsIHdhaXRpbmcgZm9yIHRoZSByZXNwb25zZSENCj4gPg0KPiA+ID4geWVhaCB0aGUg
QUNQSSBmbGFnIHNob3VsZCBub3Qgc2V0IGZvciBIQVQgcGlucywgSnVuWWluIGtub3dzIGl0LA0K
PiA+ID4gVGhleSBjbGVhciB0aGUgQUNQSSBmbGFnIGZyb20gdGhlIGRyaXZlciBub3csIHRoZWly
IEJJT1MgdXNlcyB0aGUNCj4gPiA+IGRlZmF1bHQgZnJvbSBDUkIsIGJ1dCB0aGV5IHNob3VsZCBm
aXggaXQgZnJvbSB0aGUgQklPUyB0byBtYXRjaCB0aGUgcmlnaHQNCj4gdXNhZ2UuDQo+ID4NCj4g
PiBIb3cgZG8gdGhleSBjbGVhbiBpdCBmcm9tIHRoZSBkcml2ZXI/IElJUkMgdGhlIG93bmVyc2hp
cCByZWdpc3RlcnMgYXJlDQo+ID4gbG9ja2VkIHdoZW4gQklPUyBoYW5kcyBvdmVyIHRvIHRoZSBP
Uy4gVGVjaG5pY2FsbHkgYW55IHBpbiB0aGF0IG1hcmtlZA0KPiA+IGFzIEdQSU8gaW5wdXQgbXVz
dCBub3QgYmUgb3duZWQgYnkgQUNQSSB0byBhbGxvdyB1c2VycyB0byBjb25uZWN0DQo+ID4gd2hh
dGV2ZXIgdGhleSB3YW50IHRoZXJlIGFuZCBnZXQgYW4gaW50ZXJydXB0cy4gTWFueSBvZiB0aGVt
IGFsc28gaGF2ZQ0KPiA+ICJMb2NrZWQgZnVsbCIgcGVybWlzc2lvbnMsIHRoYXQncyBhbHNvIG1h
eSBub3QgYmUgY29udmVuaWVudC4gQW5vdGhlcg0KPiA+IHRoaW5nIGlzIHRoZSBhYnNlbmNlIG9m
IGJpLWRpIEdQSU8gY29uZmlndXJhdGlvbiAob3IgZGlkIEkgbWlzcw0KPiA+IHRoYXQ/KSwgd2hp
Y2ggcGVvcGxlIG1heSB3YW50IHRvIGhhdmUgKG15IHVzZSBjYXNlLCBmb3IgaW5zdGFuY2UpLg0K
PiA+DQo+ID4gSW4gYW55IGNhc2UgSSBoYXZlIGxhdGVzdCBhbmQgZ3JlYXRlc3QgQklPUyB2ZXJz
aW9uIChyMy41IG9mIHRoaXMNCj4gPiB5ZWFyKSBhbmQgcHJvYmxlbSBzdGlsbCBwZXJzaXN0cy4g
Q2FuIEFBRU9OIHNoYXJlIGEgQklPUyBmb3IgdGVzdGluZz8NCj4gPiAoTm90ZSwgaWYgeW91IHdh
bnQsIGl0IGNhbiBiZSBkb25lIHVuZGVyIG91ciBJbnRlbC1BQUVPTiBleGlzdGluZyBOREEsDQo+
ID4gSSBiZWxpZXZlLikNCj4gPg0KPiA+ID4gT24gRnJpLCBKdWwgMTAsIDIwMjYgYXQgNDo0OOKA
r0FNIEFuZHkgU2hldmNoZW5rbw0KPiA+ID4gPGFuZHJpeS5zaGV2Y2hlbmtvQGludGVsLmNvbT4g
d3JvdGU6DQo+ID4gPiA+DQo+ID4gPiA+IFNpbmNlIEkgaGF2ZSBiZWVuIHBsYXlpbmcgd2l0aCB0
aGUgJFN1YmplY3QgYm9hcmQsIEkgd29uZGVyaW5nIGlmDQo+ID4gPiA+IEkgbWlzcyBzb21ldGhp
bmcgb3IgdGhlIEJJT1MgY29uZmlndXJhdGlvbiBpcyB1dHRlcmx5IGJyb2tlbi4gVGhlDQo+ID4g
PiA+IHByb2JsZW0gd2hhdCBJIHNlZSBpcyB0aGF0IG1vc3Qgb2YgdGhlIHBpbnMgb24gdGhlIFNv
QyBhcmUgbWFya2VkDQo+ID4gPiA+IHdpdGggW0FDUEldIGlmIHlvdSBsb29rIGF0IHRoZSBkZWJ1
Z2ZzICdwaW5zJyBmaWxlIGZvciBJTlRDMTA1NzowMCBkZXZpY2UNCj4gaW5zdGFuY2UuDQo+ID4g
PiA+DQo+ID4gPiA+IFRoaXMgbWVhbnMgKm5vbmUqIG9mIHRoZW0gKHdoaWNoIGFyZSB1c2VyIHZp
c2libGUgdmlhIEhBVA0KPiA+ID4gPiBjb25uZWN0b3IpIG1heSBzZXJ2ZSBhcyBhbiBpbnRlcnJ1
cHQgcmVzb3VyY2UgdG8gdGhlIE9TLiBIb3cgdGhlDQo+ID4gPiA+IE9TIHNob3VsZCByZXF1ZXN0
IGludGVycnVwdHMgb24gdGhvc2UgcGlucz8NCj4gPiA+ID4NCj4gPiA+ID4gQXMgZmFyIGFzIEkg
dW5kZXJzdGFuZCB0aGF0IHRoZSBCSU9TIGRvZXMgaW5pdGlhbCBzZXR0aW5ncyBvZiBDUExEDQo+
ID4gPiA+IGFuZCBiYXNpY2FsbHkgSSBjYW4gdXNlIHRyYW5zcGFyZW50bHkgdGhlIHBpbnMgYXMg
cGVyIHRoZWlyDQo+ID4gPiA+IGNvbmZpZ3VyYXRpb24gZG9uZSBpbiBCSU9TLiBSaWdodD8NCj4g
PiA+ID4NCj4gPiA+ID4gQnR3LCBkbyB3ZSBoYXZlIGFueSBjb250YWN0cyB0byBlbmdpbmVlcnMg
aW4gQUFFT04gb3Igd2hvZXZlciB3aG8NCj4gPiA+ID4gZG9lcyB0aGVzZSBVUCBib2FyZHMgbm93
YWRheXM/DQo+IA0KPiAtLQ0KPiBXaXRoIEJlc3QgUmVnYXJkcywNCj4gQW5keSBTaGV2Y2hlbmtv
DQo+IA0KDQo=
