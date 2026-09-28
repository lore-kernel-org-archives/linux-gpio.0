Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010028.outbound.protection.outlook.com [52.101.229.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D58B7409103;
	Mon, 28 Sep 2026 06:03:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790575432; cv=fail; b=DS+nAT7JK/8Eftj/rZQNvuCvH/MNWojjgPQ9ckGImNtixpm6ADlNUkK2/B7BU0I6gPszgI5K6/QkJscgkCpVyW9XwI2h8zAu0lbn6WtUn+mUTew30Yi1dmpp8nW5FWzk4EEmwlqsQpNV0JDmonDhDLLk9UbDdc+3uRlofrKRzFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790575432; c=relaxed/simple;
	bh=3jOAXD/3jLrMs0JyJD7xUQaOL81WNZsBxLHFsmFLLxw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=c6tsIyjiXneLChQZ02pUV98Sg2sCv7qzU+B9yF7DVSpafZE5H4/vzH4mQCEZdYFMNnO8eW0bxC2AIkeu2oK98RqqVumsJ/XB6NVaTxctRLnsW90lej78IRn3hXU30J5jzHd/MlMA/ZYA+VcPoDWIwaQqv0Y9AjhATPFUKAp6ri4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=Q3NsUaX6; arc=fail smtp.client-ip=52.101.229.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="Q3NsUaX6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Szl/cmvFmf7sqTTiBgGuHzNvQaaZoo3G3L0n0Ljr6zKUg1bRbtlDfLdLtQ+DJja1+zXaQPr1DBxIwTMR0w++AHXEs6VAAibrl++z8g0AQSL8H1LeSHiPtzdmsBkU7bQkUmRbcT5aFVk0yNzeYFUR34+IcDO3k3UqxFl9mR0tTRm3TaU/fpTYSq9P6bAEjulPX6fwYyCORhfXqsd8Hz064fSoZ3udEuyXeFhnOIkg1Q5IsK4+IwOpTmKHsVg6MdiU4alTe6FKPCgGO0yITmaC4joYwJVY6Gu8q4K9ZHTlA5YN5LpWrvZ/G5ibo8+iZdAMEY0IpL3s4PZQQNT3oiANuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XsCoFZLkmIaRCySNh0p9jIgMBue9vLbNu23O3pP3sxA=;
 b=Fu4Vn87CXvY+2ihP7RluOdZNbONYTXxZa1bRDiTd20NR/8f3emiT42u14jC+ftN1ICw9JyS2boHB9Q/oyvZzOIjouBhIJIl7qC7x/9X0uwXpYyG4Od4U7y8eufXte9oPgDu9q5eQmo6RwKAfsYwMWytUzU8RPnbcBxXlcJQloGEu2/hSIJFMMGsh5wLhmrn6hjHaQLmsjC4XaRK6dbZx9cD1GCNoUqrBo7geLkadoSeYUuaTuMMqd/eFBgKz2AIiyCWtb7wC8dvMrzzvToMqyogO53XZ+4GZoefNTGGZWZuqwKLARvyYgkWnegAxfbfOjm2O3kxpY5x+vRSdDChl9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XsCoFZLkmIaRCySNh0p9jIgMBue9vLbNu23O3pP3sxA=;
 b=Q3NsUaX6vJIPz/GAnNXRsbcolSgLP73vkX1ugnou/bKano8312Iz8XQKoFhj5G/FK2LJnarb6+vhI4D7gXnWRjqPetmO/Xu4bBN9G3kDzoDabIRRXpUFQQXnrc0Ly3W0RxXmfaI4cdyb7k20t/jbLIOGzj12AR1HqnzQsbLD2yk=
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com (2603:1096:400:3d0::7)
 by OS3PR01MB8715.jpnprd01.prod.outlook.com (2603:1096:604:153::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.23; Mon, 28 Sep
 2026 06:03:46 +0000
Received: from TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de]) by TY3PR01MB11346.jpnprd01.prod.outlook.com
 ([fe80::87d1:4928:d55:97de%6]) with mapi id 15.21.0451.022; Mon, 28 Sep 2026
 06:03:46 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: jiale yao <19888972804@163.com>
CC: Linus Walleij <linusw@kernel.org>, Andy Shevchenko
	<andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: Re:RE: [PATCH] pinctrl: mcp23s08: reject devices without match
 data
Thread-Topic: Re:RE: [PATCH] pinctrl: mcp23s08: reject devices without match
 data
Thread-Index: AQHdTPMcx8CFgDS7T0eXq2w7rRWLsrbgohqAgAAGNACAAtp7cA==
Date: Mon, 28 Sep 2026 06:03:46 +0000
Message-ID:
 <TY3PR01MB113461CE3C9EB4A175879F5BD868D2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
References: <20260925133804.2231004-1-yaojiale02@163.com>
 <TY3PR01MB11346E0C01A9337A3AF4D97DC868F2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <34472b57.1961.1a0dd3dff12.Coremail.19888972804@163.com>
In-Reply-To: <34472b57.1961.1a0dd3dff12.Coremail.19888972804@163.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB11346:EE_|OS3PR01MB8715:EE_
x-ms-office365-filtering-correlation-id: cb10e0ea-7678-4cf3-49e2-08df1d264213
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|4143699003|11063799006|6133799003|10067099003|260925021311599003|260925022911599003|260925021911599003|56012099006|22082099003|18002099003|3023799007;
x-microsoft-antispam-message-info:
 JtIayncOtOgH4LJHYSwchfKSe2LyChriphebweR/76Oa3L9RIeL4rVLVJmrYH5j+iG8vVVqIHOzY/ai6yaJwerKqxM9hU5vg7arfiAa4e4u9TWAT2dou4RSRyknAS8/Vin0Yvj6ON6BY0B27OFmcuGOANcUQQU+rSuojZm/EuLWY53c1examOvauEJ3vz2sJumAquMf6VPrDRuH/HePg+zWuJ8bt0c/LlQ3/2yH0l/P8Zy4nPFpvUpmFHeB9DMI3y+pjiMnb8DRoGIODWYA7IKDjraDxmxAz37a/Pi8ZMSV2/lf7s8ejhlk6CSr8ioeYNMdd40Jc6V8XSregWxHWpabR8dHI7MzczQzeGW1kP+Ic7uvDaNRK/lprvrN/680dxxIvv4GOXTJyGzIpAXRfmwm/T4rtmuob6ziAoWhWwxlc3ZeyQ68kebXul+SjSKNUuX48tm4/UzyYexWyh4E0BH1xFgRg6hMAL+3eeRNwzxnIvTMvBFWe9pwez2MlNqnkR98xNHENwWKnVaYyUdI4arzYtKktoTZ2AJJLC/d9HWyaCHHpvSH5qhnhLvydvJGL/CcHGpTddILCGyCaFYJVsBNwvu1KOhDzEfwSiIDYocdKyytGWLZ8SHBC7OwU2mp/gsuHsowYhAQpTDrjlv8yps+Lic5WzjP1VUmBOcOtaXhJjziKgPdqOhvTvHaGK1dj+2Np15mwWteaIJnODWXJQqo81YhLv1uEZLHxgWYpeSM=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB11346.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(4143699003)(11063799006)(6133799003)(10067099003)(260925021311599003)(260925022911599003)(260925021911599003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?WQcJ4aVvWO/g+4q5OrXylmi4/3ndfckuCWulr2lVWhvx++6heTdXHkzbJsLQ?=
 =?us-ascii?Q?jMYIvVFnCh0MR8AEt39LbZAywf+S04am0LJuVuQKXWKFiCfiG//rS3WvkDCr?=
 =?us-ascii?Q?o6bdUDZs+910nA0zdpaJ0wUBn8PyvwBFselJDmq7cPio/Aqm3pP1pj97tJL7?=
 =?us-ascii?Q?JjtRz5mdF6zui4r2ZV/Y+E8gxX3V76DgsiO+VwNII0bIVCvDXZa4+kccdahN?=
 =?us-ascii?Q?62uFImLYr4HrN9PIBmTOvsN0bEnzYQ/uKn38q9pFGjaLW8+4ZbrEp/cX/Ebh?=
 =?us-ascii?Q?OQtN5RJDH2Uwk12nQXwoFZDBN//FNnbItRiRATKZ761wU7bAvhga6Xq497+G?=
 =?us-ascii?Q?KbTEfcE0YgBAdr5imC2PXbhE5rCuSAGDYGMLegHL1j8+PHUr+iRuohORfvbz?=
 =?us-ascii?Q?V17Qz+Xg/b+Fw0bu17Wdz4bgLgcECzNjudci6mEzXIPouEBQNO1GJ/JrcTTJ?=
 =?us-ascii?Q?HR/OtKmzh79C82X8s0p7qb1lY+fPeGYPoE/4Q947hyJu6g0H0fPluXrEoY76?=
 =?us-ascii?Q?9aqXhGwJCyyO6os5O0E4eQ/NLRpr+fmW2uoJ4RA/aJ3KcH/DHSXx73WFtECR?=
 =?us-ascii?Q?6r11VSfH6sXVOYCPeezB/v93UFpMd/YQYCgI/rd/Lzjv80qqpigYAWhU4QEW?=
 =?us-ascii?Q?maIeD5w9Xu4f5oZQksvmkZ9mNJeT2EwngKmoboJ5VdcgcPDOWViIZ2JEdLT2?=
 =?us-ascii?Q?j4p+AOIpiLMJbdjpDEzJjTe4RfXjEvnYwFfTAFcWV+TdoWQuN7w4PuOa8STM?=
 =?us-ascii?Q?UbjXk+iVYbFoks55VdP2zbEmOTBxbUgK9dC2oNXTWMlRDCJqpQHzFDz1438Z?=
 =?us-ascii?Q?S+tu5Xqjd5ail0o96vOXAzhNKQEDctAzdjW0s1BARYrzH/o2x9jfT+YqkTba?=
 =?us-ascii?Q?9BVtyuFdY/884EMtDna8ynprwWNqHLo8ZiTpS1NSW1FzGPruMTjCUZbRrbyG?=
 =?us-ascii?Q?pnMGAjUSvQzeAnBGkPN5BY33xodxQDjPFEfnCgmVhGrkALtI8RL5LW+mrkMA?=
 =?us-ascii?Q?/SytNPL+VoB3NXX4Mi3rmLoNJNJ+ZWfY+yJnAKmkRpJ6NkYpiL5J+6nnzZEW?=
 =?us-ascii?Q?jI/UsTvcqwpMNQhHlwsWNyYtqSdPZKFvBEFsv823+JJ1Uohkc3ZGzZj6a+Rd?=
 =?us-ascii?Q?x2weZ3aqWCfmPbWVTptmHbTYdYxeBIFNYzeBycWZ9zd9qs9LGOPcsA1Fu/aO?=
 =?us-ascii?Q?YhKWNsVd4zLYPfW6aM8jCqshv1vcSbQdGiRdmX5MdHMfzFtOLOv/1NmRdJMj?=
 =?us-ascii?Q?5gcYd+NTj6kPI8GKI/J/kylEqgfFr2Q6l1f+bj7tFtf6feYO9P96nbA0t3eg?=
 =?us-ascii?Q?jZnDmPJYnhk90KNYZNcBdKQdFTmnTk5IcC+88AjRk5+2/2vK+p8ccjbEOdr6?=
 =?us-ascii?Q?i8ANz3s+nylTUiQbklA/+ZpDgsI15z6e9ZYklZmqzOca6tEXV6NDQ+2oBtKk?=
 =?us-ascii?Q?oGQLLAEU0Tx7/apxa/ygoiq/EHEvP4Zkvwt04ZBzx4AdDIFEr1m3jCDZ9bPL?=
 =?us-ascii?Q?7qAk+RFscrY+hBjazygIiyAfO8dfj38YZea1QXvbxPw+l80iCmKg6SJt2APx?=
 =?us-ascii?Q?J5nndOAjH7HJSAd2ob1hhECBwuCSf4OnaMz6bGduXGcShvo5CGEl9iEj+FG+?=
 =?us-ascii?Q?iJxQfWJLVl0dsrWmDDQmgfzohApjbg2oFYC2d2oCHcPr/RVyzB39PyK/rQn5?=
 =?us-ascii?Q?dkp8GEMlw1kEtCvr172s72LAvIuYO18M/dImFZ9yRUVb2IOTZ68rDC/L3WGB?=
 =?us-ascii?Q?PSSdoI8amQ=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: cb10e0ea-7678-4cf3-49e2-08df1d264213
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Sep 2026 06:03:46.3793
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: P1NihQ6II8B81ddIxOd7MyfdS/DYaResUeth8FLHFHfVqwgRJJ9l91YkVnP+f2y2RamCSNTfi1SrNPBzKN7cHdYng/oRdH0zt0jI7dSQM68=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8715

Hi jiale yao,

> -----Original Message-----
> From: jiale yao <19888972804@163.com>
> Sent: 26 September 2026 11:24
> Subject: Re:RE: [PATCH] pinctrl: mcp23s08: reject devices without match d=
ata
>=20
> [You don't often get email from 19888972804@163.com. Learn why this is im=
portant at
> https://aka.ms/LearnAboutSenderIdentification ]
>=20
> Hi Biju,
>=20
> At 2026-09-26 18:07:14, "Biju Das" <biju.das.jz@bp.renesas.com> wrote:
> >Hi,
> >
> >> -----Original Message-----
> >> From: Jiale Yao <yaojiale02@163.com>
> >> Sent: 25 September 2026 14:38
> >> Subject: [PATCH] pinctrl: mcp23s08: reject devices without match data
> >>
> >> A device bound through driver_override need not match an entry in the
> >> driver tables. In that case
> >> spi_get_device_match_data() returns NULL, but mcp23s08_probe() later
> >> passes the result to the regmap setup and dereferences it while settin=
g up each device.
> >
> >I believe this is an invalid use case as the user trying
> >driver_override and the probe returns error. Am I missing anything here?
>=20
> Yes, my commit message was not clear enough. This patch is intended to fi=
x a regression introduced by
> commit 2e44555b05c0, rather than to make an unmatched device probe succes=
sfully through driver_override.
>=20
> Before that commit, missing match data effectively resulted in type 0, wh=
ich fell through to the default
> switch case and returned -EINVAL.
> Commit 2e44555b05c0 replaced the type value with an info pointer, but the=
 SPI path missed the
> corresponding NULL check before dereferencing
> info->type. The I2C path preserved the previous error handling with an
> explicit NULL check after the same conversion.

you are testing the driver with driver_override and your patch makes driver
Probe failure. I do not understand the test case you are trying to
achieve with driver_override.

Can you please share some logs with driver_override that you planned to tes=
t?

Cheers,
Biju=20

>=20
> Consequently, an unmatched device bound through driver_override used to f=
ail cleanly. It can now cause a
> NULL pointer dereference when a valid spi-present-mask property is presen=
t. This patch restores the
> previous failure behavior.
>=20
> >
> >Can you please prepare a patch that makes the driver probe success by
> >using driver_override Feature? Also please share some logs to see how
> >it works in real device
> >
> >Cheers,
> >Biju
> >
> >>
> >> Reject devices without match data before reading device properties.
> >>
> >> Fixes: 2e44555b05c0 ("pinctrl: mcp23s08: Simplify
> >> probe()/mcp23s08_spi_regmap_init()")
> >> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> >> ---
> >>  drivers/pinctrl/pinctrl-mcp23s08_spi.c | 2 ++
> >>  1 file changed, 2 insertions(+)
> >>
> >> diff --git a/drivers/pinctrl/pinctrl-mcp23s08_spi.c
> >> b/drivers/pinctrl/pinctrl-mcp23s08_spi.c
> >> index bacebcff67ef..926034fcd512 100644
> >> --- a/drivers/pinctrl/pinctrl-mcp23s08_spi.c
> >> +++ b/drivers/pinctrl/pinctrl-mcp23s08_spi.c
> >> @@ -146,6 +146,8 @@ static int mcp23s08_probe(struct spi_device *spi)
> >>      u8 v;
> >>
> >>      info =3D spi_get_device_match_data(spi);
> >> +    if (!info)
> >> +            return -ENODATA;
> >>
> >>      ret =3D device_property_read_u8(dev, "microchip,spi-present-mask"=
, &v);
> >>      if (ret) {
> >> --
> >> 2.34.1
>=20
> Cheers,
> Jiale

