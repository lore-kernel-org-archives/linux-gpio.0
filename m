Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011011.outbound.protection.outlook.com [40.107.74.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95B8C45D5D9;
	Mon, 28 Sep 2026 07:32:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790580783; cv=fail; b=tLsKjBKau7Rpm40gOvskPrI3GgihooplQBkcBHlhzq15ilP/4bILwme6imPt1sCP5zGxsF5CpCEFdALnrd8oegHB6+RSZqK2RBSX4R5kzY3PVmoFnejYvHikGQM54g9Y0lkCp2uPUI0aJAwt6l8dQB/Cd9CUMXzO5LZOHxe1JpE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790580783; c=relaxed/simple;
	bh=bYJEYm2UpHfX52juwPGypnaN1qSkat6uxVTbY82LBUg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=d8diUDl42usx72nsGkcb+xLZVRnHYcpM7gbf1TxOg0n5tesY8sYhdKM0wwPIrccjzHIu6UZ8UPtChtFd/x/UxlMEMwatx5vWuaEbIBD7UX2xNB2wdkxW0hMKbkYSFpNu0U+wliOBPA6ZJM9eqetn/SXXMWoC3P+guGK3+qpxTL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=nMZ/qIpH; arc=fail smtp.client-ip=40.107.74.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="nMZ/qIpH"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VBGyilNTFSwk04svidTsn7VVLesp70ViSpJkiFb/Vyy1uuaE8ObgqcnNkr7w9W5Fol1dOvZ/4j5WMOyARxBnc40e2SEz1Ef2p2E1YSMaOh9hDdSGZsfG6Wx6uuGf1s5G9Lip3Nk6m6IdgiEZNCWw2UlNPYJX2smfTL/bK29hCjnKEl28P3UrmIH8tsEAiu8ekUY9F+9XCmGk5p8QxB5zmWAlFhdyKiWGAsBKrLvnEj9AL7g+uvAqGP5nHZ5gEcNNUsRP0ui1wKUpkRs2nd16tXwCw0r+A3PaGk7VJEf3XYg2UDmy2wEKmGOLwWKWuEy3/6xyC1Hk0sxdudQqkx2L6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A53cG18zaJtYVGwGodHmYQ2g/YomLHgHNNaeAeyNFHY=;
 b=LU98X5ukDVMbkQ4Rdw1kgn2Pk8B+NGIU8Sezojtx0PsCbz30HPt+/9okQQaFcZTrh+6W1S56v2cKIMgnyRp8De64YGvOFEbXoPVrocA9rxHTwYgqF4M0IF0LGtanizYv+OhfxE7rrasSdRpJHtSpPWqrIjm/LoZCdIJfSOPC5/VjlxnwsvXx12UyLWstGofP2sDrkA43PCx6eVDJsZsb7Mxdu+fKppb56+e9G+T/DRO0GMAVJd2C7q5RhsuSPzvQn+TTi0yR20ZUL7Gs3UHyP7wqfdRPRnV7hTQqb1hMlONAD3SdQ8VF30k7toDSWgwcgIeRKL96bKIm/1pBe9zxqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=A53cG18zaJtYVGwGodHmYQ2g/YomLHgHNNaeAeyNFHY=;
 b=nMZ/qIpHbA0celQVUyvGudAISmZCQ8mwCQxs6kBcr2Nk4DPTZyr5GNg+wia+Hw6s38tygNuEyjDXBp6nU4Er0apI3RjbNb5Ywi4hDEkvtgQdjjS2NCdTeFddcb48/LNc/ggSrAOsluh2ql663vYEKBvquRpkA7jy1gKI8EYwiIM=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OSCPR01MB14824.jpnprd01.prod.outlook.com (2603:1096:604:3b1::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 07:32:55 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 07:32:52 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: jiale yao <19888972804@163.com>
CC: Linus Walleij <linusw@kernel.org>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: Re:RE: Re:RE: [PATCH] pinctrl: mcp23s08: reject devices without
 match data
Thread-Topic: Re:RE: Re:RE: [PATCH] pinctrl: mcp23s08: reject devices without
 match data
Thread-Index: AQHdTPMcx8CFgDS7T0eXq2w7rRWLsrbgohqAgAAGNACAAtp7cIAAGDwAgAAApUA=
Date: Mon, 28 Sep 2026 07:32:52 +0000
Message-ID:
 <TY3PR01MB113468365E8ADD0FC214135CD868D2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260925133804.2231004-1-yaojiale02@163.com>
 <TY3PR01MB11346E0C01A9337A3AF4D97DC868F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <34472b57.1961.1a0dd3dff12.Coremail.19888972804@163.com>
 <TY3PR01MB113461CE3C9EB4A175879F5BD868D2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <1186ef64.63b1.1a0e6e70a59.Coremail.19888972804@163.com>
In-Reply-To: <1186ef64.63b1.1a0e6e70a59.Coremail.19888972804@163.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OSCPR01MB14824:EE_
x-ms-office365-filtering-correlation-id: f5b063d1-fbb7-41fd-bf5b-08df1d32b4a2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|38070700021|4143699003|56012099006|5023799004|11063799006|10067099003|260925022911599003|260925021911599003|260925021311599003|22082099003|18002099003|6133799003|3023799007|13003099007;
x-microsoft-antispam-message-info:
 k7mSjFUnlHGiZlbEdt06fINv2MO2PYcIccYdJKlHafm8ghiktabOvXmQvWo4jcV0i6qwbczJhiLESqJAplTJ90K2XTRq6y2Yd/VZClemUuc7+NVUHlSC1Jibra496HGY2Ziyp7aJAYjP3myLbt4w+nPKLDBquYx/SaOHgTLsKL7oAd3NW9OXHhfeUbgRHbAfAHqHFG+lCz2Kk++6QFfQ1IngcQbKiHjm78xhDhWtwmLOjnwF8Ywy12hH10Y/BD+eMw7kXGiePsYb8A9iq/pJKZj6Rg1bmTy3YSnQli5SzROIXWV/8Q4EgcJq+aRSIwp5jT+T7B2DEQveWHJZhvg0PbeXux15sm7RrFe5jUxjZCgPvCtf5FEcVd+ta4zkn21CIUqpJyfXiUptxnRpMYckp7YLo/roHhCYmVJ01dazD+rGcbXHZetOISYVabpJCpMmqJeOcdknHb/bywn8mIqHDmhRMPWIRpvK+Sdg5B72qKIoJNoRS5tP8hSftWU/7TSFp0zjH3LmHKjbshfIQcuxmQH6FiCUA6O7mbzJWrpaVePWABRFqnuYuWYiZQfEZVSd3QBzNN3zfnYbvv9tQpr6nlteMRev68Y+rPRhMTqYyHN04Axto3Xvm5ZLV90+EGQp3MukFBjnbK+COlafYzpdRilh2VYwUpvhuKVJuCaJdmW6vM+5Z4qIlYZWEALTcJU9+1BVTq/UwoWnWox3zSXAp8pFX2nPrcZ9z/GloApOU/M=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(38070700021)(4143699003)(56012099006)(5023799004)(11063799006)(10067099003)(260925022911599003)(260925021911599003)(260925021311599003)(22082099003)(18002099003)(6133799003)(3023799007)(13003099007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?8N7t4WZGAD+mpdY1GwqatAu+BBZkaQRxB25q7v109u94uyjAfXVcjGgdk4Ze?=
 =?us-ascii?Q?z9t6bKmrNG9PMK9Y8GD5+6YzxOdrhf8Wk5sqkOTULL90NyJykCMZg2OsDVy1?=
 =?us-ascii?Q?qyYBS1DADHffaAft1RX40mYwG1ca6dl9MCdxtig8Se6DUfnWrL4zcucjKvU5?=
 =?us-ascii?Q?Ed9cmSFhJuKnMYTZoO7u/+B5mIzZDBkAl1ganRRvAqJdgqzp4nHqmAwu9U9j?=
 =?us-ascii?Q?l6JSASq+f90XTyIBtTpztdtb7EKczV8jNQhBNx61wnOFMG4xHw8o99MvHWOC?=
 =?us-ascii?Q?wNywhk7X4+hbVOTi9AtR3tuAymRkiLbzFWRqW/ZaFQstjvqWp/BlpGppgiUN?=
 =?us-ascii?Q?+BtqEyKrBYZEvXrmil3hZtZmMZixN0raB23/154YnspwX9djTYdmL7QvhuIP?=
 =?us-ascii?Q?6d+yJRYFK/JNP2DIzBRKrqFkgLitX4Ca+LxbzDcR7EF2CfgvvkzNMZnwODM5?=
 =?us-ascii?Q?x7N+pouI6dBK9BHjXjHC/+ao0JYJWPIGlUgE2/74b55qUPJjNd2EOTO4MG0O?=
 =?us-ascii?Q?V4aB0oqGN49wpxWr+JzyGXXKvAGhugpA+rRmpQ8IAy8K9oPrCaHHOGt+5FrY?=
 =?us-ascii?Q?itmAEnxQiwERptm8RgxRMO0yrLBNwM8ueZmpyVaD0zFwfdCuMAPKoXFOdUAD?=
 =?us-ascii?Q?clNm1BocLJn7neU7Km+Tcp3vcAzbBrGehvQrphOO4pnnaTXmeT23Ew8P7DUS?=
 =?us-ascii?Q?/RJ9TmDijcW/guB1Qz2BOeMzQagC6O7vhNMPyPk/9h+5HN8ulEbNU0MrMjKL?=
 =?us-ascii?Q?vDFt0gADGrp8T7C9hgvHSNOqVd/UK3cIDzpjAljHyLwYpZYfZ/9PJb5rDgAt?=
 =?us-ascii?Q?lmsjuHeewAnd+S6UZlxm58J9q6YlfG37kz+ZV2PR58IxFzoWmuHQWn8PI7h9?=
 =?us-ascii?Q?aDoT5gqLXkSSkyERzHU1zvhUKXiY7ACwJkwKY/7qwwwMvCDOf6r0LeZogZxL?=
 =?us-ascii?Q?VWvVaKGxi+C2vnTlXFIwhCxOtYqlXB9QuJVuTReUfkZHRf5m66aJeFvocp1H?=
 =?us-ascii?Q?Da0VzrFdXiwbK0z8JnGwwSterqNUvTtehz/XNklODlvR8yvSVueTqmWPAWyt?=
 =?us-ascii?Q?0InOslWArfWkKscpIZiEmJh8DzQ60gQlKny82feZzoKCV/1HEEhkyjUBaUwS?=
 =?us-ascii?Q?tSCGcydHbXCsFFCLcnlhIgOp4J2B2tUuvttfmcJ0HwiALgusGZU28t18VwSI?=
 =?us-ascii?Q?F5PfrFM2p4Tt27IQq1uhG0hpKurifn+J65vheiOFYuPInKmxd0Ga2WMG4jil?=
 =?us-ascii?Q?bznN+sj3CQTZ2S9I833HAHiqFsBBRMWYEtSu23cUjiSJpw97FDxYkR45qEFa?=
 =?us-ascii?Q?RyDC80n1Vi9p7IHCAoCBEhMuOtwztHl1YmjXPQ8uKtvvn6DuUV23oSzTC/o4?=
 =?us-ascii?Q?xpCJ3iKIPHISZjLNsc00sZBV4DzgzQAYEp8QwyQUV5yzrKTpj92/cfFjITav?=
 =?us-ascii?Q?RFER/68CpuJX3hzdMXv7LGhjyGqRXuWIvPdlMaqOVwtKW1P5Tfn1GWoYZsgF?=
 =?us-ascii?Q?hB8MHW7oloV5EcpEtOMjd6bQmrq/anqBuKU85VfCpu5PRpz34X8fNFzrJQ3l?=
 =?us-ascii?Q?55KrP21gqepQIPy9SAAc7naLO/WPWJGWiKJRSSdu/zx/MpNAVirmMMj/9WKv?=
 =?us-ascii?Q?IMyqzuuOJAMB1Eg1i854b/rY/8uBexLuEDgBs6NAJaE8A1NYsuWJUGtUsDKU?=
 =?us-ascii?Q?1uEql8LWsVLY60vrRk7Eki8NvasXu8W9IuhOU1sVgYIJeDR2kcOac7xZn20/?=
 =?us-ascii?Q?Bk6CtFQnkw=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b063d1-fbb7-41fd-bf5b-08df1d32b4a2
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2026 07:32:52.5710
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: +gZ/O6NgXKNEVQgcDV5nYagm8hB5pwUdAcrN/AQXGylNbYvzD+AxBfyzG+ypF3flijhOjLaybr3WJ7wLrV2eAoUMzKQh6MwC8Wbjf7L/+KE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14824



> -----Original Message-----
> From: jiale yao <19888972804@163.com>
> Sent: 28 September 2026 08:25
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Linus Walleij <linusw@kernel.org>; Andy Shevchenko <andriy.shevchenko=
@linux.intel.com>; linux-
> gpio@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re:RE: Re:RE: [PATCH] pinctrl: mcp23s08: reject devices without =
match data
>=20
> [You don't often get email from 19888972804@163.com. Learn why this is im=
portant at
> https://aka.ms/LearnAboutSenderIdentification ]
>=20
> At 2026-09-28 14:03:46, "Biju Das" <biju.das.jz@bp.renesas.com> wrote:
> >Hi jiale yao,
> >
> >> -----Original Message-----
> >> From: jiale yao <19888972804@163.com>
> >> Sent: 26 September 2026 11:24
> >> Subject: Re:RE: [PATCH] pinctrl: mcp23s08: reject devices without
> >> match data
> >>
> >> [You don't often get email from 19888972804@163.com. Learn why this
> >> is important at https://aka.ms/LearnAboutSenderIdentification ]
> >>
> >> Hi Biju,
> >>
> >> At 2026-09-26 18:07:14, "Biju Das" <biju.das.jz@bp.renesas.com> wrote:
> >> >Hi,
> >> >
> >> >> -----Original Message-----
> >> >> From: Jiale Yao <yaojiale02@163.com>
> >> >> Sent: 25 September 2026 14:38
> >> >> Subject: [PATCH] pinctrl: mcp23s08: reject devices without match
> >> >> data
> >> >>
> >> >> A device bound through driver_override need not match an entry in
> >> >> the driver tables. In that case
> >> >> spi_get_device_match_data() returns NULL, but mcp23s08_probe()
> >> >> later passes the result to the regmap setup and dereferences it whi=
le setting up each device.
> >> >
> >> >I believe this is an invalid use case as the user trying
> >> >driver_override and the probe returns error. Am I missing anything he=
re?
> >>
> >> Yes, my commit message was not clear enough. This patch is intended
> >> to fix a regression introduced by commit 2e44555b05c0, rather than to =
make an unmatched device probe
> successfully through driver_override.
> >>
> >> Before that commit, missing match data effectively resulted in type
> >> 0, which fell through to the default switch case and returned -EINVAL.
> >> Commit 2e44555b05c0 replaced the type value with an info pointer, but
> >> the SPI path missed the corresponding NULL check before dereferencing
> >> info->type. The I2C path preserved the previous error handling with
> >> info->an
> >> explicit NULL check after the same conversion.
> >
> >you are testing the driver with driver_override and your patch makes
> >driver Probe failure. I do not understand the test case you are trying
> >to achieve with driver_override.
> >
> >Can you please share some logs with driver_override that you planned to =
test?
> >
> >Cheers,
> >Biju
> >
> >>
> >> Consequently, an unmatched device bound through driver_override used
> >> to fail cleanly. It can now cause a NULL pointer dereference when a
> >> valid spi-present-mask property is present. This patch restores the pr=
evious failure behavior.
> >>
> >> >
> >> >Can you please prepare a patch that makes the driver probe success
> >> >by using driver_override Feature? Also please share some logs to see
> >> >how it works in real device
> >> >
> >> >Cheers,
> >> >Biju
>=20
>=20
> The test is NOT intended to make an unmatched device probe successfully.
> driver_override permits an explicit probe attempt; it does not guarantee =
that probe must succeed.
> The driver must still reject unsupported devices safely. The bug is that =
it currently crashes instead of
> returning an error.
>=20
> I reproduced this deterministically with KASAN on arm64 QEMU.
> The SPI device has an unmatched compatible and a valid microchip,spi-pres=
ent-mask property, and is then
> bound with:
>=20
> echo mcp23s08 > /sys/bus/spi/devices/spi0.0/driver_override
> echo spi0.0 > /sys/bus/spi/drivers/mcp23s08/bind
>=20
> KASAN reports:

This is original issue.
You want to now add driver_override feature.

What is the log you get with your patch, probe failure?

Can't you make a patch for making probe working with driver_override featur=
e
that makes the device functional with driver_override?

>=20
> KASAN: null-ptr-deref in range [0x0000000000000010-0x0000000000000017]
> pc : mcp23s08_probe+0x2f8/0x944
> lr : mcp23s08_probe+0x190/0x944
> Call trace:
>  mcp23s08_probe+0x2f8/0x944 (P)
>  spi_probe+0x1c0/0x2d8
>  really_probe+0x17c/0x5b8
>  __driver_probe_device+0x28c/0x350
>  device_driver_attach+0xa0/0x18c
>  bind_store+0xc4/0x13c
>  drv_attr_store+0x60/0x9c
>  sysfs_kf_write+0x170/0x1e8
>  kernfs_fop_write_iter+0x298/0x404
>  vfs_write+0x648/0x8cc
>  ksys_write+0xf0/0x1e0
>  __arm64_sys_write+0x70/0xa0
>  invoke_syscall+0x70/0x24c
>=20
>=20
> spi_get_device_match_data() returns NULL, and mcp23s08_spi_regmap_init() =
later dereferences info->type at
> offset 16.
>=20
> The patch only guarantees safety; it does not attempt to support unmatche=
d hardware through
> driver_override.

If you don't want driver_override non functional
What is the point of this patch, simply want to add some
Code space in linux kernel?

Cheers,
Biju
