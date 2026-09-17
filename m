Received: from USG02-CY1-obe.outbound.protection.office365.us (mail-cy1usg02on0079.outbound.protection.office365.us [23.103.209.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F0D3FE359
	for <linux-gpio@vger.kernel.org>; Thu, 17 Sep 2026 21:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=23.103.209.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789681474; cv=fail; b=fQpaGDEcO3QlTmWre6k6R8PULJm4V9aPPqvdGtRsxh9tKc2NAWh6HyJ63rylWe6euNr5FPxa/okMbw28SKGiu0dbpgY8Qr7oi8xhfV23Lm4AHcFL8DYHMCCQFOd7Ta6PUPfQp+hWe3pDjf5AxiHvJusB3NEk3VUi1G+4X0AOGks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789681474; c=relaxed/simple;
	bh=gzU2SAYAQhjOoYBZROaGF3LtCmhsrI/qnjeXYU21m/4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ym0xeNTvhX03CWQzrgMVRmiqmXP2lnOHfz6ul6/js4t26VIIcOCa1c9gXQahZshhEgbIrHfXlU205WBFvChFeUPXP2XZhd1HrivMmGVVu8pkkV7zWl1HA5SqbrtrOoayCBHsnEQ16qTKD+5M2AUFo9TG1CUCTgb9Kn/Ps2XHuSI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com; spf=pass smtp.mailfrom=xes-inc.com; dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b=vMTF0BiH; arc=fail smtp.client-ip=23.103.209.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=xes-inc.com header.i=@xes-inc.com header.b="vMTF0BiH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=UerxYlrqdPf3JIVA1mqPZ1CBIe82ee3t0YfVM++9ZK4qxS505Jo6l1teI04gh5CFLdX2dugxBfIdNzj5b3FF/ROJar6pW0gZyztn588D8XDDbhT2+PIVyLMu01/X0AtTasTuBcCY177OniKZEoR2WIGbSU146tDdBq7mtAwF0/0GXXYniE0+btb97BswTxWLFS+qjJmMX6BpnRiYiEEpbSi1elIyOmTtCqOOMXTffIMFS0kgJPeiDf5VqS8PafxDZqcnUYd3dJe7t1Aj3sPMl6ll6RfNeVt5yDL9cRPrc9yetgUu1SSFty+3Qbw0ofELNkkfz1Yo2qVVezHMMx7trQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gzU2SAYAQhjOoYBZROaGF3LtCmhsrI/qnjeXYU21m/4=;
 b=JbtaVyiSs6n3q0cDAIB0AW8taeNQBQ6ijcr2UXxPVQPfnWSfCoFnos5sVLwPb9hbfYAvVgSeTbJuv46xAuXZFQKX22N4SO/57jo26HVu80akOcFMJ4EzRbnyjtm3Xys2q53qT8VgKGlB7kyCsj9VODiQEu/JWkqMfg2HPE7TNvQnPw3tNlr4AoP2ZuauI9bbB73TTpyqENrQEeHpQ288JYfXh60Wd7l03dLtK53+3wW0uvkaiPrswDIPxIMBu0CflUiY2oH6ZoFahkb+w5hjgccVC5pJh1T12xfDso6H900p+aNsI3Vcc7BoHLNRmUrHlv31Zdm6j4wS95qAYqjpXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gzU2SAYAQhjOoYBZROaGF3LtCmhsrI/qnjeXYU21m/4=;
 b=vMTF0BiHtzhH6jitJWC+dJSPkp2tbVg5aVAnGn59BGfLUqS1TOY/DJn32YQwEX5k0p+NUqrcqdY9tgsQ26x8S44nt2FdG4OEGe6Yn1b6aJVm1PuqSucF6DFu8Pw5e+k74f0uGE0uS4REzvdopHl5PSNh7zzItq8gZ/lqshcsGRCeW1IIy7qXBGBm0aPlg/7Z8bFa5hYRdCVdNqfi4V4nMqvtGGyR/eIY1RtkUpXFfcqSo10To87LAl/2taX8m0QvvmUd0HAue0VuJSVHAG1MIB/RKlMUk8I9ib7acgZbiuvb0w7NoZjm7AW3bhLvqL9jSMd427zsdrVzgFrppgkdtQ==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by BN2P110MB1461.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:17b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Thu, 17 Sep
 2026 15:12:21 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52%5]) with mapi id 15.21.0428.011; Thu, 17 Sep 2026
 15:12:21 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij
	<linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, Viresh Kumar
	<viresh.kumar@linaro.org>, Erik Wierich <erik@riscstar.com>, Phil Howard
	<phil@gadgetoid.com>, "brgl@kernel.org" <brgl@kernel.org>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: RE: [PATCH libgpiod] README: move SPDX boiler-plate into REUSE.toml
Thread-Topic: [PATCH libgpiod] README: move SPDX boiler-plate into REUSE.toml
Thread-Index: AQHdRrbvCW5hTBqz7UinPryHH1z7Iw==
Date: Thu, 17 Sep 2026 15:12:21 +0000
Message-ID:
 <PH1P110MB160350B3672928BB4D72DAA19FB8A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References:
 <20260916-libgpiod-readme-licensing-v1-1-1221405d6840@oss.qualcomm.com>
In-Reply-To:
 <20260916-libgpiod-readme-licensing-v1-1-1221405d6840@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|BN2P110MB1461:EE_
x-ms-office365-filtering-correlation-id: 7e661ebd-4850-474e-e943-08df14ce125b
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|23010399003|366016|41320700013|10067099003|55112099003|56012099006|18002099003|22082099003|38070700021;
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(41320700013)(10067099003)(55112099003)(56012099006)(18002099003)(22082099003)(38070700021);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e661ebd-4850-474e-e943-08df14ce125b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Sep 2026 15:12:21.3384
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN2P110MB1461

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmFydG9zeiBHb2xhc3pl
d3NraSA8YmFydG9zei5nb2xhc3pld3NraUBvc3MucXVhbGNvbW0uY29tPg0KPiBTZW50OiBXZWRu
ZXNkYXksIFNlcHRlbWJlciAxNiwgMjAyNiAxMTo0OSBBTQ0KPiBUbzogTGludXMgV2FsbGVpaiA8
bGludXMud2FsbGVpakBsaW5hcm8ub3JnPjsgS2VudCBHaWJzb24NCj4gPHdhcnRob2c2MThAZ21h
aWwuY29tPjsgVmluY2VudCBGYXppbyA8dmZhemlvQHhlcy1pbmMuY29tPjsgVmlyZXNoDQo+IEt1
bWFyIDx2aXJlc2gua3VtYXJAbGluYXJvLm9yZz47IEVyaWsgV2llcmljaCA8ZXJpa0ByaXNjc3Rh
ci5jb20+OyBQaGlsDQo+IEhvd2FyZCA8cGhpbEBnYWRnZXRvaWQuY29tPjsgYnJnbEBrZXJuZWwu
b3JnDQo+IENjOiBsaW51eC1ncGlvQHZnZXIua2VybmVsLm9yZzsgQmFydG9zeiBHb2xhc3pld3Nr
aQ0KPiA8YmFydG9zei5nb2xhc3pld3NraUBvc3MucXVhbGNvbW0uY29tPg0KPiBTdWJqZWN0OiBb
UEFUQ0ggbGliZ3Bpb2RdIFJFQURNRTogbW92ZSBTUERYIGJvaWxlci1wbGF0ZSBpbnRvDQo+IFJF
VVNFLnRvbWwNCj4gDQo+IFRoZXJlJ3Mgbm8gcmVhc29uIHRvIGtlZXAgdGhlIFNQRFggbGljZW5z
ZSBhbmQgY29weXJpZ2h0IGhlYWRlcnMgaW4gdGhlDQo+IC5tZCBkb2N1bWVudHMgKFJFQURNRSwg
Q0hBTkdFTE9HLCBldGMuKSBhcyBpdCBvbmx5IGRlY3JlYXNlcyB0aGVpcg0KPiByZWFkYWJpbGl0
eSBpZiBvbmUgZG9lc24ndCB1c2UgYW55IHJlbmRlcmluZyB0b29sLiBNb3ZlIGFsbCBTUERYIGhl
YWRlcnMNCj4gZm9yIC5tZCBkb2N1bWVudHMgaW50byBSRVVTRS50b21sLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogQmFydG9zeiBHb2xhc3pld3NraQ0KPiA8YmFydG9zei5nb2xhc3pld3NraUBvc3Mu
cXVhbGNvbW0uY29tPg0KDQpBY2tlZC1ieTogVmluY2VudCBGYXppbyA8dmZhemlvQHhlcy1pbmMu
Y29tPg0KDQoNCg==
