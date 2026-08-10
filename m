Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11013020.outbound.protection.outlook.com [40.107.44.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4298B331EC0
	for <linux-gpio@vger.kernel.org>; Mon, 10 Aug 2026 04:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786335472; cv=fail; b=fUkoTrygs3yRVLCZlTTSsZ3wwTiv3JiBCjtjkhW3s0QiA1+MdkoSL5wXNlKK89ItyCyk/yqHZXTNYYSc//m28iBiI2U1SYTHX7POnWCNh7GKqyq9ZkNMHmd+Sa06DIrE8KJMuSv/LGMT72AFa/WndenK/jsuipzUMFkZXXq1qKo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786335472; c=relaxed/simple;
	bh=IIbIrOfsPCxz78VW1GNnZFV9GXjERnVDFAU8U1kCQiY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=oknhR9Q6EbfauagdlUnSyvP6go2j85TEFQLzkTia/YeQubpTGJBO8uZFe7x8lQHvHD6kG7oXwifJffDFGPAbd67WkTeowF73UgEJOYyYf9fIbq9xgnjA4dd1MzTI5CvlkyrbqazypZMqAnIVg1bnPoS8OIOi+OMjeVfERHuYavA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aaeon.com.tw; spf=pass smtp.mailfrom=aaeon.com.tw; dkim=pass (1024-bit key) header.d=AAEON.COM.TW header.i=@AAEON.COM.TW header.b=YO872T4L; arc=fail smtp.client-ip=40.107.44.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=aaeon.com.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aaeon.com.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=AAEON.COM.TW header.i=@AAEON.COM.TW header.b="YO872T4L"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DComgh/mFDpXmr2pF6NBvNMwL6zBnX3yTDQwLHiIwN8vDAYL7Jfl6PhgbcvcPAz4mef/PlJVjlIansOaS/TrJ4AJlSKjhc5W1a4fogD5NseFHRbT12PcXClU880M8OSj0YDxiAx7teW/sM4rZrY1YkmzwAt9ZHqHyfa33r0HuTyLb6uW+ik+dRSjv6iiecj7i6ZClk4TXOi5jhnDivvJd51nKTeB0+2Sny/VWc+Y41qfhDDXI+WHZ3mnw/6ZGemZc2pXX8t8E/nEnyMmyaggAdD1qrkPNYAsAr4dTuFmV9zg+9F7+dWfhIUE7zHRViFGAKqqJlxkFMMQ0qN1Aj2Pzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IIbIrOfsPCxz78VW1GNnZFV9GXjERnVDFAU8U1kCQiY=;
 b=SXzUdbYDninRq+atMI7mCZ/KFnAc52/VR1smIH4Bb02sVoi3evoOsDo2/ty/GWFOrv2pvTfoQOF3edF70phIV+G4rjPPTwXfWM3hp9NiMR31/PxtfRoe/tGPhx9spnEWEUKoBy/ukIGv2aqR9u3eNZLv93mjmFD9OMCyNqeebQdpKPBWOUsakLxqoLaihPHW83ksfFsDGo/iLzR3gPKAm+hA2l2Am3zYcZbkIvTL1H9mCl3dgOB0qIZkEANfZcMjtnKp2hzbmkq1ptkNO1h6Pj/Qr1e9qaw0EXNeWKOo12FYt0OqYDXxnrIXFgcM/7E1s/HGsqdT1Hdo+a6AYYuCag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=aaeon.com.tw; dmarc=pass action=none header.from=aaeon.com.tw;
 dkim=pass header.d=aaeon.com.tw; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=AAEON.COM.TW;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIbIrOfsPCxz78VW1GNnZFV9GXjERnVDFAU8U1kCQiY=;
 b=YO872T4L/JnSrkE4fuVU0NNRv6mLtvJU89/9V9p8rXb+4zsGC3vuWMTd3yGLWhbvJFRElgR1PydTwL/jkmhP+EtCVvZduF5plAo1TbV84qpDaSakV7iy+wusBkXoEEGi6iHYbM+NMlOBwjBRT4NT9b+9trvADwuZ/meNyJIFk38=
Received: from KL1PR02MB7239.apcprd02.prod.outlook.com (2603:1096:820:127::10)
 by TY0PR02MB5970.apcprd02.prod.outlook.com (2603:1096:400:207::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Mon, 10 Aug
 2026 04:17:43 +0000
Received: from KL1PR02MB7239.apcprd02.prod.outlook.com
 ([fe80::2d6:2245:ecbc:ca26]) by KL1PR02MB7239.apcprd02.prod.outlook.com
 ([fe80::2d6:2245:ecbc:ca26%4]) with mapi id 15.21.0292.024; Mon, 10 Aug 2026
 04:17:43 +0000
From: =?utf-8?B?QmlsbHlDaG91IOWRqOWNmuWAqw==?= <BillyChou@aaeon.com.tw>
To: GaryWang <is0124@gmail.com>, Andy Shevchenko <andriy.shevchenko@intel.com>
CC: =?utf-8?B?SnVuWWluZ0xhaSDos7Tkv4rnqY4=?= <JunYingLai@aaeon.com.tw>, Thomas
 Richard <thomas.richard@bootlin.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, =?utf-8?B?SmFzb25IdWFuZyDpu4Pku4HmnbA=?=
	<JasonHuang@aaeon.com.tw>
Subject: RE: Up Squared Pro 7000 (UPN-ADLN01) broken BIOS?
Thread-Topic: Up Squared Pro 7000 (UPN-ADLN01) broken BIOS?
Thread-Index: AQHdEEdyeHj2H5neCk2cagLOPz7GorZmd4OAgBRGIkCAHBwdcA==
Date: Mon, 10 Aug 2026 04:17:43 +0000
Message-ID:
 <KL1PR02MB723976B817F54AEB9785B51D9FDE2@KL1PR02MB7239.apcprd02.prod.outlook.com>
References: <alAJJr5ATEZdHBBA@ashevche-desk.local>
 <CANYHO6rgn19uxjmc+1xv-pmadZQ1EaePmwvC3Kfy-E6ckwcYqA@mail.gmail.com>
 <alC3Kc2BcjkmUVwV@ashevche-desk.local>
 <TY1PPFA4928F5D95D0BFF5F087E44F8B166F0C02@TY1PPFA4928F5D9.apcprd02.prod.outlook.com>
In-Reply-To:
 <TY1PPFA4928F5D95D0BFF5F087E44F8B166F0C02@TY1PPFA4928F5D9.apcprd02.prod.outlook.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=aaeon.com.tw;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KL1PR02MB7239:EE_|TY0PR02MB5970:EE_
x-ms-office365-filtering-correlation-id: 58b68b2f-1738-4330-2835-08def696534a
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|55112099003|18002099003|22082099003|56012099006|11063799006|38070700021|6133799003|4143699003|10067099003;
x-microsoft-antispam-message-info:
 bKIfWALWW3rSJ0Z5OUNlODu5ZDp6n3UgZaXwqXi7TM8Zx/UypooAwmG/sEjrtjeJ9L76ZeoVzg3GRz7KKTN69nk2zzQy+UCjU9pbR0ySbpNYFyqv9cWDF3jpL43sFyAmpev+ZbQlhmxVE2t3hHOjQr9PSUY8qsknfQ+Xt4gM1UYMd7uPXKGghH0qzfLsz8opHpElfMbfLPauV4y0ERnWV+Q4t38GdOooVJWUaTPA3iQQSOTqZsjOLgTEL8RisCU5jhrNDza73gESo02hOvT5HWOQ72AnS52Dz840DmhDWAt09+ycHbnDyvPhI86K5TZFT1WLojcUDtpfa9FF2M5gGBahNTPwieleoyql2stKKul2pNjMHi4l7aItuf2f1nQNeXgpyR+4GkqxroyOE5tCEbYva6xwHI2uVfz0ZhhgR8XHqXIKRAomBSAyDrUm8KdfZECkiQJVMfrFq13wcauKjypoyA6FVybya0PQdYu96LEyeSBRsTtxFzZuJGWBGS0sDb6pWVqfnRN6HmIQ7Sjunf4jIx2UfwAE2eh/2JXmoD47RI2ZpZHi17jMq1vuMQQxgU3LT7S40ix3yoCdFo0LHnErwvBzxI7v1QaBTT8IgQTPqIdqLROzRr52NgQigDtRRXhDcJC/UqoZb6o/4rv5DJ1LwoxcM3EOFAUEhM5qeKAGQoz6i9gTy2mtwxEsVrSbrlJC2I45clpnw0qleOhvbd+9lHbH47vHcfLr0IV1Pgg=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:zh-tw;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR02MB7239.apcprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(55112099003)(18002099003)(22082099003)(56012099006)(11063799006)(38070700021)(6133799003)(4143699003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?TnJuVjJHdUUxaEwreU1pcDR6TDJWYXlrS0pqN1Jud21EZGV5a3hhRStLTWw4?=
 =?utf-8?B?SUcwQnRxZ1VhakhFeFpnQitlQ1RWbE9pdGM5R09hRWJlZHl0SjRwdUZ0OXBw?=
 =?utf-8?B?MFh0ZlBSM1B0cW1XVkxRMFFxMys2WlBLVTdiSE04NkFLZVJRbnJWa1YySkV5?=
 =?utf-8?B?QkorYlcrTTRUNHRLbnJaeEprWFJIRWQvWW1FajNWUFdzRzljR0xSb21aVmtp?=
 =?utf-8?B?cENGU2RiWkIzb0FjaFlRT2dCaW5KbVFTVkx5OWczSC8yc3k5OHV0aVVjOVJH?=
 =?utf-8?B?TlRKaGlhSzRUZXNpM1dYT3ZCTGJSY1BEczBmaHBEZGVGVEhiZVhNU2llc2NF?=
 =?utf-8?B?WENHU0hqWCtaSFk3TnppWDRuUkEwcmtYaWF0aS82dnZVWVgyQUpibk9pZkxF?=
 =?utf-8?B?SHBnUXZwVTAyNlNyWmEwT0xtU29Nb3lCdzBOMlFSVm5RcHdWS1VOSVg1S1Jv?=
 =?utf-8?B?N3pMYzBpd3ByRWRPK2gzYyt4ZzJkTzRRUkgxQWZmVVVBRm0vTFRIcW00Nlh4?=
 =?utf-8?B?WmJQYm5ET1M2RHMvSExJUCtzMHk3YTl5NWdtVDVCYUxjZitTK2JaQi90R1dD?=
 =?utf-8?B?Q1h1VmI1Q2d3VDNtMHo0azJDQk9FaXpwTlExN1JIOFdvVjM1ZTVBY0o2SlF6?=
 =?utf-8?B?NGl5SUd0UXBFSDBLYXM4RVQvR3ZMdzV3RUw2NkRoMHZHUXhhMWw4QzhOK2ph?=
 =?utf-8?B?TmJGY1J0cWV2cmJIL0hBVktiNVpSNThXVDRPRW4ya1R4NXF5M3pXUmdtZFlR?=
 =?utf-8?B?dlZWcnBYaVI2cmZFQnNrU2tkYWVFcVkxM1FDTXFuaHF2bWRCc254WkxXTGVJ?=
 =?utf-8?B?VVQ3aUI1aG5zaFdTOVpjRFlOUm5UWjFhTjFnTVR2OTJEQktvMWN4eGpIbTZ0?=
 =?utf-8?B?T09zVHlpenZxUlNqeGFaTG1SUnIzOG1XVkNhWHNuZ2p0OHNTRlQyZnBYbFFH?=
 =?utf-8?B?cGcvMzdZV0JhRDl4K2E5ZEpPL2NMRnVMMlNwSXk4RFpESXQ5MThCQ3BOeXFw?=
 =?utf-8?B?NnlKU3Q0a29seVc1dzdWbVdnSVRVaVpJTnJzN1lEVEtUbDNLWFBiQnZySnlM?=
 =?utf-8?B?WGx4c0dLVkwyOVdycXlSanB4cmdod3EyTmZpQndtK2tLb0dXZWZGdXFSRnBt?=
 =?utf-8?B?ZTNtUzJZMkl0L09uVUxOcjJIOG9mRENab1JqMFcwd2RJQndlVXFSZGxTR0Q2?=
 =?utf-8?B?eXJhUDM3cmVjWjZCemNadG1JeTVOTGFFanV5dWh3QTVZR0loNXd6WDVDNXBX?=
 =?utf-8?B?MjJNZjdTajl1SVNVOVEwaTNOTm5yUkpxTHFNM01wUDE3S2YvT2ZXS0kvVkdl?=
 =?utf-8?B?OElDOGNXM1NPWGV1Z2FtcFpMb1hXNGI1RVVFeFNISjgzM0FkMUVFYkp1WUVi?=
 =?utf-8?B?bytLWFAraFJIbjk3WEVaVlRsdGQvNzZjekVYVmxGcWVySGp2R05yYjY0MW1h?=
 =?utf-8?B?L2oxN0RGWm5FdEdJaFdnQUVnbmNmQ2E5TDFrOEZ2dVNBNGJQM3luRC9COWpy?=
 =?utf-8?B?S2VzUnp3RnNxSHpQQVdTZlJnNHhaQzdWbHZEcTlNNVl5dVFZdU02SGZzRXo5?=
 =?utf-8?B?Ym1DOHZhRzBjL1hnbHBNYWxZVkluMmFwMUJuUjJsaG50T3FGVSs0cTdDQlZQ?=
 =?utf-8?B?a1RRTnYzZ0lwdHJlUE1FVVhUeHVjZmdGT3NxQ1pRd1BJTWQ1RVFudTlEVElH?=
 =?utf-8?B?NU0yM3lXNzI3bDVqbkpudGdJZnVsM0pEOGo5NFpxbWY1ajhqUlc0N2txbmJn?=
 =?utf-8?B?QXJNSUNXaG1Kdk9pbm8xQlJBc0NIb2ZiWUk5ZWxwTEF0V2lHT2xCOG9IeWVs?=
 =?utf-8?B?N3ZDUmdTd3ZpdFRrUEFpQkdnczBFY3lFcXdmcWNJZkJEY1VoYjQzZ1BFbzRO?=
 =?utf-8?B?dkRLRTdHR0hyN3VIT3l6VVRmaWo0WlhKSlpSL3lxM29KRkdqMVlnS2EvTmxs?=
 =?utf-8?B?THRRc3dpcmNycXRDTTdjTUN4WXNiREVqWmhYZ2RwdHpQQUZZQVZ2THFVanQx?=
 =?utf-8?B?SkhRWUlBdFdvbUdQcThCbzVqa3ZJYTJCam9lRmNMbklEcUdJbS8xZVZBYis0?=
 =?utf-8?B?K2U0ZTVFRGdzdjRsb2ZEZE5LRU9kVE1MQUNHQXU5RENwdzU4cXRsNHJka3F4?=
 =?utf-8?B?RzhtRjRwM0VDK2d3Q2x5ZU9mQy9oVU5ZV0NENlhSZEZKSXg0TUYzMlVNWDFi?=
 =?utf-8?B?K2R0Nm5PM2liZnArSld2a2R6WnpsOGIrZnNIVWFLODYwMVpidlk4dnBwenMy?=
 =?utf-8?B?MnE4QXJhSzFKSHVBSi9ENXV4T2UxU09lTnRGZXg2bHAzY014dlRVM051aEhH?=
 =?utf-8?B?Nkl3VDlGLy9LenRsbW1BVnB3bEJ5Ujh1cVc1UFdCT0VlMWcvazY1dz09?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 58b68b2f-1738-4330-2835-08def696534a
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Aug 2026 04:17:43.5724
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 56a2d4be-9fe3-430e-b539-7e13a4744857
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xWClVOLSLDV5oqICef15Dq6+giYRJNQ1MeS6vchMd86rYHzIaIyrhDy3rxVeIm+pITnIniXX2iZMXX23oyVKIQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR02MB5970

RGVhciBBbmR5LA0KDQpUaGFuayB5b3UgZm9yIHlvdXIgZmVlZGJhY2ssIGFuZCB3ZSBzaW5jZXJl
bHkgYXBvbG9naXplIGZvciB0aGUgZGVsYXkuDQoNCldlIGFyZSBjdXJyZW50bHkgdXBkYXRpbmcg
dGhlIEJJT1MgdG8gY29uZmlndXJlIHRoZSBIQVQgY29ubmVjdG9yIHBpbnMgdG8gR1BJTy9HUE8g
bW9kZSwgd2hpY2ggd2lsbCBlbnN1cmUgaW50ZXJydXB0IHN1cHBvcnQgb24gdGhlIE9TIHNpZGUu
IFdlIHdpbGwgdXBkYXRlIHRoZSBCSU9TIGFzIHNvb24gYXMgcG9zc2libGUgYW5kIHNoYXJlIGl0
IHdpdGggeW91IGZvciB0ZXN0aW5nLg0KDQpUaGFua3MgYWdhaW4gZm9yIHlvdXIgcGF0aWVuY2Ug
YW5kIHN1cHBvcnQuDQoNCkJlc3QgcmVnYXJkcywNCkJpbGx5IENob3UNCg0KDQotLS0tLU9yaWdp
bmFsIE1lc3NhZ2UtLS0tLQ0KRnJvbTogSnVuWWluZ0xhaSDos7Tkv4rnqY4gPEp1bllpbmdMYWlA
YWFlb24uY29tLnR3PiANClNlbnQ6IFRodXJzZGF5LCBKdWx5IDIzLCAyMDI2IDI6NDggUE0NClRv
OiBCaWxseUNob3Ug5ZGo5Y2a5YCrIDxCaWxseUNob3VAYWFlb24uY29tLnR3Pg0KU3ViamVjdDog
Rlc6IFVwIFNxdWFyZWQgUHJvIDcwMDAgKFVQTi1BRExOMDEpIGJyb2tlbiBCSU9TPw0KDQpGWUkN
Cg0KQmVzdCBSZWdhcmRzLA0KSnVuWWluZyBMYWkNCg0KSnVuWWluZyBMYWkNCkFBRU9OIFRlY2hu
b2xvZ3kgSW5jLg0KNUYsIE5vLiAxMzUsIExhbmUgMjM1LCBQYW8gQ2hpYW8gUmQuDQpIc2luLVRp
ZW4gRGlzdCwgTmV3IFRhaXBlaSBDaXR5LCAyMzENClRhaXdhbiwgUi5PLkMuDQoNCg0KVEVMOiAr
ODg2LTItODkxOS0xMjM0IEV4dC4xODkxDQoNCg0KDQotLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0t
LQ0KRnJvbTogQW5keSBTaGV2Y2hlbmtvIDxhbmRyaXkuc2hldmNoZW5rb0BpbnRlbC5jb20+DQpT
ZW50OiBGcmlkYXksIEp1bHkgMTAsIDIwMjYgNToxMSBQTQ0KVG86IEdhcnlXYW5nIDxpczAxMjRA
Z21haWwuY29tPg0KQ2M6IEp1bllpbmdMYWkg6LO05L+K56mOIDxKdW5ZaW5nTGFpQGFhZW9uLmNv
bS50dz47IFRob21hcyBSaWNoYXJkIDx0aG9tYXMucmljaGFyZEBib290bGluLmNvbT47IGxpbnV4
LWdwaW9Admdlci5rZXJuZWwub3JnOyBKYXNvbkh1YW5nIOm7g+S7geadsCA8SmFzb25IdWFuZ0Bh
YWVvbi5jb20udHc+DQpTdWJqZWN0OiBSZTogVXAgU3F1YXJlZCBQcm8gNzAwMCAoVVBOLUFETE4w
MSkgYnJva2VuIEJJT1M/DQoNCumAmeaYr+WklumDqOmDteS7tu+8muWcqOaJk+mWi+mAo+e1kOWS
jOmZhOS7tuS5i+WJje+8jOiri+eiuuS/nembu+WtkOmDteS7tuaYr+WuieWFqOeahOOAgiBUaGlz
IGlzIGFuIGV4dGVybmFsIGVtYWlsOiBwbGVhc2UgbWFrZSBzdXJlIHRoZSBlbWFpbCBpcyBzZWN1
cmUgYmVmb3JlIG9wZW5pbmcgbGlua3MgYW5kIGF0dGFjaG1lbnRzLg0KDQpPbiBGcmksIEp1bCAx
MCwgMjAyNiBhdCAwNDozNzo1NlBNICswODAwLCBHYXJ5V2FuZyB3cm90ZToNCj4gQWRkIEFBRU9O
IHNvZnR3YXJlIEp1bllpbmcuDQoNClRoYW5rcywgd2FpdGluZyBmb3IgdGhlIHJlc3BvbnNlIQ0K
DQo+IHllYWggdGhlIEFDUEkgZmxhZyBzaG91bGQgbm90IHNldCBmb3IgSEFUIHBpbnMsIEp1bllp
biBrbm93cyBpdCwgVGhleSANCj4gY2xlYXIgdGhlIEFDUEkgZmxhZyBmcm9tIHRoZSBkcml2ZXIg
bm93LCB0aGVpciBCSU9TIHVzZXMgdGhlIGRlZmF1bHQgDQo+IGZyb20gQ1JCLCBidXQgdGhleSBz
aG91bGQgZml4IGl0IGZyb20gdGhlIEJJT1MgdG8gbWF0Y2ggdGhlIHJpZ2h0IHVzYWdlLg0KDQpI
b3cgZG8gdGhleSBjbGVhbiBpdCBmcm9tIHRoZSBkcml2ZXI/IElJUkMgdGhlIG93bmVyc2hpcCBy
ZWdpc3RlcnMgYXJlIGxvY2tlZCB3aGVuIEJJT1MgaGFuZHMgb3ZlciB0byB0aGUgT1MuIFRlY2hu
aWNhbGx5IGFueSBwaW4gdGhhdCBtYXJrZWQgYXMgR1BJTyBpbnB1dCBtdXN0IG5vdCBiZSBvd25l
ZCBieSBBQ1BJIHRvIGFsbG93IHVzZXJzIHRvIGNvbm5lY3Qgd2hhdGV2ZXIgdGhleSB3YW50IHRo
ZXJlIGFuZCBnZXQgYW4gaW50ZXJydXB0cy4gTWFueSBvZiB0aGVtIGFsc28gaGF2ZSAiTG9ja2Vk
IGZ1bGwiIHBlcm1pc3Npb25zLCB0aGF0J3MgYWxzbyBtYXkgbm90IGJlIGNvbnZlbmllbnQuIEFu
b3RoZXIgdGhpbmcgaXMgdGhlIGFic2VuY2Ugb2YgYmktZGkgR1BJTyBjb25maWd1cmF0aW9uIChv
ciBkaWQgSSBtaXNzIHRoYXQ/KSwgd2hpY2ggcGVvcGxlIG1heSB3YW50IHRvIGhhdmUgKG15IHVz
ZSBjYXNlLCBmb3IgaW5zdGFuY2UpLg0KDQpJbiBhbnkgY2FzZSBJIGhhdmUgbGF0ZXN0IGFuZCBn
cmVhdGVzdCBCSU9TIHZlcnNpb24gKHIzLjUgb2YgdGhpcyB5ZWFyKSBhbmQgcHJvYmxlbSBzdGls
bCBwZXJzaXN0cy4gQ2FuIEFBRU9OIHNoYXJlIGEgQklPUyBmb3IgdGVzdGluZz8gKE5vdGUsIGlm
IHlvdSB3YW50LCBpdCBjYW4gYmUgZG9uZSB1bmRlciBvdXIgSW50ZWwtQUFFT04gZXhpc3Rpbmcg
TkRBLCBJIGJlbGlldmUuKQ0KDQo+IE9uIEZyaSwgSnVsIDEwLCAyMDI2IGF0IDQ6NDjigK9BTSBB
bmR5IFNoZXZjaGVua28gDQo+IDxhbmRyaXkuc2hldmNoZW5rb0BpbnRlbC5jb20+IHdyb3RlOg0K
PiA+DQo+ID4gU2luY2UgSSBoYXZlIGJlZW4gcGxheWluZyB3aXRoIHRoZSAkU3ViamVjdCBib2Fy
ZCwgSSB3b25kZXJpbmcgaWYgSSANCj4gPiBtaXNzIHNvbWV0aGluZyBvciB0aGUgQklPUyBjb25m
aWd1cmF0aW9uIGlzIHV0dGVybHkgYnJva2VuLiBUaGUgDQo+ID4gcHJvYmxlbSB3aGF0IEkgc2Vl
IGlzIHRoYXQgbW9zdCBvZiB0aGUgcGlucyBvbiB0aGUgU29DIGFyZSBtYXJrZWQgDQo+ID4gd2l0
aCBbQUNQSV0gaWYgeW91IGxvb2sgYXQgdGhlIGRlYnVnZnMgJ3BpbnMnIGZpbGUgZm9yIElOVEMx
MDU3OjAwIGRldmljZSBpbnN0YW5jZS4NCj4gPg0KPiA+IFRoaXMgbWVhbnMgKm5vbmUqIG9mIHRo
ZW0gKHdoaWNoIGFyZSB1c2VyIHZpc2libGUgdmlhIEhBVCBjb25uZWN0b3IpIA0KPiA+IG1heSBz
ZXJ2ZSBhcyBhbiBpbnRlcnJ1cHQgcmVzb3VyY2UgdG8gdGhlIE9TLiBIb3cgdGhlIE9TIHNob3Vs
ZCANCj4gPiByZXF1ZXN0IGludGVycnVwdHMgb24gdGhvc2UgcGlucz8NCj4gPg0KPiA+IEFzIGZh
ciBhcyBJIHVuZGVyc3RhbmQgdGhhdCB0aGUgQklPUyBkb2VzIGluaXRpYWwgc2V0dGluZ3Mgb2Yg
Q1BMRCANCj4gPiBhbmQgYmFzaWNhbGx5IEkgY2FuIHVzZSB0cmFuc3BhcmVudGx5IHRoZSBwaW5z
IGFzIHBlciB0aGVpciANCj4gPiBjb25maWd1cmF0aW9uIGRvbmUgaW4gQklPUy4gUmlnaHQ/DQo+
ID4NCj4gPiBCdHcsIGRvIHdlIGhhdmUgYW55IGNvbnRhY3RzIHRvIGVuZ2luZWVycyBpbiBBQUVP
TiBvciB3aG9ldmVyIHdobyANCj4gPiBkb2VzIHRoZXNlIFVQIGJvYXJkcyBub3dhZGF5cz8NCg0K
LS0NCldpdGggQmVzdCBSZWdhcmRzLA0KQW5keSBTaGV2Y2hlbmtvDQoNCg0K
