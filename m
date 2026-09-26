Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011042.outbound.protection.outlook.com [52.101.125.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BC523A1A38;
	Sat, 26 Sep 2026 10:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790417240; cv=fail; b=Ky29tJwLxZci/czdoBo6Z0ZkScv3u/g3DIxy93Ev1vFtFOdLgNmap2ddA1esRsb9jGsszYZlOvuKQNtwkoPlr47GvqE5Z4uCor0S8F3OwCd/E5Qo/9QTalrnWTY8bFWjm4dK0ynsAlg1NYppxtlfzzHaUZtw/ifD0W+cobt08/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790417240; c=relaxed/simple;
	bh=gLHLiD3vPD+bHuEk5ID9xhVBoWcr8OdFudZXV8nWbVQ=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PPXJxIL1tSU+RYnmKANVwbDpDAJhnXruhcgVOWb5J+cQaC4XD73kmf6qOwbdvuUEdRFi37P+oN73HkNHI1M+9tRZDX3sxCb1r8QkAeb0JDQyRURGsUCe6xWQM5nQx1i9PKHlwV+2M0MlDputA5XJOk0/nYarwKlfo9XT1ThzQ8E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=e18bQLGh; arc=fail smtp.client-ip=52.101.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="e18bQLGh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T1nvNPedJW9RTKj31d4BOdf2h2Os8WgYJf7OGAvB8G6Phlt/dZjFB57QD2BYF3xk0b0w3+bVNuCGX+7ikO3//35xH4EPWFDyyefthen9H5pZEIw7nZlykP/q3zU1lG/kePR6tz/R7g6mrmMSlJwioXrCULctZIIC72YP9Vqosjhx1Xs2FAuY2Uc1gBUdQnAZrtssaGOs+I0+OTyTGYlO8ciXTMhmJt3EmPAz0qcWabPLdghVXn0H4uRyMS3L566eWw/oAcP7iNP21U1xZ5DvQdzTj17mdMNBXZBbfyBkOjUPCswkIMiEQHAM9jlJO6PmIcYAvA1nie3CFeEoCosg7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XEzqUX38//kbOJT4FTGXRlhG4x6NHm1gXQzfsVgL7KA=;
 b=c1rYAiR7Oqv3ZyHWxDQmj0h4fs3hqN95kMEbPPYGvcWz1okJSAUoYH4Rvp44XiSOK0cW1a2OMmDT2F2Qw9XUJFGtQpdc38/Z2hlTFu6ApP1vHlfQ7EOR27N3f8p8J1CnA5oJjz38yruOEkYfbtPi9CQpHsU7JwwCfYYO+/D0SS9MsNg7rIzxqjTeo3FrY+5nSQo5Wxy8Zn6HJEUO0LeGkHgZ1XvXGiH6qFhMYC7fYXudvNDguQr1/cfCmAOFDZ5hZjqaeJFj3TwDbBb6u/xS9SluwQxIBjfr2tyYFsLqIwNpdWq1uLe9xWJsIPDFFRjx0nhcHjSuDfHpfr0TG+mw1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XEzqUX38//kbOJT4FTGXRlhG4x6NHm1gXQzfsVgL7KA=;
 b=e18bQLGhrTZfmreiZPDdMvyI0+Kos9RIA6ZCn+G5umsxCeYhlLD+LmzjmOvbEe7Yhs5vXo4+QIw31qaQW+qb/EqGaa3z6NH8pKgjzkGxyjha5Y47m98juxUjubTNXVaYEd3icQm/LhPQStsMK8CVtq5Z3jmjA9r5UNDPq0iVUbQ=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS7PR01MB17833.jpnprd01.prod.outlook.com (2603:1096:604:445::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.19; Sat, 26 Sep
 2026 10:07:16 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%6]) with mapi id 15.21.0451.014; Sat, 26 Sep 2026
 10:07:15 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Jiale Yao <yaojiale02@163.com>, Linus Walleij <linusw@kernel.org>, Andy
 Shevchenko <andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] pinctrl: mcp23s08: reject devices without match data
Thread-Topic: [PATCH] pinctrl: mcp23s08: reject devices without match data
Thread-Index: AQHdTPMcx8CFgDS7T0eXq2w7rRWLsrbgohqA
Date: Sat, 26 Sep 2026 10:07:14 +0000
Message-ID:
 <TY3PR01MB11346E0C01A9337A3AF4D97DC868F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260925133804.2231004-1-yaojiale02@163.com>
In-Reply-To: <20260925133804.2231004-1-yaojiale02@163.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS7PR01MB17833:EE_
x-ms-office365-filtering-correlation-id: 799c4806-fa12-479e-fd88-08df1bb5f0a3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|23010399003|376014|10067099003|11063799006|3023799007|18002099003|22082099003|56012099006|38070700021;
x-microsoft-antispam-message-info:
 u6wFIl4RNF0mebx35L6Ubz8t9l0bXUAQriUjQpOD+a+9bdvezuEY6pMPjdu3K5EtIn07BHfReVuQiuylKbO34OqTbaaX0j+4mNMhd+Ls3EQUKOciu0i3vBZ51dqqkpLOyQUwNDGQNfZD7kf9OATsQHB77ODu+rwfDCO0Ulo7LGCz5GE353Py6jzE7LiHjMkMHy+s16hJgGu+HocpIR+pTBjQtRkF9p9JMoqbDHo2zHyDjrEUnR0/WFqby20+uC5kVfAismDcuaUFIdHBmBWiYYG4qdfZKUFN7jf4aB0z/ZZmJKK9ngMo2LMTfEveB8WIiEQ6mS72XRHLQnzgN0ol3VuhGOlymcESOLuUqkfHWnxhql8jC0zyWI8wWFTS83nqHcA4FAWwNhHon7JfYGOLjs0npUf10lHHes3sRgaNFfCh70W8izH07D8GcDHo1+hy0zHTpVZ1m/+XXCIjpcGuiS1amB5y4uufK8hpAS4dbOlsRJyox46hg1ul2vzQvskiFD6r8ElAc2r21yN0//E3H+SgFQt4N33SOMUtk9Wgtxyw0GqPJoOAdxroER83g3IPK2mGZIBOlYj3/I+ou5iFUkNj9+XSCRBFIl+1GxMi9cPbbADjPVKDXv9bsKdskCKcrlKcBpjurQMQTMqvFIoGrfTjACAE1tKceVcK6CTCid2hjP3ZEUB4R6fV0wTVohdjZd88m0GuTsbwhYuNGIBXyCtmEhWvn9oyMBXc72hZJfs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(10067099003)(11063799006)(3023799007)(18002099003)(22082099003)(56012099006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?SzyctaEk+sLmF0+38PEoJDVx8a+E92739OxShoS29MOpl6wpCLRzHheLzPc5?=
 =?us-ascii?Q?xwB1ulasQG5HxJhYZwjZpPxikMuu1bvl7lNa8vCYYZH0M/mAEEVovZeKzYW1?=
 =?us-ascii?Q?ZIsiNiivQ5YfcL1v74k/Lz8JcunTSTKzCf/0zmwmIqBW6/dGxuUAVdcTWtNA?=
 =?us-ascii?Q?Z7cFFfhrfa06QCs46uZHQ+Mur+CDNpVnZevXivzTYLfU44s6rkc5iH0GgjDk?=
 =?us-ascii?Q?2tDgJtyyxu6J7xJamgD3BlCOkZeVRJcYAGVro1QhzNObkVeSQcsbcUIem5xY?=
 =?us-ascii?Q?Q1OXSI0vI0Kx8KV96+ZG+OikIsIhgrt9mTH+04BrKGRq3P13yx6Q0jOa9qJn?=
 =?us-ascii?Q?hK3t2d+TX3K4qgPSQWAYsra0hIUk6cMGphIODriP3kzj/6XLXWdT0kGOoyhf?=
 =?us-ascii?Q?U5V7hO5HO+bCOhcK/KqcQ9NnP9UoiIHAu63o7XXsdqOl0cZIULR1mAyK2YXG?=
 =?us-ascii?Q?MP4u9W6aPEwJXlYM+6Bf4oN7Lh69WpFfk3+Iu54E9yiM6waaV+noR8Um4JOl?=
 =?us-ascii?Q?sSAi03FgTxp5oTyJ3iNOWdJFxXO2Bs8dO87tU07kscHsUuboeQrttyYuetJq?=
 =?us-ascii?Q?wlYDUoArsyHhtSCvIssBpvkxuw5iIxU4/qZ6K1BMuNuMoHozRaiFhtRypnLD?=
 =?us-ascii?Q?7e4JTqsEJogOjbSmoCM+n+xRulu6iIKtIZAInh0ENGQNszEqzEN4qyBARqUo?=
 =?us-ascii?Q?Sm5vO2s2PgYur0PV8EJ3Ei4GgvXjs4b7nYYJRe2UJuWfNxftSYHjqXSwDiPu?=
 =?us-ascii?Q?ll0xtH+7LwLyMLAArJIERedxQrf9GBUMcwIsuzUpSrcjrTnIdeX76XpDMzyg?=
 =?us-ascii?Q?1qx0yaDmM8kvTX8WJU1U70dh+PfEse9H+5I8grFqIktxWFu9EXp8WqsqTibt?=
 =?us-ascii?Q?dM+i3fwgCYsUu2/L4CCyb/cwG5EaOK4ya7poiG0RnFvtSO/vF6HsMkUm98fP?=
 =?us-ascii?Q?l2/e85KS899tWmbXJzKGDTZLfd2GX1hCe9PB11XK+Bjh3CKfsX5Wv04jhCoc?=
 =?us-ascii?Q?5UFV777e/gfazb6FtJCNU87tjRhudrM4qkgvFPmSEbPypHviHLOP9A2GlNQD?=
 =?us-ascii?Q?9kRAwjzbxmRjVwUkeLAzp8NJf4MWBuOmPljZxo1VhRptUq8VTqQXr4su+Aao?=
 =?us-ascii?Q?gPQNFi8CWQDx/xllxz2kMN/htMSDAVKGaEdtvHHGyyLkivY5yDXQCQWA/d8v?=
 =?us-ascii?Q?KBItrE75MRcimo+zB7x9C5EWuJSFdxP3xXgFuPTSCkR64ucLjKmtV8OcE4WB?=
 =?us-ascii?Q?0f3VBjVSqJL/oEqKP2SSLBmrFMhJ7ocvNKEXMp3q6e+AFZQJieJmKYdwBhOe?=
 =?us-ascii?Q?m1zTEXyYhqX92RpV8IbkyFxpTD7DLblGKaXcjZNaM/auy87dxNvFDqGGIs7l?=
 =?us-ascii?Q?0wgIRigdsztFQiIlPEzNFXW36GqChvb1NIvvrQmVBRhQyrens+oE8VDOF12A?=
 =?us-ascii?Q?A3L98tveJWYSwZw18tukJNecRPkj4DM0Opo65sCir42HiQODcxD+1/Je/HwN?=
 =?us-ascii?Q?Rop5GivqfLw/TiwHVtjpNb7EP8TcLUIWuhRYewqmLBwdsPIcmSYM7h+ODGiP?=
 =?us-ascii?Q?pFlnYo1OyOjmcf0XBgWA1zC82f5wJMXB/sDZNoxEu2TYegn7h5YXwapcRIIp?=
 =?us-ascii?Q?q/Cj5nv8IJgcnly5W3tyJgGFVWVuhI0YqEo1wzQZlF8XWSm/wgPusQoPtvHZ?=
 =?us-ascii?Q?fy3VQ9Z2COIAGidvLRD+NYQDQFUVAGOcmAji5ufQ/fxNnZGlFzX37lbu9UAZ?=
 =?us-ascii?Q?RQ5l62jALQ=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB11346.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 799c4806-fa12-479e-fd88-08df1bb5f0a3
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Sep 2026 10:07:14.9742
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: mKoJFSJeCRx7EKzQz/z7BwE4Z/giEsVMwtIWU8S/lMGd6/UbCyjqTg4lRsbQ8Ti5da5VqRBIT6g0VlJwS0tPPgVG99wErrOadWyiuWG1K5s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7PR01MB17833

Hi,

> -----Original Message-----
> From: Jiale Yao <yaojiale02@163.com>
> Sent: 25 September 2026 14:38
> Subject: [PATCH] pinctrl: mcp23s08: reject devices without match data
>=20
> A device bound through driver_override need not match an entry in the dri=
ver tables. In that case
> spi_get_device_match_data() returns NULL, but mcp23s08_probe() later pass=
es the result to the regmap
> setup and dereferences it while setting up each device.

I believe this is an invalid use case as the user trying driver_override
and the probe returns error. Am I missing anything here?

Can you please prepare a patch that makes the driver probe success by using=
 driver_override
Feature? Also please share some logs to see how it works in real device

Cheers,
Biju

>=20
> Reject devices without match data before reading device properties.
>=20
> Fixes: 2e44555b05c0 ("pinctrl: mcp23s08: Simplify probe()/mcp23s08_spi_re=
gmap_init()")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>  drivers/pinctrl/pinctrl-mcp23s08_spi.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/pinctrl/pinctrl-mcp23s08_spi.c b/drivers/pinctrl/pin=
ctrl-mcp23s08_spi.c
> index bacebcff67ef..926034fcd512 100644
> --- a/drivers/pinctrl/pinctrl-mcp23s08_spi.c
> +++ b/drivers/pinctrl/pinctrl-mcp23s08_spi.c
> @@ -146,6 +146,8 @@ static int mcp23s08_probe(struct spi_device *spi)
>  	u8 v;
>=20
>  	info =3D spi_get_device_match_data(spi);
> +	if (!info)
> +		return -ENODATA;
>=20
>  	ret =3D device_property_read_u8(dev, "microchip,spi-present-mask", &v);
>  	if (ret) {
> --
> 2.34.1

