Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.67
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795168139;
	b=yKJqXvDQMudgGvwPnuK3T+tCAX8i1JoIceGcKT0bznrW4JPstrDanxBs6zSjSOsxSJ0J
	 A+r80w2yXz4adKfpFURMEdI5Q95eOzxcrtptw1XF79LlK2RpDDQ6TUAyNBVSE+WUyc1mn
	 PnGXyade8G1ns+4X+vIdjpDbm++YPRougwcTnsYrDOKimOoo60IPeMbUsoDOCVD59n57J
	 u7coSlxVHDwWZWvtjNO9TwFcLLH4t5LoUXT/+I2469m9GB2lejdvlUMZ/VTRrAlqNv6Xc
	 w0wpfB1xi7NZZAYo2ht9ME7FRCuO32VjLqrhJKFWJEW/cvkGhK51JsFbAdKqb8iYobQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168139;
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
	bh=q5Qhg1EKxai6r2NVf6AepZAap8X010qtHDxVE/e7QAQ=;
	b=YcyDuUmFRRpERkFMAKb7KSI+Yoz9nnFctH0v5zRoDdi9r6Zw0e6MEKJ6eUN+csOuGaUF
	 UMNxACOMC+gmVzWN5KKCMoQ41X5cWOfD/4nZ9wzlfeq7CP9TZCuAMM3Uafj+DvCeszn/0
	 AVKE6AGv//DmP8fRod751oMcrg+GCeQo5EIgK9fJBd4T5nr/n96MVPISIuHShdV99Z2W5
	 HduFYunAH86dVa/mvLV0pFvlHwrA5zfYhIad8CMxIqJPdDt2ClP8IOyukzCjJ2JR9Irj9
	 KXG+mGZfuLd4Qd/CD3Hgpspb0SXKQL/rxdVOujJs0nx4xyE36GhH/fAgFL9G1wvxlLw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=siemens.com;
	spf=pass smtp.mailfrom=siemens.com;
	dkim=pass header.d=siemens.com header.i=@siemens.com header.a=rsa-sha256 header.s=selector2 header.b=bYFLJxN2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.84.67
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010067.outbound.protection.outlook.com [52.101.84.67])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A432A606A330
	for <linux-gpio@vger.kernel.org>; Fri, 20 Nov 2026 09:48:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A432A606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=siemens.com header.i=@siemens.com header.a=rsa-sha256 header.s=selector2 header.b=bYFLJxN2
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ODvfpMNAN6uS1Laan2faryayGOOgWmqdvMr46VP5ECLdmsAmRADVPbmSizMZo6jfkVdni+Qxe7BhmN7El8ZS/A0DprgZtfXART4JINMc1RRyRIqlUy1ywwUfj+X5xeM9nLpXZ4Y9eW71yC93+TUtN/XgMDOvWLyaxw3BQpRoBbagsZdq6ADLmmi8a9MvD+AXnj8kYi9ROnuQGmG+ZTcOk3+q/kraZghPLjUhBSmAqg61U/at63oUeGO/E0FpkGfYd/81bAxMJHbzc8Vy9VzIk3cjLWoC70zqKPYGViXdrE3/yI8DQq4OM6vzfKgl0goMLx1Ue8ggVYCm3aXvXm6Uqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q5Qhg1EKxai6r2NVf6AepZAap8X010qtHDxVE/e7QAQ=;
 b=nmkryt4ftVIdF7LYLX1EOy5HmmYleWrKrfTpaoONTvbuuulfL/L3LFKoMYqy98am0WdYgr4j8weJWaz2WOBFS3j3I5jzUPM1kI7V0OCGZXugFQ7XjyoC33jRjjzBSCI3r3V+a0XlkCnF0tLjOLgnwk9pRW0g3XplHDgj70Tu88pil8iHOtq3Tc5mCPVCXQlA0LTm+SOgCftqa/x5qKUESHSWgEm6a4oSEExA68dlBjjShYuxIYT7DoAzfavyBC7EnpaWz0n1uy/8lEo8XabXrrxFoKq2cvQc0P79JigG1MaPG1q46D554igHOEEwrEcUcI2+Grw39RzLTY7PR6PGFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q5Qhg1EKxai6r2NVf6AepZAap8X010qtHDxVE/e7QAQ=;
 b=bYFLJxN226vKiOnNXALWNkkvKpykvVcZ4coRDmsKv6pGlYNywVwu8gVLGzzRFhtaYvOxkkuHmkcD1H+7VrvgXcJu7cI4bkUikFHbZkW4lht66bWXbSS2q8Ao/wnkrjOyvBgLL98nYxq8oXjiafbdZ2jhsYMX1Njw3NylKdy5sN+5KMgQT6bL9Unavc7ySJR6akB3ASRkfOzzUUJ5dTDYvwTeElq5jrZg7XYs2q6y1RRyBpx3KhScZc5bniWvBmg0mJNUEkqMchuUwMHAwEGIFwP942rQImkl6VdEiuwdGj02xjwn7zSx4wHp2/lAsHmFOu0Fmfk6UB9V01ePE2eBdA==
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5b6::22)
 by AS1PR10MB179894.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:6e0::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.2; Fri, 20 Nov
 2026 09:48:54 +0000
Received: from AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f]) by AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9126:d21d:31c4:1b9f%3]) with mapi id 15.21.0662.001; Fri, 20 Nov 2026
 09:48:54 +0000
From: "Sverdlin, Alexander" <alexander.sverdlin@siemens.com>
To: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 3/3] pinctrl: single: Reject bit-per-mux without a usable
 function mask
Thread-Topic: [PATCH 3/3] pinctrl: single: Reject bit-per-mux without a usable
 function mask
Thread-Index: AQHdeH2l4/kOXH+YJkWjaohv4t8lyrc2DjUAgACpg4A=
Date: Fri, 20 Nov 2026 09:48:54 +0000
Message-ID: <5eed4e7bc3301d2168029ebf233d8918f0997e94.camel@siemens.com>
References: <20261119232806.4093754-1-alexander.sverdlin@siemens.com>
	 <20261119232806.4093754-4-alexander.sverdlin@siemens.com>
	 <sashiko-outbox-224208@kernel.org>
In-Reply-To: <sashiko-outbox-224208@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
user-agent: Evolution 3.58.3 (3.58.3-2.fc43) 
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB6867:EE_|AS1PR10MB179894:EE_
x-ms-office365-filtering-correlation-id: 2de03216-8b2f-43aa-a467-08df46eb7d62
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|1800799024|366016|23010399003|10070799003|38070700021|10067099003|4143699003|11063799006|5023799004|56012099006|261022075727099003|261022105027099003|261021121427099003|261021123027099003|261009223027099003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|55112099003|22082099003|18002099003|6133799003|13003099007;
x-microsoft-antispam-message-info:
 GHHPSb627exp8VlkS4Vcpd7F4rFIZ4Aw8iukhJmNlkbAs1Wl4hNTBwuDFZkY6HVzIxMXGUfxvr2Dm2fekbWee0zmp0VhDxb269NWPw8m0nQYYc0zSAGRbxrAYAV5yM4HZQ5536NyQrCNgdZ3QjgJrSjmuwj7E1oQBaLdLgbvIjbHqzGfq8n262GS0jZ1+OeIJjskiq2o1BG9ix9qx//IPdXltWCxQyrXaBCon2968BilzVCNlRbNv3r3eHv4L+kA6QS6jrnxkEhKu5kxi6Ow0EC+PM/7T9iVgfv54y/J8NgRSxT8ZrLpxIrtlu6CpOJi747+zbkHsgW5k6HAQ3JJGq2SU9OnJfN27ay6MzlgjTDw65bhxOLUjAx6OcdEzurxhke6xjM6bXuvLwlxHV9p19tQ3qwNJaeE6FtSGqzYBb5lTfZqf7u8ep7rNxqsCUi8gQ2WJeRN/aXVeDOZb+JIIsEkFTGxMYu9E3pwz8HanOmXUcMq3e+DLXcFPYubRPPvAiL9MtlZV5S17IRhwWsZPWVRsEw26GiEZqF28FE/Gq9ez7Ga6UTrekXW6kmHKKA+f3aA6du16TfviHIwErxEC8K3rILbq2AyoYJCNogwt3vX5umFUXqknkKOzB8vyr8nviCT6adtI4fJWT8ao05baVVGXNP58XPXPZ05VX7t3uU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR10MB6867.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(10070799003)(38070700021)(10067099003)(4143699003)(11063799006)(5023799004)(56012099006)(261022075727099003)(261022105027099003)(261021121427099003)(261021123027099003)(261009223027099003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(55112099003)(22082099003)(18002099003)(6133799003)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eUltQllORERnbVlWYzZxSkdaL3doYmRySVppNTlsd3QzaHE0bTBYdnlWSUlX?=
 =?utf-8?B?bzZ3Yk8rdTl3RVJzbWxoOUVSVGNFWVNtTnpTZTR0R0pQT1IxSSs0d2pQRnl3?=
 =?utf-8?B?WVBFTndlaTcxYkJLMk5rcEo0THNHRnZYZExsN081UU9STlZDejl2K3Examtv?=
 =?utf-8?B?ZERJMStJRnR6WGdTSEpBU3pONTRucVlJS1l6WXczWXQ1NzJoeElFcU9JK2xF?=
 =?utf-8?B?eUluV00ycnljWTFsdjJWSHRGRUdWZEYzbEhmVFU5K2UvZG9PZkhhTkUzZmFs?=
 =?utf-8?B?Ny9FcGt5QjIwRHAzV044WTE1bVVIYzJraUxoRk0rZkhwNjJFVWFvRkdBa1lR?=
 =?utf-8?B?SU9XV0tZaS9Xd2hrd2xOQ0FmMjJYUElJTmwvL2dUakJDRHNYZjFFSTNaUmVq?=
 =?utf-8?B?ZDFpKy9UdFRzL1ZaN0Jwano1OHhhWUFXVlJqVTVWZEZ5azBvQjlqUzVFejB1?=
 =?utf-8?B?NUZwbnJKbDV1WDlTTU5td2QwK20zdERXcURib25YUnNHVHh6elU1UkhEdTJB?=
 =?utf-8?B?RFIyNkxOTFNncjhhMkIzSDJCRHRYZGhtZXZaRVlJVGQxVU1BM2QzSWRtQmdw?=
 =?utf-8?B?cGk4d2lzbGZWVFdxVUlzUVM4emFoSGd3M2hoVlZzQm9jc2IzZjc1d1RieWhF?=
 =?utf-8?B?WUJ3S3VJOU5KeXgzcldqd1JjT3pXZkpvekp1MnVGV01lWkxmT0w0c1Q2TjAw?=
 =?utf-8?B?K1VvSVZVV0NNa25za0dvWVFuYTh3dkFBWU95bmRmWHd5YmhGeEtuN1NXSC9l?=
 =?utf-8?B?MmdxTFNPSWx6Y0dQYXI4bzdtQ2d5aGszTHV0LzNLck5WeUZudUJ0NEYxN1F2?=
 =?utf-8?B?Nmg5TUFxUkRaL01xTkI4ZXRuelF6bkNHcEFaWEFVVEdQemZzWjBhRmhiUTl3?=
 =?utf-8?B?T1BjT2psM2U1ZlBYalZxRlNSN0JEeTF5NEtpVnhNWVQvZXlscDJCejE4d1VS?=
 =?utf-8?B?dERobk1ic3VSS09IOGl2dEF6RnFtMmUraXVwTHF4VVpxaW8rMlh1Mk1kNEpM?=
 =?utf-8?B?OEpJTDY1YlRLVm1zYmJpaEJQK3liVExvVC9ZaENUaTI4MitzSkJZSDA4cVda?=
 =?utf-8?B?S0Q0bUFTTVRKWDV3dHhENEhpVlU5RUkrVmkraVorMnY3bGxlcTBYcWsvVi9R?=
 =?utf-8?B?ZDF2QzBCWU16dkZyUC9zbElBQ1dHZ1RxY004ZDNTUkhmd3VDdGs0Tjc1bUl1?=
 =?utf-8?B?d0crN3NZd3h0SXpBZ0pwQUNzYzdSdWFLYStpWTJwVFhva0k1b0EwNHpGaDZz?=
 =?utf-8?B?cGVxZ0ZOYk9IdE5FcTRWVDBBa3BibHJKWWNWWUVLQVc0K2lTeDJOdkNBb3B1?=
 =?utf-8?B?NTlya0NuWW80bGJGcEhzRHpGeER6a3RQV082OHNzakdIYlJ6aitGb1VFNDRI?=
 =?utf-8?B?T3JONkIzaHBRN2VaRVpscG1FYVpmSnBCNE5rQVhkb0xqWHZNNE9melJGby9y?=
 =?utf-8?B?RVNCQUhtZHk2OWluMWpPSU5rZC9VWTVUcVhmQkVEcmpSdkRkTWljL0Z2RGdT?=
 =?utf-8?B?cWdkQXRUeHY4VVRpVHRta3dERGl6cjQzQkJRazE3c3ZxcGc0a044UTQwTFpG?=
 =?utf-8?B?YVBaMElETFhIWFJwd2FMUnFVRVl3bEV2TTJXYVhZK2NnRk5UU29SeFNSMXBL?=
 =?utf-8?B?aitlQjhoQzFOcDJyWHBiNUtLN0F2TWpkWlFRZnUySHMrYWZRa0s3WFNRaVQ5?=
 =?utf-8?B?dDc3d2FWQVZzcGdqTkN3YXFrQXpGUTNNc3ZCNVd3dDc1NUw3a280M1Bqd1R6?=
 =?utf-8?B?VXNRNVJpN09IWnhqdkswdFdwRXFPWjVxM2pWeTd0T1F3Q3ltcm9jNHNBZUtM?=
 =?utf-8?B?eDc0d0VsSGZCQTFuY2NHVTIxemRWWENjZ1dYTHl3cUFuZzVQbnQzdjNydytS?=
 =?utf-8?B?ajJTQUlwZ0tON3lNSGZJWGxITXZuUVBwQ0xHVDVOSElyZCtab1RQbDBQcTI2?=
 =?utf-8?B?OUxPd1RVVnVWc2JPakpIcXM2OXRoUi9NcmpObGpQMWVnUW1NTDVRV0lXc2Nm?=
 =?utf-8?B?ZmppWFBRRzhGNW1WNEVodVdrOXZNUUxRTDBWbEVTM1NOb1I5bzVlUWZZRThv?=
 =?utf-8?B?K3NsSHBUWC80bE55U251WWN5a0o1UHdCcmY4eXBWcFdHS0dxa1BlclAreUdC?=
 =?utf-8?B?blpFWVQrdEx6UXhHcnM2Q2pmUWZFeDVORTFrcjRKOVU5cnY2Wk1TYVR4eFlD?=
 =?utf-8?B?MXJTVWVqZGJNd051NE1sVS94cnI2a0Iza2dFSG9uMVI0OCsrOE9md3o1TnZ5?=
 =?utf-8?B?RDBnLzVsWmxZcjlkblNXNlp5aWM4SnMwa2JDZmIwOHgzdndkN1l2TWNiVjVW?=
 =?utf-8?B?RXNlblo1UlVGOGs4YTJzdHIwVFp0dFRzQkdqZXVhRTgvYmxoK24zWE9NV2FH?=
 =?utf-8?Q?AFZrEpbyL9h/DNpfjX3pLh9d9sq+CkRjRPJa/udPJE6kq?=
x-ms-exchange-antispam-messagedata-1:
 ZYF48XQA+hr+E0Xv/eAhFoSNUcRgWQJNK+nYx1cDMPhhBrvL5Cbf7h2S
Content-Type: text/plain; charset="utf-8"
Content-ID: <5349B6C19E471B4EB5A42AF0075EA30B@EURPRD10.PROD.OUTLOOK.COM>
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 2de03216-8b2f-43aa-a467-08df46eb7d62
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2026 09:48:54.4463
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: oz0THntgG7d2z+AgvbRHflRkdD4+qU+LO4YBk5F6MBmeTTsccYF5SDoKhUMthyc4U3NVoSA6mYQibc80mt/F/YE537cmfwNLxnK2rlD+uW0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR10MB179894

SGkhDQoNCk9uIFRodSwgMjAyNi0xMS0xOSBhdCAyMzo0MiArMDAwMCwgc2FzaGlrby1ib3RAa2Vy
bmVsLm9yZyB3cm90ZToNCj4gVGhhbmsgeW91IGZvciB5b3VyIGNvbnRyaWJ1dGlvbiEgU2FzaGlr
byBBSSByZXZpZXcgZm91bmQgMSBwb3RlbnRpYWwNCj4gaXNzdWUgdG8gY29uc2lkZXI6DQo+IC0g
W01lZGl1bV0gcGluY3RybDogc2luZ2xlOiBfX2ZmcygwKSB1bmRlZmluZWQgYmVoYXZpb3IgaW4g
cGNzX3Byb2JlKCkNCj4gICBvbiB6ZXJvIGZtYXNrDQo+IEl0IGFsc28gbm90aWNlZCAxIHJlbGF0
ZWQgcHJlLWV4aXN0aW5nIGlzc3VlIHRoaXMgcGF0Y2ggZG9lcyBub3QNCj4gaW50cm9kdWNlOg0K
PiAtIFtIaWdoXSBwaW5jdHJsOiBzaW5nbGU6IGRpdmlzaW9uIGJ5IHplcm8gaW4gcGNzX2FsbG9j
YXRlX3Bpbl90YWJsZSgpDQo+ICAgWzFdDQo+IC0tDQo+IA0KPiBjb21taXQgY2MwODk1OGJiMzM0
NTZlNTNhMzEzNWI4ZTUzMDQ3YTY4OTkxNGE0NA0KPiBBdXRob3I6IEFsZXhhbmRlciBTdmVyZGxp
biA8YWxleGFuZGVyLnN2ZXJkbGluQHNpZW1lbnMuY29tPg0KPiANCj4gcGluY3RybDogc2luZ2xl
OiBSZWplY3QgYml0LXBlci1tdXggd2l0aG91dCBhIHVzYWJsZSBmdW5jdGlvbiBtYXNrDQo+IA0K
PiBUaGlzIGNvbW1pdCByZWplY3RzIHBpbmN0cmwtc2luZ2xlLGJpdC1wZXItbXV4IGNvbmZpZ3Vy
YXRpb25zIGluDQo+IHBjc19wcm9iZSgpIHdoZW4gcGluY3RybC1zaW5nbGUsZnVuY3Rpb24tbWFz
ayBpcyBtaXNzaW5nLCB6ZXJvLCBvciB3aWRlcg0KPiB0aGFuIHRoZSByZWdpc3RlciB3aWR0aC4N
Cj4gDQo+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MTExOTIwNTAxMy4y
NTYzODExLTEwLWxlZUBrZXJuZWwub3JnLw0KPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9w
aW5jdHJsL3BpbmN0cmwtc2luZ2xlLmMgYi9kcml2ZXJzL3BpbmN0cmwvcGluY3RybC1zaW5nbGUu
Yw0KPiA+IGluZGV4IGJjNmEzYTQ5OTkxNTYuLjczNDI1ZjZjOTcyODQgMTAwNjQ0DQo+ID4gLS0t
IGEvZHJpdmVycy9waW5jdHJsL3BpbmN0cmwtc2luZ2xlLmMNCj4gPiArKysgYi9kcml2ZXJzL3Bp
bmN0cmwvcGluY3RybC1zaW5nbGUuYw0KPiA+IEBAIC0xODU1LDYgKzE4NTUsMTQgQEAgc3RhdGlj
IGludCBwY3NfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4gPiAgDQo+ID4g
IAlwY3MtPmJpdHNfcGVyX211eCA9IG9mX3Byb3BlcnR5X3JlYWRfYm9vbChucCwNCj4gPiAgCQkJ
CQkJICAicGluY3RybC1zaW5nbGUsYml0LXBlci1tdXgiKTsNCj4gPiArCWlmIChwY3MtPmJpdHNf
cGVyX211eCAmJg0KPiA+ICsJICAgICghcGNzLT5mbWFzayB8fCBmbHMocGNzLT5mbWFzaykgPiBw
Y3MtPndpZHRoKSkgew0KPiA+ICsJCWRldl9lcnIocGNzLT5kZXYsICJpbnZhbGlkIGZ1bmN0aW9u
IG1hc2sgMHgleCBmb3IgYml0LXBlci1tdXhcbiIsDQo+ID4gKwkJCXBjcy0+Zm1hc2spOw0KPiA+
ICsNCj4gPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gPiArCX0NCj4gDQo+IFtTZXZlcml0eTogTWVk
aXVtXQ0KPiBDYW4gcGNzX3Byb2JlKCkgaW52b2tlIF9fZmZzKDApIGJlZm9yZSByZWFjaGluZyB0
aGlzICFwY3MtPmZtYXNrIGNoZWNrPw0KPiANCj4gV2hlbiBwaW5jdHJsLXNpbmdsZSxmdW5jdGlv
bi1tYXNrIGlzIHByZXNlbnQgaW4gdGhlIERldmljZSBUcmVlIHdpdGggYQ0KPiB2YWx1ZSBvZiAw
LCBvZl9wcm9wZXJ0eV9yZWFkX3UzMigpIHN1Y2NlZWRzIGVhcmxpZXIgaW4gcGNzX3Byb2JlKCkg
YW5kDQo+IHJ1bnM6DQo+IA0KPiBkcml2ZXJzL3BpbmN0cmwvcGluY3RybC1zaW5nbGUuYzpwY3Nf
cHJvYmUoKSB7DQo+IAkuLi4NCj4gCXJldCA9IG9mX3Byb3BlcnR5X3JlYWRfdTMyKG5wLCAicGlu
Y3RybC1zaW5nbGUsZnVuY3Rpb24tbWFzayIsDQo+IAkJCQkgICAmcGNzLT5mbWFzayk7DQo+IAlp
ZiAoIXJldCkgew0KPiAJCXBjcy0+ZnNoaWZ0ID0gX19mZnMocGNzLT5mbWFzayk7DQo+IAkJcGNz
LT5mbWF4ID0gcGNzLT5mbWFzayA+PiBwY3MtPmZzaGlmdDsNCj4gCX0gZWxzZSB7DQo+IAkuLi4N
Cj4gfQ0KPiANCj4gX19mZnMoMCkgaXMgdW5kZWZpbmVkIChfX2J1aWx0aW5fY3R6bCgwKSksIGFu
ZCBzaGlmdGluZyB0aGUgMzItYml0DQo+IHBjcy0+Zm1hc2sgYnkgcGNzLT5mc2hpZnQgY2FuIGFs
c28gdHJpZ2dlciBhbiBvdXQtb2YtYm91bmRzIHNoaWZ0IGJlZm9yZQ0KPiAgcmVhY2hpbmcgdGhl
IG5ldyBjaGVjay4gIENoZWNraW5nIGlmICghcmV0ICYmIHBjcy0+Zm1hc2spIGFib3ZlIHdvdWxk
DQo+IGF2b2lkIGJvdGguDQoNClRoZSBhYm92ZSBzZWVtcyB0byBiZSBhIGRlYWQgY29kZSBzaW5j
ZSB2My4xNywgSSdsbCBkZWxldGUgaXQgaW4gdjIgb2YNCm15IHNlcmllcy4NCg0KPiBbU2V2ZXJp
dHk6IEhpZ2hdDQo+IFRoaXMgcHJvYmxlbSB3YXNuJ3QgaW50cm9kdWNlZCBieSB0aGlzIHBhdGNo
LCBidXQgZG9lcyBwY3NfcHJvYmUoKSBhbHNvDQo+IGZhaWwgdG8gcmVqZWN0IGFuIGludmFsaWQg
cGNzLT53aWR0aCBbMV0/DQo+IA0KPiBMYXRlciBpbiBwY3NfcHJvYmUoKSwgdGhlIHN3aXRjaCBv
biBwY3MtPndpZHRoIGlnbm9yZXMgYW55dGhpbmcgb3RoZXINCj4gdGhhbiA4LCAxNiwgb3IgMzIg
aW4gaXRzIGRlZmF1bHQgY2FzZToNCj4gDQo+IGRyaXZlcnMvcGluY3RybC9waW5jdHJsLXNpbmds
ZS5jOnBjc19wcm9iZSgpIHsNCj4gCS4uLg0KPiAJc3dpdGNoIChwY3MtPndpZHRoKSB7DQo+IAlj
YXNlIDg6DQo+IAkJcGNzLT5yZWFkID0gcGNzX3JlYWRiOw0KPiAJCXBjcy0+d3JpdGUgPSBwY3Nf
d3JpdGViOw0KPiAJCWJyZWFrOw0KPiAJY2FzZSAxNjoNCj4gCQlwY3MtPnJlYWQgPSBwY3NfcmVh
ZHc7DQo+IAkJcGNzLT53cml0ZSA9IHBjc193cml0ZXc7DQo+IAkJYnJlYWs7DQo+IAljYXNlIDMy
Og0KPiAJCXBjcy0+cmVhZCA9IHBjc19yZWFkbDsNCj4gCQlwY3MtPndyaXRlID0gcGNzX3dyaXRl
bDsNCj4gCQlicmVhazsNCj4gCWRlZmF1bHQ6DQo+IAkJYnJlYWs7DQo+IAl9DQo+IAkuLi4NCj4g
CXJldCA9IHBjc19hbGxvY2F0ZV9waW5fdGFibGUocGNzKTsNCj4gCS4uLg0KPiB9DQo+IA0KPiBX
aGVuIHBjcy0+d2lkdGggaXMgbGVzcyB0aGFuIDggYW5kIGJpdC1wZXItbXV4IGlzIG5vdCBzZXQs
DQo+IHBjc19hbGxvY2F0ZV9waW5fdGFibGUoKSBjb21wdXRlcyBtdXhfYnl0ZXMgPSBwY3MtPndp
ZHRoIC8gQklUU19QRVJfQllURQ0KPiBhcyAwIGFuZCBkaXZpZGVzIGJ5IHplcm8gaW4gcGNzLT5z
aXplIC8gbXV4X2J5dGVzLiAgSWYgcGNzLT53aWR0aCBpcw0KPiBncmVhdGVyIHRoYW4gOCBidXQg
bm90IDgsIDE2LCBvciAzMiwgcGNzLT5yZWFkIGFuZCBwY3MtPndyaXRlIHJlbWFpbiBOVUxMDQo+
IGFuZCBwY3NfYWRkX3BpbigpIGRlcmVmZXJlbmNlcyBwY3MtPnJlYWQgd2hlbiBpcnFfZW5hYmxl
X21hc2sgaXMgc2V0Lg0KPiANCj4gWzFdIGh0dHBzOi8vc2FzaGlrby5kZXYvIy9idWcvbGludXgt
YTAzMDNiNmUtZDBjNi00MjkyLWFlZWItZmE4YTIxODYxODI3DQoNClRoaXMgb25lIGhhcyBiZWVu
IGFkZHJlc3NlZCBieSBMZWUgSm9uZXMgYWxyZWFkeSBbMV0uDQoNClsxXSBodHRwczovL2xvcmUu
a2VybmVsLm9yZy9hbGwvMjAyNjExMTkyMDUwMTMuMjU2MzgxMS0xMC1sZWVAa2VybmVsLm9yZy8N
Cg0KcHctYm90OiBjcg0KDQotLSANCkFsZXhhbmRlciBTdmVyZGxpbg0KU2llbWVucyBBRw0Kd3d3
LnNpZW1lbnMuY29tDQo=
