Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2128.outbound.protection.partner.outlook.cn [139.219.146.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85CA6577E24;
	Wed,  9 Sep 2026 14:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788965242; cv=fail; b=JypmKMtxtV6Wx3nSH5SWnPJbGrWP4sg1yHe2BejEHYfnOtIlclWPEnskl+2rIazhQwmbfAewXwPBTzwrnuRzAi8QK5r3MLy0xSKfxOvus/1LYL+UrKAaqR59SHp9bIxKDVCIMtdu0YwDIxnD4Acu917/U935J/Bux8xlfTECMRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788965242; c=relaxed/simple;
	bh=gkXOpVbXPnadlIkdZZx4ACMssUjUYPtsihsC8cZeNCQ=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=MDjy/upvL4Q9pbKJqZDx4w3ojGglgHwc36xOvh6M0/YboTwXslsQ5APWZbYXdxqE7IWFC0boyOK/4MC5R0xk97UUIBlM1TAmM4rxox36xu4ECllM+QDUws75mcg6Ax+VFEmGBx3s25pC8ppqOjyrz4X6k2QTt9qo0Q4VrY+egiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n70nqWQC0PZAuTMg7mW3CIcdnj36LQA2txTLR2g4pwKp4tHNi8tnyGWXQfgeTzitm1Uy56AYAf/yZW7ZzYRsNzb31I2xoMeDwlfx9uIuIJcGeWWDRc3zGMPScKxmOxCjGm8Uv6wuWPzs5fvpcBMpwxzJOHNlsO6SIjd2waIOcnc1wgHtnl1+GPwgwBkyXO/V65xw+u3qPWHjkTrCb21BcTv2kOBREk0xde2nu/pHSeGSBBQ+y2cs5ULAAHoG/BS2zfoXbKRE9mJHkVVV0HvodVy3spp4zE1yZSsOMeVR8wZO5qWUAX+SqIR53yVJLg/eZTGFGz2nEyi4v8Fo7NGcLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=frfvd6jW+x2T8ns+6/X3TNs/higvG1vyLrmcZH6la4w=;
 b=NX5s0baQtsadGWWeQg95UnIwo6vXqMe9zDAhnssnqBdt3L9vHxvZpa4yVbFNGt6Jjfnkvjj9F+woKvwYw64SoWF+FbKI9iw/pNs/hUa0/hHxLprpkHP2XhirHQGb1G7DWY+ibFR+UAI2N+zjiFzqB5JmkTs0jkoOWgO5AL67CA3Z6hJXMqX3LruHRmUIiiTjTaq2iJ+eOAJE0EWHNNR3U1Ml72F0E72GXyY/sbRJvsKAlZmZ6IFQcp+t7ofQmLgN064ovy/6ir/YZ9dkMbEtHC4AAEej373zpgfUWv9oHXBSBs2SRGWQQqBfs7QzXLiOwH8b14V6a0iz+gZj7C52/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1266.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.18; Wed, 9 Sep
 2026 10:14:45 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0339.017; Wed, 9 Sep 2026 10:14:45 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Conor Dooley <conor@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>, "linux-gpio@vger.kernel.org"
	<linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Lianfeng Ouyang
	<lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v7 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Thread-Topic: [PATCH v7 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Thread-Index: AQHdOTzS/Ezb1OmSwkyNoZ30RtNkILbFJiCAgABglECAAIwuAIAAArWg
Date: Wed, 9 Sep 2026 10:14:45 +0000
Message-ID:
 <ZQ4PR01MB12027338F6207EFD690228BEF2B02@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260831113514.66382-1-changhuang.liang@starfivetech.com>
 <20260831113514.66382-4-changhuang.liang@starfivetech.com>
 <20260908-annually-catfight-39e3a1543274@spud>
 <ZQ4PR01MB1202F0B2A4BB3D370C82D523F2B02@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
 <aqEvTU_-69_PAQf7@squawk>
In-Reply-To: <aqEvTU_-69_PAQf7@squawk>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1266:EE_
x-ms-office365-filtering-correlation-id: 8193e8e3-ad26-4ee1-fc47-08df0e5b2bf5
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|23010399003|366016|38070700021|10067099003|4143699003|56012099006|18002099003|22082099003;
x-microsoft-antispam-message-info:
 vS6tNb2ba/j9+X/c11Xc/yYUObdaqhkr3Bs9tLFgM7yvgnZXkk/3ACkEkjoDNIt+7pqlBucdCeh6bZrrAYx5R98KlLSWFAvVk4spr3RVHWLNQBQ1ridz3Psf1NYcAjlzwZ8QSqPXk3PESI0GKZwvnsP5LUyZ1odf2kQ8zjBbSJvsVJgb2kVwgHLfx/pEKsTea9xW46ZjBev2iGU0S1Hn5BfKC2sY0ZHmFskBMHu3QHVj0zL+5vdJARQJaxZIwscJ43vQj0tjrxH0AuuQEUQDt8Ge3E9C3OpiInogRCUF9Zt0nACgJpUrTeyExmaDm6o5dayBJzENWxeL7X5iP9gVbls2N4kv1Of7NLHRTw96nCdh08NjW01tuvkCcvqyNiOKEd1MtfFzz0ppV0bI+JPP2yqCn3AM4hdPM0X9smQhgv4ZIutRaJ5S7w7tEH7iuD4X0JPzMxXKkch8xUrjX0VnXlK9B28uBP2pGwuFmWsG5ne1iRrsatoc27qPGYZdK5plb9kPHAWyItDtu3ffdg2p+b00dg6mxRPxz8gWjKSnyaS+3eyGsd6OkunAymMbL2x2
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(23010399003)(366016)(38070700021)(10067099003)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?WUDXRmmy1JCEBavi1oxPkq1jQ8RVnsFunXsTNjnxfEL5ARixG8z0IeHeBO4Z?=
 =?us-ascii?Q?kk/AzlcdTnERtS91v1qBiH20hVUafjAjy//mzQzvVtEKDEayEfzfKJMuroqX?=
 =?us-ascii?Q?y0CXB/WK9fgiFk++RwPQdzsYygqPjXtvuapmTt9fnAuoDWKX0QNcmmX/bvqz?=
 =?us-ascii?Q?axcNQdchYNn3+B6wi1OCX1DxeDvtt0EOsoqcR1V9TFWeMamTe6BuuS7Ua8RX?=
 =?us-ascii?Q?wguyMtZDYZ9zvbWA6CoBV+Y6zN81yAyY2cYM92hbk9WJ0wu4rnME2XJFBLvr?=
 =?us-ascii?Q?2PdGkxP0af+Wo4LSVpp9J1f2qHBfs3VB/sqYodVNYSInCFTS0l5sSK352c2J?=
 =?us-ascii?Q?xfWDxGu1Qi0iQxVwzKGdQKbrEZKYH9IbSzFMSnSj915UMgh7ZzMlR+AUODK3?=
 =?us-ascii?Q?db+gArRSXcyCG11gpEagdA/D3XaENDbMZULXRkQqF5nmdKlpK+OFaw5e+BaF?=
 =?us-ascii?Q?MWvf9/nic+ImGd3a7YLJKL4oIuGs5AoL4ncs2snTM7fKCyEbxnUvg+a4R8tA?=
 =?us-ascii?Q?OsQqIsBbxYhDuxFGfKMhqn0p6yafyDQD9mQqODFBRR+B+wPO52QB3SQO7dQE?=
 =?us-ascii?Q?yOqc/OEkbIL5gGknmPBeCdbb97aO4jS1IDDwP4ckazKaGSoAeA6ajGdHu6GG?=
 =?us-ascii?Q?JegOeiaxWdXeXnYtyOhIQlKFJR6uLzgvdxIkXRzVMlXcTLCb7PSbQ8nHNkzZ?=
 =?us-ascii?Q?J/RZMBBPNCI++u67FTRpciKiPKW+EnM0kN1+g4JxQcidlGLUnC8954NG703X?=
 =?us-ascii?Q?/HtZ7D5V3xoDkIOmOqr9oAsVtrWkJwQIOwdHPpGPJuJmhb9zUVQ/WSg5Zd6K?=
 =?us-ascii?Q?K2T3Xhml1F12txaPiTTAXBbRpdd8eMplXC5nBzmHnVNqK1HdMkHRWkjT3yVN?=
 =?us-ascii?Q?qYZAZE7E7y/YYLhE8Pl0NpxENRCHeEfCDlqPKCaItVbFyyb9gV3NlhZAWb/G?=
 =?us-ascii?Q?O8ZxDqjy6rNjdODgfEoFji7HkgK6cy1wfZ99iUA+XFbOZRFcxCPNVaCjR7bl?=
 =?us-ascii?Q?bToH1vBfdM7OGB/euVprVg1VquPpvApVES2cTQeOgVLVwPlH/r1Vy1aTUhpX?=
 =?us-ascii?Q?nhs3lByRo6ISyoKNgBA4pqxVLt2z+xs2WZzX9q0fv0IZ7xNNiWmsXnUvr101?=
 =?us-ascii?Q?H+AEahuB3MBsJqg9yGCOdAditvSVaAr+20T619xo4LHiibg7o/yVsEwTOgN5?=
 =?us-ascii?Q?3iNdGv6Zk9fW0FLlyMnGJ/NJekVcT6hps21QO2orcB7KnuCl5c7BlkA2DnnZ?=
 =?us-ascii?Q?TTWk7qPByLQ9muxXdA9eOQ5JnLURjOTp9tenAVvwcv5kSefJb0h8ZGwNlY2P?=
 =?us-ascii?Q?NemJUPTDnZSxApR1RyKs1KvcNx03o2sO81Q9l/odKtORcRQTX4serZ4oO+3M?=
 =?us-ascii?Q?y7Yl/TwhK+IYd+fnJdZP8ABwz3MKPehDnAZ24bW/HoR0k4Ydfp7WYhB5tOsl?=
 =?us-ascii?Q?ZtV4Hh898ApThjB7h3jlU+yEzUXnlFG6Cg8kE2All+pS63JiGdVxM0fwhEiP?=
 =?us-ascii?Q?pJ59aYsQUFZO25HT4vsBTmHh1NXuruEgy/MhlNiNu3i49BRb+vAA8EDb0A2l?=
 =?us-ascii?Q?VzKGbIgfaPsfPRC90755LnAUf8KNauVJIBKUgU41xv0RLE485f0jDxVDqrW/?=
 =?us-ascii?Q?7eILxiokjB8xGEH5VQlWeLAOYr4UrtfzR+Ddja0U0wmOgS/jGvWoYT4mxpEj?=
 =?us-ascii?Q?Iihr9aTaBVwIGPy3qW0HMJLdsUiuSInoBXDi9OgL9tXzUl0yMHX1KPtpnlfy?=
 =?us-ascii?Q?jZOKxhz3R7fRaXKqsR9uLHEFsDW3jwc=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 8193e8e3-ad26-4ee1-fc47-08df0e5b2bf5
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 10:14:45.1712
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O/6eVJklPPTGztEDhS+qKdTZTRxFrWwxHiINwnQZQy6cXCl5W8NNiXsnNxZzywESt2sNMEYDqtbr4HXN0j7gf5qJHCCyIpPc64q8ncpg34plWf/GlIEzohA37fTXCgyY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1266

Hi, Conor

> On Wed, Sep 09, 2026 at 01:43:20AM +0000, Changhuang Liang wrote:
> > Hi, Conor
> >
> > Thanks for the review.
> >
> > > On Mon, Aug 31, 2026 at 04:34:56AM -0700, Changhuang Liang wrote:
> > > > diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> > > > b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> > > > new file mode 100644
> > > > index 000000000000..6d8f5516a178
> > > > --- /dev/null
> > > > +++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> > > > @@ -0,0 +1,17 @@
> > > > +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> > > > +/*
> > > > + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> > > > + *
> > > > + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> > > > + */
> > > > +
> > > > +#ifndef __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
> > > > +#define __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
> > > > +
> > > > +/* sys0 pad numbers */
> > > > +#define PADNUM_SYS0_GPIO_A0				0
> > > > +#define PADNUM_SYS0_GPIO_A1				1
> > > > +#define PADNUM_SYS0_GPIO_A2				2
> > > > +#define PADNUM_SYS0_GPIO_A3				3
> > >
> > > Krzysztof's point [1] about these still stands. Pad indices aren't bi=
ndings.
> > > Sure, your driver and your dts both might want to use these but that
> > > doesn't make them a binding. For that to be the case, they need to
> > > effectively be made up numbers - like how clocks are often listed
> > > with numbers from 0 into the dozens or hundreds, when that may or
> > > may not correlate with actual bits in registers, e.g. indices 0-31
> > > in a clock binding might be in register 1 and then
> > > 32-63 are in register 2. There's no need for a binding here to
> > > assign meanings to numbers, because the meanings are assigned by the
> > > hardware itself - index
> > > 0 for SYS0 *is* A0, because that's how the hardware is designed.
> > >
> > > Were the numbers to run continuously, so that we had
> > >
> > > #define JHB100_PADNUM_A0	0
> > > #define JHB100_PADNUM_A1	1
> > > #define JHB100_PADNUM_A2	2
> > > #define JHB100_PADNUM_A3	3
> > > #define JHB100_PADNUM_A4	4
> > > and so on down to
> > > #define JHB100_PADNUM__D0	1234
> > >
> > > then it would be a binding, because we're assigning a meaning to
> > > 1234 that's not something determined by the hardware.
> > >
> > > FWIW, I'm happy to have the unchanged starfive,jhb100-pinctrl.h sit
> > > in arch/riscv/boot/dts/starfive, because the defines are helpful -
> > > but as things stand I think Krzysztof is right.
> >
> > For the current series, the drivers also use some definitions from the
> > binding. In the next version, should the macro definitions be directly
> > placed in their respective pinctrl-starfive-jhb100-<domain>.c files?
>=20
> Only the ones that are actually used, which I think is a limited subset o=
f the
> definitions in this header. At least, none of the ones that I looked up w=
ere
> actually used in the drivers, except for the sys0 ones.

Understood. I'll define the ones that are actually used by the driver direc=
tly
in the corresponding domain.c files in the next version.

Best Regards,
Changhuang
