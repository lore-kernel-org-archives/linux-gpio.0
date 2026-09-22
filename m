Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012014.outbound.protection.outlook.com [52.101.126.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB7F38735D
	for <linux-gpio@vger.kernel.org>; Tue, 22 Sep 2026 15:30:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790091038; cv=fail; b=f+X64yWzf10+jBSB+nlHd7J3rJx0swSRw4oNdt7iVCpPpKqm+AQ/v047nxoa10DIlhhP7IZMJF8oTky5hlmMFx4uDZ3ovYTzrNkj2Xv4EDeD1DjL5XsyMsvMuEHGCh9R6Yzkd6g6Hja/iOUqpH3Tj4mB9/ahu2rVoMZPDFlC3Kw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790091038; c=relaxed/simple;
	bh=7qXYJ9BJwT3k05PxFTCN9PH4uJ89DI0DzGDzOL6FUFw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UEz82R/qGLPcC8CWS9U97C9HRzvagDoPlv8DiPv4t+kap4Wq7rutVMzp7Qg6jghssvIwWZqI66dqRTAM4AdfmUJ4nvbHO2+YPft4bqavwhJWD+mmxH3fhvdSxZ93qEwxcXtIeLjDpY3nnVmoICRY3WdZ2QuWh7FucG2iewDbyGI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aaeon.com.tw; spf=pass smtp.mailfrom=aaeon.com.tw; dkim=pass (1024-bit key) header.d=AAEON.COM.TW header.i=@AAEON.COM.TW header.b=XngOpORF; arc=fail smtp.client-ip=52.101.126.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aaeon.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aaeon.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=AAEON.COM.TW header.i=@AAEON.COM.TW header.b="XngOpORF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xcDpbSVkyVqjzkhCNVAzpzhNkHRQj2q0kT584eoWMMzOCSE8AeqUB44T8TgLP1jVVIXZDNdV/yh/HhWNTLFjeqpnFZRcbBljRSFeMlEtomgec6Z5hIOa4TG+cGi1qahtZKFK6vZiThoOL8f9CwbNTIEPprVs67Zw9fENBsXj8LYhTsRYO+swbyERZ4ysqJtpJrU4BBYydKbwBWM40ZhQ37oK7sJnfFWOk3JkLTrIjDDhqfIJzJ7ufOBxK4RzEazsbS6gVyOntpGbRFqOsp5gjvc9qUstN91JdgwJnYAUrifyckgwGA5LwjOw1G4qup1yLpxAnolCDnfL6CLXZYVbTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7qXYJ9BJwT3k05PxFTCN9PH4uJ89DI0DzGDzOL6FUFw=;
 b=cwVNtLq2ouZGWcmrT6TKZj29l1ReiQ77JL1PPZXSBZBePAI+4j5RURxLvf6lKR3veLW9dxQjfZl5u0MzDqeTWGm4q/DRrLmrygPeSa0tFcRgCydtZkXUCwqFzSiZ537RN3QNZcbrLY9z8ISQbmwJalFDHkV/3vXucqBCqFvKkz86/EcsDU4GpRIwPdvwMiUivE9mUMnESrwewLk5kXIdZf29EVg68aZ7l59TIb0ophc9U65USr5z9Q2KalxApCFooS6DqGJKPUpFbUI5djfGgiHX0XRz+qven2tzxK+k+dD0moeKbOzTXrgnDxDUq6PWl3S5Vq6i8Cr2u7fBIl8WeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aaeon.com.tw; dmarc=pass action=none header.from=aaeon.com.tw;
 dkim=pass header.d=aaeon.com.tw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=AAEON.COM.TW;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7qXYJ9BJwT3k05PxFTCN9PH4uJ89DI0DzGDzOL6FUFw=;
 b=XngOpORFUp1QrvBBCBJURIv4NfoOaflrtgU19A8JNMCIoCRDkBR3AD7o0DFrl5XgdyeZboGwf98rvDgPHP+7NGM0xjCozxSDR0MYo15KgkPfsTmZNTZzZO0KBrFl/wjUZ3wjIitXu3A4VAwC/SgxtG5EGmQYMeCeeEMJtd5XOCM=
Received: from KL1PR02MB7239.apcprd02.prod.outlook.com (2603:1096:820:127::10)
 by PUZPR02MB6065.apcprd02.prod.outlook.com (2603:1096:301:e7::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Tue, 22 Sep
 2026 15:30:29 +0000
Received: from KL1PR02MB7239.apcprd02.prod.outlook.com
 ([fe80::2d6:2245:ecbc:ca26]) by KL1PR02MB7239.apcprd02.prod.outlook.com
 ([fe80::2d6:2245:ecbc:ca26%3]) with mapi id 15.21.0451.014; Tue, 22 Sep 2026
 15:30:29 +0000
From: =?big5?B?QmlsbHlDaG91IKlQs9Wt2w==?= <BillyChou@aaeon.com.tw>
To: Thomas Richard <thomas.richard@bootlin.com>, Andy Shevchenko
	<andriy.shevchenko@intel.com>
CC: GaryWang <is0124@gmail.com>, =?big5?B?SnVuWWluZ0xhaSC/4KtUv28=?=
	<JunYingLai@aaeon.com.tw>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, =?big5?B?SmFzb25IdWFuZyC2wKSvqk4=?=
	<JasonHuang@aaeon.com.tw>
Subject: RE: Up Squared Pro 7000 (UPN-ADLN01) broken BIOS?
Thread-Topic: Up Squared Pro 7000 (UPN-ADLN01) broken BIOS?
Thread-Index:
 AQHdEEdyeHj2H5neCk2cagLOPz7GorZmd4OAgBRGIkCAHBwdcIAAN80AgA+PiZCAABc5gIAAADeAgAA8XZCAIx5uAIAECpOAgA0NXqA=
Date: Tue, 22 Sep 2026 15:30:29 +0000
Message-ID:
 <KL1PR02MB72391D5102537DE71532B1A79F832@KL1PR02MB7239.apcprd02.prod.outlook.com>
References: <alAJJr5ATEZdHBBA@ashevche-desk.local>
 <CANYHO6rgn19uxjmc+1xv-pmadZQ1EaePmwvC3Kfy-E6ckwcYqA@mail.gmail.com>
 <alC3Kc2BcjkmUVwV@ashevche-desk.local>
 <TY1PPFA4928F5D95D0BFF5F087E44F8B166F0C02@TY1PPFA4928F5D9.apcprd02.prod.outlook.com>
 <KL1PR02MB723976B817F54AEB9785B51D9FDE2@KL1PR02MB7239.apcprd02.prod.outlook.com>
 <anl8TtJweGgob1kp@ashevche-desk.local>
 <KL1PR02MB7239DF2E12270CC4B58F55429FA42@KL1PR02MB7239.apcprd02.prod.outlook.com>
 <aoadazG84iGSWCuI@ashevche-desk.local> <aoadmbnFae8C4y3q@ashevche-desk.local>
 <KL1PR02MB7239A0882DE535296B4ED5249FA42@KL1PR02MB7239.apcprd02.prod.outlook.com>
 <aqRF9CrO42-_nwMO@ashevche-desk.local>
 <034a8506-f158-4fe1-af61-ff821744a63c@bootlin.com>
In-Reply-To: <034a8506-f158-4fe1-af61-ff821744a63c@bootlin.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aaeon.com.tw;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR02MB7239:EE_|PUZPR02MB6065:EE_
x-ms-office365-filtering-correlation-id: e7f60d15-4fc3-46d0-e492-08df18be6f05
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|10070799003|366016|376014|23010399003|1800799024|38070700021|4133799003|6133799003|10067099003|11063799006|4143699003|56012099006|55112099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 96czhNvRAk5SBvaEeJe/ZUCq4fNsf9xqo8D7hS//IiHkyX+cua3yJ+h4nzKhGp2g/ctolins1/vAjPhMpAv7pO9reyQUiERVT3NvJbWu+wu3JuoIdlCS7rSXteKKBX/w2EZ0P/9YzpTj0eIEqMsvwypmPdpM/vtK1UUQhmWb+kMSAYb6k3mm/JjtaEiE/D+MlL11B/DqQqww80GfwepFPQJsqTx5noK/rzZRdbzjTerE/w1tk2m87rMYJFfJzWupjz77SOnAYyAsQ+F0zX+nUwgcyAXGP7QnTCFnc9x/QzESP79zLZTc6TanaNZfDsiBsZSIY7XgT72yMohYFiQ/2fI9n7ILAusGNHqaF9UYrGSFy2/0+IvD3pkasqfO4OKcI4P1uFgUPogTotSolE9tHT3Qmd2lMa3sXu1Nd9seokM0fUldECyk2MSYVch41oYZ+Bviz1A4Y7fbZ90+pXM926EY6wwH7WIVFn/LwAujAyfMBTDu9AVSu9tT6rd3cG6d30CBVX+TCDfQfz/NBJJIbcy1Dc6LsI1p0iUE0GpcdMLeedK23XRqQuoD6NE9chiMqvuqIeEpQZZRlN8ZJ4exQYAkASexJUrzntInEM+8kFW+QD5LWESN7QgiuuefFUP7xSSn1HRPvTvRkzxd0puocrCqlU6tQh0C1elNAwmWO1sasZmnUc89rjNYcGReqZKi
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR02MB7239.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(376014)(23010399003)(1800799024)(38070700021)(4133799003)(6133799003)(10067099003)(11063799006)(4143699003)(56012099006)(55112099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?big5?B?em9COGhiWmhUYllZRy9VNkI0Nk16T3hIVGxPakJJZzZKMUJpZmVPOGhJTk10VmEx?=
 =?big5?B?My8vM1hqRHJUV1BLbDAvdCtsQ3Y0TFFBMTNRMm4wZXhibldjRW14Q1dmK1VrMzRL?=
 =?big5?B?bEx0Yk1WV3NUYm1lbjhaRmlBd0p3ZDdHRXVtYmtzVnZHVXUxdytIQzVVRVdjTlMx?=
 =?big5?B?YnN3Qkw5dzJ2aVJMc3VxQ3ZhYXBmczJEQ3lxWFp0dXh6MEVJOVBKUTh1WXRpVEFr?=
 =?big5?B?TlQ2Q3lCSC9JU3I4WmoyOGQzUWowMnFqRk01bUJtRk9KU3dIOHJiV1VsK3Vjdmd4?=
 =?big5?B?dit2ZU9jQkx4N28ra3Z6VkgrVVMyUTRYL2xRRVZOSFpoL2Y0dXdiUENsL0MvVVk1?=
 =?big5?B?RFFXakxSbGY3ZFJPYXRFQmduWE5hdEg0aG1rUGpUL2JWVlR3OW5JbzdKTGc1Rkxl?=
 =?big5?B?Zmg4OFpPU1ZtbStCd0VoUFRmZ3pLN0JrMFdQRGwxVzhwRm1uRFdHcXIzMW1kNnEr?=
 =?big5?B?MTN3dXE2VWJNdUMxeHlySExPL3lzd1ZJWG4zRFlmSEdqZnpCQ0JzR3Q1dlV4dXJE?=
 =?big5?B?NVRidU81a2tjR0JCMHhWVmtTUEF1dnNpSmZkZXF5b0gzODcwMHBLSlRWclZMVDVS?=
 =?big5?B?RWhVOXZQeEw1SjVLZFRDeUt1VUVwQ3VlWExMb1U4VEFjd3llQk43Y1NuNzJWU2Q1?=
 =?big5?B?MTh6NDJ4WHZMcC90ZUFHUCt4QXIydk1wQXl1U3E1ZWlWV3ZxM3JXTXVLMUdUL2kx?=
 =?big5?B?cjRKeUVHdHU4ekhYZWY0NmdCb1pFaGxETjZETXh4S0o3U1ZlczF3QzNRYnkzbm9u?=
 =?big5?B?NDdzeXNCMHFxMDZ1Ynh2ZUo3b3k0SC9JYURpMGgrTjJvYUk3MlhNNkk2YjNKQ21s?=
 =?big5?B?Y0Nsb0t6SXdwNHRVNWRMOXdlakt0ckhNZGNXaFlIdHpaY3U0Y0tnYjNtUjQ0U01C?=
 =?big5?B?Tm0rdk1BUGdmWXgxRGZMMHhvUzNsWFhZbFh2VkFXL1JpRVVnN050NXJYajVmQXpa?=
 =?big5?B?SDBSdjlwbENLb211SDJDNnk2cTRyNzBLU3R0VHg0T2tjbW4rTkpzVlJrVmRoRzFD?=
 =?big5?B?MlpGMkRFK3l4NWY5L0RYZURLK04xckZ3OVJkVk5NMW40V3kvQUc5cEVmdmFKNGNV?=
 =?big5?B?YzRKZXRrbUo1aFhjMG9QcjdlQWtEWnNpYStON1U2NlZ5L2xKeEJVdzVHWmdqSDlJ?=
 =?big5?B?Z0NIVDE4VW5MM0NMWnpvZ0huQTFiZVJmTUEvdDBySlhyL2poTGF6QVdDV2JMeGdt?=
 =?big5?B?MVJWYUdSVUU2YTNjZXQ3ZU5RUGl1MHNET2FCaFRpY3lBRlowYWFjWm4wZDdYY2Ev?=
 =?big5?B?L3RsZ3RCQ1hQa3FTOG5NMGM0L1paamhzTFNXT0VpVE5BK2FtWDNOYkdwSlhzVFgr?=
 =?big5?B?VFc0U2dpdHgvRGRNM041L25vVzhQWE9Fc1lHaThkenduYWNKYktRbURNWVRYWDBa?=
 =?big5?B?SkFkYmpCcEc0eEdiMkFOMTQxdE50MjU1R0NHajk4NXZtZHo4ODBjUys2MlBEQjVC?=
 =?big5?B?LytOSlMwSStGelBwQWZoUXpJaEdac0w4Tm1rR2dPL1F3eWRaZThjZWZKRzFWL2to?=
 =?big5?B?R0lRVVVhaW5UWTAzeGJNWTc2WDdLMDNCZWdGWkJuYWtWVlIzMUVLV1ZBWXhER3Jv?=
 =?big5?B?T3hTRVlQSmFTR3BoaDZHQlhsTWduSUIzNHFmN1VCUmNCRmt6d0dLZUp2TnQ3NDl2?=
 =?big5?B?UVR0OFQ0UkI0bStKQXAyTXMrTEJidzE2MC9GSmE1d0tlMy9qcEFrSlZBaVlQRHli?=
 =?big5?B?N2l6a0RpR1gwY005cmt3Z0Y0eVJlZnhtSUFKNlZ4OXdFVmIwNjQzSElRTHhFRXVZ?=
 =?big5?B?c2o2VHoybkgrellIY0Vnd0h1UXJBRTF4TjdXeVlXS1cralVZSGJkUWhBL3Znc01H?=
 =?big5?B?WWUyQ3pqOWZkdjlhdkZFUHp3RzVVOUNISDFJVllZbVpXMlBSV0VXcVd4SjVDalpI?=
 =?big5?B?M3BPY29pRWZKTEpBOTR1SFk2M3R5Q3VWN0cremRBNXc0bXRzRllqeHZ0VjN3OUZP?=
 =?big5?B?YVdpNmlpWFBqUTJtb0ZBcHZYRHk2MnY4L2w4S0NaZHl5VTNKVHhFTXFMSXh0cWZk?=
 =?big5?B?Y3JTallKQ3dmdkM1ck9NTUFOaHdWK1lZTTVtMVVqYTFiYWZxdDQ5QmRGZlN4RGN2?=
 =?big5?B?RlUvT0dtaXpKR0xCdmRyek0yRjFuMUZ2emFwbXkxU044Zlp1cWVSRy9wOHlGK2V3?=
 =?big5?B?WVQ4ODNZZlRqbURnWlhZTnV4anVHREo2RHpXRjJuUUt5RUdKaGVENUp2WGNSTlJk?=
 =?big5?B?U3A5SzdmR29sd0tON2hSQ0N2Z3l3Z0VFNFlNRTlCRkZvaEtQYi8wMTV3MVk1Z29m?=
 =?big5?Q?yHyY5TVgD2hqe4l3Zo0Wemms?=
x-ms-exchange-antispam-messagedata-1: xGm6IRlpbpPeYw==
Content-Type: text/plain; charset="big5"
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
X-MS-Exchange-CrossTenant-Network-Message-Id: e7f60d15-4fc3-46d0-e492-08df18be6f05
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 15:30:29.5268
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 56a2d4be-9fe3-430e-b539-7e13a4744857
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VjxIXtMkQ/PEIcRRsO7Ngbkyd4ra9VqPijfBnu6kouxDIQTv0cIH5eHP8MLqqfMcWNqm35cyQJxEXc2GUi6FKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR02MB6065

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBUaG9tYXMgUmljaGFyZCA8dGhv
bWFzLnJpY2hhcmRAYm9vdGxpbi5jb20+DQo+IFNlbnQ6IE1vbmRheSwgU2VwdGVtYmVyIDE0LCAy
MDI2IDQ6MDEgUE0NCj4gVG86IEFuZHkgU2hldmNoZW5rbyA8YW5kcml5LnNoZXZjaGVua29AaW50
ZWwuY29tPjsgQmlsbHlDaG91IKlQs9Wt2w0KPiA8QmlsbHlDaG91QGFhZW9uLmNvbS50dz4NCj4g
Q2M6IEdhcnlXYW5nIDxpczAxMjRAZ21haWwuY29tPjsgSnVuWWluZ0xhaSC/4KtUv28NCj4gPEp1
bllpbmdMYWlAYWFlb24uY29tLnR3PjsgbGludXgtZ3Bpb0B2Z2VyLmtlcm5lbC5vcmc7IEphc29u
SHVhbmcgtsCkrw0KPiCqTiA8SmFzb25IdWFuZ0BhYWVvbi5jb20udHc+DQo+IFN1YmplY3Q6IFJl
OiBVcCBTcXVhcmVkIFBybyA3MDAwIChVUE4tQURMTjAxKSBicm9rZW4gQklPUz8NCj4gDQo+ILNv
rE+lfrOhtmyl86FHpmKltLZ9s3O1sqlNqv6l86Snq2WhQb3QvVSrT7lxpGy2bKXzrE+md6X+qrqh
QyBUaGlzDQo+IGlzIGFuIGV4dGVybmFsIGVtYWlsOiBwbGVhc2UgbWFrZSBzdXJlIHRoZSBlbWFp
bCBpcyBzZWN1cmUgYmVmb3JlIG9wZW5pbmcgbGlua3MNCj4gYW5kIGF0dGFjaG1lbnRzLg0KPiAN
Cj4gT24gOS8xMS8yNiA4OjE4IFBNLCBBbmR5IFNoZXZjaGVua28gd3JvdGU6DQo+ID4gT24gVGh1
LCBBdWcgMjAsIDIwMjYgYXQgMTA6MDQ6MTNBTSArMDAwMCwgQmlsbHlDaG91IKlQs9Wt2yB3cm90
ZToNCj4gPj4+IE9uIFRodSwgQXVnIDIwLCAyMDI2IGF0IDA5OjIzOjQzQU0gKzAzMDAsIEFuZHkg
U2hldmNoZW5rbyB3cm90ZToNCj4gPj4+PiBPbiBUaHUsIEF1ZyAyMCwgMjAyNiBhdCAwNToxOTow
NkFNICswMDAwLCBCaWxseUNob3UgqVCz1a3bIHdyb3RlOg0KPiA+Pj4+Pj4gT24gTW9uLCBBdWcg
MTAsIDIwMjYgYXQgMDQ6MTc6NDNBTSArMDAwMCwgQmlsbHlDaG91IKlQs9Wt2w0KPiB3cm90ZToN
Cj4gPj4+Pj4+PiBEZWFyIEFuZHksDQo+ID4+Pj4+Pj4NCj4gPj4+Pj4+PiBUaGFuayB5b3UgZm9y
IHlvdXIgZmVlZGJhY2ssIGFuZCB3ZSBzaW5jZXJlbHkgYXBvbG9naXplIGZvciB0aGUNCj4gZGVs
YXkuDQo+ID4+Pj4+Pj4NCj4gPj4+Pj4+PiBXZSBhcmUgY3VycmVudGx5IHVwZGF0aW5nIHRoZSBC
SU9TIHRvIGNvbmZpZ3VyZSB0aGUgSEFUDQo+ID4+Pj4+Pj4gY29ubmVjdG9yIHBpbnMgdG8gR1BJ
Ty9HUE8gbW9kZSwgd2hpY2ggd2lsbCBlbnN1cmUgaW50ZXJydXB0DQo+ID4+Pj4+Pj4gc3VwcG9y
dA0KPiA+Pj4gb24gdGhlIE9TIHNpZGUuDQo+ID4+Pj4+Pj4gV2Ugd2lsbCB1cGRhdGUgdGhlIEJJ
T1MgYXMgc29vbiBhcyBwb3NzaWJsZSBhbmQgc2hhcmUgaXQgd2l0aA0KPiA+Pj4+Pj4+IHlvdSBm
b3INCj4gPj4+IHRlc3RpbmcuDQo+ID4+Pj4+Pj4NCj4gPj4+Pj4+PiBUaGFua3MgYWdhaW4gZm9y
IHlvdXIgcGF0aWVuY2UgYW5kIHN1cHBvcnQuDQo+ID4+Pj4+Pg0KPiA+Pj4+Pj4gVGhhbmtzIGZv
ciB0aGUgZ29vZCBuZXdzLCBJJ20gbG9va2luZyBmb3J3YXJkIHRvIHRlc3QgaXQhDQo+ID4+Pj4+
Pg0KPiA+Pj4+PiBUaGUgdXBkYXRlZCBCSU9TIGZvciB0aGUgVVBOLUFETE4wMSBwcm9qZWN0IHdp
dGggdGhlIEhBVCBjb25uZWN0b3INCj4gPj4+Pj4gcGluDQo+ID4+PiBjb25maWd1cmF0aW9ucyBp
cyByZWFkeS4gS2luZGx5IGRvd25sb2FkIGl0IGhlcmUgZm9yIHRlc3Rpbmc6DQo+ID4+Pj4+DQo+
IGh0dHBzOi8vYWFlb24zNjUtbXkuc2hhcmVwb2ludC5jb20vcGVyc29uYWwvbmFzX2FhZW9uX2Nv
bV90dy9fbGF5bw0KPiA+Pj4+Pg0KPiB1dD94c2RhdGE9TURWOE1ESjhRbWxzYkhsRGFHOTFRR0Zo
Wlc5dUxtTnZiUzUwZDN4aE5ETXlORFZrTg0KPiAyTTJaRFUwDQo+ID4+Pj4+DQo+IFkyVTFZbVl3
WmpBNFpHWXhNak0yTmpJeVludzFObUV5WkRSaVpUbG1aVE0wTXpCbFlqVXpPVGRsTVROaE4NCj4g
RGMwTkQNCj4gPj4+Pj4NCj4gZzFOM3d3ZkRCOE5qTTVNalE1TmprMk9UWTNNRFUxTlRnNGZGVnVh
MjV2ZDI1OFZGZEdjR0pIV25OaU0NCj4gMlE0WlhsSw0KPiA+Pj4+Pg0KPiBSbUpZUWpCbFZURm9Z
MGRyYVU5dVVubGtWMVZ6U1d4WmFVOXBTWGRNYWtGMVRVUkJkMDFEU1hOSmJFRnBUMmwNCj4gS1dH
DQo+ID4+Pj4+DQo+IEZYTkhwTmFVbHpTV3RHVDBscWIybFVWMFp3WWtOSmMwbHNaRlZKYW05NVps
RTlQWHd3Zkh4OCZzZGF0YT1la1p6DQo+IGENCj4gPj4+Pj4ga2w2UzNscGRFUjVRMGhJUkhWNlRF
RlpObWhzZVhVMGMwOWhVVU5IY3pNMWIxcEVTa0Z4VFQwJTNkDQo+ID4+Pj4+DQo+ID4+Pg0KPiBz
LzE1L29uZWRyaXZlLmFzcHg/aWQ9JTJmcGVyc29uYWwlMmZuYXNfYWFlb25fY29tX3R3JTJmRG9j
dW1lbnRzJTJmDQo+IDANCj4gPj4+Pj4NCj4gPj4+DQo+IDA3JUU4JUJCJTlGJUU5JUFCJTk0JUU5
JTk2JThCJUU3JTk5JUJDJUU4JTk5JTk1JTJmQklPUyUyZg0KPiA+Pj4gX1JlbGVhc2VkX0INCj4g
Pj4+Pj4NCj4gPj4+DQo+IElPUyUyZlVQTi1BRExOMDElMmZVTkFTQU0zNi56aXAmcGFyZW50PSUy
ZnBlcnNvbmFsJTJmbmFzX2FhZW9uX2NvDQo+ID4+PiBtX3QNCj4gPj4+Pj4NCj4gPj4+DQo+IHcl
MmZEb2N1bWVudHMlMmYwMDclRTglQkIlOUYlRTklQUIlOTQlRTklOTYlOEIlRTclOTklQkMlRQ0K
PiA4DQo+ID4+PiAlOTklOTUlMmZCDQo+ID4+Pj4+DQo+ID4+Pg0KPiBJT1MlMmZfUmVsZWFzZWRf
QklPUyUyZlVQTi1BRExOMDEmZ2E9MSZMT0Y9MSZ4c2RhdGE9TURWOE1ESjhRDQo+ID4+PiBtbHNi
SGxEDQo+ID4+Pj4+DQo+ID4+Pg0KPiBhRzkxUUdGaFpXOXVMbU52YlM1MGQzdzVNRFUxWlRoak5t
RTVOalEwWWpBMVpXUXhZakE0WkdWbVpUZw0KPiB6DQo+ID4+PiBZakppWkh3MQ0KPiA+Pj4+Pg0K
PiA+Pj4NCj4gTm1FeVpEUmlaVGxtWlRNME16QmxZalV6T1RkbE1UTmhORGMwTkRnMU4zd3dmREI4
TmpNNU1qSTRNRE0NCj4gPj4+IDRPVGsyTmprMw0KPiA+Pj4+Pg0KPiA+Pj4NCj4gTWpZNWZGVnVh
MjV2ZDI1OFZGZEdjR0pIV25OaU0yUTRaWGxLUm1KWVFqQmxWVEZvWTBkcmFVOXVVbmxrVjENCj4g
VnoNCj4gPj4+IFNXeFoNCj4gPj4+Pj4NCj4gPj4+DQo+IGFVOXBTWGRNYWtGMVRVUkJkMDFEU1hO
SmJFRnBUMmxLV0dGWE5IcE5hVWx6U1d0R1QwbHFiMmxVVjBad1kNCj4gaw0KPiA+Pj4gTkpjMGxz
DQo+ID4+Pj4+DQo+ID4+Pg0KPiBaRlZKYW05NVpsRTlQWHd3Zkh4OCZzZGF0YT1VbGRITWxoRk5X
eFhNM2h0YURGQ01HZEtWM3BaVFRaMU16DQo+ID4+PiBaT01GQnpXDQo+ID4+Pj4+IEdkU05tdGhN
MlJzTm5GelNUMCUzZA0KPiA+Pj4+DQo+ID4+Pj4gSG1tLi4uIEkgY2FuJ3QgbG9naW4gdGhlcmUg
d2l0aCBteSBAaW50ZWwuY29tIGFjY291bnQuIEkgc3VwcG9zZQ0KPiA+Pj4+IHRoYXQgc2hhcmUg
aXMgb25seSBmb3IgeW91ciBjb21wYW55LiBNYXliZSBNUyBUZWFtcyB3aWxsIHdvcmsgYmV0dGVy
Pw0KPiA+Pj4NCj4gPj4+IE9yIGp1c3Qgc2VudCBhbiBhcmNoaXZlIHByaXZhdGVseSB0byBteSBA
aW50ZWwuY29tIGFkZHJlc3M/DQo+ID4+Pg0KPiA+PiBTb3JyeSBhYm91dCB0aGF0ISBJoaZ2ZSB1
cGRhdGVkIHRoZSBkb3dubG9hZCBsaW5rIGFuZCBmaXhlZCB0aGUNCj4gcGVybWlzc2lvbnMuIENv
dWxkIHlvdSBwbGVhc2UgZ2l2ZSBpdCBhbm90aGVyIHRyeT8gVGhhbmtzIQ0KPiA+PiBodHRwczov
L2FhZW9uMzY1LW15LnNoYXJlcG9pbnQuY29tLzp1Oi9nL3BlcnNvbmFsL2JpbGx5Y2hvdV9hYWVv
bl9jb20NCj4gPj4NCj4gX3R3L0lRQWRzVGRXVVFodlFwQW9TOGxFTFRlOEFaSzcwT1JsNkZCLU5k
Y2YwbFhVd3VzP2U9WlYwTXZTJnhzDQo+IGRhdGE9TQ0KPiA+Pg0KPiBEVjhNREo4UW1sc2JIbERh
RzkxUUdGaFpXOXVMbU52YlM1MGQzeGhORE15TkRWa04yTTJaRFUwWTINCj4gVTFZbVl3WmpBNFpH
DQo+ID4+DQo+IFl4TWpNMk5qSXlZbncxTm1FeVpEUmlaVGxtWlRNME16QmxZalV6T1RkbE1UTmhO
RGMwTkRnMU4zd3dmRA0KPiBCOE5qTTVNalENCj4gPj4NCj4gNU5qazJPVFkzTURjeU1qZzFmRlZ1
YTI1dmQyNThWRmRHY0dKSFduTmlNMlE0WlhsS1JtSllRakJsVlRGb1kNCj4gMGRyYVU5dQ0KPiA+
Pg0KPiBVbmxrVjFWelNXeFphVTlwU1hkTWFrRjFUVVJCZDAxRFNYTkpiRUZwVDJsS1dHRlhOSHBO
YVVselNXdEdUDQo+IDBscWIybFVWDQo+ID4+DQo+IDBad1lrTkpjMGxzWkZWSmFtOTVabEU5UFh3
d2ZIeDgmc2RhdGE9U2s1b1JUVXJORUl5YWtwTGJqWndURTFsYkVkcg0KPiBiV3ANCj4gPj4gd1JY
UlhiR2xxYlRFNGVqZFFkRXhPYWtGTlFUMCUzZA0KPiA+DQo+ID4gVGhhbmsgeW91IQ0KPiA+DQo+
ID4gU29ycnkgZm9yIHRoZSBkZWxheWVkIHJlcGx5IChmb3IgdGhlIHJlY29yZCBJIGhhdmUgdXBk
YXRlZCBCSU9TIG1vcmUNCj4gPiB0aGFuIHR3byB3ZWVrcyBhZ28sIGJ1dCBoYXZlbid0IGhhZCB0
aW1lIGFjdHVhbGx5IHBlcmZvcm0gYW55IHRlc3RzKS4NCj4gPiBUb2RheSBJIHRyaWVkIHRvIHVz
ZSBzbyBjYWxsZWQgR1BJTyAxMSBhbmQgR1BJTyAxMiAob24gNDAtcGluIEhBVA0KPiA+IGNvbm5l
Y3RvcikgYXMgaW5wdXQgZm9yIHRoZSBldmVudCBnZW5lcmF0aW9uLiBJdCB3b3JrcyBuaWNlbHku
IEFsc28gSQ0KPiA+IGhhdmUgYnJpZWZseSBsb29rZWQgYXQgdGhlICdwaW5zJyBmaWxlIGZvciB0
aGUgcGlucyAyMDUgYW5kIDIwOCAoSXMNCj4gPiB0aGF0IGNvcnJlY3QgbWFwcGluZz8gSSB0b29r
IGl0IGZyb20gdGhlIF9DUlMgb2YgdGhlIHJlc3BlY3RpdmUgRGV2aWNlIG9iamVjdA0KPiBpbiBE
U0RUKSwgYW5kIGFsc28gY2hlY2tlZCB0aGUgd2hvbGUgbGlzdCBhdCBhIGdsYW5jZS4NCj4gPiBB
bGwgc2VlbXMgbXVjaCBiZXR0ZXIgbm93IKFYIG5vIFtBQ1BJXSwgbm8gW0xPQ0tFRCAqXSBmbGFn
cyB3ZXJlIHNldCwNCj4gPiB3aGljaCBpcyB0aGUgZ29hbC4gVEw7RFI6IEkgY2FuIGNvbmZpcm0g
aXQgd29ya3MgZm9yIG1lISBXb3VsZCB0aGlzIGJlDQo+ID4gYW4gb2ZmaWNpYWwgb25lIG9yIHNo
b3VsZCBJIHdhaXQgZm9yIHRoZSBvZmZpY2lhbCByZWxlYXNlIGFuZCByZS10ZXN0Pw0KPiA+DQo+
IEkgaGF2ZSBhIFVwIFNxdWFyZWQgUHJvIDcwMDAsIHNvIEknbSBhbHNvIGludGVyZXN0ZWQgYnkg
dGhpcyBmaXguIFBsZWFzZSBsZXQgbWUNCj4ga25vdyBvbmNlIHRoZSBvZmZpY2lhbCByZWxlYXNl
IGlzIGF2YWlsYWJsZS4NCj4gDQo+IEJlc3QgUmVnYXJkcywNCj4gVGhvbWFzDQpIaSBBbmR5LCBU
aG9tYXMsDQpBbmR5LA0KVGhhbmtzIGZvciB0aGUgdXBkYXRlIGFuZCBmb3IgcmUtdGVzdGluZy4N
ClRoZSBCSU9TIHlvdSB0ZXN0ZWQgaXMgYSBwcmUtcmVsZWFzZS9lbmdpbmVlcmluZyB2ZXJzaW9u
LiANCldlIHdpbGwgcHJvdmlkZSB0aGUgb2ZmaWNpYWwgQklPUyByZWxlYXNlIGFzIHNvb24gYXMg
cG9zc2libGUuDQpUaG9tYXMsDQpUaGFua3MgZm9yIHlvdXIgaW50ZXJlc3QuIFRoZSBzYW1lIEJJ
T1MgZml4IHdpbGwgYWxzbyBiZSBhcHBsaWVkIHRvIHRoZSBVUCBTcXVhcmVkIFBybyA3MDAwLg0K
V2Ugd2lsbCBwcm92aWRlIHRoZSBvZmZpY2lhbCBCSU9TIHJlbGVhc2UgYXMgc29vbiBhcyBwb3Nz
aWJsZS4NClRoYW5rcyBhZ2FpbiBmb3IgdGhlIHRlc3RpbmcgYW5kIGNvbmZpcm1hdGlvbi4NCg==
