Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010071.outbound.protection.outlook.com [52.101.228.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD4952CCD0;
	Tue, 22 Sep 2026 10:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790071730; cv=fail; b=sifj6+c36NdmJbg9/Ul8kQDnfEVNHLi0mvOmq4BAeREVXvRpeReMpp6tb+TUZ3WpzvwP1lfxWjzeMAhPxyEAIwopRhWlPD956Z1yGqDR1r/5Igstvs/sFTAOflZJNCYJcwKZ8yQmoppZ2vYnAEZ8X4/Q6r523NAy6OetSD6dtPY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790071730; c=relaxed/simple;
	bh=Gnt4hLSQTVIvBFWSA45zBXNBawiFLTtU6FhWXJOM8Nw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UitXbGA9VJHiX76F/Eo2LPoUIdQ7aqNBGOU6KJ8J1BBqWjgx0kcS+/rscyUukdNveh89WFsGoyRvIYUutIQZju9NSsXBBKQJDrTYFAmVJ8R7eDXtVc/DtBX5AlHzPmbgrd1rUZQlliRwtET9FCJDWdZgbPxc+5NdlUD+2yJ9LbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=bFkPQHCr; arc=fail smtp.client-ip=52.101.228.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="bFkPQHCr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zj96HZxuv9LbNGgVGwwa3ME/iv1Ac/d4VlZLKmlwHr4lhOBNO0ZUe9nnKJm1C/B6YYa8o7Ae3E0dCVQVWaAUI/xcAKXowlwqUYhyZCIyKUMVa55x+f2jA7O5LrZateZvQqYwfCUIl9gjK2xKrSR6GiBD0+Ai2l6kb1kZYv8vxHkuZXfjWLJL/Af5Y1dv82DS9nL90WqG92QAwQw4Xo0bhCSbN/9albO4CTcjRIwo6BsNxQp5XoBdhZneSO58K4eOmD/bzyNTHEW4zr1pM27soV2UvR+JhIqTgFZIuBSZI8or/QKKSRkSjHboviamEA5sBtBkSQOA6rlTdsJoToYtlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K6MHvAGB3X9mcXuK4F7JPPKcYDktsw860ImsPyK12/c=;
 b=VQb/jDwJfJwCcu/fBx0HgHwIKswULLvbY7mkV+YdYWxsuU5QkR9eXsEec2j893q4cU3cSKkTxZYmfxMGpSRdxdFMl1mtT3KV9mSw1A+2Rm3iIy/DXmWXca/8tAfkqaTdgvdu7APO//PLPwflGck6uNGmrgQus6aG/CQy+sTg5Zv9Ir5j4Aa7B1678Ksgvgkablou97cWWyhyHK2PF/dLv7q9Z8p7NjBaPmosha/+3m0prKSDS2HM/NfLZCUX7A+S7LZQVwh6SugD1cdHKdDsRRiaAc65xngyfAlUkCJVFsLiAE4EvXgV6zPgjHFugRVihpuAWoUGqrAO0vj2ZJnaRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K6MHvAGB3X9mcXuK4F7JPPKcYDktsw860ImsPyK12/c=;
 b=bFkPQHCr40p348xhLgoKVyDaAnc6f2EZzsOpH1MHS3YwYTiOqz5yYomg6NKRJUV4eqhFFtdOX+2vpZdDgYJqQXdaZ9Irs+Hih/2T2Oz3XCcYfEIsrcGF0WA+Qxg5YrDno8rd0yQfeJ3C3WibhfZlgf5WaC1cpopsvoSv0QX4ffQ=
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com (2603:1096:400:448::7)
 by TYRPR01MB15121.jpnprd01.prod.outlook.com (2603:1096:405:224::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.16; Tue, 22 Sep
 2026 10:08:38 +0000
Received: from TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::3468:d7ea:e817:1e6c]) by TYCPR01MB12093.jpnprd01.prod.outlook.com
 ([fe80::3468:d7ea:e817:1e6c%6]) with mapi id 15.21.0428.011; Tue, 22 Sep 2026
 10:08:37 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: "Rob Herring (Arm)" <robh@kernel.org>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Linus Walleij <linusw@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	"magnus.damm" <magnus.damm@gmail.com>
CC: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: pinctrl: renesas: Allow power-source
Thread-Topic: [PATCH] dt-bindings: pinctrl: renesas: Allow power-source
Thread-Index: AQHdSiCRDl0Do1MQz0+pWlKss+A7lLbaYEVw
Date: Tue, 22 Sep 2026 10:08:37 +0000
Message-ID:
 <TYCPR01MB12093ED5954DA2226ADDD6B07C2832@TYCPR01MB12093.jpnprd01.prod.outlook.com>
References: <20260921232551.3129244-1-robh@kernel.org>
In-Reply-To: <20260921232551.3129244-1-robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB12093:EE_|TYRPR01MB15121:EE_
x-ms-office365-filtering-correlation-id: 3b4e4c0c-8275-4b0d-b4a6-08df18917856
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|10067099003|56012099006|6133799003|18002099003|22082099003|11063799006|38070700021;
x-microsoft-antispam-message-info:
 palOzEBqBNwASQhi5SPUDekX1j8yKUfP9/US9CeduV10HlWFQfbViWT+LTEbOBp2+QIhWGDRXHYO+uS7wIaUjIExTO3wv6yzJDTGamI9aqpGXpTtRddj1+EpOxXIJ18MDywFNnoGtZdzLA0UESVVJZ99ra9QOBSOsfvuplxcqA560ULZV7IJW3zNvtwVm6C+I6tspCZY/ZXTOJ1TODB45y3FVspUDfCMtoq2DpWxRxFkkGf/inLs1cNJ7gS3YQcTuUPX/VKvqlvgDtHsuh4CEAasWQgnA8hCwaX+XlgmRHVV/7vrIPdT9A9/YMdbY9V61TW+RLqWmg9A2pdUkQjoaZrDD+kSgBX9LoqftjX9IWTIdSm9f9diIr2TIaVpAn0GkdLunnOijY5NVK7o+gZrK6bgGPRthV1IWLXEuyXyGvayIWos6dHO6jtWn0phB32WnvSdkpJYvWKolaa/pNQ3mGr4EnMEk7hEHCBXIMG/9qmUAmcvZ5W67nd641/aLVURWuSKrpCBy1AsLc/TUh/uY6KNU19Hzb6qcFzpoCNKtpH4TVM13Xr4d1sPiPFwVYpEDNbElwSRO8Pxlg11QHnweVGT9l71hX4blA3LFV8amqEccNR8H7u7NkVV4fcwKHWv2U6oXX8Z0scKpaAmoVgT93EqdwfNpEZVns93fAK57pRY/y8YVy6wKZoSCYwjyZplh74jWEkCKmujSPVmnzIMhe0iW6TL+ACLZABQEGMkklk=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB12093.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(10067099003)(56012099006)(6133799003)(18002099003)(22082099003)(11063799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?cJLFbSArbQBj0qxFbNrdC/ZKkysgNj2c7KDw7NbqKJEFyfSiMsrdlc8AqAMk?=
 =?us-ascii?Q?YxFOWn1X7Iy6SybLaP2aEykdlteEg0fFVrtNKFnjCNN6YnyWtkh4RDuZ8am1?=
 =?us-ascii?Q?I1jRihv8LGLDJ/1RsSNiG3HFxz+lp3w7m0qe9REM5soNQF1zvc0+pdMOV5++?=
 =?us-ascii?Q?VsKAI2xA4gBWTM5WcKxXVl+p3sYwc+nQaGMy2pWvzk7WojmQR2VazVDDumpR?=
 =?us-ascii?Q?wwRvZMXr9nuXAa4Wxq4Fr1brDQ0z0BhVfUvoSr5gIdlgn7adXKZd2Lh3wFRZ?=
 =?us-ascii?Q?pKuGdIP/78OXgCGCdMbhpa9bkDqHKrU6jX00mh4OwVyp2md7CzA61sEIcRHZ?=
 =?us-ascii?Q?hXimSFw4vHxzRCODIRvVeMn/aMDTf7HRmRm2TwUBigLfGwbshpB4FB7z7i4n?=
 =?us-ascii?Q?hXmLkVSdGk9bVh5+8+Bojnafx7GqvivSgmXP53h9ncD0fxwea6qzbL86wWMP?=
 =?us-ascii?Q?y0vq8T0T4cxb3IjF36hyLGG7sTMsIAZLA72NRXdVlOMFt0OQv4Mi4nGNowFd?=
 =?us-ascii?Q?kbdRPc2KFMNmNri5CQ3YIfwdOJWx15J7adSEUBJyqR+yAm1qDQvv2R+ZaczU?=
 =?us-ascii?Q?H4y+phuzlj1HRbebbUIFyTsj1OTTTda33FNG2KQVLbY7dlB3moojJVe1NkPn?=
 =?us-ascii?Q?4mar+yAQK5JhC1hVLt7/rl31G7+OHti2kC5p+/92GTHiG0z+mCF1cTLNTgZN?=
 =?us-ascii?Q?HcM7SCC/53PpgKzCaX8UiIYOZdtJAnEZntC0p+bz1IK0Sy3naC99H+h6pP/L?=
 =?us-ascii?Q?i7UFnbmB4wTLnXL2Flc4pOCh7JpYxmWzhjVwmLGz3ZTPiZN0phHpYigPrOOo?=
 =?us-ascii?Q?FlG413h74ziuPiJVpE9VZSoFul7Y2mTNXqnbitgKIRJsl3XH/rC+0mT4edc5?=
 =?us-ascii?Q?a3/pY3DuCE41BXdEFCfD1tmC0cgtHHgF8d+asKmZu3a7wjYiltkDz8S9erpM?=
 =?us-ascii?Q?HzRUXySRxJl8D/zCtgD9fXEVwAWSbdJjHylax6geCV229xPD5JgDTnU4+EjW?=
 =?us-ascii?Q?tvCBunerJFNPiTMwpBI/Dy05Me8xUi6RSNwxrlRTFVLglLW1RpFTDvJF6TVC?=
 =?us-ascii?Q?vZM8qKgX/cev8jmEsXVh6OLvZhD2+04kvfEDid/P9Sjz2Gcbh2ASAzQxx4TN?=
 =?us-ascii?Q?AdwLlQ10t8g0lW01r02CogFZOB+MYNfjm6V9mOaCLyDv2h41qRqbZON9K/GH?=
 =?us-ascii?Q?VeH6/p7paeZIcISvzfY8RI+fklZWX0cUxh71vLqfUlBWHeVY2o6c1v4yAyFo?=
 =?us-ascii?Q?EjsyvA9OfP2fFpacfcYBg4QIyzjrtJRbT4UavIP6n67fFFXvMZJCYPXvpFut?=
 =?us-ascii?Q?oI0mYWIsc3moUbJEIgKaUjjkYSWdgG6Q8kdJinB6YT+neK5ZoJBH0tn1enTm?=
 =?us-ascii?Q?xARqqA1lrJf/TaoecMKiGplCFuU9zroQfFfr/UXo4ZO37lv2b6/qNAmIbwhN?=
 =?us-ascii?Q?Du/4VrNJYUskDDp+biK+7A1acAzJIU8i9HkjXFPTJ4mz8rUgyrUj7rnmevVo?=
 =?us-ascii?Q?SIoR2YFRemui4fo9frKh+xQS7IpA+7lAIbZOLs9cZh1Y2PyqgcD5Iz3OdjXS?=
 =?us-ascii?Q?ZKUr/pefUXGrbjcsmOstIMjsBUct6ONS2oEMzZt6/Fg/55YwhymRzSRyuK3m?=
 =?us-ascii?Q?QyiMC3plObSAlLQeZJibwXxWeeKrVqhiRMnflwzlz4JCrHSoj/+YsOMcoT8m?=
 =?us-ascii?Q?CoZDI40i9+pkGbKIg6iXtnrUtmzOuU36tkVQeTBQ+EwHe8YRJcf+URa4ffwR?=
 =?us-ascii?Q?/e21N8gDnD3Hw0YTAq7MjMIVEsstAnc=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB12093.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b4e4c0c-8275-4b0d-b4a6-08df18917856
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Sep 2026 10:08:37.6956
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4SpraNvhiG+Sk0wzuuGHZFz5m2akZJHJ9ytg97OLLSRfWb9sXh315WPWOn4hFL1DB5CV8E5ULL3pKzQlacfzjooNBpqd7g/YV6Ywc+0oHTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRPR01MB15121

> From: Rob Herring (Arm) <robh@kernel.org>
> Sent: 22 September 2026 00:26
> To: Geert Uytterhoeven <geert+renesas@glider.be>; Linus Walleij <linusw@k=
ernel.org>; Krzysztof
> Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; magnu=
s.damm
> <magnus.damm@gmail.com>; Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Cc: linux-renesas-soc@vger.kernel.org; linux-gpio@vger.kernel.org; device=
tree@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Subject: [PATCH] dt-bindings: pinctrl: renesas: Allow power-source
>=20
> RZ/V2M pin configuration nodes describe the I/O voltage with
> power-source. Add the property and allow the 1800 mV and 3300 mV
> values used by the DTS.
>=20
> Assisted-by: LLM
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

> ---
>  .../devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml     | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinc=
trl.yaml
> b/Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yaml
> index 88b2fa5e684d..f24d05136f19 100644
> --- a/Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yam=
l
> +++ b/Documentation/devicetree/bindings/pinctrl/renesas,rzv2m-pinctrl.yam=
l
> @@ -73,6 +73,9 @@ additionalProperties:
>          bias-disable: true
>          bias-pull-down: true
>          bias-pull-up: true
> +        power-source:
> +          description: I/O voltage in millivolts.
> +          enum: [ 1800, 3300 ]
>          drive-strength-microamp:
>            # Superset of supported values
>            enum: [ 1600, 1800, 2000, 3200, 3800, 4000, 6400, 7800, 8000,
> --
> 2.53.0

