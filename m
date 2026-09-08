Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011011.outbound.protection.outlook.com [40.107.74.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4406559CB4;
	Tue,  8 Sep 2026 13:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788873212; cv=fail; b=oY0VY6WDRr/Lp3LJITZBtNoPH4FgaLOa9qMeQh2zvY15gtNOAbj72OjUomGv/N3fFXK9E2t5AnP3PB2atWbntn8OdiNsIXMgXpMRl6g3nWRcPGyK8GAwTLD3XasdUeP6AtUhL87yyrIKOFSX+gCSn+P3vWDvD1EHehiTI0v5xc4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788873212; c=relaxed/simple;
	bh=uzgImhQKY0YfMNnY9MRd8UE/opwzEzBWUmINAb/hte4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Nbmjw68li/7Hif4HMO4FUfFmiErp0LCxjGiZ02fj74Zs+/qoQfZ+ln4DkMiYHr2n4+jM2MSah4IPXNab2vjX307Y2YUFKWR942hsAQR2P12s9MMweOsDAYXkfBG/vA2wvfnDnlZYkCCpBXawVocIJCv8cPeAyhJR/cGrcC+VfVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=hilaCJsu; arc=fail smtp.client-ip=40.107.74.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="hilaCJsu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=upTmGUMnTwytdwgXDuCmOEioqfoLto9M++hqlnBQYdOtHX7+SxVeg7SGGtiv6xv/FvNpioiyeEfAGM6xe9LRoa7l1pKzm9stB/viNhk/uavwg/68jqPMrqVquhdwzJwFmloaIS/MU3Kzf70DffWiicdJY7S7npcNgjGBSdQZe7d0eDCeNyBwWWZB2UTYUNGyP/eiLCFiqebU7HrwlPm0wCy+fXAw41252X0Wyzu9Hx2prO8WqCfDTUg1HH2mzERMaD4+6T1WhjtLNY1ZqNw+it3uk7fLZA0RbICE4hqUnDnnHILxSveBUfeiS1xt4wXCn2Xg6nM3yBAw31xZ+zLHFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bxPwIWZxysW2N0sv00HrZF3vGysduBjd7bpdIdJklR4=;
 b=R/bfPNQ5/RZ4P1PXiYnJC99BoBagTW+lt9D8xCKwCIIBgwgUjJhHa/GjW7eL/pIwVVkZCfhwvxwe05YXAJAdP7bsUM/4TZfa7JfTI8uXVmgsKvOZRl/qg95qx7NMEy8AmsbE2GJPa0i59v/cLklvcJGZFJ+QtVR5WdQtE4LAOrpCeySXJLHVXG9pD8srAaB31vBbZKr/ua7t/oB+zD5LjpwBXQfgJsKBbfB8KA1na+iHK/Gt3SVLmulim7NPG7wFdWE3tLE2+VtvYEH5tKbEjDEUNN5ZV/roO35WMu9ECFv1EYSL7Rup8SA6AdrgZa82+1JTm48qk2TNs4/JAouwXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bxPwIWZxysW2N0sv00HrZF3vGysduBjd7bpdIdJklR4=;
 b=hilaCJsu6Bsc4WbLasHgF/xK9V9IOQrWnNlXmzwIBik0YVSGGl8TJL5bsp51ecPQlJaba+x+FCzSHLfE1lCq+++7z0ZbWxoGovbGQPX/T+le7o/2g19mIS0yoka2JFK9L/Yg0GwCv8phpO2I0JAB0ZVgUEPuWIOxCWrqzitEXmo=
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 (2603:1096:405:29b::10) by TYCPR01MB11899.jpnprd01.prod.outlook.com
 (2603:1096:400:38c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Tue, 8 Sep
 2026 13:13:22 +0000
Received: from TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::a68f:5c9:9de8:4fa4]) by TYRPR01MB15619.jpnprd01.prod.outlook.com
 ([fe80::a68f:5c9:9de8:4fa4%3]) with mapi id 15.21.0406.005; Tue, 8 Sep 2026
 13:13:22 +0000
From: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: geert <geert@linux-m68k.org>
CC: Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"stable@kernel.org" <stable@kernel.org>
Subject: RE: [PATCH 4/7] pinctrl: renesas: rzt2h: fix reading pin value in IRQ
 function
Thread-Topic: [PATCH 4/7] pinctrl: renesas: rzt2h: fix reading pin value in
 IRQ function
Thread-Index: AQHdLnphGKO1zzMM4EueHC4thk/rjrbEk5mAgAAlxuA=
Date: Tue, 8 Sep 2026 13:13:22 +0000
Message-ID:
 <TYRPR01MB1561923FCDFBC721F326FEE6985B12@TYRPR01MB15619.jpnprd01.prod.outlook.com>
References: <20260817185700.322370-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20260817185700.322370-5-cosmin-gabriel.tanislav.xa@renesas.com>
 <CAMuHMdUHAXzRiODL9hphVTjqKOHNVUe8cOygXESWF6_r7Ou2yw@mail.gmail.com>
In-Reply-To:
 <CAMuHMdUHAXzRiODL9hphVTjqKOHNVUe8cOygXESWF6_r7Ou2yw@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYRPR01MB15619:EE_|TYCPR01MB11899:EE_
x-ms-office365-filtering-correlation-id: b5e3468b-3412-4518-d905-08df0daaf559
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|23010399003|366016|1800799024|376014|10067099003|3023799007|22082099003|18002099003|11063799006|56012099006|4143699003|38070700021;
x-microsoft-antispam-message-info:
 CGpHcMxa/kSsdGUf1gs1HU+Z61XEc0DFVEi2Luc/l6d+SbHx3yXmDWZ+YddJaTJaZ3mWJ1BQZcXMXBXSIjTH7lAbukcn5oNU1ZlO+esNG6KpU28TOFMWnTyfIzheLF4DqV3MSXwXAWPZAZtkLU2AY6ismTLRP8ZkaKcCrFY5DGxvHCXXuBnssDCwC9XtVdWmla96lR5vig/zB74AJep3XjWxDX79yYqo/rDkMC9OAmUr6BDt+D7/asPyvKo1XBUEn6Uo8QTnAuBP1PQqEhspu7MkZxnOYcxbQUIysC58z0dA0D9U2GNjYzDxCAOaLGSL1kL7vsPM/l5Orne4irq75HBIKT28tZ++egdW/Wc2N+1iBMTqAOknl93aOKTWM35TkTeSmFOpOxLJu+b1ZtLkfWnY86PQCuqelJB+PnGFF0YbQ2n4GxeQKYnEyhlRBn89iE/XmVQoVQ72JeD0MskV5GRYTDtK+D2eLAJx6FEFaHrwe6nfeugggY3Sq4WXxq08qHttfrBfNmPc5AmF/2XIQvU/SGhuG015LiNNZFE7PaAqZex7wTf7VmQfys24ubY630mfNppawNe5z6EqGzcEltXmf5gFd+AIslBtHKYWZQrrImo+rvIHFO3R/Q5zoaa+aL6aCkNF51iEBeaamM+QA/SePqkm9eK90OFNPucQIFUbkb90xJrcBSsfCJyNfe4xzasjeHorzMvTmVsa9Aa652oogPVn6PY1EukQ3yq0LQ8=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYRPR01MB15619.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(10067099003)(3023799007)(22082099003)(18002099003)(11063799006)(56012099006)(4143699003)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?egzHlbTlcTFAP27k8Ii9ywwlx9qiWsABaXic0X2IM1YPc9myJCzqEAcwlIG0?=
 =?us-ascii?Q?H2CmCdL2sTGUj/hTTmP/tzOSagUTdwhfsCqnIuCRTP6mWcMEjXLwa04ZMH6j?=
 =?us-ascii?Q?RPiOBfuoCh0E746hQXTCwYQaNb7D1DGtsHQ/Hsz/wiTA07nkQWCTjkqLpCZO?=
 =?us-ascii?Q?lfvPYRRGqaooQZRUe53fKKGGFpnVWdH3GqB3vVocCWznWkge0CF/LmolTire?=
 =?us-ascii?Q?H4fbBFnJgSSEWn0SLw/lIRW+3iQ55NPRTPYFbxJukQzWeKN7ZX5u47AHrrti?=
 =?us-ascii?Q?jyK9f9W8tZwjq6KMLt/TGaRm/DQ9dE9IrakWV4MBql235mCAXuDugkXY8oCJ?=
 =?us-ascii?Q?J44RODgyxOzD8G/Q9K9X6f8qLxoR9LSaDZE+Cxkm2p7pSF2Jinj93zr/Hgd7?=
 =?us-ascii?Q?WLrk38M+Bmi5TJQU/WWK2H87mjI1G2G3HbP59MyuI3iNQTtU/G5qGWgvUpQv?=
 =?us-ascii?Q?URM8BDoZjPJOftNWdCqrD7xLMSsNi7jO6A/Aii7wQG+mE2QJWeIFeDt+/qfg?=
 =?us-ascii?Q?Jd4TWNT1xP2q0Mft6kf3gvSsTGkY9TQ9s40/lKg7XzE76Dk6C8f9QjNh48LN?=
 =?us-ascii?Q?aOgODiOiltWGbqpxx6OlFuCGXDZa9qhMsvOwM88cqXw+cIoHfTbXOTTaeUK0?=
 =?us-ascii?Q?hecVFo3K97FAmq4Rh5a15+6/bqd5CBej1uVnRcS2cUTUCiULXM2bcJA27sgB?=
 =?us-ascii?Q?/7mOc10Y4k3Tet3YYaW3C3ATGLNPQDi4MLfijiZz3XFV98z8TpL4gTmzXhro?=
 =?us-ascii?Q?rXxskY1bkn+pr2zi4afjiY30I5/+BiVYrq7kfbGc6tQU2m5wo0+DVtSy283x?=
 =?us-ascii?Q?BOjSFLUYFiMN/093xSh2ZQQNlWNF4eaJeDxXmfU0wjNNhCoHiLExafd4hKn2?=
 =?us-ascii?Q?lzBJgUYvHjjIjUuBhPqoXEhcGTkc4hHm6syaVObFx1wiEY4X4xyiTFXN5Z/H?=
 =?us-ascii?Q?pnZD92IQ+s1qb8WJjqGMdKNqTDxIVQijFmlhZdNY6luxyHXBUnfCQlh2CGBO?=
 =?us-ascii?Q?V5Cr9JEdDx3EpSBYm5LisMhrLGQeHOiBWQT2AHjG5bTy65XDrbgkkrjKt7OC?=
 =?us-ascii?Q?qASh5YowN5T5z9I/UMAZiwRE/Vvxh0wBWbb+5LGcsLbnPR8iDaIO5HjYgcwL?=
 =?us-ascii?Q?kWUn3IRT3xAilr1JJTxTQoe9agGvIxcORcu0tVauO33YpC4L0eJ4YzNTRJn0?=
 =?us-ascii?Q?lHy3xX9jOOvbuRev25npf7BjY2YVZzJZK9k1uIvO96iIO5C7H8oFtVC+Wy3V?=
 =?us-ascii?Q?RBTntTzTqSy5tOLD+8wC9HoFnvWQcouW3w3rPQci1DJS34jhUO/HmvRDRNTP?=
 =?us-ascii?Q?iXTskvO93IaatZF8C0a+dSuNX+Jrz8BC/t0Y4zUfboM86CNi0+vz/s9L7syY?=
 =?us-ascii?Q?qbLclbwb/mZ8onUZcc05TzmMfp6Rug/vLnS8QCAZDntxriFrj6IQjXuGp/rW?=
 =?us-ascii?Q?/cGsOOFXbgaEQOqlD5fg6bBh232eMrW7KvncezomiOWXdqzqWDoQDqTud3DT?=
 =?us-ascii?Q?l/qdv4511XwCZxj796s9bZXVVSS5seaRj5V3X8t//t40PuooMXmMb4o3/zqI?=
 =?us-ascii?Q?+WdAFKx0lEohCrUylVCLid2yBnu8P04l6ukXqoByd2PS+GfptmJH6lLk13yt?=
 =?us-ascii?Q?E5DxzRV3IHz9nss2lyE/rx2EWNyMnqN61Rb4OVLb6doU3l/Am/btuJHrNyQd?=
 =?us-ascii?Q?PBgHz/E85ePPrcuu1CHKIz8juHZX63uvI0lhDSHnerK8Fy9sIChlpUHBtfgZ?=
 =?us-ascii?Q?nYhoDo/mlm8faGeUAgc345MMuVYABUVALywFlkexCDFKAmD+iRFK?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: b5e3468b-3412-4518-d905-08df0daaf559
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Sep 2026 13:13:22.1276
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 264pLrw79xW7PgisNjBNTnbl72lpWGxtdgVPaSV3Uutqta1SZ1clegkjrFb0KpnxqaoraPLr07PFRyqhOHGzhMkCAm0cUAoexP8kwJsdga7rCaRsB7d8wmoj4Uv11Bkr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11899

> From: Geert Uytterhoeven <geert@linux-m68k.org>
> Sent: Tuesday, September 8, 2026 12:56 PM
>=20
> Hi Cosmin,
>=20
> On Mon, 17 Aug 2026 at 20:58, Cosmin Tanislav
> <cosmin-gabriel.tanislav.xa@renesas.com> wrote:
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
> > @@ -171,6 +171,23 @@ static int rzt2h_validate_pin(struct rzt2h_pinctrl=
 *pctrl, unsigned int offset)
> >         return (pincfg & BIT(pin)) ? 0 : -EINVAL;
> >  }
> >
> > +static bool rzt2h_pin_mode_is_peripheral(struct rzt2h_pinctrl *pctrl, =
u8 port, u8 bit)
> > +{
> > +       return rzt2h_pinctrl_readb(pctrl, port, PMC(port)) & BIT(bit);
> > +}
> > +
> > +static u8 rzt2h_pin_read_pfc(struct rzt2h_pinctrl *pctrl, u8 port, u8 =
pin)
> > +{
> > +       u64 reg64 =3D rzt2h_pinctrl_readq(pctrl, port, PFC(port));
> > +
> > +       return field_get(PFC_PIN_MASK(pin), reg64);
> > +}
> > +
> > +static bool rzt2h_pin_read_input(struct rzt2h_pinctrl *pctrl, u8 port,=
 u8 bit)
> > +{
> > +       return rzt2h_pinctrl_readb(pctrl, port, PIN(port)) & BIT(bit);
> > +}
> > +
> >  static u8 rzt2h_pin_read_pm(struct rzt2h_pinctrl *pctrl, u8 port, u8 p=
in)
> >  {
> >         u16 reg =3D rzt2h_pinctrl_readw(pctrl, port, PM(port));
> > @@ -847,6 +864,13 @@ static int rzt2h_gpio_get(struct gpio_chip *chip, =
unsigned int offset)
> >         u8 bit =3D RZT2H_PIN_ID_TO_PIN(offset);
> >         u16 reg;
> >
> > +       if (rzt2h_pin_mode_is_peripheral(pctrl, port, bit)) {
> > +               if (rzt2h_pin_read_pfc(pctrl, port, bit) =3D=3D PFC_FUN=
C_INTERRUPT)
>=20
> Section 17.4.5 ("PINm : Port m Input Register (m =3D 00 to 35)") states:
>=20
>    "The PINm register is valid not only for general I/O mode (PMCn =3D 0b=
)
>     but also when peripheral function is selected (PMCn =3D 1b) and it wo=
rks
>     as input."
>=20
> this is not limited to PFC_FUNC_INTERRUPT, so I think you can drop
> this check?
>=20

Ack.
