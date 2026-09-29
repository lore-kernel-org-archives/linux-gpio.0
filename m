Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D65517BC0;
	Tue, 29 Sep 2026 10:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.203.200.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790678625; cv=pass; b=MGhyVoQpikReJL9oEkbiiBoZ2lL0CKL38wYarvloMQH4wYhJ+IMi7T/kip1E+pk5hWgYdJrfplx/C578N18JVPEiXtSX3YS2x3Zs0lIZgkFuYzEdK93sgS1KXC2wd49DejkNOEKwWEGkbWwi03YySZS/u/yMwoz6lMoxlBK/Kjc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790678625; c=relaxed/simple;
	bh=5J514lza0krHJitGl9UfuUtC5FyE9os6vFOtREHBAv4=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=I84O3BitSOEewJCJ7WIe6zg+6tC01bRAbw5TGPhcM5O6FxOz5Isoqaokkp/hqP563jc0219JWayjPyzPFeYW4QVgsJc5TK4zxvOTR3icxf01TMhZtS6p+216rNzDpFrtdRhpNEf1ooPEM7L60ZVpjVLxJ0WyLk35OFp6pGPGlNs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b=DT1p7VkP; arc=pass smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.b="DT1p7VkP"
Received: from [127.0.0.1] (unknown [IPv6:2a02:560:5dd5:4b00:9ebf:dff:fe00:fdb5])
	(Authenticated sender: sha@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id A4B3C200D2A;
	Tue, 29 Sep 2026 12:43:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790678608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8eqC9HECkZKv+r9GsTkWdSv68RlAX6I5shyNDqW9P6s=;
	b=DT1p7VkP/+svnE1aXJpl9neD2EF/pMzrVJBxKPudplyCaNaze8p8cPFVkQ2I9CJ0IlJ6v8
	QCCOuxO5jRXSXqgUAUA4X7U+p/vWvkbDJwwdUDqzxlUnpqozwrxU5f4BgWGEjWM/onlyqa
	lCXOMQeO0o5tCZYbL/XuJ5f1qpBzrLtoK5/XiFpYmEGsZr6hfcREjOML/teLePuQk07LiV
	RH8b+Zp5ltCnc5Y0XV9xlglTMSlCzl6/fXFBazHIafXddELdJX4NGSNPnbTgE3Dj3k4Mci
	9mSuxb/ybMOzDVTgbXGy54ZU5j+Uhnp8MXYTpgaz9mQ/HpasQ33r5rUcY/sRzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1790678608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8eqC9HECkZKv+r9GsTkWdSv68RlAX6I5shyNDqW9P6s=;
	b=fSvLa3xJhpuwvPHq3EPxV+H1qfWMY3WWJQLXe819ljo+0V0pOLypft7VyDAKJq+jF7Qetk
	CS2FYl1YruIRWcFHqe8lmOp64JFDMsqHwaqeYvYPDe6GCTZVzPXzY959lyYcrObh+KADxF
	m7s7qCGDzM8E85euAVHmxMNHOrW8RqW4qzD/8qp9yrKzaJtpT/OjvbDCqkyV325DtXUJcM
	OEBJFA8gE8VuGJuxhH5ZXWXu/r2bBkDhSI/0ug9YgESeDVi1Qc8AewQmj3OcRpN2zl21ht
	TUGMnNOOoIYR5I9+UwrJKg8hhPyLSnqHzZadu+wF+ZCUUyBW4yeaXgqEG1BjLA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1790678608; a=rsa-sha256;
	cv=none;
	b=NxXa8ydWaRiw34+wpF5HajG9GqvcG87aa+b8/veOZrxrOFn3fBVudb7mJXipccjMf7Pk4I
	TaDCaks7vN/HxFXRBnafqoM3dPFednm25TnJrmScfQTeQXsFT4CyhVp9NhbGF+h4DuhTNq
	U0M594bWVq2tqJQZFvFFwTI6x+PXZ2kkAocyQbcBK/k5hSg29/8S67BfSnHkb96fZuy2+v
	R1JofyV7ZVepVv1IxEn5hqUhSc9SvQQp2Jqd4neR1Yzer6A4rRwzIHADivzvbjnGdbTtJ+
	GFQjccHUJS6PWvFV1ALyCVKVlZdxjyT+aGeyf0mf09jGolFpiKM3o50baBdw/Q==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=sha@pengutronix.de smtp.mailfrom=s.hauer@pengutronix.de
Message-ID: <97e38914-bd04-4e01-8e5a-a729dfe0c7f5@pengutronix.de>
From: "Sascha Hauer" <s.hauer@pengutronix.de>
Subject: Re: [PATCH v9 2/2] clk: add TI CDCE6214 clock driver
To: "Jerome Brunet" <jbrunet@baylibre.com>
Cc: "Sascha Hauer" <s.hauer@pengutronix.de>, "Michael Turquette" <mturquette@baylibre.com>, "Stephen
 Boyd" <sboyd@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>, "Brian
 Masney" <bmasney+clk@redhat.com>, "Jerome Brunet" <jbrunet+clk@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, kernel@pengutronix.de, linux-gpio@vger.kernel.org, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Linus Walleij" <linusw@kernel.org>,
 =?utf-8?b?QWx2aW4gxaBpcHJhZ2E=?= <alvin.sipraga@analog.com>
In-Reply-To: <1jcxu18xme.fsf@starbuckisacylon.baylibre.com>
References: <20260921-clk-cdce6214-v9-0-f2ea74fd38a2@pengutronix.de>
 <20260921-clk-cdce6214-v9-2-f2ea74fd38a2@pengutronix.de>
 <1jcxu18xme.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 10:43:27 +0000
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>

Hi Jerome,

On 2026-09-25 11:54, Jerome Brunet wrote:
> > +
> > +#define R0	0
> > +#define RO_I2C_A0			BIT(15)
> > +#define RO_PDN_INPUT_SEL		BIT(14)
> > +#define RO_GPIO4_DIR_SEL		BIT(13)
> > +#define RO_GPIO1_DIR_SEL		BIT(12)
> > +#define RO_ZDM_CLOCKSEL			BIT(10)
> > +#define RO_ZDM_EN			BIT(8)
> > +#define RO_SYNC				BIT(5)
> > +#define RO_RECAL			BIT(4)
> > +#define RO_RESETN_SOFT			BIT(3)
> > +#define RO_SWRST			BIT(2)
> > +#define RO_POWERDOWN			BIT(1)
> > +#define RO_MODE				BIT(0)
> > +
> > +#define R1	1
>=20
> I don't really get the point of those defines

It was requested by Stephen [1]:

> Maybe it would be better to have '#define R30 30' just so we can easily
> jump to the fields like R30_PLL_NDIV. I see that the datasheet doesn't
> give a name to these registers besides prefixing the decimal offset with
> the letter 'R'.

I don't have any personal preference.

[1] https://lore.kernel.org/all/e5858fe5d4276a735c5354e955358f27@kernel.org/

> > +static int cdce6214_clk_out_set_parent(struct clk_hw *hw, u8 index)
> > +{
> > +	struct cdce6214_clock *clock =3D hw_to_cdce6214_clk(hw);
> > +	struct cdce6214 *priv =3D clock->priv;
> > +
> > +	switch (clock->index) {
> > +	case CDCE6214_CLK_OUT1:
> > +		regmap_update_bits(priv->regmap, R56, R56_CH1_MUX, FIELD_PREP(R56_CH=
1_MUX, index));
> > +		break;
> > +	case CDCE6214_CLK_OUT2:
> > +		regmap_update_bits(priv->regmap, R62, R62_CH2_MUX, FIELD_PREP(R62_CH=
2_MUX, index));
> > +		break;
> > +	case CDCE6214_CLK_OUT3:
> > +		regmap_update_bits(priv->regmap, R67, R67_CH3_MUX, FIELD_PREP(R67_CH=
3_MUX, index));
> > +		break;
> > +	case CDCE6214_CLK_OUT4:
> > +		regmap_update_bits(priv->regmap, R72, R72_CH4_MUX, FIELD_PREP(R72_CH=
4_MUX, index));
> > +		break;
>=20
> Can you properly describe your clock rather than doing this sort of
> matching ?

You mean something like:

struct cdce6214_clk_data {
        unsigned int pd_reg;
        u32 pd_mask;
        unsigned int reg;
        u32 mux_mask;
        u32 div_mask;
};

static const struct cdce6214_clk_data cdce6214_clk_data[CDCE6214_NUM_CLOCKS=
] =3D {
        [CDCE6214_CLK_OUT1] =3D {
                .pd_reg =3D R4,
                .pd_mask =3D R4_CH1_PD,
                .reg =3D R56,
                .mux_mask =3D R56_CH1_MUX,
                .div_mask =3D R56_CH1_DIV,
        },
        ...
};

If yes, I can do that.

> > +static int cdce6214_get_psx_div(unsigned long rate, unsigned long pare=
nt_rate)
> > +{
> > +	unsigned int div =3D DIV_ROUND_CLOSEST(parent_rate, max(rate, 1UL));
> > +
> > +	return clamp(div, 4, 6);
> > +}
>=20
> Can't you just use a regular divider operation ? split you clocks in
> different entities ?

I can switch to use the generic divider helpers (divider_recalc_rate,
divider_determine_rate). Is that where you aiming at or do you want me
to register the clocks as composite clocks?

> > +static int cdce6214_probe(struct i2c_client *client)
> > +{
> > +	struct device *dev =3D &client->dev;
> > +	struct cdce6214 *priv;
> > +	struct pinctrl_dev *pctl;
> > +	int ret;
> > +
> > +	priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +	if (!priv)
> > +		return -ENOMEM;
> > +
> > +	priv->client =3D client;
> > +	priv->dev =3D dev;
> > +	i2c_set_clientdata(client, priv);
> > +	dev_set_drvdata(dev, priv);
> > +
> > +	priv->reset_gpio =3D devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_=
LOW);
> > +	if (IS_ERR(priv->reset_gpio)) {
> > +		return dev_err_probe(dev, PTR_ERR(priv->reset_gpio),
> > +				     "failed to get reset gpio\n");
> > +	}
> > +
> > +	priv->regmap =3D devm_regmap_init_i2c(client, &cdce6214_regmap_config=
);
> > +	if (IS_ERR(priv->regmap))
> > +		return dev_err_probe(dev, PTR_ERR(priv->regmap),
> > +				     "failed to init regmap\n");
> > +
> > +	ret =3D cdce6214_configure(priv);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D devm_pinctrl_register_and_init(dev, &cdce6214_pdesc, priv, &p=
ctl);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "pinctrl register failed");
> > +
> > +	ret =3D pinctrl_enable(pctl);
> > +	if (ret)
> > +		return dev_err_probe(dev, ret, "pinctrl enable failed");
>=20
> It feels like it should an MFD driver. half the driver belong in pinctrl

I'd rather not go that way as it means splitting a relatively straight
forward driver into three subsystems with different maintainers. Also it
means getting cross device dependencies right.

Taking "Multi Function Device" by its name it means it's a device with
multiple functions. The CDCE6214 is not that, it's only purpose is to
generate clocks, only that the pins need some configuration. Most other
devices of this type just have device specific properties in the device
tree for configuring their pins (which I was rightfully pushed away from
in earlier reviews).

Sascha

--=20
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

