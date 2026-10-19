Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=23.103.209.68
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792422618;
	b=EPRIuaQ6gayL/RwXhYs3zcjIjRXLBTAmuMLcNy4SnzApS+bDCUWet6yYJ32X6tKo9rkz
	 Se6/1YREPx9A/ls8f/DZUQlerHPxnU06qgvyIE62F+I7O3rIjNPuQplfauY9zJ2pJBvbI
	 ZOIDVVpUV9guZEja4RP3rPpm0UApglAyLTLitLk9qp9rN00FcCSk4dW2DHmCAdr5LGKqS
	 UEK2Bv0WDem+leKDlbvOGPxeKrMN1ij5QsuC4Dnk0f1QtnAcR+iY6Dh6SGTwMZl+o0R0G
	 nJNp329gFXNXB0xaErSdALJlCl9wOrDLS9f1Uwtnlp0dCjEp7i6Wv6OkT6fEp5P9H6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792422618;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:CC:Subject:
	 Thread-Topic:Thread-Index:Date:Message-ID:References:In-Reply-To:
	 Accept-Language:Content-Language:X-MS-Has-Attach:X-MS-TNEF-Correlator:
	 x-ms-publictraffictype:x-ms-traffictypediagnostic:
	 x-ms-office365-filtering-correlation-id:
	 x-ms-exchange-atpmessageproperties:x-ms-exchange-senderadcheck:
	 x-microsoft-antispam:x-microsoft-antispam-message-info:
	 x-forefront-antispam-report:
	 x-ms-exchange-antispam-messagedata-chunkcount:
	 x-ms-exchange-antispam-messagedata-0:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-AuthAs:X-MS-Exchange-CrossTenant-AuthSource:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-originalarrivaltime:
	 X-MS-Exchange-CrossTenant-fromentityheader:
	 X-MS-Exchange-CrossTenant-id:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=mD6IHpeZ9oT4qULbrLfnH8bUhmVkARoKyMYArwIxOeQ=;
	b=5SePPuVekPRO0Su/x15bin1vx6S+mnyXB6mFwMZF++NwZq55UAu/FjhLiedJfxyLbDmg
	 r8fwDSE5RJobJC0bP0F4QEvpKmAypT5JntAkJiwLjS83O/kk0dyUkCwy2B8lWqN9GHVoH
	 JwBzcArrijWIZ4k8gAApa3VLCVeRCymLy7oFR7oUOHaTRncpbmO9ulUW2D1Tt83zki7mC
	 PuWAy14Q7PCfIVgi0BAlUjIYZqNv9hGPTv49//A8uEtHFvJd/DmZPbN7oydlBAzy8TDy1
	 BUHZl1ZkSwYb/ncV6UAWBXq/hKEHyQOvHP/H/iDdgyTqcqmpTzX9as8a+StGn83gp1Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=xes-inc.com;
	spf=pass smtp.mailfrom=xes-inc.com;
	dkim=pass header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256 header.s=selector1 header.b=DTYYeCa6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=23.103.209.68
Received: from USG02-CY1-obe.outbound.protection.office365.us (mail-cy1usg02on0068.outbound.protection.office365.us [23.103.209.68])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B88AB6088296
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 15:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B88AB6088296
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xes-inc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256 header.s=selector1 header.b=DTYYeCa6
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=lFjA1ucmsDIfwq8mOzpSrqNpKHxIpcQRuxAuNP4I0mRLDPKhf9HSY0r8QX5n0ZCMHXtb243yH+ebPEjSm6SPdh71Y0UELccD885fA7n7nIs7lvR48ocBPxoXrAjFHOuf6CssrLxyCS8CMcCj3mGLvy0d263HoNHzpqZGQF0oSZSLq2BdsDoyjVkbKF0YlRhaR67ojN9iUGU06eP4z3AKNuZFlIKDThUbSKyMofr/9qck+N15UPnOh83n1+SowlJMM//wZYA03dbNtqp7GIo5liHXFEoGZ3OVOSVW7Di+SKFf22diQCpf9nQuMZerJB7fOY2fZi4qx8/a3ZbIdDHq0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mD6IHpeZ9oT4qULbrLfnH8bUhmVkARoKyMYArwIxOeQ=;
 b=Y8crdRPJ7/K2nQ/+YQP2PEcIFLLqSUsgH/luIaxxTFluckiigSwsCjlVHfAw9/njBuVdxbiMOzjwN+CWNcjKK3f+7yFmq1+QMs9FBlpGXRP8+Uh3GkMci9PFQHkmrCVwJKfE4bjWJz3nMmGTfYMVRZHw3Wv/3ko6MNn5xw8uShgYorrqGDhvq+3irgm0ysYW9QcDiHLRDpo2scsRa4EhW3skqf3I7EpzJ607J0qCet85bEQtqgeGM52V5bEP+qAUJGeXkM/FOZ2cWsqpXPsxir4Gv+rDq6xST3RrueMt4NhYoTlo02Y7kUOfoYHE9O5/g5oEvVWMudJWN38XMktcOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xes-inc.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mD6IHpeZ9oT4qULbrLfnH8bUhmVkARoKyMYArwIxOeQ=;
 b=DTYYeCa6E5U6Ndm38AXwCD/3/kBgGICcBATTtQ30g1pETPUEigw79xnk+1v/TVDNzbDFtAALOrPM1I5su2EvDC929gC4qjZ82vYc/nKvyJyq1NuIxMjkoDt5XZxtfmmLH+ZHRCXg/bgg/XHPd/nlPDwGyOjfRENRzbN1Enp9lwKMDESHUzkUI4VToDVzJ4ge4qB/qqYq7u4ra3UeVqp7+JyiH+g9WVeWKCwlJXlQ3IAOzHXhGNKwltGMkNRqPXfvyVZKi+a6e1rWa/aDne/1jJdX9d/6jankXo3sV3ArPJcSodojw+GDvNBaTDcaxKUX0RdDOokwP1Ckc5zDT/XJTw==
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by BN2P110MB1493.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:17b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.19; Mon, 19 Oct
 2026 13:37:22 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::de5f:f4ab:6e45:cf52%4]) with mapi id 15.21.0522.017; Mon, 19 Oct 2026
 13:37:22 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Linus Walleij
	<linus.walleij@linaro.org>, Kent Gibson <warthog618@gmail.com>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"brgl@kernel.org" <brgl@kernel.org>
Subject: RE: [PATCH RFC libgpiod 3/3] tools: implement gpioctl
Thread-Topic: [PATCH RFC libgpiod 3/3] tools: implement gpioctl
Thread-Index: AQHdX874XyCuC7X1Bk2R3NHJeIxo5w==
Date: Mon, 19 Oct 2026 13:37:22 +0000
Message-ID:
 <PH1P110MB1603341FEE65946773070BE79F98A@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
References: <20261016-gpioctl-v1-0-8770622679b8@oss.qualcomm.com>
 <20261016-gpioctl-v1-3-8770622679b8@oss.qualcomm.com>
In-Reply-To: <20261016-gpioctl-v1-3-8770622679b8@oss.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|BN2P110MB1493:EE_
x-ms-office365-filtering-correlation-id: 8e098a94-ec2f-4840-2788-08df2de61ae9
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|41320700013|6133799003|55112099003|22082099003|18002099003|38070700021|5023799004|4143699003|10067099003|56012099006;
x-microsoft-antispam-message-info:
 TfNOIh/mMvLPpwclqWlXiuWCTYdJPymEvi89NksLLCROAW5rXbDag93K5GNoGLNxUsPwUZ21BqZunz4Q1+ESZ1b2EZ0lZcRAWdpfX8R+sfk7ZA2ZzuFqqKgBju/njLqIQ3Lc8xe25iSwunuVypYEEcCuuSM+DoIEIVpis+4lCSVGNs2tcAW59Ig7niInUVvDybVMcZqJD6QI2D9DR2BSUwZ+bwXpDn8OLSe9kaMDHl2wYC5xuyi5pIyzaGlOLBvKt7Bg3e5SvkCdG777gt9zOZkZV1594WpZtm8LG/iKsC1MgK730+eti/N0koz+Ij/d4MHsRJ6y7yhfp9NjMpaqdqnrN0yRfV5d2ygeEFDbm3FY0e3iMCtv2F+J5VbbE34bzHtKnYYcHEU/p4YfGHbz54fPpQ+MFnR+nOlUAVLWFPUwjTTx0TCXFSI1K/IMGGj7rlkIQhEo7pu3pH32usqJAF2m+eMfijnD7++XLq9sn7I9iFQG85nIi33W8SdgZrIhP9RLsGKUYd8nvwvo5yQ8nXpOYysXx/zfzEkD9TW5FL6KhWPBBTsrG16PXV+q6Ochso5pAC+MphAeBMBrsLkjitJ0PzPjF/nj8q2by8z0fyj3z8tM6nVwew6qrUgHNCfkrG4NaX7wF6HrhyBxttN2It+iKneJvyjDmc94e8BCbnCogGwSGvZx7nNvn0ylek138sifvqYdmCyoPpjs83Jaek13fHxxW5ziSvLkG6Z5zug=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(41320700013)(6133799003)(55112099003)(22082099003)(18002099003)(38070700021)(5023799004)(4143699003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?RlZpOEVzclZTRmF6Q0RZRm4ydFRkOHZXamt6cVJQYjlXOEFLKzQyOVVyTzFx?=
 =?utf-8?B?M1RQQ0Y3b0JEY2l5ZDhSbUVHZjV5Q3lqajYvSlliZG00dUk4bkVFRlVMUmha?=
 =?utf-8?B?M2RNdkdFcHVXVHlDbk9pUWtqOFZSS0FUS0lmdnkzTlBXNzNyMHlwQzVEUmFD?=
 =?utf-8?B?N0NpQ3ZIbjJEUmZZQnpNay91RkcreTdYSjhnK0NaWm45L0s2MHpFY3lUNk1D?=
 =?utf-8?B?L2w3RkhTbVhicHIrTHpIV1dqT1pQbFRmZERtQ3lJZnRnT1hpYU5LWnhXZ3dU?=
 =?utf-8?B?b2xNU0s5cmhkOExYMDI2Q3JIYVpoQ0ZMcFQ1ZlVhdWwvNW16ZDJtQVkvNXZu?=
 =?utf-8?B?ZEZhbWc0bHhIK0paN2UwOFBjQU1hVW9CS2JRZGhjUUp0RkJjWXNQOXlzMHVG?=
 =?utf-8?B?cVBqSDk2S0VFTW9la28ydlVCeHduVk1qV2U4cnR3aU1XRFJEK3JJK09zRzZM?=
 =?utf-8?B?Ykw4Umowc0VmOG1Ra1ZaTFdDRUxkbnR6VTRjRTdSTVRJQm1KK0RyUVBkQ2Jw?=
 =?utf-8?B?RzM0Y0MzZDFyZkdkS3ZBY2xJU0lueE42bXpFS05ZYzNwRXd5dXpaeUkwWlRn?=
 =?utf-8?B?UGE4b1ArTTYrRU9PYUR2V0ZWb015T1o5N0V1c2REUmFNSkRITGtBMUV5em1D?=
 =?utf-8?B?eEZ6ZFNJR3Z3elIzeW5aWTZwWTlhdE5tUEJSUlk5cnFTclpVN1dGWm9lamZy?=
 =?utf-8?B?WjJFaVhjb1I1dGQ5S3B5Z1FnT1pYS3gyQ2dkRWQ1dUYvQ204YUQyZHZRam91?=
 =?utf-8?B?dW1Nd2I3RWxOUmQzMEI5VTVxZmduRERwZlhMOGxldFZkdGpqQkRIUmE2QWY2?=
 =?utf-8?B?ZEtoQVk5QUQrTXpRc0dtdjJ5NFlyb0k5SERQT1lCRVYyQU5oMkg0WDAzYzkz?=
 =?utf-8?B?WDdNcmhLT1NlOTFueVpZWjhmL2ZINDFxS1NJaXJUM0owTS9EWDFFVXVvL3RR?=
 =?utf-8?B?a1h2RGprQUZVMU5jWldYdkN5RkVjKzlOSE9oRUhUSHd5RTdjd2hsTzlyeXpI?=
 =?utf-8?B?VC8rYU1RL1k2SU91WG1nSGtJc1dyVjJtSHZqMDdKTzNHZ1B4dUlTNjh1TmNK?=
 =?utf-8?B?TGc3Q09tak9Lb056U3J4TG1BSTdWTzAxbWtHbTYzcUJyY1FESmdyb3RwM0hS?=
 =?utf-8?B?RndxYzFwNzcrbVZvVjNnVFM5K1VlalBhUTVKcEFOMnJYTGQrcCtJRkwxd1JY?=
 =?utf-8?B?OUFJVkpnUGZqODZkWjM1RUg1MmhvWDhHUFRIQ1NiOG5qbTU0L2oxM1ordVZ6?=
 =?utf-8?B?dUYraXZFZVhzVWwrWVBpNFlTVlZERTROQ05pUS9hLzZQWlU4Mkh0QnQxTVBh?=
 =?utf-8?B?ZVIzalVsQ3E1WnlyS1Jvcm05anlBU1YzWkZMTjZOVW9Kenh6YVVjdUIwaHJF?=
 =?utf-8?B?ZnFqVy9nT3Yzc1pLWnRidjJWZ0lYbVdKc3BDUDZNWE9aczBYZmg4eWNLNVp0?=
 =?utf-8?B?ZnhHZGFmN2hPbWN6MWtwbjF2L0VLZFFvRVFIdVI2OGw0TzgrbjRJT3hYWDdq?=
 =?utf-8?B?VGE4a1RzT2hLMVJmT1FHN00wU2VTVStQaUZ2TmltdythUGRudUYyUStsanJS?=
 =?utf-8?B?WndOTnNHZTZrZmthcE9HMFdaSHI1UXVlWTBBUTFZM2xtYVc5ajFveVJQdWRJ?=
 =?utf-8?B?RnRaTjhvemltd0FSbVdwOFpmUDBHSkR6c1NHaU11alU1c0NML1dvVGJuVjlk?=
 =?utf-8?B?OHY2ZStQS3htdzMxbSszOHBqM3lXZExWWTIwRi9adDFUa3UrT3h5clVOaHBS?=
 =?utf-8?B?Qk5rOUhCT1pEK2Jia24ra3hQb2JwMWpiL0JVZkZEa2R0U2M4QWNCL293QjBU?=
 =?utf-8?B?ZDNEb2tjUHRTL2dpQ1VUdXJXVlRxbnNDeHVMVUozQlpHS3AyRlBOSlRMM3Vm?=
 =?utf-8?B?QkpSSmU1MnZMM2dQVWZ2N2xTSjdEZVk1UzZPNlpHaXk3akp5SXNUQTVJQmZk?=
 =?utf-8?B?bDV5SFcwcEh5UVdSZndXMUo1d2p6SFVMUkRRYzNtM2JUSXdYeDZ0blJNVVFq?=
 =?utf-8?B?eDdVMTRzM1RGWWFpaCthOUR4TjczYTVZTTc3RnFBWU4xT3dkZGZYb2ZlSGRU?=
 =?utf-8?B?b1paVE1GMHZvbzZzWWVVRjdTeG1kSmRuSFBENU0rSnRVck9oZ1plTmVyb21S?=
 =?utf-8?B?RlhFcWZmWmpBWHYremVXa3ZyWXI4WXVoaitsVkhkaW5LdHdJdjRlS3dNQUdM?=
 =?utf-8?Q?AUWbl6QoAzuXb1UwOKcpxidZQuqVWwMm2uTIrHTucO4b?=
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
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e098a94-ec2f-4840-2788-08df2de61ae9
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Oct 2026 13:37:22.6566
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN2P110MB1493

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmFydG9zeiBHb2xhc3pl
d3NraSA8YmFydG9zei5nb2xhc3pld3NraUBvc3MucXVhbGNvbW0uY29tPg0KPiBTZW50OiBGcmlk
YXksIE9jdG9iZXIgMTYsIDIwMjYgOToxOCBBTQ0KPiBUbzogTGludXMgV2FsbGVpaiA8bGludXMu
d2FsbGVpakBsaW5hcm8ub3JnPjsgS2VudCBHaWJzb24NCj4gPHdhcnRob2c2MThAZ21haWwuY29t
PjsgVmluY2VudCBGYXppbyA8dmZhemlvQHhlcy1pbmMuY29tPjsgQW5keQ0KPiBTaGV2Y2hlbmtv
IDxhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20+DQo+IENjOiBsaW51eC1ncGlvQHZn
ZXIua2VybmVsLm9yZzsgYnJnbEBrZXJuZWwub3JnOyBCYXJ0b3N6IEdvbGFzemV3c2tpDQo+IDxi
YXJ0b3N6LmdvbGFzemV3c2tpQG9zcy5xdWFsY29tbS5jb20+DQo+IFN1YmplY3Q6IFtFeHRlcm5h
bF0gLSBbUEFUQ0ggUkZDIGxpYmdwaW9kIDMvM10gdG9vbHM6IGltcGxlbWVudCBncGlvY3RsDQo+
IA0KPiBQcm92aWRlIGdwaW9jdGwsIGEgbmV3IGNvbW1hbmQtbGluZSB0b29sIGZvciBwZXJzaXN0
ZW50IEdQSU8gbGluZSBjb250cm9sLg0KPiBVbmxpa2UgZ3Bpb2dldCBhbmQgZ3Bpb3NldCB3aGlj
aCByZWxlYXNlIGxpbmVzIG9uIGV4aXQsIGdwaW9jdGwgaG9sZHMNCj4gcmVxdWVzdGVkIGxpbmVz
IGluIGEgYmFja2dyb3VuZCBkYWVtb24gc28gdGhlaXIgc3RhdGUgc3Vydml2ZXMgYWNyb3NzDQo+
IG11bHRpcGxlIGNsaWVudCBpbnZvY2F0aW9ucy4NCj4gDQoNClRoaXMgd291bGQgYmUgdmVyeSB1
c2VmdWwgZm9yIHVzIHNpbmNlIHdlIGhhdmUgc2NlbmFyaW9zIHdoZXJlIHdlJ3JlIGJhY2tncm91
bmRpbmcgZ3Bpb3NldCB0byBzdGlja3kgdGhlIHN0YXRlIGFuZCB0aGVuIHVzaW5nIHBncmVwIHRv
IGZpbmQgYW5kIGtpbGwgdGhlbS4NCg0KPiArDQo+ICtQZXJzaXN0ZW50IEdQSU8gY29udHJvbCB0
b29sDQo+ICs9PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KPiArDQo+ICtgYGdwaW9jdGxg
YCBwcm92aWRlcyBHUElPIGNvbnRyb2wgd2l0aCAqKnBlcnNpc3RlbmNlKio6IGEgcGVyLXVzZXIg
YmFja2dyb3VuZA0KPiArZGFlbW9uIGhvbGRzIHJlcXVlc3RlZCBsaW5lcyBldmVuIGFmdGVyIHRo
ZSBjbGllbnQgcHJvY2VzcyBleGl0cywgdW5saWtlDQo+ICtgYGdwaW9nZXRgYCBvciBgYGdwaW9z
ZXRgYCB3aGljaCByZWxlYXNlIHRoZWlyIGxpbmVzIG9uIGV4aXQuDQo+ICsNCj4gK1RoZSBjbGll
bnQgYXV0by1zcGF3bnMgdGhlIGRhZW1vbiBvbiBmaXJzdCB1c2UgYW5kIGNvbW11bmljYXRlcyB3
aXRoIGl0DQo+IG92ZXINCj4gK2EgcGVyLXVzZXIgYWJzdHJhY3QgVW5peC1kb21haW4gc29ja2V0
LiBUaGUgZGFlbW9uIGV4aXRzIGF1dG9tYXRpY2FsbHkgYWZ0ZXINCj4gKzYwIHNlY29uZHMgb2Yg
aW5hY3Rpdml0eS4NCj4gKw0KDQpDIGlzIG5vdCByZWFsbHkgbXkgZm9ydGUgdW5mb3J0dW5hdGVs
eSwgc28gUlRGQyB3b24ndCBoZWxwLCBidXQgaXMgdGhlcmUgYW55IG1lY2hhbmlzbSB0byBlaXRo
ZXIgcmFpc2UgdGhlIGRlZmF1bHQgb3IgZXh0ZW5kIHRoaXMgdGltZW91dCBvciAic3RpY2t5IHVu
dGlsIHN0b3BwZWQiPw0KDQpPdXIgdXNlIGNhc2Ugd291bGQgYmU6IHdlIG5lZWQgdG8gc2V0IGEg
cGluIGFuZCBkbyBzb21lIGxvbmcgb3BlcmF0aW9uIGxpa2UgcHJvZ3JhbSBhIFNQSSBmbGFzaCB3
aGVyZSA2MCBzZWNvbmRzIHdvbid0IGJlIGVub3VnaC4NCg0KSSBzdXBwb3NlIGNhbGxlcnMgY291
bGQgc2ltcGx5IHJlcXVlc3QgdGhlIHBpbiBzdGF0ZSB2aWEgYGdldGAgYnV0IHNvbWV0aGluZyBs
aWtlIGBwaW5nYCB3b3VsZCB3b3JrIGlmIGl0IHJlc2V0IHRoZSBpbmFjdGl2aXR5IGNvdW50ZXIg
d2hpY2ggaXQgbG9va3MgbGlrZSBpdCBtaWdodC4NCg0KU2luY2UgaXQncyAiaGlkZGVuIiwgSSBz
dXBwb3NlIGBwaW5nYCBpcyB1bnN0YWJsZSBhbmQgc2hvdWxkbid0IGJlIGNvdW50ZWQgb24gZm9y
IHNjcmlwdGluZz8NCg0KSSB3b24ndCBiZSB1c2VmdWwgaW4gcmV2aWV3aW5nIHRoZSBhY3R1YWwg
Y29kZSBidXQgZnJvbSBhICJ3b3VsZCB0aGlzIHV0aWxpdHkgYmUgdXNlZnVsPyIsIHR3byB0aHVt
YnMgdXAuDQoNCkFja2VkLWJ5OiBWaW5jZW50IEZhemlvIDx2ZmF6aW9AeGVzLWluYy5jb20+DQo=
