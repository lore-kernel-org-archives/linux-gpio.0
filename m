Received: from CHN02-SH0-obe.outbound.protection.partner.outlook.cn (mail-sh0chn02on2138.outbound.protection.partner.outlook.cn [139.219.146.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6149287246;
	Thu,  6 Aug 2026 06:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=139.219.146.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785998584; cv=fail; b=aKJNiHMJiNU9j+9nklSyBMycWNAPIEVqP6iMy4ldsI6AoyV6g+53tdLvrebhrpjU5HQnxTJOgEOosexE2SxH3lalnw7WA4pA57te4yMTKO5/Ru+H6NWWeXaNXDBevZHJHYs1lTrNEilT/4T2zcuRswg0mcyKCTI/T9JK6zGvwUE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785998584; c=relaxed/simple;
	bh=H7GuAUeCYrTcHEu48seq4Jxq0Uo3gRAHNA3DfnXdQDI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=YswHcUHNNWGdCYJh7t/eT5Debe0vL1b/G7SHEd4LOa7VUh9v5Gb6nCvuKyDE/xJjRg4G+56mw5UB+5BWK7f15KuuhyJ3OCnngqg1nJW6PernTR+m0mEEo4F37E1ATcbSWc0qojGNjwN7L7TDR2bUzzHCQl2m5dYZgaWe9Zvgi/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com; spf=pass smtp.mailfrom=starfivetech.com; arc=fail smtp.client-ip=139.219.146.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=starfivetech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starfivetech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ywgav4KXb7y7V25MX5PgTcsxpd41EkhvT+xcQP+tcRXUkDVaPMfzHHrsGx5NbcbpXPd+vol8OODh39IHIGtTr/+ECYmcoqXNPYsksXPgCDGRhKVWKAkn3qX9oQTWR4pPtBybwgaMxr7/O2Vb7JpCufLQ0586UGtN7j502dPNB75STzG1bhHyIcY03HJOKELi5LAOGnbdCELo7pU+YVFpeYhJQv/omxk/SITw5hA5PUd/wh88AmyIwPtH7HOBNt8W5ujhcqAkRfgP5t11Fmegy2AAh/ZAcoq23S6az+/Bo68D7I32Avc94I6Ce3ROPDbkMf4YVJLZ+xike+buluZw9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgwUl43APcibYB4vnR5inaqRV0MpLVjeWDE15UWxkCk=;
 b=ejrkJSbw4j65xMUskRIjMnCeXhNgRZW97udnHO4SiDWiZl6g2Fapso5zbiLjaBEV6gQKB/83pUgfhlR9dN6RTgMHUazRy5h8vjP8LGPHt8prT5O48FHqvYZWlbhiLtMONnBvb4SkW28jHLvhj3vG2ZAseWqBc/GyB6s0Da4FklqyHQu0ds5E08yEzf8CbzCnCf/aFzfI1GRKZvZntj1CK0E7EcZUMNLAZFdLmkXIFGfEqmidaT6BSUkMwJEKosgrCtswkM7MHz3jvaapUt3zZzkzCu55lAiSbELn+MMLB7OCc/Hg74fnFrXt5gDYEBGGDf8QLsd6Uh7949LLfbIdyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:17::6) by ZQ4PR01MB1252.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:16::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.19; Thu, 6 Aug
 2026 06:27:07 +0000
Received: from ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn
 ([fe80::e7d4:256c:b066:850d]) by
 ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn ([fe80::e7d4:256c:b066:850d%4])
 with mapi id 15.21.0292.018; Thu, 6 Aug 2026 06:27:07 +0000
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Rob Herring <robh@kernel.org>
CC: Linus Walleij <linusw@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Emil Renner
 Berthing <kernel@esmil.dk>, Paul Walmsley <pjw@kernel.org>, Albert Ou
	<aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti
	<alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, Bartosz Golaszewski
	<brgl@kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Lianfeng
 Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v4 05/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0h-pinctrl
Thread-Topic: [PATCH v4 05/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0h-pinctrl
Thread-Index: AQHdIYczlwja70qKk0yuMGzbQI4QT7aQAEkAgACV3HA=
Date: Thu, 6 Aug 2026 06:27:07 +0000
Message-ID:
 <ZQ4PR01MB1202D65340093ABCD709D94EF2D22@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20260801072711.153217-1-changhuang.liang@starfivetech.com>
 <20260801072711.153217-6-changhuang.liang@starfivetech.com>
 <20260805213044.GA1808833-robh@kernel.org>
In-Reply-To: <20260805213044.GA1808833-robh@kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ4PR01MB1202:EE_|ZQ4PR01MB1252:EE_
x-ms-office365-filtering-correlation-id: b501b162-749f-4c52-54bc-08def383bd65
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|1800799024|23010399003|366016|18002099003|22082099003|38070700021|3023799007|56012099006|10067099003|4143699003;
x-microsoft-antispam-message-info:
 gn+yvBx62GolzzhHii/hldVcBbasvO0aeKUCX0vAc7GKfj0yDACXl2PNbxO7T90bvTvCJ5Wlc0rY2pvdpASg614rNbc8gCdQib96xdSh7aj4Edh/Bmj+mVm6LcWhMqHMIw16rSYxdnWEKAfdfr5smbOi7g8zSaqXPvF4YyLRMVnbycSZgNMRWEiXEJqVQCn/jUwgdVYd3SlZE2cOBffPn0AzbF0LE6i2D81ZW0AOc4j2n/MwSDfjPP/fgpTHF55/Hd06GuzGIMoGF7lA1OCmAsjW7IvZV+FNL8PCeRbMJCPVZg3fbzFxav33lqUbuMQ+GM171weegecprTte3OOyJGChPThWUAD3bQhRvFhXHCZdsKygQGJJyXjBsshV52h2MUD8J1AwMW2CjZ1yEVamRfRKRjFJDIizp2DEFP7t3RTBfD/ddtX81xbhgPnpSFv8riM2CSnYElhFiJ2eMcjkh/XjVxvHdzL7zgIQ93pa5yA3TgVzwUqc/k6KHZMRdgKN9DJcVeAEzKYkEY1aUwRxmomyXcSQHoT6G7vh+jtCp5Vn11UDD0WknU/wSbEsos0h
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(23010399003)(366016)(18002099003)(22082099003)(38070700021)(3023799007)(56012099006)(10067099003)(4143699003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?xzQy349EL69ORaOuj+WpKYLNMNn+FuIH8w9xrtsFug+pBagJOa0ntmjuM3bR?=
 =?us-ascii?Q?BLU3UhmQv++Kd+9QjsAoHXNRC31eqLu9bxcVOTwH3CqeHpb7iSboFhcvS+zx?=
 =?us-ascii?Q?iHsmDhyrK6WlK2WtFf24yJfo4umWvsrtt6S0wkiA0G08gPBPbJ0WevprTJsu?=
 =?us-ascii?Q?AiuByvxh7irTPEUlVQt+bGtiGiZB5KgERc5lx0deyPD7RluLiNqFwfAazxXr?=
 =?us-ascii?Q?ygXIBA+iOpokuHpq7lnER4q51FU+aS7mqAast4h0dr2VOvdqgzi5hX4FlvdL?=
 =?us-ascii?Q?IgpfDw6ZCTVAvt92obcrM6v8ZiZrG2IiDBghg/ZZreeLj9VEjZWmDCqmUUhm?=
 =?us-ascii?Q?ygyMvFWTkxW2jifs2+vMKRaPs589C29bxl45hG2tiOgpAU2uOf8e1cBlyyVD?=
 =?us-ascii?Q?lpiOfS5kttPVWmVWQhjJroy9FTnP00oZJHSmGeTzVk/spGzTlwBYVNXcwuJo?=
 =?us-ascii?Q?APjHgG9rnjrMBav7ZJrGJ4G8hlo83urNbwOdZTJV50nl2Z+FV5+TfISZLjq0?=
 =?us-ascii?Q?PHeFXjMhqTo31LdwFxDA3jbM3X4YBrryj/TME9CSpZr/x8Bw4hcu4+Pq7qA0?=
 =?us-ascii?Q?iu75Wv9SlX5ISn9jvCVoXTCOidBZBQ8RPCQ3If1Ctonl1haoSIKMBIG1cIoB?=
 =?us-ascii?Q?5vhkjBYTgMpRwKQLCl0lwRLcEcKUOW62Qd0WGfjVhPbdx0cvBOcFzBzRg5H4?=
 =?us-ascii?Q?EKQZrjc/hMAkO4v2Y9EahaoB+Imj3AehI4vf9yztFqUTbNfOMFx8OBdzVTfJ?=
 =?us-ascii?Q?8xIi4Sjvue7lWFGAgJMT/pZViCLbb7bQhEb8hINByYW/gngmNA/GkYW9cj+i?=
 =?us-ascii?Q?g9e8pJerCFiCQKsvrwWeO87jz26XxR6LvXlgYJVUBxa1DVs8ix9a+2RSgk/W?=
 =?us-ascii?Q?zCIxrYpcA2Q2dcDwLnVnBpqUCRMCwMNOfJ23PCG7OcoIx0X7P84v3zJCJHiS?=
 =?us-ascii?Q?uSgiXhsj5s53tYrj/lrybIetN3RBW4djnWU9d1Lkdl5Ge7oMHxGf4/c1k+SY?=
 =?us-ascii?Q?ci+J5JQIlIdPfGz9qv4cH7dxkPIGaxeLjrqPGzA1szGl8PxAAGiX0AxD0zJJ?=
 =?us-ascii?Q?Zy5oTcSlwZxTqPq+8AGw//x0gBeFdRcjQMTPE8djTCboeAVLTlUMk3Za9HWd?=
 =?us-ascii?Q?oDJFeWROrJKF+Hxn7/DL66INQpyeEMFNL3OoutpUkbazHDlDGhcjKnQNmTUM?=
 =?us-ascii?Q?yJDx9+2RLyX8TkiuJdvjXyEMsud3RI18wP3JdIIM5h8u/TXvsxllPnpNWr+4?=
 =?us-ascii?Q?ePF1AkTrzgtz5AUDsx3ru+1DvF1FdbKaRgIMt1CIXxL4L8Jde0501kW2h7Lx?=
 =?us-ascii?Q?KjXsdL+PgEBPT0CEgo+/psZ4S9f78oaMwTfZfrFxlUSKAVz0L1nhEsN6B3U+?=
 =?us-ascii?Q?86yx1e3rbRpfJjiUXusEutpKVqYr5w8do6SxusCB8hCzsPWFayd4MyTKtkUu?=
 =?us-ascii?Q?fv4Lhrv0NWUU6aoFtKHjGZp0HGD68W5ydEktFyhSS2rrVjM3kiU5bIfmI//D?=
 =?us-ascii?Q?gL6ntWS2MQyY/DdSjtigc1VyA2yQiPl+X7RPpd3P/38RBSuNQWYqYA/FXe2+?=
 =?us-ascii?Q?b4qpfRtBR8WOFRnEqdEL+Oly84Be7q9CslBUwSltMrTnPVcn90ccXRPjv+15?=
 =?us-ascii?Q?GGcotcETB/2Q+P+oOJ/hBGjRshTsxuIysRxG6jgU9Mzc6Doig1d03CGyhlY3?=
 =?us-ascii?Q?MbGbafgy4+NeZ/n9hv0bfc3Q7hqZSBUrbiUFKbC7kXWOjpSYJywT8F4JIZ4i?=
 =?us-ascii?Q?bbxAUAYLTeh1r3l5oSEme8HLP4V2qT8=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b501b162-749f-4c52-54bc-08def383bd65
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Aug 2026 06:27:07.6717
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: n5c/LkpDwEmF2sMpIwAqLi/1SXGgeVaKsrO4ibD1+U6JUnj/r2B4g8mmpSDYdiKN+BdRf0YfcZGqDtsNFpZ1EwhvgCKrVPTxyWYWWQ9lJ38MX+FLOfQdj7EJDzKOm5Mm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ4PR01MB1252

Hi, Rob

Thanks for the review.

> On Sat, Aug 01, 2026 at 12:26:55AM -0700, Changhuang Liang wrote:
> > Add pinctrl bindings for StarFive JHB100 SoC System-0 host(sys0h)
> > pinctrl controller.
> >
> > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > ---
> >  .../starfive,jhb100-sys0h-pinctrl.yaml        | 162
> ++++++++++++++++++
> >  .../pinctrl/starfive,jhb100-pinctrl.h         |  14 ++
> >  2 files changed, 176 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinctr
> > l.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinc
> > trl.yaml
> > b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-pinc
> > trl.yaml
> > new file mode 100644
> > index 000000000000..80acc64834df
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/pinctrl/starfive,jhb100-sys0h-
> > +++ pinctrl.yaml
> > @@ -0,0 +1,162 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause %YAML 1.2
> > +---
> > +$id:
> > +http://devicetree.org/schemas/pinctrl/starfive,jhb100-sys0h-pinctrl.y
> > +aml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: StarFive JHB100 System-0 Host Pin Controller
> > +
> > +description: |
> > +  Pinctrl bindings for JHB100 RISC-V SoC from StarFive Technology Ltd.
> > +
> > +  The JHB100 SoC has 13 pinctrl domains - sys0, sys0h, sys1, sys2,
> > + per0, per1,  per2, per2pok, per3, adc0, adc1, emmc, and vga.
>=20
> These all look about the same other than 'function' values. I don't think=
 it's
> worth splitting just for that. I just put all the function values in and =
just
> document which ones go with which compatible.
>=20
> If there are more differences I missed, then perhaps the split makes sens=
e.
> Maybe it's 2 or 3 different ones?

I've organized the differences based on the current series:

1. 'function' values

2. bias-pull-up
   - per0, per1: support two types
     - type: boolean
     - enum: [600, 900, 1200, 2000]

   - Other domains: support only one type
     - type: boolean

3. power-source:
   - sys2, per0, per1:
     - enum: [1800, 3300]
   - per2, per3:
     - enum: [1800, 2500, 3300]
   - Other domains: not supported

4. drive-open-drain and drive-push-pull
   - Supported only on per0 and per1

After re-checking, I noticed that I mistakenly added these two properties u=
nder sys2 as well. I'll remove them in the next version.

Based on these differences, do you have any further suggestions?

Also, if we later introduce ADC0, ADC1, eMMC, and VGA domains, there will b=
e additional differences to consider.

Best Regards,
Changhuang

