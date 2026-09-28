Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011014.outbound.protection.outlook.com [52.101.125.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCBB400967;
	Mon, 28 Sep 2026 08:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790582730; cv=fail; b=LQDhfibw8V0EHkGY3QXvUECvgXICRYO6FEdF0LulSFYtoIE80RRyzHNgVNpSJNcG/6y7EZWRbbm1q0Avf3Db1I0oG9KBImyFSkfytibiHr04UOtmTIrh0Py414kIjdGUyJANUR5BvMc+b7fMbvSnHJKlgqwiM+leyBN+UGHWRjI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790582730; c=relaxed/simple;
	bh=VwQxFEwoYtKZDuL0Eu7gujxTKB6ygfCwAuCSSzrZOSo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=f1dhY0v6/XYED+v7r4isZcRDJW0Hg23AgawRxIRPNMSgT04TXf4aofiLMfqrSmE1J/QijEP+IfSEYznhkzNJ+Gs1RtcHtkckxJ37l2ghtbMBOzQWQxFTMpr0JGOI0QUFsNdYzqaGTkL4durvOyrcZQoTZ96yz3Kq1m0ItsCazq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=kiIyf7Ui; arc=fail smtp.client-ip=52.101.125.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="kiIyf7Ui"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E09WqdS3jT1+V9YYlheColhRFNN3SVvOxKuf0S9tcT4hjWt2NG/tZ2j6yZatT4CzWmiEVkJ6gEBoHF8b/w+uKGt2TT/LX2AwIQlh4E7b7DAc5HHcRaC3F+ersqZhxv8SPGFBIeSIGGcNBFG3XvY9cNdvR6Jn8a5U6vVlKeFnLZ8qmI8spN4iOcsGilV+2Dxwbwukhnp4Wo3FdCEMKUmRJdH530y5wrALeaFd5A3PQb7Fy3WwYUWbZKWB8+Ltm0FZBzoXA+BZkWSDzgjMboSF1oDAcH86zxs8OL+9JszdW8NuB0T04zcpbe3SpKCcC79JEnujZr6K0wpvRxvijuOSGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AQ8tRCyixVhwqsWc61Gvmjz/TK8ToHyFAvDC1j1/Ol4=;
 b=ti2jy74RjdezzE0nrRRuuryffTWKEXOyKWe0inQ46ZXmeWtfMIr2JLnmxVU3lZtrH1a9RLX50rjIWtDkdtGbI/l1yCHdpfo60X3D83ujfxg6Loe7f02hOfZJqnnLjzBHaUxKVXRlMyEm6xoZpZ7737ympAv9DGNFWq7cmgXJ/fckJvKUmms4+6qfkhh/B6d15M6McCkxE0mG3BS1FGlaegvvprCRbXWTMnA8H6hMfp1y3JTW6WGX48JHbWbHOXNYhsMX9pRXkbwDm98T43DHlHER1O/8Pox6dZLdXUYZft4ZbfF+o1gs70s+XSL0ZC8Iz9KNGXNF2PFmRXbvT6DDoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AQ8tRCyixVhwqsWc61Gvmjz/TK8ToHyFAvDC1j1/Ol4=;
 b=kiIyf7Uix2ti36CArzsko0MC8Q5HTcJTGXgOzMGYG8z+pM7X7EGCQmIcjpMAIDlzHzZEVOvYe1lDfjSI73I20xasAT9K5eU4kV8GPVcjTgc7rFYYW2bSZeNwD39rQk/064ckOBY9peY61JVxaTWnXC7OByRVe2urzO02kgFDO4s=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by TY3PR01MB9697.jpnprd01.prod.outlook.com (2603:1096:400:223::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 08:05:25 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 08:05:25 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: jiale yao <19888972804@163.com>
CC: Linus Walleij <linusw@kernel.org>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: Re:RE: Re:RE: Re:RE: [PATCH] pinctrl: mcp23s08: reject devices
 without match data
Thread-Topic: Re:RE: Re:RE: Re:RE: [PATCH] pinctrl: mcp23s08: reject devices
 without match data
Thread-Index:
 AQHdTPMcx8CFgDS7T0eXq2w7rRWLsrbgohqAgAAGNACAAtp7cIAAGDwAgAAApUCAAAe6gIAAAT1A
Date: Mon, 28 Sep 2026 08:05:24 +0000
Message-ID:
 <TY3PR01MB1134666FCB97948ACDA5C3661868D2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260925133804.2231004-1-yaojiale02@163.com>
 <TY3PR01MB11346E0C01A9337A3AF4D97DC868F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <34472b57.1961.1a0dd3dff12.Coremail.19888972804@163.com>
 <TY3PR01MB113461CE3C9EB4A175879F5BD868D2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <1186ef64.63b1.1a0e6e70a59.Coremail.19888972804@163.com>
 <TY3PR01MB113468365E8ADD0FC214135CD868D2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <ffaef81.6d34.1a0e70274e7.Coremail.19888972804@163.com>
In-Reply-To: <ffaef81.6d34.1a0e70274e7.Coremail.19888972804@163.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|TY3PR01MB9697:EE_
x-ms-office365-filtering-correlation-id: ae134019-638f-49f7-7af1-08df1d374058
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|260925021911599003|260925021311599003|260925022911599003|11063799006|5023799004|56012099006|4143699003|6133799003|10067099003|3023799007|22082099003|18002099003|13003099007|38070700021;
x-microsoft-antispam-message-info:
 Tdm1VTGvU4U8KLch+kjYuinl2i076HGg+FCFGjYDsnihlQSw4br7qnvhhmjXt8Bsfz3aZdLU0uCBXlnuhwvZ5WSI/TDSpCO+06sXlzuqH7pZIx5H3m57FWPXRCpOmQFBHR/fXKj6KT0yvx5o/NEdMssXJNUrvMxdKthbVv+ZtxJEWqpJqO6DPU8z7cSHYA+0pYcxiRyYMx8DRFs8MMZIfwVxNmDw0js6Rk5vy5oGDU9TInzCsaZJCh4S3dL8qvvjyA1ce1xainCPiNcsSPx82M/KlWASk/gdS1vXRBbMlSHHluujaW1cmd3YdDW6PjwlCcSVC93FOTI/TUetQ+NRTPUQ12VME5nBZ4O5rNQb/jLsT6N5kRRTUV3XpQ/z0+4V1AzAeIIypoVBcpsCvZmwZP+yntnDyRavR6OwcLNfjtu1dgZUhp/dDC53FIide8XstDAQlVWjUHJLe5Haw6XDjAEnLJ5DKWeFHSu0s7gm9X7BeEr5WCU3PZ43WjVPULnD6rU8GS9lQTzbxZfxnkwcfSruTvvRUCABDzDRYbWj64lLEH9Gk3y2ypgpO5XW6D6+1d6gUX68wZemjRuX7rYcXSAu1fDJlEZ2QjkWbQWuiLOeYjHbnZCtLz6Y2jDGYMzBURswmommAQ40cXKC9471t2qpGTA7mBcsIEvXguvaJDVdaPFlmzCvq4B5VlZaTNHpbQFpJ1TtE7+9W1un+fpOfRrIY8edMFS4JfMxWbgrDhs=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(260925021911599003)(260925021311599003)(260925022911599003)(11063799006)(5023799004)(56012099006)(4143699003)(6133799003)(10067099003)(3023799007)(22082099003)(18002099003)(13003099007)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?P5imq+ewxs3cAkv5ILgKJZgsgfBPY6rhk5er/bNaESZec63oN12egHTymSRe?=
 =?us-ascii?Q?qqrKFVs6Ys6P1rzteC6ip5LtSkRQOweiR20HpMxMGw2dNVVsr4p67htzA5H7?=
 =?us-ascii?Q?WrL4dsIukbBLRzZ9xXQ121B1Ux6MNiXwgFTQHvaVCmcP2jvIgdQCYqbsBemW?=
 =?us-ascii?Q?STaY2f4xmoACXOviIQnmZgiDVL2vwhg5YTZiUkJoCMYn+oDpjAMdynm57WCY?=
 =?us-ascii?Q?YOBsPpsP7VmRH6HhYQV3pKerX7V8WG0Gcm4qlu2Ak7kOYINGyG0Az206AHR5?=
 =?us-ascii?Q?2waHKDnBmWzfIr8gcIKHzkoqNoAaYqVX+vg+C2oWfoVF5t8Uq06vGkqiKEas?=
 =?us-ascii?Q?QRY07Ih8DBBnlbVGrjTbC8L7UNRKynTCBMiDxDDLDs9reM5pzxcqSzkZBmxq?=
 =?us-ascii?Q?OFhCSfHiqqOVIvXewmunjnSUJUM9LwxAJ3w1Mxq1kSJpKbmrzAE7dclmnKl4?=
 =?us-ascii?Q?W35TriMbFjAG7UjuzAu+sz2qaqnc3yGtTXIOnCuDMXzrE8JFwBqGOg6HtttJ?=
 =?us-ascii?Q?vOWDnI93bXmOhoACTvVKqAmhNYWK1G+xzoNOnKc9ldKaEAvg8c0aNhynkL0b?=
 =?us-ascii?Q?H8zXmHd/d/YP3TOp790gJt8SENRGap5ZK72LS7rSvT5+/bKYX0h8PhTW8PT6?=
 =?us-ascii?Q?R2i+B47StVPzxP+2pDAJFqi3ZCtEo3QXTR7BOx3+0CGbTYU4/06F5oiiShR7?=
 =?us-ascii?Q?c4VuOqp5HiTxVgDiK0IeKMrmiPHvoBkVrOVnc1OJes/V0wDtbOgzo3utDKEK?=
 =?us-ascii?Q?rava+OHFKGwiI7DfYXFYTUtroVU+XAMN2/kX6kApBe6cV8Vg1Pd0NTvZE6Jk?=
 =?us-ascii?Q?sGi/gGtWv8PLAJqaGtsDH1EoNmRAawo5jNRFDHZkJ531lU/n/q63+7k4GCVz?=
 =?us-ascii?Q?zsWY7WdQJr5N1C/3wZSQGP9QwSxgH40exmGodLNByscQb/rVtwQDoQIYWWaK?=
 =?us-ascii?Q?quXgyoVMdeN40JJNrWUUsWxsTpBku16KH+79gzNW1YOZ3nrA4KIrna0Jud+W?=
 =?us-ascii?Q?y4jvSjLxdTm7a/5AGbSG6cO9d0USpH8kJEiFAn+9MPDV79xAzGhfDRiiTwEu?=
 =?us-ascii?Q?s7fNp7Bw43/W7/zRs8yohNSHXThvquuLsKWAfst70Dut9qQxD1MWTQKCQIO7?=
 =?us-ascii?Q?T17hU9LzAaeLpKReBKjQLatg7dTCl3aHywzOO1s0FaivMli3Hd/t45UOjF+9?=
 =?us-ascii?Q?CVTC7F3nCdu5rSIXA7voDvA7aINdHvDfI6CrQjT5ja0EnNMZBjVUU1Ntx8uP?=
 =?us-ascii?Q?wnzj2k/DncxMlq0ybh4duxl1PGzRFSVOcnxfm1OW78Hs7H6fRAdPZwXeaCKw?=
 =?us-ascii?Q?tfV5Dw2Wy+FiAZ5Lza5zvagcgav7sTksMD/mVjME0EJygqc1LCOJAxfb9COn?=
 =?us-ascii?Q?9o1/86HesKwlc3ZNJmxkQtmCghfyaOn3mojCfpacEZI/dyah99RXkGF0ZV39?=
 =?us-ascii?Q?lr+ROQDD5BWHPi7LgrlvRWzB7fnR8oNgNssNC8JwQGp592MFjroJ1GEGQifT?=
 =?us-ascii?Q?3bQY+65yyJV+Ko4psm89TCQF51yvFed1wVhRmdTI9XY3XnG+hLYcr7+lPrjK?=
 =?us-ascii?Q?wQE90Lkx6J22Zh33HWhOP54VVvoGH8aUZ53CPwG6DeIL6qlTw704YlMj3Z4N?=
 =?us-ascii?Q?/FJTPVRDe9yx/igJXlI3MRdYnfzYy7DmVrkmAA7CpmyUeUJSJUkyXA1gIKy3?=
 =?us-ascii?Q?EHnOUuhc10t0QypGlkj2uTe5fbQFByBeC/+5dWcK0TNMDNbkypnHFKyo8Rab?=
 =?us-ascii?Q?o0GZFyMPTA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: ae134019-638f-49f7-7af1-08df1d374058
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2026 08:05:24.9594
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KMYYsgwpAmmT5EKJue8wEIyKsGSM6kYvVUVC7vZQyui9tw8JpDr/7fLPbuulCwU8MXrrz3PMpGxktN0HtLdDAaftNWoNLebWPj+FzpGN9WA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9697



> -----Original Message-----
> From: jiale yao <19888972804@163.com>
> Sent: 28 September 2026 08:55
> To: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Linus Walleij <linusw@kernel.org>; Andy Shevchenko <andriy.shevchenko=
@linux.intel.com>; linux-
> gpio@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: Re:RE: Re:RE: Re:RE: [PATCH] pinctrl: mcp23s08: reject devices w=
ithout match data
>=20
> At 2026-09-28 15:32:52, "Biju Das" <biju.das.jz@bp.renesas.com> wrote:
> >
> >
> >> -----Original Message-----
> >> From: jiale yao <19888972804@163.com>
> >> Sent: 28 September 2026 08:25
> >> To: Biju Das <biju.das.jz@bp.renesas.com>
> >> Cc: Linus Walleij <linusw@kernel.org>; Andy Shevchenko
> >> <andriy.shevchenko@linux.intel.com>; linux- gpio@vger.kernel.org;
> >> linux-kernel@vger.kernel.org
> >> Subject: Re:RE: Re:RE: [PATCH] pinctrl: mcp23s08: reject devices
> >> without match data
> >>
> >> [You don't often get email from 19888972804@163.com. Learn why this
> >> is important at https://aka.ms/LearnAboutSenderIdentification ]
> >>
> >> At 2026-09-28 14:03:46, "Biju Das" <biju.das.jz@bp.renesas.com> wrote:
> >> >Hi jiale yao,
> >> >
> >> >> -----Original Message-----
> >> >> From: jiale yao <19888972804@163.com>
> >> >> Sent: 26 September 2026 11:24
> >> >> Subject: Re:RE: [PATCH] pinctrl: mcp23s08: reject devices without
> >> >> match data
> >> >>
> >> >> [You don't often get email from 19888972804@163.com. Learn why
> >> >> this is important at https://aka.ms/LearnAboutSenderIdentification
> >> >> ]
> >> >>
> >> >> Hi Biju,
> >> >>
> >> >> At 2026-09-26 18:07:14, "Biju Das" <biju.das.jz@bp.renesas.com> wro=
te:
> >> >> >Hi,
> >> >> >
> >> >> >> -----Original Message-----
> >> >> >> From: Jiale Yao <yaojiale02@163.com>
> >> >> >> Sent: 25 September 2026 14:38
> >> >> >> Subject: [PATCH] pinctrl: mcp23s08: reject devices without
> >> >> >> match data
> >> >> >>
> >> >> >> A device bound through driver_override need not match an entry
> >> >> >> in the driver tables. In that case
> >> >> >> spi_get_device_match_data() returns NULL, but mcp23s08_probe()
> >> >> >> later passes the result to the regmap setup and dereferences it =
while setting up each device.
> >> >> >
> >> >> >I believe this is an invalid use case as the user trying
> >> >> >driver_override and the probe returns error. Am I missing anything=
 here?
> >> >>
> >> >> Yes, my commit message was not clear enough. This patch is
> >> >> intended to fix a regression introduced by commit 2e44555b05c0,
> >> >> rather than to make an unmatched device probe
> >> successfully through driver_override.
> >> >>
> >> >> Before that commit, missing match data effectively resulted in
> >> >> type 0, which fell through to the default switch case and returned =
-EINVAL.
> >> >> Commit 2e44555b05c0 replaced the type value with an info pointer,
> >> >> but the SPI path missed the corresponding NULL check before
> >> >> dereferencing
> >> >> info->type. The I2C path preserved the previous error handling
> >> >> info->with an
> >> >> explicit NULL check after the same conversion.
> >> >
> >> >you are testing the driver with driver_override and your patch makes
> >> >driver Probe failure. I do not understand the test case you are
> >> >trying to achieve with driver_override.
> >> >
> >> >Can you please share some logs with driver_override that you planned =
to test?
> >> >
> >> >Cheers,
> >> >Biju
> >> >
> >> >>
> >> >> Consequently, an unmatched device bound through driver_override
> >> >> used to fail cleanly. It can now cause a NULL pointer dereference
> >> >> when a valid spi-present-mask property is present. This patch resto=
res the previous failure
> behavior.
> >> >>
> >> >> >
> >> >> >Can you please prepare a patch that makes the driver probe
> >> >> >success by using driver_override Feature? Also please share some
> >> >> >logs to see how it works in real device
> >> >> >
> >> >> >Cheers,
> >> >> >Biju
> >>
> >>
> >> The test is NOT intended to make an unmatched device probe successfull=
y.
> >> driver_override permits an explicit probe attempt; it does not guarant=
ee that probe must succeed.
> >> The driver must still reject unsupported devices safely. The bug is
> >> that it currently crashes instead of returning an error.
> >>
> >> I reproduced this deterministically with KASAN on arm64 QEMU.
> >> The SPI device has an unmatched compatible and a valid
> >> microchip,spi-present-mask property, and is then bound with:
> >>
> >> echo mcp23s08 > /sys/bus/spi/devices/spi0.0/driver_override
> >> echo spi0.0 > /sys/bus/spi/drivers/mcp23s08/bind
> >>
> >> KASAN reports:
> >
> >This is original issue.
> >You want to now add driver_override feature.
> >
> >What is the log you get with your patch, probe failure?
> >
> >Can't you make a patch for making probe working with driver_override
> >feature that makes the device functional with driver_override?
>=20
> I think we are discussing two different expectations:
>=20
> - driver_override only gives the named driver an opportunity to bind, as
>     documented in Documentation/ABI/testing/sysfs-bus-platform. It does
>     not guarantee that probe succeeds.
> - Without match data, this driver cannot determine whether the device is
>     an MCP23S08, MCP23S17 or MCP23S18. Probe must therefore fail.
> - Before commit 2e44555b05c0, this path failed cleanly with -EINVAL.
>     After that commit, it dereferences NULL.
> - This patch only restores the safe failure behavior.
>=20
> With the patch applied, the result is:
>=20
>     [    2.319112] mcp23s08 spi0.0: probe with driver mcp23s08 failed wit=
h error -61
>=20
> This is the expected result. As far as I understand, an unsuccessful prob=
e should return an error, not
> cause a kernel memory access fault.
>=20
> I am a little confused by this point. Are you suggesting that, if driver_=
override is used for an
> unsupported device, the kernel should crash rather than have the driver's=
 probe fail cleanly?

If you want to support driver_override, you need to make it functional for =
this device.
But you are making probe failure for driver_override which is of no Value t=
o Linux

Cheers,
Bij

>=20
> >
> >>
> >> KASAN: null-ptr-deref in range
> >> [0x0000000000000010-0x0000000000000017]
> >> pc : mcp23s08_probe+0x2f8/0x944
> >> lr : mcp23s08_probe+0x190/0x944
> >> Call trace:
> >>  mcp23s08_probe+0x2f8/0x944 (P)
> >>  spi_probe+0x1c0/0x2d8
> >>  really_probe+0x17c/0x5b8
> >>  __driver_probe_device+0x28c/0x350
> >>  device_driver_attach+0xa0/0x18c
> >>  bind_store+0xc4/0x13c
> >>  drv_attr_store+0x60/0x9c
> >>  sysfs_kf_write+0x170/0x1e8
> >>  kernfs_fop_write_iter+0x298/0x404
> >>  vfs_write+0x648/0x8cc
> >>  ksys_write+0xf0/0x1e0
> >>  __arm64_sys_write+0x70/0xa0
> >>  invoke_syscall+0x70/0x24c
> >>
> >>
> >> spi_get_device_match_data() returns NULL, and
> >> mcp23s08_spi_regmap_init() later dereferences info->type at offset 16.
> >>
> >> The patch only guarantees safety; it does not attempt to support
> >> unmatched hardware through driver_override.
> >
> >If you don't want driver_override non functional What is the point of
> >this patch, simply want to add some Code space in linux kernel?
> >
> >Cheers,
> >Biju
