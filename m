Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.19
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795165602;
	b=biRQQUemanI9DEUiq5KSUqfUKtA10EG6n7rNA6OmJ6+YDAY5ERLMqL9u2g1eQARoxZls
	 AvGtN9mPjUKthaOZMspxtae+TAF9YkYf6wupwhTD4M2oFz2866WktE/uobz7ecdDl6DkS
	 M4sPBYhGqAHGtZZ2aMWP/Xx9vKkWjFOgXeOtl/qGrjhw6KQ6Md9IijAadN498gU0h+CCS
	 DAW1gfAmjo4zHg5nYfT9UC1kf4dnS1g3u91DCc5wRtUEN8OZTChk5gR9vLj368iCxcqWK
	 0Xu62sNUMiy8AFsO6j7yzpW2clpmK0D4vEcQAwjxZHcYmdKb5Ku3A7CStSgf5eVVDHA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795165602;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 user-agent:x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-atpmessageproperties:x-ms-exchange-senderadcheck:
	 x-ms-exchange-antispam-relay:x-microsoft-antispam:
	 x-microsoft-antispam-message-info:x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:
	 x-ms-exchange-antispam-messagedata-1:Content-Type:Content-ID:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:X-MS-Exchange-CrossTenant-mailboxtype:
	 X-MS-Exchange-CrossTenant-userprincipalname:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=9yEz7TC2Up3zHNT+uSXg4EJ6KRqZOH2tUaHIo69leFw=;
	b=GgAGptUPAcaKBd+Eoxq/TKe9gDUemtHBXHo3v//BXnFyUBGgw1JK04Qr18tnyDMYa0yP
	 ztpYU9G5aSFffrJ6hEYHlnI2/keH1Xw7zeZuvGQrHcg1ejZoKx942YkXXBqW7SwzCRwWU
	 fA+EAtLXci3qKihcCNLcP10CyXUGXZ02vSm8pgBQ87g+lNnbDrsJT6PdC2EFqYPxD0Zy+
	 D7kSXCG240K74dTM6qq8U/GxIa7Q+aWStfpSqqApsjgc1tvw+6vNaTTaigt75X64c0h0B
	 4yo4c2tjC3R9ujk5R6HjspXFX1wIrPKkBvY06sdNjkUgGmzKLM/DdTcN5V3ejY4aBhw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=siemens.com;
	dkim=pass header.d=siemens.com header.i=@siemens.com header.a=rsa-sha256 header.s=selector2 header.b=OidmaC1V;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.159.19
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013019.outbound.protection.outlook.com [40.107.159.19])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5243E606A333
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 09:06:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5243E606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=@siemens.com header.a=rsa-sha256 header.s=selector2 header.b=OidmaC1V
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nxr1LgF3IL6ETkksXnRtKlEg+bEdpNfSRDV1grbnrifbWrxdNO8fDawObCyGq9eYdZE95L6l3J5KwyirVcQBSIZA1gM0sGzzJfdiqgtaTxZ74aOVAyRV9uvNcUWTZChNCyejGfDgG3aEprgAwxBLpeLhNiR7Fi6y6eVWhVpzuMSdY2qmND8uUD1w02uR51Ro/5d9wyAsQ8E/RdU1DKAK84opDWablbftApHQKe/dLui/hFqGo7uDY+BErhJfrupc1QUCznNZ56utEd8ZktQQjyGW8h0zXfrUe6AUiiJuPbIRFEbHeKOvFgKdrWFMtzhCmZ4E/urZwxkmupMd0UEPfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9yEz7TC2Up3zHNT+uSXg4EJ6KRqZOH2tUaHIo69leFw=;
 b=FqvKYhuXhfSeddU+RAm4S2mT4d/EZXKSemjFvTg1dn1HgWDPanfdbha7SluoEgtTqF8Mngjms5eVJ4Olqhnm/brj5niKyr16djwdOVlSvNSOGF/sfe8WCMBTm5CLNFg9+RjZ5Gp5t4B1p47FIfBBshp0BO1IAJZe3MhDMRZs5i3s5WWMK/rzMqsVmfPDuv3g1DwNzxzv45rHCk2ZhuEJ+Z3O9upPnoIslaIDJljpS3nkvVozSfYPqHLOYSabhZvuXbal7rkHs+s/AMxCN7CcPBevcK1oiX8LgW6axLxqF01QpfFp1Cl/I/z/yyA17V2BfuFRKqqrDCgpTr0GDK/u7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9yEz7TC2Up3zHNT+uSXg4EJ6KRqZOH2tUaHIo69leFw=;
 b=OidmaC1V7pNI/Z/Vly7gA77UuER4ck5LdgvdrUDCBbQJCt8VmjqHhCFbtEm1BwDoBM1vkc/o57JW9lOx3JXMmTm6rAWO3afbvazl8W4P6Kzi12ebBSogaLoskK9njojZUfqbMhMni/NEgi+jUqnTBkqikL07zsn2JP39okn1aWzqF2fPE/sPQFPpbMor5Hlgprf+P+8mJolW1c9JFXekLIMdBH5+n/c6TTjc+3DYZGLtMjirPvBns4afnFPGhzh0DwAQp0dY8ntHgx8wbZ9P4ANkxoknosRY8dDZgUnMnKfBvzX0VqI7H/0G6I8AgNcWWjqxiZDWRBGGrrxFxhEPCw==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by PA3PR10MB9230.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:4d5::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.1; Fri, 20 Nov
 2026 09:06:38 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f%3]) with mapi id 15.21.0662.001; Fri, 20 Nov 2026
 09:06:38 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 1/3] pinctrl: single: Also free the pinconf table of a
 duplicate function
Thread-Topic: [PATCH 1/3] pinctrl: single: Also free the pinconf table of a
 duplicate function
Thread-Index: AQHdeH2kxY67OBgbJ0WJxMVAj+6BXLc2Do0AgACdXIA=
Date: Fri, 20 Nov 2026 09:06:38 +0000
Message-ID: <157b4f4de5f96a81ee3013e224ef8ec94d5540a3.camel@siemens.com>
References: <20261119232806.4093754-1-alexander.sverdlin@siemens.com>
	 <20261119232806.4093754-2-alexander.sverdlin@siemens.com>
	 <sashiko-outbox-224210@kernel.org>
In-Reply-To: <sashiko-outbox-224210@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.58.3 (3.58.3-2.fc43) 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|PA3PR10MB9230:EE_
x-ms-office365-filtering-correlation-id: d4050a82-b843-4768-6dc7-08df46e595df
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|10070799003|38070700021|10067099003|4143699003|11063799006|56012099006|261009223027099003|261021121427099003|261022075727099003|261022105027099003|261102123227099003|261021123027099003|261026121527099003|261028144727099003|261026140227099003|55112099003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 ovHhuTP0TyShQfC5JdfUPSR+9z9udGCFtjPeOxrs4PTEdZxG2US1KI+xTrhIdv7GDMUMkU2YKx7cylp8uQw3GB48fkH2/wb3Wd0vYIC3eFBQBMiohaOXVhYh7oyT259x0WHkznuZqXIw38pGpcVfPI8sGbZsS1WibgwAbK7lMBIukzgQzrwJVdFkOineByyzQ/M6f24pR2w1jULHM1BNSmCs1uX+VPR7AP6mCIBgWEwUEHJVjtdLTswaEHbRwqKOxmc93ZLjriyzhopvlUryKniujhcOchdhm0GAS1iuoM9/TG06mKfLjKMUFIdLfm9LXwsIRZUNDxKP/1T0TOrDXYsOsXH1QQHCkQqwfNe/9a7ooaOzRh4FhSZ5olWW7DEvenWHqcB50HAvrQXlNkCrIGP3hffH+2h5xnOy0E4bW8zDKstgJOLrCPJ3JaoF8hkG+qyg+AVWop4fO/xPC0xUza6TxFT4mviYze0rqiUz80XGi8DgXmiclmW5b3loRSB6rDzIKf6fJW7YIRabQyggq/Y3BIvNBAIrkhpBnhUKSw3CBdIe2Zlbtnf+hDczkWWBMt8INDcfgV2J269QZJCBL5xj7HNS+ov80y0GxEiu1Mmkfq9kDHswMG4aKZIwW9oZou+VLv4LbknQWRLXygTliFvlwITp4liVQTqhpP+O0JE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(10070799003)(38070700021)(10067099003)(4143699003)(11063799006)(56012099006)(261009223027099003)(261021121427099003)(261022075727099003)(261022105027099003)(261102123227099003)(261021123027099003)(261026121527099003)(261028144727099003)(261026140227099003)(55112099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?STdhQU5JeTQ5K0NnT2diVHIyNnU4d3VZekN6d2R3eCtjU0VXSU5IN1JLUlB6?=
 =?utf-8?B?YnNaN2x6d2o4Rm9GdWlPUHg2Z3lCK2p2QUN0Q2xhc3VVbHdOWUljd2x4SWkz?=
 =?utf-8?B?WFdFUUE1aWg5U3h1RVBQWWNqQ1hrWVh2eDd1RFh5VU00UTBlMk8rVkxNdStZ?=
 =?utf-8?B?L05STHVhSDQwcHlHWFhXdVloc1pySS9PQS9kQW05VytEMnFLNzEvSzVXUDZ5?=
 =?utf-8?B?NjVXclk3cjhXOHlyWWc1aTdGbE9FOHFLaEZvVHlsY0xlS2VjWGd0eHM2WDgz?=
 =?utf-8?B?RlNuT1llK1JNTW5SUFlkQkJ4R2NOWFgxN0NNWGd4V2s2cjhFbEszOXF0aERW?=
 =?utf-8?B?d1B3WlREQ056aDZFWnlqNys4TWRsMGdIQkFLak1nOW1rd2ZOdmxtamxsWFBY?=
 =?utf-8?B?M1oySnBlSDlVY3JHUmF4NzZQWFZYcmhSY0JtMU5CMXFrYm43dnJrbGJZUE5q?=
 =?utf-8?B?VEV1ZFFpRk13ZUlOT3A4TWd2a0Y0NWdaVXhRcFFnYk0yemNHRGQyNm9kTXJ0?=
 =?utf-8?B?eTNGVUVzYjFzR1kzbVY2OStoMTJVTWV0SXFMYUpwbkFYYnpXbDJJQ3RWQTFl?=
 =?utf-8?B?aDhsWnNObFR4K0EvOUxJN1hod1FUenBXS0xVOHJibkpXTzB2Q3NEMlZLS2xM?=
 =?utf-8?B?MFUvbDJLVGV2aVI4NlRRbWRsQm9DTUJ5c3lBZEUxalZjcDVBK2VrT1QzRjRF?=
 =?utf-8?B?cjhkb3NDQjd2cWJQTDAwT0NLejRweGdlaktFcHdLT09GaXQ4Wi9xYkxyUjJw?=
 =?utf-8?B?YWJ2THg1Kzk3bGdCUEQwT1R2WjRrd3dJV2U5czVVMWJlMGxqUTJ2RkVDVUFY?=
 =?utf-8?B?aTIvWHA0MlpVa2RXd2F1dldqdWw0YjFRd2ZXR3gyOTJYczV6ZnhPNG0zRDdR?=
 =?utf-8?B?TnkwOGtkRThsQzBoYkFvRkZkbGxtTXc5TXdKQ3RZWHRVU0dsZHdRMWszT2Qr?=
 =?utf-8?B?bzluQ3F6NlRpUDNEVmRFUlZoY1VoM1pORjRiZkRVMzhwUW9ZNEduSSt0ZXJX?=
 =?utf-8?B?VjlDcGU5aG5zUzRTN21wQkM4MW1JcjZiTzhYRlZwaG5DVzJHdzBGc2t6bU9J?=
 =?utf-8?B?SXpEcHZXRXhQWVJOTjJ0L0xqZUVybU9SdWIyTkdTK1pUVS9ZM3hwYmF5SE5Z?=
 =?utf-8?B?MHUxczR2c0hMSW43QXpyaFFSOE1WVHowVW1IMnBXY0pDQjBNM3M0dDV6REFF?=
 =?utf-8?B?aHVGTSswdVBMVmhnTitzQ1NVT3cwcDRYcUpsMlBDUXhxTC91TWZxN1RRNCth?=
 =?utf-8?B?N0dONVlGYUprMzg3OVhTSEoxazVyWHZhUUVBYjM1bTFQN0FENmVpcXJUWERl?=
 =?utf-8?B?QXhKcUdDanVrUmhxQUc1VkgvZllPbGpweVE3K3p5MmxGRERnTThsRGVneTVz?=
 =?utf-8?B?cmdRQldEZzZrU0pYRHBwRlBCSHpoV0NBVjBLZEkrM0pXT1lIVDJtYVJlUWJB?=
 =?utf-8?B?RlJENVRYNmFCZjdKREk1RHl5aXQwUFNmVXJ4b0hlcDFZNVJTNUtvcmFWYWRB?=
 =?utf-8?B?S2ZSaUEwcElNYWFRZHZ0VDQ5R0hEOG9YTUdCMlY0QmR5VmI1ODU3c0xJYW1k?=
 =?utf-8?B?ZGtzZys1NGVUTGtYVEFZQituSnVKU2ZoZnhRbmVVMm1xc3NvaS9VRVNEbWNU?=
 =?utf-8?B?M0pIUmlLSzRWa3dIRTJGeGpiMklaNHZkV2pBaUtqQ1RBSHpyRDdQR1N0QjZU?=
 =?utf-8?B?TmxBQ3RXU3FsMVpiNW5mY0RpUjhJUWcvc1h0TjNBbVhoQnFFS1g0MVkzOFRm?=
 =?utf-8?B?QzUrUm5VYXRnek8yaUlTaE9LR20xc2F2RENlbkExQ0ppOHkyM3FINC9GbGxQ?=
 =?utf-8?B?Ry9KT0psQ2QrUlczelN2aTk2SUJlcUx5Tnlpc01sM0g3MCtlVkRRaXZCVEFx?=
 =?utf-8?B?Tjl6SmpGR2JIbzYxNWpKYnJIWUNyclRaR3ViRTg3QmhXdCtIYzlpbDNJM2xO?=
 =?utf-8?B?RE9kOU1LYU9ockQyV0ErcDJ5eGFrV3dMd3dmaG9CN0lsejRrYzdub2Y1YSt3?=
 =?utf-8?B?QzZxdHdJMWR2bThOWUxkMFI0RVlVenYwbktWL01oQktrQTdiMWZGOCtOWmdo?=
 =?utf-8?B?Vk42UzFhSTFBSXVJVGtUVlBRQ0tRTVBQM1MyUko1VVRzbEJqbXExZElZVlln?=
 =?utf-8?B?ZE02RVdhMTh5TzlPcG94bGVZMis1Z2hUNVdBM3NVRmF5ZjFpendsVU4rOWta?=
 =?utf-8?B?U0tiZFBpNTc5a1VQVnh1MDNlZTV1K3FCd0pEbzQ2Ui9PQXBGekluMkxjMld5?=
 =?utf-8?B?bTFFUHNFWi9ZS2JlOGwzT3RXRlZPc1E2c3dwanZ4MU1zaDh0eUI4Ym9vR1M0?=
 =?utf-8?B?UFp1YnhCZlp0SDZuMUlwR2VrcWQxQUx2SVBVZDRGenN0Z043ajQyaVJnN2Nl?=
 =?utf-8?Q?A/0HPBaMglCraQPqwN7ye6I26BWPXI/Go0j4nd5fWIva9?=
x-ms-exchange-antispam-messagedata-1:
 5JZ+2LsLrBL8RP0YDjYZOl793HmNU87Uscycfo6CCjXTm6K7FRTD4Qbi
Content-Type: text/plain; charset="utf-8"
Content-ID: <D3B067A162EFAF47B8CF60D813536EB9@EURPRD10.PROD.OUTLOOK.COM>
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
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: d4050a82-b843-4768-6dc7-08df46e595df
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 09:06:38.5059
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: JyrVuWgMxZKRERW1C2TVxws1II+WyBVakvJj4Xn+qOCUXOrFgq7q9xQJXNn39TSYDcyiBL5TIWycSR2NIUnl+XtqxNs37QvJZpTNi2BBgZA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA3PR10MB9230

SGkhDQoNCk9uIFRodSwgMjAyNi0xMS0xOSBhdCAyMzo0MyArMDAwMCwgc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyB3cm90ZToNCj4gVGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlr
byBBSSByZXZpZXcgZm91bmQgbm8gbmV3IGlzc3Vlcw0KPiBpbiB0aGlzIHBhdGNoLCBidXQgbm90
aWNlZCAxIHJlbGF0ZWQgcHJlLWV4aXN0aW5nIGlzc3VlIGl0IGRvZXMgbm90DQo+IGludHJvZHVj
ZToNCj4gLSBbQ3JpdGljYWxdIHBpbmN0cmw6IHNpbmdsZTogdXNlLWFmdGVyLWZyZWUgaW4NCj4g
ICBwY3NfcGFyc2Vfb25lX3BpbmN0cmxfZW50cnkoKSBbMV0NCj4gLS0NCj4gDQo+IGNvbW1pdCBm
OWE4MGI3ZDRiMWNjMDA0YWU2MzZmNWU5MWEwMzdiMGQ2YWZiYzkzDQo+IEF1dGhvcjogQWxleGFu
ZGVyIFN2ZXJkbGluIDxhbGV4YW5kZXIuc3ZlcmRsaW5Ac2llbWVucy5jb20+DQo+IA0KPiBwaW5j
dHJsOiBzaW5nbGU6IEFsc28gZnJlZSB0aGUgcGluY29uZiB0YWJsZSBvZiBhIGR1cGxpY2F0ZSBm
dW5jdGlvbg0KPiANCj4gVGhpcyBjb21taXQgZnJlZXMgZnVuY3Rpb24tPmNvbmYgd2hlbiBwY3Nf
cGFyc2Vfb25lX3BpbmN0cmxfZW50cnkoKSBkcm9wcw0KPiBhIGR1cGxpY2F0ZSBmdW5jdGlvbiBv
biBjb25zdW1lciByZS1wcm9iZS4NCj4gDQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3Ry
bC9waW5jdHJsLXNpbmdsZS5jIGIvZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtc2luZ2xlLmMNCj4g
PiBpbmRleCA1MjczNGJkN2I3ZjA2Li45NWM4YmQzODQ1OWM4IDEwMDY0NA0KPiA+IC0tLSBhL2Ry
aXZlcnMvcGluY3RybC9waW5jdHJsLXNpbmdsZS5jDQo+ID4gKysrIGIvZHJpdmVycy9waW5jdHJs
L3BpbmN0cmwtc2luZ2xlLmMNCj4gPiBAQCAtMTEwMiw2ICsxMTAyLDcgQEAgc3RhdGljIGludCBw
Y3NfcGFyc2Vfb25lX3BpbmN0cmxfZW50cnkoc3RydWN0IHBjc19kZXZpY2UgKnBjcywNCj4gPiAg
CWlmIChwaW5tdXhfZ2VuZXJpY19nZXRfZnVuY3Rpb24ocGNzLT5wY3RsLCBmc2VsKS0+ZGF0YSAh
PSBmdW5jdGlvbikgew0KPiA+ICAJCWRldm1fa2ZyZWUocGNzLT5kZXYsIHBpbnMpOw0KPiA+ICAJ
CWRldm1fa2ZyZWUocGNzLT5kZXYsIHZhbHMpOw0KPiA+ICsJCWRldm1fa2ZyZWUocGNzLT5kZXYs
IGZ1bmN0aW9uLT5jb25mKTsNCj4gPiAgCQlkZXZtX2tmcmVlKHBjcy0+ZGV2LCBmdW5jdGlvbik7
DQo+ID4gIAkJZGV2bV9rZnJlZShwY3MtPmRldiwgcGduYW1lcyk7DQo+ID4gIAl9DQo+IA0KPiBb
U2V2ZXJpdHk6IENyaXRpY2FsXQ0KPiBUaGlzIHByb2JsZW0gd2Fzbid0IGludHJvZHVjZWQgYnkg
dGhpcyBwYXRjaCwgYnV0IGNhbiB0aGUgZXJyb3IgcGF0aCBpbg0KPiBwY3NfcGFyc2Vfb25lX3Bp
bmN0cmxfZW50cnkoKSAoYW5kIHBjc19wYXJzZV9iaXRzX2luX3BpbmN0cmxfZW50cnkoKSkNCj4g
cmVtb3ZlIGFuIGFscmVhZHkgcmVnaXN0ZXJlZCBncm91cCBhbmQgZnVuY3Rpb24gWzFdIGFuZCBj
YXVzZSBhDQo+IHVzZS1hZnRlci1mcmVlPw0KPiANCj4gV2hlbiBhIGR1cGxpY2F0ZSBub2RlIGlz
IHBhcnNlZCwgcGNzX2FkZF9mdW5jdGlvbigpIGFuZA0KPiBwaW5jdHJsX2dlbmVyaWNfYWRkX2dy
b3VwKCkgcmV0dXJuIHRoZSBleGlzdGluZyBzZWxlY3RvcnMgZnNlbCBhbmQgZ3NlbC4NCj4gSWYg
cGNzX3BhcnNlX3BpbmNvbmYoKSB0aGVuIGZhaWxzLCB0aGUgZXJyb3IgcGF0aCB1bmNvbmRpdGlv
bmFsbHkgcmVtb3Zlcw0KPiBib3RoIHNlbGVjdG9ycyBmcm9tIHRoZSBjb3JlIHJhZGl4IHRyZWVz
Og0KPiANCj4gZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtc2luZ2xlLmM6cGNzX3BhcnNlX29uZV9w
aW5jdHJsX2VudHJ5KCkgew0KPiAJLi4uDQo+IAlpZiAoUENTX0hBU19QSU5DT05GICYmIGZ1bmN0
aW9uKSB7DQo+IAkJcmVzID0gcGNzX3BhcnNlX3BpbmNvbmYocGNzLCBucCwgZnVuY3Rpb24sIG1h
cCk7DQo+IAkJaWYgKHJlcyA9PSAwKQ0KPiAJCQkqbnVtX21hcHMgPSAyOw0KPiAJCWVsc2UgaWYg
KHJlcyA9PSAtRU5PVFNVUFApDQo+IAkJCSpudW1fbWFwcyA9IDE7DQo+IAkJZWxzZQ0KPiAJCQln
b3RvIGZyZWVfcGluZ3JvdXBzOw0KPiAJfQ0KPiAJLi4uDQo+IGZyZWVfcGluZ3JvdXBzOg0KPiAJ
cGluY3RybF9nZW5lcmljX3JlbW92ZV9ncm91cChwY3MtPnBjdGwsIGdzZWwpOw0KPiAJKm51bV9t
YXBzID0gMTsNCj4gZnJlZV9mdW5jdGlvbjoNCj4gCXBpbm11eF9nZW5lcmljX3JlbW92ZV9mdW5j
dGlvbihwY3MtPnBjdGwsIGZzZWwpOw0KPiAJLi4uDQo+IH0NCj4gDQo+IFRoaXMgZGVsZXRlcyB0
aGUgb3JpZ2luYWwgZ3JvdXAgYW5kIGZ1bmN0aW9uIGRlc2NyaXB0b3JzIHdoaWxlIGFjdGl2ZQ0K
PiBjb25zdW1lcnMgc3RpbGwgcmVmZXJlbmNlIHRoZW0sIGFuZCBsZWFrcyB0aGUgZHVwbGljYXRl
IGZ1bmN0aW9uLA0KPiBwZ25hbWVzLCBhbmQgZnVuY3Rpb24tPmNvbmYgYWxsb2NhdGlvbnMuDQo+
IA0KPiBbMV0gaHR0cHM6Ly9zYXNoaWtvLmRldi8jL2J1Zy9saW51eC0xNDZjNTc3Yy1kZWM0LTRk
YzQtYjI4ZS04MjZjMWNjNzZhOWENCg0KWWVzLCBJIGNvbnNpZGVyZWQgdGhpcyBpc3N1ZSByZWFs
IGFzIHdlbGwgYW5kIGFkZHJlc3NlZCBpdCBpbiBwYXRjaCBbMi8zXQ0Kb2YgbXkgc2VyaWVzLg0K
DQpbMi8zXSBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjExMTkyMzI4MDYuNDA5Mzc1
NC0zLWFsZXhhbmRlci5zdmVyZGxpbkBzaWVtZW5zLmNvbS8NCg0KLS0gDQpBbGV4YW5kZXIgU3Zl
cmRsaW4NClNpZW1lbnMgQUcNCnd3dy5zaWVtZW5zLmNvbQ0K
