Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011042.outbound.protection.outlook.com [52.101.125.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84D03A6B68;
	Sun, 13 Sep 2026 07:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789286152; cv=fail; b=qeFZIrmYzTsRJzOxFp4GzPIz/ymsXfmnml/z/THK4lZTqVyfS7wqyEWCd+/yvNp9aYgv6bMrxsbPLPB9tA2ybez5dFJMTn4c0oW00cEPIPhLx7hp+ANckGDx3hIl6TF5od7/Hxe1R0zUEmKobmEjhomZU76lMPg28ArNjSmizxY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789286152; c=relaxed/simple;
	bh=3pbY2UNGSx2gjbA9YsMoHmKvnYhA8d6pqDNsawMoW0g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nR+ThYw5XrhDrUxRuAWOHDsHDtftXdOLSozNK4tGei5rR9aXD4qpduC6115J+6Myry1NDuqHavG+QG9pkAK4DohZKXx02wdQoLKMNK2Uu67Fp92pyrZE5pJUliV8AzxI4cLZepo/Qomr0jzQUKqDUSTAanQ9bwkGolXQewK6vT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=nLrCuMO2; arc=fail smtp.client-ip=52.101.125.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="nLrCuMO2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BA324tjbiQ1+zHNNdE6pzC48MGQtMg1KLM/EQfHIr/cBLEPT0gTGBXc8hPpkMEwRcwLgpbDk+KdDHXLt9WzWHkQoZ8f9LbyYm7ZaxEsvAoIHksMFJNex5f6jYOVoeXfwz1v9DBfkHhXZT1f4nwr+pWgp2mLrzrJ99hcDCt+w3fB1naUAJ1agqFBDl+Ug79pNtXFQjKi2WLuiHNAC6hAPedOKUfty0GGgtTUHjbUmbognErPZmjcvC7T0ofd5/zOODm1m/jNdVEoL1Jo0GtKghT4CSsAifCmSjrmizkZWEZCFdSRWDNTNxJuvjkoQL5wVlB+GiwAnaxytHPBYhnyyRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=auQLGaLDZ46b8g4O9V3Hy0ZRuZFx5X3855aTuu9vb3c=;
 b=pRgU/nvv1/6SnywKgUs1qQd3kTSPwwzWVoZ3xJ4bc+YVx9V3S0mzSH/tI2HDK/xakTZt9KIqTfxLwg3vQqp6puDM62d7inEA7Gwy0IgdwNzSZf3mWwdFOSMqdjF+PzrWxT5LCOknGaxZmdP7tOgGD76dTEG5K68sLwB1GOvdbNqqLA5yoZWnj4zc6s3KcMvVurBkEsO43edj3ENh58lJhtXcbsgVoIyyIPWO9LR9I7ZIgorhzpLbNCGNzinQq9gQF1nxpbjQwbPchOW8DbifQXlgd3y7GeBzP69Uy1qqzDs/0CfUqCVGh69J1PRlXPCs3qE4jAbget8XBeWuIF+EtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=auQLGaLDZ46b8g4O9V3Hy0ZRuZFx5X3855aTuu9vb3c=;
 b=nLrCuMO2wU2EeLE8ul0p/e3hDUEOoc8Xzuly/oVqqZ+aZY7dW2fEP6sCsh/5gUmrvNa8j62xIWJNkk1Xp/pG64UmKbHZi5V2THK8FnpW3pQi6qUJy0FfRUI7HEIuTs+hepaWj15HLK6gzlATY17XXyRni+t/VZXeZLTVNF9pTI8=
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 (2603:1096:405:29b::10) by TYCPR01MB8517.jpnprd01.prod.outlook.com
 (2603:1096:400:155::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.12; Sun, 13 Sep
 2026 07:55:29 +0000
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::a68f:5c9:9de8:4fa4]) by TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::a68f:5c9:9de8:4fa4%3]) with mapi id 15.21.0406.007; Sun, 13 Sep 2026
 07:55:18 +0000
From: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Linus Walleij
	<linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@kernel.org" <stable@kernel.org>
Subject: RE: [PATCH v2 3/4] pinctrl: renesas: rzt2h: fix reading pin value in
 IRQ function
Thread-Topic: [PATCH v2 3/4] pinctrl: renesas: rzt2h: fix reading pin value in
 IRQ function
Thread-Index: AQHdQT30j4WrZBvibUOOZ3pY3I/R7bbMJu0AgAAAdEA=
Date: Sun, 13 Sep 2026 07:55:18 +0000
Message-ID:
 <TYRPR01MB156192F55869E6024612C28B685BC2@TYRPR01MB15619.jpnprd01.prod.outlook.com>
References: <20260910160226.489183-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260910160226.489183-4-cosmin-gabriel.tanislav.xa@renesas.com>
 <aqZWCqBi71yjl_xg@black.igk.intel.com>
In-Reply-To: <aqZWCqBi71yjl_xg@black.igk.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB15619:EE_|TYCPR01MB8517:EE_
x-ms-office365-filtering-correlation-id: 0eef36af-1b67-4e69-9e03-08df116c5aba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|23010399003|366016|38070700021|3023799007|56012099006|11063799006|4143699003|18002099003|22082099003|10067099003;
x-microsoft-antispam-message-info:
 21ul3ee3Mt72heApgkTNVjKAuSPqWzaWFYAZp84X5GtCs+NMERcPvfBu6twSExaLWxyF+dUZEe0HwPp5nwheUv+ijWAR0lbHI9FFHSpgQPpb4K3FJiBF0XheHGVH5WxlPE198egSvVO5AMnd0wd88QVECVD6UmCaeUQeZqASL1j7BjAGUbqt5Ld+ICOrAzJryYdzQmeWJxO/ZnBMRPFTrD9xYInqhCNswkmosGdhGhLZyjNO3v5drNCshjelq02RWXkM0SEIHTUo+CuTLlbzNCIOouMDK1O3m0zsTISFCej3uBKQVSu7l4UO4WqpWTa1JyPtsyRS2QHBV+0wqqQO0qOif377ycXoXWL/LEHK6qMp6c+f5I7qIC9Rg7ggO0nNEeBLeatlNLlUmfilWC+DDQ9a078l2lv92pTikJEmDmbvndGUZOPbHx+DrVJr3LZ3+mlbssCjC60oyIntMRq3u2ujRghNQS4kkC5c/4NaTUJOqTG4LbFBQrn7VYtzu4ecuN4v99Xy1Uu4f76mqFMxq46oMaORCAWmflfZPXT0oRq8H3koo9nmuvXogN2ltcJZSsYWI/KPuUL9XE/Kwa7HJsZ3ImpaYlGEQXEVE0OwpcANqfD9f06G9VbUBufNzTq8cKjeZipsM0zgIBo0RSY7KEXHNkMiYz0KqVAe4S1DYUvRAWxu3qNLE6CxYddxlPOQ38YGvu5YwK2GZglK8wIkFmvco7lFEXIYA+LwMW+YHOE=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB15619.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(38070700021)(3023799007)(56012099006)(11063799006)(4143699003)(18002099003)(22082099003)(10067099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?yu4d1mPJH4gtSxzkTRgfymJ9uvpnWoDYaolMbSXsEmvPaWzhyGu1hYTLQwSZ?=
 =?us-ascii?Q?0wKuxHGLqcDocpc2c5t2dxn+EQYLIbS8jskxo0E94XydADe7zS8aFMGGro+C?=
 =?us-ascii?Q?tbtEogf1vWBDnfvFhU3Emw3qzWf7YUF7iOkVTaw69hzcYChsG2Ycf8LHCa+y?=
 =?us-ascii?Q?K0G1s1DWWgNF25oG86AeyDZD8LhGXtLlhvsY3CQ7c38DC4EfV7nFxuLlCB1W?=
 =?us-ascii?Q?KMSv3WRNnJ5+UfZz1VwGl90ChkIjAdOuKlCbgk32m73C2fL3uczUfais8wwK?=
 =?us-ascii?Q?PGLDC6atY4rhrE6U+Wmg5oKAXCxWq9joSZOZN8g2a2YkFyfu58F+sqk5synA?=
 =?us-ascii?Q?mMwXoovfnACcEEAnHfVDhTFvTLoD9iCKkLFTBmqY1bliNumWAJVRuee0/hyG?=
 =?us-ascii?Q?2ASn4UGI9e96IgfgNTiERX4/ov7HTJrkdxJ6epCZKI5QfatIPzhu9X+9r5A4?=
 =?us-ascii?Q?p/UPGY0PaLKRMvTyOglrHvh7Q5uyTdcYEFNfUx61S3oc4X5W6ZmPtjEOvj5Y?=
 =?us-ascii?Q?mNhEXtk8hDPOo0L9uVAxpLPL9da91X3evUo8Z1hVGYrguuFr9TPygR4iiklJ?=
 =?us-ascii?Q?sJnrqfAoUl/ioYvdQua1lu5K+2H1s1klOaDcA309tHY84oQdn3PRtFZLDrgN?=
 =?us-ascii?Q?Zto9fMdjlMH+THz0J1YfSOI4TA/kWZimXxqKVa4COQN9JKO5SrNmxYGjVSSL?=
 =?us-ascii?Q?bleqRZone7O07smZkOrERklc5oUMIyImJw5+RbXRMVbYPO8Kl7ZLMaAdoKM8?=
 =?us-ascii?Q?7ntQb63d0EQf0c3VkhEbC4gJVL3F8sHaehieSibBpDlkCPi8VrQCi28Xov3j?=
 =?us-ascii?Q?mk6/DxAG+24yyjTqIuN8ru59CK4l7LnQ/iXRXL/Ve1xLvKUJPl6PdZWkU3VV?=
 =?us-ascii?Q?5GuMra0a1Q/03W7+YUIIbwf7/b/pI6mD/YLN16BgrXN7yod7zqyopGyOmz4A?=
 =?us-ascii?Q?r1psgcjUREEN7YJuYvGM5cduw2LENhxz5izH9wbciBXF9EU9hG/svGBlbtdN?=
 =?us-ascii?Q?mbH/BC/9DSvoLlGHfVGd9BGI65kgzK3BmQeuajFOOmyZeRyr+9hEroxer07U?=
 =?us-ascii?Q?TbymMWWQ3OwwbzdK9sLyFdSLbxmUn9qcXOlF53SKcGA2j+tsM4Re7wYQJe0j?=
 =?us-ascii?Q?dWu7BA6IdDa56/6O1xaLhiiGpazSXg0XDXQx8yq7EM1ccBuOsqRrgBOuyYvZ?=
 =?us-ascii?Q?Pql1ZC4CLQM5dqqj3LQzz8cUHJEdxwoa2ZI6K/vLKokT2WrdGPs5FATyW2La?=
 =?us-ascii?Q?yua4nqOrAp1O5wqKLpjBWEvdJZppH27gosTFTl0YGwH+NCEy2iwe6au8kVwc?=
 =?us-ascii?Q?wQTxH2BgV9F+Pztg6Z9USyVKGXqC03pTvSIPlLThTSB/8k5tPSnbIbWjB+pI?=
 =?us-ascii?Q?8DjuC0CmNvmmV0koXDtroKwHH059Fs9PJ4+RstycpwkyLc2d6Q4cKV/+fN7Z?=
 =?us-ascii?Q?k7H3VUpVSwIrDhYC9bdAQufodX6PzRDlUCeeWZ15om74esx/7/JqZgLV/EYV?=
 =?us-ascii?Q?P9LngfKmehN4xq976NbNbBEsAF+1t33KdpqROUjfxB2Ak5eVWcCnEgG77/UD?=
 =?us-ascii?Q?ZQCVVMSqKpifNSRAdYTras6FqcMTSvm4Rx6I7lbnBsSfHZGLdSQB+JumGCEy?=
 =?us-ascii?Q?/Btfqe3O02JWr1+hl9YSK33ea5xAVsBnKN4X9QDv+0Ajw3Cni99ZQ/iOrkUW?=
 =?us-ascii?Q?ZozpMdRUa5b0Pm47Axx1FldzkJCsxKAd5O94rK7aaHzdPAfBLAD1FymEQ9yn?=
 =?us-ascii?Q?B+9I43XnLFyIj9lMwEGrSHRZIPxQ5FwCY5rlASG4kSmyVtWayuje?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYRPR01MB15619.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0eef36af-1b67-4e69-9e03-08df116c5aba
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Sep 2026 07:55:18.5717
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Mrbt1RQ85A/ZHuuW7tpf+kWUV5H82ES7Td/DhWwUZ1d7vp4ES28LmelVSqy8L3exrC+slm8zbCUXkt1uQJ72VzJ1y+9weNJmrR+erIlEpeM5IbgEDlVyx8ZRZHHenyf2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8517

> From: Andy Shevchenko <andriy.shevchenko@intel.com>
> Sent: Sunday, September 13, 2026 10:52 AM
>=20
> [You don't often get email from andriy.shevchenko@intel.com. Learn why th=
is is important at
> https://aka.ms/LearnAboutSenderIdentification ]
>=20
> On Thu, Sep 10, 2026 at 07:02:25PM +0300, Cosmin Tanislav wrote:
> > rzt2h_gpio_get() only reports a level for pins in input or output mode
> > and returns -EINVAL otherwise. When a pin is requested as an interrupt
> > it is switched to IRQ function and its I/O mode is set to Hi-Z, so its
> > value can no longer be read.
> >
> > gpiolib calls gpiod_get_value_cansleep() to determine the edge's
> > direction when a line is watched with GPIO_V2_LINE_FLAG_EDGE_BOTH.
> > Non-zero values are translated to a rising edge, zero to a falling edge=
.
> >
> > Since gpiod_get_value_cansleep() ends up calling rzt2h_gpio_get() which
> > returns -EINVAL when the pin is in IRQ function, every edge is reported
> > as rising.
> >
> > When using the IRQ function, the input buffers are enabled and the PINm
> > registers reflect the live state of the input.
> >
> > Report the input level even when the pin is used as an IRQ.
>=20
> ...
>=20
> > +static u8 rzt2h_pin_read_pfc(struct rzt2h_pinctrl *pctrl, u8 port, u8 =
pin)
> > +{
> > +     u64 reg64 =3D rzt2h_pinctrl_readq(pctrl, port, PFC(port));
> > +
> > +     return field_get(PFC_PIN_MASK(pin), reg64);
> > +}
>=20
> This is a dead code. Add it when it has users.
> Especially this is weird to have in the patch with Fixes tag and Cc to st=
able@.
> Bad rebase?
>=20

I forgot to move it further in the chain when the original usage (which
used to be in this patch) was removed...

Sorry about that, I'll send a new version to fix it.

> --
> With Best Regards,
> Andy Shevchenko
>=20

