Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn (mail-bjschn02on2109.outbound.protection.partner.outlook.cn [139.219.17.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2530123ABB9;
	Fri,  2 Oct 2026 14:38:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.17.109
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790951904; cv=fail; b=DIvmz4V/uVZVDxdG+eiC0bO0MbG9bomGQB8gqi3C5ELG5pR57nX83rbIxpZyJjNetXd+BbHKO6deg+3xEFkjf2I7b57OiVlfw/UbJcN+F89ptCGQ6BZgsvoKk5YGMvuff4edSynkOJcAS5Xtwszwc+jMWGzM1a1Y0LylNwEYiJE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790951904; c=relaxed/simple;
	bh=ywB11bRORvqp/7Pmy+LhiLaQffLUfmetpb4oM/vXecY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MGhvo18cOEt6u83AI713PgUwor2c4Zhi4ZT4oEEO6aFd4lxaEDnhu+0qfS+51EOU2rImp1sknXmoO6fL9rqz5KZWHkFTh5obCAuxrvk0jDBpiGmTfqBZWjpQhb3rZL3N+Cbr+/OHIPAzbIt9JVRJyhsbHXf2dkVtKdvZ8gZJKEE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.17.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2vklbpE1w/awE8KILU97MBTrq3UaiTsiz2S6GUpdUda0YgNUMOI2axXgmm/KOMIMBej8uDHI8JMFVbFkaDTencEnHC+IcrW7TM7cmbSBuIMOgpcfOdsANWMpebwlRTrP6A2TNSpuBWAlYu4nkbvcAE+qKKjNAeA7TL3h5X02yujcU5oiRwY4vC/OTOOuqcUo3X80OTIo4CtapBs/CXKObFi65GHLnjCp6jXCT9mAmaUP0vqlwoC6Fkp9pkTb8ywlDzxetZ099PgpZ4Ixb4rAsJz8O2426kKOVIYsFbkKPnSx9XtOOoJeoNPZQnrPm3ttDRQ8Uz9tPcIivE4VDmWeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wV+0K/2AFKG+zy/cGp2FAEh+l8YScSL8jhY1Ews0xog=;
 b=Pr2+1R9gIPUF3iycKpHlBuKhjrrifp5XGGF4ImdWWjhqM/Raxa+K/4yve9rAfxtxzsbPJK2fVYXsrPSykgzJzqjmhd9PvRgxYLpXPeTOYNU+psoXniZPmQ1IRdldJor5Zhplun/aIgoXQ/K4kDRoWI8K3b6C4aNkcP6xBJR1L9jRqTTDEtOSIgmmASdk7aJMq4iAJ/bQAwxUWTANX7B90dte6m4azWfZtsat85IkgJ4++ARC1GrzfMOVvVPw9/Ki8qcZQCigdSZ7JPkZVX1aQXT/mdm/CLg0F20iRcfBgxM9Q6qdRiKCI8wO9hbXIKYlK3xgs9BUOxGziognhoicrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1316.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.19; Fri, 2 Oct
 2026 14:23:50 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0472.016; Fri, 2 Oct 2026 14:23:50 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>, Alex Soo
	<yuklin.soo@starfivetech.com>
CC: Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski
	<bartosz.golaszewski@oss.qualcomm.com>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] pinctrl: starfive: fix missing CONFIG_OF dependencies
Thread-Topic: [PATCH] pinctrl: starfive: fix missing CONFIG_OF dependencies
Thread-Index: AQHdUmwyOmyHJHRzzUi23RHSKpzANrbqTm+w
Date: Fri, 2 Oct 2026 14:23:50 +0000
Message-ID:
 <ZQ4PR01MB1202F8321538F50EEE2CF7CEF2892@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20261002124722.3545736-1-arnd@kernel.org>
In-Reply-To: <20261002124722.3545736-1-arnd@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1316:EE_
x-ms-office365-filtering-correlation-id: db39e776-9024-45cc-dbd5-08df2090c75d
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|22082099003|18002099003|38070700021|10067099003|56012099006;
x-microsoft-antispam-message-info:
 sweUjomeN3/RSTRmfXkF97tGpJjHMIxAYbq2U4JaqYEv8UfvaEHMrEaksBvbbd+t6UaoqpxG7LTGllvXgn8slqsIAErBpGBYhyPshxN6mG5KkR5HP8l/YIMZU3U89jgY5o+tqbgyRK7m3ND4WsxVPD1Z5DNzmpEnRBzDfBjz/F+u1zib0Idkgaxv6hyiqDo9IDtHb6PQTM64BpGE/wFJrZWaYNHSZIPvLNZ/yaWGurovxnMvfuYL4SeKMdG82M7nekMZQTQYEJ70HrxN6FyqHHwLxGlBQ1mtSmFdvlfjTaXNhdcnk0PNmdhzoos4zdye0DK2mLGtrT1tXVvOK/6YLVGEDCCV+WE5RqlTXdKQbtZKVMok7SRT3D3DgyCIlyBNJ0U0QdQ31yQV9k7kVInGCureZ2uBHj1kS0svGwbFAyeMZwCAuJ6pt9+4E7dfIbeNsDJ6xvz+MGZQoGQs7s2FZHvOMDJ54DMPxjhM9sZrB0Eoa5Q7ywYR8vHLV40cV8wYe4N8sOJqdQCtZltn/caixJUmrxi2XLj+oEmK2WyROd0uOyjqpY9HqJShYtV2z+vU
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(22082099003)(18002099003)(38070700021)(10067099003)(56012099006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?RDLvDHxceYiKnURbfhWQo/J0LFz+zrWmdUoozTB+lgqCELmbnUqZwepqLM6N?=
 =?us-ascii?Q?yRWbIKgyJG0jZRx41hCKpeCoxo37SL354jBUDF6mmAV77HOl+jFmWkKh69MS?=
 =?us-ascii?Q?80LbfpCjSt8SVUGFSQvm282XE0rqmF5jPCb+OFAySbSFfAR7+mZOMms/0G+I?=
 =?us-ascii?Q?9SJ6G4fR84/aA5vdCPAYKfXBkUGrP23/HbKWaZrHoJMRubGtSrJnFbMhExDb?=
 =?us-ascii?Q?myfleYTmDKo24V1ZojzKaIiNAKI8CyU95zdKk3BQRCJRlbqEBvXtxo9/QK1o?=
 =?us-ascii?Q?997XqvKYW5ytuE4/pbRwqSVE34cq9MXCydRyJM2UmIvA304x2MQTrJnpV7KT?=
 =?us-ascii?Q?PZZwvjMYBPgBqky28Turur0i1Ve3YuGccmmRD9I4nOtBhtUZh47qY/QXnZVn?=
 =?us-ascii?Q?3wVtHo6P/hnAYA027J5gETKFgFmxJ7/t/ah2ZB7xxkYmnlpF2ZVctcOsdIa0?=
 =?us-ascii?Q?jHkjki98BT47ECpN5sMw/K21MASvfYhRIZeP/SbKFZTT+r5EwY/gt5aUFPBy?=
 =?us-ascii?Q?D195An7NQ1zg7kKM7Yhl+XaHabAOTj/2/CxXYBQnf8SRudgnXdFuZjMx8JUS?=
 =?us-ascii?Q?kv3dAva6Mm7XgBYRupBVd4JLpaMhXKDh9SOg+K7JNXhwRurNhMpQVJn0Cd/f?=
 =?us-ascii?Q?+daoP37j5MXgHeFab8UMAxs9+iMFvNT5NhKG6e7aMy03sW/2aCTrDfc3+cl7?=
 =?us-ascii?Q?owP8PWQ3RZ6tP6aSTql/OPIvnPDStnymBGs0cnzCEjMvq43/s/IMjveejcQO?=
 =?us-ascii?Q?2jdVFxExq5+5dtk+x5Djm/2v3ACRATjl2MgmlteqHMiOLuOgN9IvTcIVznft?=
 =?us-ascii?Q?dYmwn0K4Lt1OMlstFUxY+2zqAaMKXTYp0cteEbcDP0zTiMsr5JX2i1+i/5tZ?=
 =?us-ascii?Q?7T2SDsioHrbZs8LyTeLav4Ma1gMI8fPWmZEc/EfAXr1XKA1/0v5klWcWCjOx?=
 =?us-ascii?Q?XnaagbF/FmdXBBEX4+5ts9QTIc50hdVzVANhkJxlNWX+XauE0z8rJKwuEgzE?=
 =?us-ascii?Q?8cg34Sh7NYLwhj9TWzPkgSSTPWHPQozJrsGIGbWLxTve4ib7JbXSpSOzLrc1?=
 =?us-ascii?Q?hkp1olAn+dWjeBPVOewAWUL/jYlLyjnRhCCd1HvN1M223bTI31mOsgcFe3mo?=
 =?us-ascii?Q?/GkjH2jLruHIlv4iIChFm9+GWrqhP9XvxOCjJfadUlA3aRPtx1iEU4Oaflxc?=
 =?us-ascii?Q?yEwwmBCvWT00rTxYpJAmzr2YceMAatUrjbInbymxQ0uDw35O/mmTPTWGjK57?=
 =?us-ascii?Q?jyOj0sG9yvUGFnh37swHrtS0iugA/YU+lsKlqeJz8HTitu/7skRRU55IbdG3?=
 =?us-ascii?Q?iZJpNJ3Ipr8ASxVEqq3+JesPew92r1JZ4F4JTY/k0ic9jH0C/bWHwGj8r2qX?=
 =?us-ascii?Q?9+fOeaybQ6piXjjrV6gv5gjEVoYd5TWIBs8qbxqfBcHWZYfAmtOFMkSVowUY?=
 =?us-ascii?Q?6y636+stbw26WZTYWAIujbDGFwDkPNXRFVlQXPn+yP1MVfHkI3EyLmWR6sjr?=
 =?us-ascii?Q?GZZdBwp+Q2/EQuTh7+/WZibFaM5Hu/q++/+X1ZoRWnTe/wNcuPHELbRG6gNE?=
 =?us-ascii?Q?kJ/6DNnmIYMObarFWAgFe1CAiQidkEmnJuAx5ZERWsEtVOe64Ji7mn/DtTB1?=
 =?us-ascii?Q?zcIKNQJAlXxvLmISQP8W3T2Rn7uFGf/0IJxnnAQZkyqzWiJ57EgM0e3gGDg9?=
 =?us-ascii?Q?KTdAmnU4uTBvYVcS8mY9+QnEwEaEC0UaqPsPrVjXhqYWqizPU7OvyRTq8lg8?=
 =?us-ascii?Q?Nix0yIGgqQSbvW8LPOhvkXyexT9HDNo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: db39e776-9024-45cc-dbd5-08df2090c75d
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Oct 2026 14:23:50.1977
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MgyDLCU4oIyDCHz09G7J3CRbmCVV40B/O/rbZlIB3Yy0uDwp/Yavk018Ad1GrOFvC8DwZG0pEBj4EsLCU1dTR3MU3QXS/ytwBSdxoZXk+1wN7LcBCEmxp0x4OYZ6UjmY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1316

Hi, Arnd

Thanks for your patch.

> From: Arnd Bergmann <arnd@arndb.de>
>=20
> The common driver portion requires CONFIG_OF, but the drivers selecting i=
t
> do not, so we get random warnings:
>=20
> WARNING: unmet direct dependencies detected for
> PINCTRL_STARFIVE_JHB100
>   Depends on [n]: PINCTRL [=3Dy] && OF [=3Dn]
>   Selected by [y]:
>   - PINCTRL_STARFIVE_JHB100_PER1 [=3Dy] && PINCTRL [=3Dy] &&
> (ARCH_STARFIVE || COMPILE_TEST [=3Dy])
>   - PINCTRL_STARFIVE_JHB100_PER2POK [=3Dy] && PINCTRL [=3Dy] &&
> (ARCH_STARFIVE || COMPILE_TEST [=3Dy])
>   - PINCTRL_STARFIVE_JHB100_SYS1 [=3Dy] && PINCTRL [=3Dy] &&
> (ARCH_STARFIVE || COMPILE_TEST [=3Dy])
>   Selected by [m]:
>   - PINCTRL_STARFIVE_JHB100_PER0 [=3Dm] && PINCTRL [=3Dy] &&
> (ARCH_STARFIVE || COMPILE_TEST [=3Dy])
>   - PINCTRL_STARFIVE_JHB100_SYS0 [=3Dm] && PINCTRL [=3Dy] &&
> (ARCH_STARFIVE || COMPILE_TEST [=3Dy])
>=20
> Apparently the problem is selecting CONFIG_OF_GPIO, which is a mistake th=
e
> newly added driver copied from others. This was recently cleaned up with
> commit e785c990adcc ("pinctrl: Kconfig: drop unneeded dependencies on
> OF_GPIO"). Do the same here for consistency and to avoid the warning.
>=20
> Fixes: 9c4d0c8fc4c1 ("pinctrl: starfive: Add StarFive JHB100 sys0 control=
ler
> driver")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Changhuang Liang <changhuang.liang@starfivetech.com>

> ---
>  drivers/pinctrl/starfive/Kconfig | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/drivers/pinctrl/starfive/Kconfig b/drivers/pinctrl/starfive/=
Kconfig
> index 11bd429b45b7..7ff506a15dd8 100644
> --- a/drivers/pinctrl/starfive/Kconfig
> +++ b/drivers/pinctrl/starfive/Kconfig
> @@ -50,11 +50,9 @@ config PINCTRL_STARFIVE_JH7110_AON
>=20
>  config PINCTRL_STARFIVE_JHB100
>  	bool
> -	depends on OF
>  	select GENERIC_PINCTRL
>  	select GPIOLIB
>  	select GPIOLIB_IRQCHIP
> -	select OF_GPIO
>=20
>  config PINCTRL_STARFIVE_JHB100_PER0
>  	tristate "StarFive JHB100 SoC Peripheral-0 pinctrl and GPIO driver"
> --
> 2.53.0

Best Regards
Changhuang
