Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2104.outbound.protection.partner.outlook.cn [139.219.146.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A4D3A7852;
	Wed,  9 Sep 2026 06:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.104
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788934723; cv=fail; b=ej9yhs+StXrX+02lF9OQ3h4QwET7wLpGVrBhd3Vv4ynpkmfC4jGdXCg+r/YfisvkORqK4GEneacBI7FbeQ14KM3yra0ayORcXmfYDdPHaPI1BNQYtdJUZ0XZfGREM3UlFHNGb2DtsmiED2bZoiKNxZ/dlP2zoflPgqlrA4x1DGQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788934723; c=relaxed/simple;
	bh=L3kWmHagBXo+LONExhSJznNgfAa2TB0F/NF/DA2U/xg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Ul1Ps5Jr1otwA9BFyQAefzvhG0aarGVqA9nL5TfH4Nfu2OODEAkVxifqrGja9960hsvCAAD73qmVK+5PMFth3IUH01Jl2dHbhn5ySUCwsdKKNBCp2Vb0uqxdCuG9u8PhxHQzcasTbJOdNGjEKrRL5YTMYqGzvDLDay7P2ft85OY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TK3qbEcSr6BAFcOg0IDnyf2CywUGFRc0xR8vQmQy604U+WUs22LrF6I70EVZutP/6vd5koYeFRnDBLcS1Eb8Mk/HuJMbD8nsqKyG85AYVi16IYs9u3e2dcFJDscCyzFU1+qq8ZeB6BmkPCHgFJHQiCB6WJ+Spf2l9ArOzxXJw/DW6EPnJUlWNLpdkNMVVaHlNJgtRNBM/nyZjnwAjdmoCLGZ0HPYrP1lN0Bd4E9HJdq64nx/p6ugRm7S1MMP3hixQOmdjensMu64cAJhEkW7pFuT0l2LbNtfPC8JT9Xp5A7LZ+kDZhtP6LH8sCI4cUxbzUMG1JPmtm8KeOFcCCJN+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=91IBFkekoyrjI+nDmQJA4wLRF4Be374Ak/3DGItdEi8=;
 b=HUimvhHFsHpcvNQiUQSHmAWk5WqqqrAlUOi/5s9n50zYYr0LXeZ81tvkPB2F4mYU8/aHXTrBnCcKOYQAqGpHqnJ4jHd+aIIkdz6iR6IFoIx1Dah8p/lUk67kH4b6pXYCiNlwzHAWNhYJ4JCi8f5g2VahX9jxoY45424iwYdfKke07gJpKnk8oR2PLgrya5iePUM4JSBsyfZpB5ueFgcC3fuOIsdEXGwoOeetu1Xj1Zr1K4yjDY5nuD1B8t/pVjNiQ/eVyN9vprFbxwZpcGrX1IEY4iKgxtG0c/XwO2zjyilHcFLOXfxY2fINhulDt7T/k8qx7JnP4DonAHEEVBWsLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1220.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:14::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.18; Wed, 9 Sep
 2026 01:43:20 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0339.017; Wed, 9 Sep 2026 01:43:20 +0000
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
Thread-Index: AQHdOTzS/Ezb1OmSwkyNoZ30RtNkILbFJiCAgABglEA=
Date: Wed, 9 Sep 2026 01:43:20 +0000
Message-ID:
 <ZQ4PR01MB1202F0B2A4BB3D370C82D523F2B02@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260831113514.66382-1-changhuang.liang@starfivetech.com>
 <20260831113514.66382-4-changhuang.liang@starfivetech.com>
 <20260908-annually-catfight-39e3a1543274@spud>
In-Reply-To: <20260908-annually-catfight-39e3a1543274@spud>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1220:EE_
x-ms-office365-filtering-correlation-id: fc801271-77aa-4eda-79c8-08df0e13ba7c
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|7416014|376014|4143699003|10067099003|18002099003|22082099003|56012099006|38070700021;
x-microsoft-antispam-message-info:
 JF/bDqvZ9OFs5F7pJNV+sY6MBcTng4rhZY00XJp25GGA2E7UyONHhIIC4vuyC6BQGbCcPN1FUFh5nTXvHva5TzeAwhvpyPbbMnuT4D4/1sa/pgp513w2PRuQWdmSoIpmf8eFcvfyyzFt5OBH1gor1E8u1jInpQ4DXniWQXDvAik/qd09Zd8sAZNhmW6oNSFA7BJMtojan3D0KlCf4E8VPXdpnz5HhJsyFbpvT/we9PgbF67hVvDH7vtcHvDYn9XdPuxbhOXe0pr9VzS4CUJ1Gq/wFucpB9+jlUY945YnQR1TsTIvJkjSqnMe+ytjTxV4Rp1qANqrhMwOVvDt2izarFLF6v3uJayysJOlhou14M/qsD8sv/YYBefNz0gsznpJhFnk6KK1Rq30qEGTFb4AiG/mOcLf6W9bdD3x5oMc91ZqjRSkybMqi6Dr8zV7akWTF0TqnmfO3CDEbxYmPN15G/bNxoGIGdm7EcS0ZwisXx9ATIzq4n5eBbCbkrQQykZT5gkTVp0AUQ1gUZk2JqoqKXroI5PCBKK3mX2+NZyrx6/hXL1oQFHYgoZ9kLBvcUIL
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(7416014)(376014)(4143699003)(10067099003)(18002099003)(22082099003)(56012099006)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?wwhS1HLCjM0fXs2odjqCIeoIFOZF/piN9xx7Hk3TcGdvQ2yMRjXY2DSxqEFm?=
 =?us-ascii?Q?GayWBN9zRi9Md4TqeyWnojw24H546ECCqsxOKtmyYEsanIibRZyMBFkGqRm0?=
 =?us-ascii?Q?1QN+CVg2FSLGvmF/FMJuwH3lFhwTxWoqJNwXSWXraSxK+25OsgJ4+gtSnQiD?=
 =?us-ascii?Q?vTbFnhFXDdXhca75BTq+UWWGlwj0ypxBuTLcpAbEDq3lJNfuU9i6n7Hvr6sy?=
 =?us-ascii?Q?5CkvrBxqt3a9m2n5Tv7+DcyHI3WbFTQK8jnWYIjzy7g+v9m6PI5dl68fxFK9?=
 =?us-ascii?Q?ipl11AyxslKSM06QBH/hJ8SDTUgszt2UGKhkZItP/3/VGvJN8FXNr2oRJZdf?=
 =?us-ascii?Q?3ydzAPNdvfgM1RLJkb5zeYSgmds7cTJU1d9KtgCcqNECsjikDRlvvOKGqyly?=
 =?us-ascii?Q?CymKLNuq9tda/hFnG42AgzlBz6CWcthgWzW28fKoA28yCCJbiIVXNc6TuqH5?=
 =?us-ascii?Q?Weq1ieZ04YIRrH48wno+q9DavrqCLyPyGPgVcepyXbJ3k4A1obryEOXYkhv+?=
 =?us-ascii?Q?uv5u42ZdD1Nb0oCbLGDnKN9KFcmD8UvQjAW+wlCIfgm57rbvcbWZiTmrFrW5?=
 =?us-ascii?Q?ZHkCgi9v8ERCgmiDY/T1LV57zQxOrsQebjGYRFGQgziRXt84SkK9E3ewdi06?=
 =?us-ascii?Q?jc0IXHCzHWUxxrANaVNRZC65Z4hcpGQS1cxPlSCIoCsElN1/frWNNj1bHSUY?=
 =?us-ascii?Q?Y6xGLCLG0bdF7w+M9b5smVPNaVf9HmEfQsl40O0NRnk2xQV8B7Rpsm/+4jd6?=
 =?us-ascii?Q?OQfxzsEX1gvmegqZOT6YTEYw61reB8kRvNwxvw1MKzt5e4cSX52IlhsR3J/C?=
 =?us-ascii?Q?hh8bu7VdWn0YdGcfoCXT/zI6KuIrrQxzjm3/svqUi7Z4XgTbB4h93WgSyuqr?=
 =?us-ascii?Q?rEowQb+nlQvkYlzNM9Ex9/8tABIxuj0Vx5BKSpTyYAQL78+CwwRnTCeEaXMU?=
 =?us-ascii?Q?J3RaMW7s6HK5fxSzEEJ2+vigAtH2jQz5t76xjQRFhqjrap6aaNxyVHMPd5UW?=
 =?us-ascii?Q?5E6xG2cKV2w01HqaxxX3DiuDH//3w8jgkZ3IZHfvycNu6Ap9d3LW+pP8xB0r?=
 =?us-ascii?Q?iePaayc8fXGehv87Sgt9Hth9lDYWOR0oVaAmnmoK16abCCmYVwm8sFVAiIlO?=
 =?us-ascii?Q?atCoeSBv/Q50jfqZZdqAYmBfZMi+W8xgGNmJ5XqfJoVV0t7IK/LtR6z1pYDl?=
 =?us-ascii?Q?XEYtAEUZP5siQV/nPfuTGlxnNxhvSzm5f8+pren6BOKl+RQoYZdFJ9MXCew+?=
 =?us-ascii?Q?f/KNo3CbCCRXrcPjq+D1y0rkfP6iioP/tGnERMGz6tvKeWz4jill9/AuIR0m?=
 =?us-ascii?Q?gcDM80tpbF2epGUIlaBjm4L2hsstVK2JX3Op9CnVOLCPyt/C6xhiNvbVn28H?=
 =?us-ascii?Q?d01oxaPripj0yP08iGNSlH4cn3bpvclOBUXTsaU8SpTG1cuPOl22EHK2t0sq?=
 =?us-ascii?Q?f+RH6SW2lq6+u6xWVd4AFNOA8uw4HZgh9MfktsJcjrj80YliG0LwA3c/WxwC?=
 =?us-ascii?Q?JKV4DQG8SdBLSwNRkOGNQv66uVENWelnvkn6dsL0G9Xwza72Ln/sbeA+3FdM?=
 =?us-ascii?Q?e8Ux6NnvDSyAM9CU3qRgBDSw7RZ+bwZNBMZgxMbjWvANE/1I52A7MSKxNXu0?=
 =?us-ascii?Q?Wtl6o6YHo3c4SnpiAVm9Bu4L7aOUM0TrzXMnLUsj0LFYUVKWDiBqM/zygCY6?=
 =?us-ascii?Q?MIjLirHMNrzvEQVQI5QxMPYMTFTRW2S5HrYZkhF+Vyec6eQHLbXbQN1KxK/D?=
 =?us-ascii?Q?8QzSXBPujtSNqHPlS3RRWaCKYxcP+jk=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: fc801271-77aa-4eda-79c8-08df0e13ba7c
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Sep 2026 01:43:20.4710
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0oKCA7QqJKk0yhIurZh5BUS9es2JH4Y4kCrV4pn8pAijfa+N4SnpCA2F5x2dpDkViUizVVqvWIN8cPzCyX+m6dKUA0sR7I2wy1V8Vyv0j7hWvHL6s67TgghlmOEcSfv1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1220

Hi, Conor

Thanks for the review.

> On Mon, Aug 31, 2026 at 04:34:56AM -0700, Changhuang Liang wrote:
> > diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> > b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> > new file mode 100644
> > index 000000000000..6d8f5516a178
> > --- /dev/null
> > +++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> > @@ -0,0 +1,17 @@
> > +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> > +/*
> > + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> > + *
> > + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> > + */
> > +
> > +#ifndef __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
> > +#define __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
> > +
> > +/* sys0 pad numbers */
> > +#define PADNUM_SYS0_GPIO_A0				0
> > +#define PADNUM_SYS0_GPIO_A1				1
> > +#define PADNUM_SYS0_GPIO_A2				2
> > +#define PADNUM_SYS0_GPIO_A3				3
>=20
> Krzysztof's point [1] about these still stands. Pad indices aren't bindin=
gs.
> Sure, your driver and your dts both might want to use these but that does=
n't
> make them a binding. For that to be the case, they need to effectively be
> made up numbers - like how clocks are often listed with numbers from 0 in=
to
> the dozens or hundreds, when that may or may not correlate with actual bi=
ts
> in registers, e.g. indices 0-31 in a clock binding might be in register 1=
 and then
> 32-63 are in register 2. There's no need for a binding here to assign mea=
nings
> to numbers, because the meanings are assigned by the hardware itself - in=
dex
> 0 for SYS0 *is* A0, because that's how the hardware is designed.
>=20
> Were the numbers to run continuously, so that we had
>=20
> #define JHB100_PADNUM_A0	0
> #define JHB100_PADNUM_A1	1
> #define JHB100_PADNUM_A2	2
> #define JHB100_PADNUM_A3	3
> #define JHB100_PADNUM_A4	4
> and so on down to
> #define JHB100_PADNUM__D0	1234
>=20
> then it would be a binding, because we're assigning a meaning to 1234 tha=
t's
> not something determined by the hardware.
>=20
> FWIW, I'm happy to have the unchanged starfive,jhb100-pinctrl.h sit in
> arch/riscv/boot/dts/starfive, because the defines are helpful - but as th=
ings
> stand I think Krzysztof is right.

For the current series, the drivers also use some definitions from the bind=
ing. In=20
the next version, should the macro definitions be directly placed in their =
respective=20
pinctrl-starfive-jhb100-<domain>.c files?

>=20
> Cheers,
> Conor.
>=20
> 1 -
> https://lore.kernel.org/all/ZQ4PR01MB1202123864865439817E1549F2AA2
> @ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn/

Best Regards,
Changhuang

