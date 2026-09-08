Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010008.outbound.protection.outlook.com [52.101.229.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 189523D6CDD;
	Tue,  8 Sep 2026 12:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788870209; cv=fail; b=TYWgolIn668Vyab2cfSupH5LFY8ACwLuO0ZBgVftOXOUthB3CodEVhSEJhnbOWEJyouEzqi6rznmOjtfKRU3Ha1cbemIAglPqH/3YyzHuWd+X/YdMRRNq9FjIfSODeMUHkk8B2ab4z/jy8rfQW9fcc5KbV9hzlV0ON1x4m7J+zM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788870209; c=relaxed/simple;
	bh=NO8OUBUwhoj+OPkzxUoClqvfHJ1/f91W/9oDAGjEfOg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=bjRmewT7PF6RrmvJYwUVCXrvJDv0q9Q2B5FbaeAC5BEODVDM6vMYjbZrcdrCfYQT0CBNd9/Xm3AvD3js8M8mT8AIFF12NE3CFdwMilqd5ay4vWBBooDelXxPKKT1nkbYsHpGOlTozpzeGbIBd0uBj2a0rf3bngwWv0+bIPZ+cpU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=POdxkEBU; arc=fail smtp.client-ip=52.101.229.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="POdxkEBU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sNMtCN3IDYVTV0RHl1Y7jLhLgFvl16W2aoxs8uRKAUjsMz0ciPjqsPpmc0SBf0vA6x+YG5a6M/5pqb+KBtsQ7o51atNFxowznGxwIr8utAWxiOmXwxgu8l1e7Gz8HnqsK7nuLkEBHuaCPTIE1U6amwG9cRejMvowdCq9gyGwOHDst2vuA5N6fEPNvzVLa4lc2d4h+XqMzP38mK13Ql+/Kb24nj3RfpDv5plQmUlT/W5EskxpY6hF/xpHs3DFeRRhiLN145EjysIrDAFgRhZWUoZpaH4nqwS31o/Qv5cwG5KIAafgP0b/ITlBFIS7t/282qmt05rbUKv6kdN90ankdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ia2hmU8k/2np8Xzqh3XCGOcDTmtBugWXr/XSb1sHGXQ=;
 b=Vvd0pMY59Xf83h3mJc2GL8ypYOBGlYAay/VUjIw4ruERYGv2R+uT5vM0SKx6EbIqoDZCwfXTEkxdPJNt2Z17l4dLixci1ScUa8UYgQiMz7mUxzax1qa/cMWoxfDc3Cpr8lnUQyaxhWltoijN2BPvYDwLMHkqQQGOH2xEwTHwRf2+FF7Rin1H7prBS1VBmHsOYzKeh+m/17fOweTM/fMrttFOj/NmiTjZr7kossJ+3YTrr6uEYHZwlmr4ZbVWwXCdgrmldejIpFl+0zfK4caz97zutSy5nU4oz8TW4nWxCfZnaeFXKz/qTiWX5VjtWhKUSBnu9XaWUsF338LlF6fYug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ia2hmU8k/2np8Xzqh3XCGOcDTmtBugWXr/XSb1sHGXQ=;
 b=POdxkEBU49vXMZ41cqqFpQXa5nqJjYRdykY0X2sOgDqT585ow0K5NbI2SJLjMU5FVzTt6UpafX5rcFEZFgoPf2ROGqZloH6Ttad3seSWhhxD6LaxS8J/7Bc/NKKMwL0fugmDQ1l9hbT2LwfT495DO6xfEMffU+eXkJsLHvMd5rk=
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 (2603:1096:405:29b::10) by TYWPR01MB9676.jpnprd01.prod.outlook.com
 (2603:1096:400:232::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 12:23:24 +0000
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::a68f:5c9:9de8:4fa4]) by TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::a68f:5c9:9de8:4fa4%3]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 12:23:24 +0000
From: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: geert <geert@linux-m68k.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@kernel.org" <stable@kernel.org>
Subject: RE: [PATCH 3/7] pinctrl: renesas: rzt2h: setup IRQ in
 .irq_{request,release}_resources()
Thread-Topic: [PATCH 3/7] pinctrl: renesas: rzt2h: setup IRQ in
 .irq_{request,release}_resources()
Thread-Index: AQHdLnpeCfmI/GTbk0WPk3sVk6uNOLbEj0SAgAAqxqA=
Date: Tue, 8 Sep 2026 12:23:23 +0000
Message-ID:
 <TYRPR01MB1561960BD76ABAAAEF5AA13B385B12@TYRPR01MB15619.jpnprd01.prod.outlook.com>
References: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260817185700.322370-4-cosmin-gabriel.tanislav.xa@renesas.com>
 <CAMuHMdXfDRFz+zYj98GG=_jBhedh1+rCdWbyMSLOycAxzYWouw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdXfDRFz+zYj98GG=_jBhedh1+rCdWbyMSLOycAxzYWouw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB15619:EE_|TYWPR01MB9676:EE_
x-ms-office365-filtering-correlation-id: 83b0b65d-d8cc-479c-1057-08df0da3fa4f
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|23010399003|1800799024|366016|38070700021|10067099003|56012099006|11063799006|5023799004|4143699003|18002099003|22082099003;
x-microsoft-antispam-message-info:
 44wiickirmkWLoC2F161ltqyxK8I9uxUlEGTrDBSPg2yeB3nIed7m9rdq0CE66ahGQh6d3CkvueSWRTnHFeMB/7Kcrw+D54g8f8oFfVW81GvTAltKP4vNJ+YocW+3SEFmeI171N0ccTbosv+Dw81OD3THJpKPEcUPpfJfj9qyzwPnE3ER/MmuhymjdPtfgIBsz7fXZwvayskuNWipFAXfXRwRtjkX2kYUU0G0/EmF4zhN1IFENnu14tb+UWm0j/quMvqxM5x8knJaVLzpxTCz5tTUwVYsq2xYDWO9s6PSgjlhezrzibZ+7ktUcXiCqlR8EVqoAQSsXkLhnO6A28BuWbpFw4Po4t1trXA0IOYE207VXDKt+UuB1WfnECp9p7acH29OGzWi7sw3DDo2IVM3VSbcJxsK7f0s+CVyJ2Yyx+CUuwDGveToDKUIDaZ+iElikwFv/K8XCal3PpbmleCka8ytN2NDb2OUXQpHhFwD0usSivmFU4Bbga50Ts3aWMwkrjmRGq73pK/i0LChZy0Rm81h9WOCmfbdAyJWACyrnHZAoJjx+ASx6GzRvsFAaxlNY7kR23uaGzG/OmTOGHIvbPJ/iHZ52qKcazpi9Um+Dhiv1SxEbut6DTJ3HNuLLDtocZBMXJ5TWeiYX1FNjFIzZ9npZw50S1+e3/s1akVL9F9nrDjrBGcqDQ+JQzigsA3TjVxZx4mN9hI76awENlNRP7Nz4HZKxti5xiJbiFgiVQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB15619.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(38070700021)(10067099003)(56012099006)(11063799006)(5023799004)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?Fh/v+LYtcKbGwLif6V5BvJtsuzjTBtRIIFI1VTxwd5HmICiIIvOOMu6LYj6D?=
 =?us-ascii?Q?IrYCEOBuwqeCDeUxLWM1PLCZUWeAsuH7cT7i+NPiHKHiPWofE+BTtPNJoh92?=
 =?us-ascii?Q?zg7xi72wLH7STjJbNvbTXuSWwa/URC0d5eKulgxKUXmHy0dAqwkusrwYnEn6?=
 =?us-ascii?Q?Xz2U9qTQb2G1oNmAei/VdjcnOoS+GRjrpPvfsJwdHVDKC+2UAiavl+kBBugs?=
 =?us-ascii?Q?WERxNC1O7xcldlLZ5GRVBLypFPNqVri7R4dihf1B/zlqyiZmGNN4LpZcScjG?=
 =?us-ascii?Q?tc7VwPIfpzf0v/q6/elX0rBKJVhqbw+O9YlC1fc+7Ls+SMSGo/xBwyuqGAez?=
 =?us-ascii?Q?++tPQBIXHRAAwz4pkZXKk5P+/LZSP2dsVYdVxJNhkj8SEbAuRx8Yi012E5YF?=
 =?us-ascii?Q?s1YqTxfYcocCAJN+YRwyd3l+VagtOSkZhUr9tIRowXxBAkOKvqbQdIP7N94M?=
 =?us-ascii?Q?obC0QQspukB+fvcFaS8DioQKyH81fJ8hvGiLimkchJb0sbFYMLWKWIDRs/H+?=
 =?us-ascii?Q?nrjtiF/0SGmMSlAIGye6iGTolaMqb5xPBMI4hnZoG4eydHHOh0vFCQuy2ka+?=
 =?us-ascii?Q?+y8LrLzNcfjhuXOt2AxDPA0c8yHn5j0tltd4jabO55Qe6HwlyLtE+J36cgCT?=
 =?us-ascii?Q?iC6ELYwsd2DK6xgssuWbfZdTITXPK4J20+81VtXD5GfTcxMz/bxnuE1jlNWl?=
 =?us-ascii?Q?mAr6BmGZvqfXiU9lx0ECZCELn1xUbgH5b7mhHor3bneMq8YPuGd6X6aKddW8?=
 =?us-ascii?Q?BK285vHW0J4BZFPKpj/p7GoGEM01A332daLfLsFeCbktt9QbzXXwC5241XyB?=
 =?us-ascii?Q?2/rsohVGd1ru0DaMr0G1FvZ1t29v9Eg0pREt77+RISiW1jnP1+qNNgKFEosh?=
 =?us-ascii?Q?ZQys1D2q1842affx+c+EbKhI6BdlfdJKPnXegLhwZ7aNtzKVpcK0BXJC5J8v?=
 =?us-ascii?Q?X+t8/W1a/qqpd85jXPNHXhJyudng62KeYoS0tQA3Yl9wrEzvMreC1yEJ3x4i?=
 =?us-ascii?Q?a03nZ5b3Vz/Ozhvyu4ICl/kAu5e0IESsmRCoYsCKJ8JfhKl/ZkT1dqY1/Us5?=
 =?us-ascii?Q?l5gktA4vDIxPfb6akrwYj4dxmDkKIfHcjqj9rTYREmnmsz1CuDf2teJ/EbDA?=
 =?us-ascii?Q?a/himeOc3bW/rGDgjxq+//P2Iu7aOKAIL6ZH+MgMLSyySJhpsx3MEhO1rIdy?=
 =?us-ascii?Q?QwI3T4dXSinDrAgCCODVU7tO0tuMqRgNfqjJw2X2T97eLzd1vb++P59pkjSH?=
 =?us-ascii?Q?qnOkgHEcfMdchzN3Q9AoXFDhcDkbtANoHTmQbvd1h3qW0ryoXtlOwKdHKoT9?=
 =?us-ascii?Q?hP1ZOGnlA2PDlikc0vx1Wspfz7Tn0asoiEmwZGq+IEZeRHsAIru8oXyS13S4?=
 =?us-ascii?Q?B5uQYyIoLBPC+6kRBoJy6b6PzaFTs69FgVmoe1t0o5aDO+6NFGAlmc6vOjVW?=
 =?us-ascii?Q?LnacshpqV73V2gDJrkcZxd0XVyS0oKONh6nlHBI1amIEUKAgAohf+l8X4S+F?=
 =?us-ascii?Q?w5p7jd6L0I10ceG49qNppS1PZMovYfZa8RBCv7HAJt1AplRXwjhBjXcBYY+F?=
 =?us-ascii?Q?VKXRdzwB4udKVBPqirKza1fs8/P+hCsuXgQWZn2DLhaJy7kPBGXatVxIBKot?=
 =?us-ascii?Q?bWKovc2u2q5sol/Ess2V7AQntjLVox+mL5BldYFdlQG14J9oCyE1qN9Rea3j?=
 =?us-ascii?Q?sxgWH21oWupRXKdUQtUE1EuTCiH5t5KYLWRJMadREUeiZNe176chxPZN1QD3?=
 =?us-ascii?Q?9wJumz51QKW9nQdf0UTEDb/itPn9L9mGROT+AF9v48rZ4GxS5RRY?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 83b0b65d-d8cc-479c-1057-08df0da3fa4f
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2026 12:23:23.9935
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ekb9pKj3Ljr91Aks7VDVE1oiqqvRBFprEVyt4DMtOHtdPjiM/p3jmjqVkEh747bP+Q33Ls8lJbqc4LbC3TMtvoIoeRW2BOn5MzRb1CzKL9l6/silmW4QPAAiDW8cpzj9
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB9676

> From: Geert Uytterhoeven <geert@linux-m68k.org>
> Sent: Tuesday, September 8, 2026 12:41 PM
>=20
> Hi Cosmin,
>=20
> On Mon, 17 Aug 2026 at 20:58, Cosmin Tanislav
> <cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> > When exporting a GPIO using the deprecated sysfs GPIO API,
> > gpio_is_visible() calls gpiod_to_irq() to determine whether a GPIO is
> > IRQ-capable, which ends up using
> > struct gpio_irq_chip::child_to_parent_hwirq().
> >
> > When using the GPIO character device, it is possible to request a line
> > and to dynamically switch between using it as an IRQ or as a GPIO, by
> > updating the edge detector.
> >
> > The current struct gpio_irq_chip::child_to_parent_hwirq() implementatio=
n
> > makes the assumption that it will only be called with the intention of
> > setting up the IRQ permanently, and that it will only be released when
> > the IRQ domain is freed.
> >
> > Since we now know that this is not the case, take the following steps i=
n
> > order to properly handle that case.
> >
> > Implement struct irq_chip::irq_{request,release}_resources() based on
> > the default GPIOCHIP_IRQ_RESOURCE_HELPERS implementations.
> >
> > Move the IRQ setup and release logic inside them.
> >
> > Keep the mapping logic inside ::child_to_parent_hwirq() to be able to
> > provide a proper HW IRQ number, but do not actually setup the IRQ.
> >
> > Remove rzt2h_gpio_irq_domain_free() as its only purpose was to free
> > the acquired IRQs.
> >
> > Cc: stable@kernel.org
> > Fixes: 829dde3369a9 ("pinctrl: renesas: rzt2h: Add GPIO IRQ chip to han=
dle interrupts")
> > Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
>=20
> Thanks for your patch!
>=20
> > --- a/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> > +++ b/drivers/pinctrl/renesas/pinctrl-rzt2h.c
> > @@ -1062,18 +1047,21 @@ static int rzt2h_gpio_child_to_parent_hwirq(str=
uct gpio_chip *gc,
> >
> >         rzt2h_pinctrl_set_pfc_mode(pctrl, port, pin, PFC_FUNC_INTERRUPT=
);
> >
> > -       *parent =3D parent_irq;
> > -       *parent_type =3D child_type;
> > +       ret =3D gpiochip_lock_as_irq(gc, hwirq);
> > +       if (ret) {
> > +               clear_bit(parent_irq - RZT2H_INTERRUPTS_START, pctrl->u=
sed_irqs);
>=20
> irq_idx
>=20

Ack.

> > +               rzt2h_pin_write_pm(pctrl, port, pin, pctrl->saved_pm[ir=
q_idx]);
> > +               rzt2h_pinctrl_set_gpio_en(pctrl, port, pin, true);
> > +               return ret;
> > +       }
> >
> >         return 0;
> >  }
> >
> > -static void rzt2h_gpio_irq_domain_free(struct irq_domain *domain, unsi=
gned int virq,
> > -                                      unsigned int nr_irqs)
> > +static void rzt2h_gpio_irq_release_resources(struct irq_data *d)
> >  {
> > -       struct irq_data *d =3D irq_domain_get_irq_data(domain, virq);
> >         struct gpio_chip *gc =3D irq_data_get_irq_chip_data(d);
> > -       struct rzt2h_pinctrl *pctrl =3D container_of(gc, struct rzt2h_p=
inctrl, gpio_chip);
> > +       struct rzt2h_pinctrl *pctrl =3D gpiochip_get_data(gc);
> >         irq_hw_number_t hwirq =3D irqd_to_hwirq(d);
> >         u8 port =3D RZT2H_PIN_ID_TO_PORT(hwirq);
> >         u8 pin =3D RZT2H_PIN_ID_TO_PIN(hwirq);
> > @@ -1089,7 +1077,39 @@ static void rzt2h_gpio_irq_domain_free(struct ir=
q_domain *domain, unsigned
> int v
> >                 rzt2h_pinctrl_set_gpio_en(pctrl, port, pin, true);
> >         }
> >
> > -       irq_domain_free_irqs_common(domain, virq, nr_irqs);
>=20
> Why is this no longer needed?
>=20

We moved from using struct gpio_irq_chip::child_irq_domain_ops::free to
using struct irq_chip::irq_release_resources, so free is no longer set.

devm_gpiochip_add_data() ->
devm_gpiochip_add_data_with_key() ->
gpiochip_add_data_with_key() ->
gpiochip_add_irqchip() ->
gpiochip_hierarchy_create_domain() ->
gpiochip_hierarchy_setup_domain_ops() ->

	if (!ops->free)
		ops->free =3D irq_domain_free_irqs_common;

It will end up being populated automatically, let me know if you think
we should set it explicitly.

> > +       gpiochip_unlock_as_irq(gc, hwirq);
> > +}
>=20
> Gr{oetje,eeting}s,
>=20
>                         Geert
>=20
> --
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m6=
8k.org
>=20
> In personal conversations with technical people, I call myself a hacker. =
But
> when I'm talking to journalists I just say "programmer" or something like=
 that.
>                                 -- Linus Torvalds
