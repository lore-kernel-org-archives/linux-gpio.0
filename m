Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559075;
	b=p/PqJG2CsRYTIehYhIxCxaXX+HBLrjG+3xVQ/HPSVG6PpKvqlaGDqaIAu0eDlJRj4/k+
	 xmuSTavP78tpFhOqJlDdyLUb4+sGBYBoPWvf7hl0Rrz4xCPG2lMko7Nqy3GYhx/397asy
	 5zRa71OfR99cdtwAmjqe1krWSeZ5Q9CnKidaYYz3ZdU1cx6hZ39AzfUZNC0NP1RpDBPRw
	 Cq/OhkJf6gpa/RhwLkfyylMQYehyay2kxdo7Sm0J00J5dW32/9R0G9kSm8quKwGgL7RLe
	 Fn7Vgo/DFED6xqaW4yp6d6YFu1Z1ILhzGMBMkOX13pQLBPe8MpeH41phLAdxgDH531A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559075;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=a+0ltUzacm2W+DnThBtGlVgS0KY3jvvdTcfl+Ic97Cw=;
	b=TZM2NFFDINPWkQeCIyYbRLugUKfFFaHIgDdewuZy/xh+XYDXBQbY0s65i4/XZozzUpjr
	 TKhMhtjWXAcqJdXO6OrxlJG+QyRY2zlJQrTxVfp5/1fP0onWJX3CelPdk/SsHbd//AetP
	 etjj4sFqVfUPOmKS6ckR9AVj5oKQt1goh6bPrTMyWIXzc2Yh/wHvPrbYC1ELXniI7XjQM
	 Bir+fDpqwe193+t8NZpNW5lsbpnFXW0Db262P1GEhqe5VHsTaVmduT6blXaqgXDAY4Dz2
	 ew+pBAaMauLwM94D0SOtzXrVDIOnYIn7FJV92H1PykD2HdzYMxNtyUeoCdNhoXpZWuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bvfDC6cL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDBD1606A339;
	Fri, 13 Nov 2026 08:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bvfDC6cL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D8611F000C5;
	Fri, 13 Nov 2026 08:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794559075;
	bh=a+0ltUzacm2W+DnThBtGlVgS0KY3jvvdTcfl+Ic97Cw=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=bvfDC6cL7ebiHcTAsLxHkhHKTcHSXUh2unJM2aAlHUEgFSOOItT2eksSfHAPZIqi8
	 0BBKCNXFCUIi8n/ZeBwy1OwiN3lW4ze6WNKq9LT5P7ps1MEI/507YhC1KR4CXUHPYK
	 DFOTdMVKQlONDSr+M+SiQTwkqM7RGWphokOlWMefsFqOUYsScHyWUU9IIXxY2n2w3n
	 4Ja3NZ7Vxtq4btqYd30O8iux0edf5BO/JrIk3aA/5BWK+zq5whot8vdnYRp1o5Dequ
	 DfcRkvBWFyQvDCVBdvI4wY+bss2VjMfhCwaniRN7cQqiW7d2yJq1TXdeoOPS6aFxNG
	 7Zvb9hqlXSn1Q==
Message-ID: <sashiko-outbox-212425@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] pinctrl: ingenic: Add X2600 pin groups and
 functions
Reply-To: sashiko-reviews@lists.linux.dev
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <afd42cc2ca2c93501ff1769b7d7a25559ef68a2f.1794557697.git.hns@goldelico.com>
References: <cover.1794557697.git.hns@goldelico.com>
 <afd42cc2ca2c93501ff1769b7d7a25559ef68a2f.1794557697.git.hns@goldelico.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 13 Nov 2026 08:37:54 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 3 potential
issues to consider:
- [Medium] pinctrl: ingenic: x2600 pin groups omitted from
  x2600_functions table
- [Medium] pinctrl: ingenic: truncated pull bitmasks in x2600_pull_ups
  and pull_downs
- [Low] pinctrl: ingenic: empty x2600_lcd_none_pins breaks
  ingenic_pinconf_group_get()
--

commit faeb190e107ce4d769c2094c52cf1675b346a6a9
Author: H. Nikolaus Schaller <hns@goldelico.com>

pinctrl: ingenic: Add X2600 pin groups and functions

This commit adds pin groups, pinmux functions, pull-up/pull-down masks, and
register access ranges for the Lumissil X2600 SoC to the Ingenic pinctrl
driver.

> diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-=
ingenic.c
> index 6794c662d2afe..557cd652ecc00 100644
> --- a/drivers/pinctrl/pinctrl-ingenic.c
> +++ b/drivers/pinctrl/pinctrl-ingenic.c
> @@ -3515,6 +3515,503 @@ static const struct ingenic_chip_info x2100_chip_=
info =3D {
>  	.access_table =3D &x2000_access_table,
>  };
> =20
> +static const u32 x2600_pull_ups[5] =3D {
> +	0x000007ff, 0xffffffff, 0x7ffbfff, 0x0000ffff, 0x000ffffe,
> +};
> +
> +static const u32 x2600_pull_downs[5] =3D {
> +	0x000007ff, 0xffffffff, 0x01ffff1, 0x0001e000, 0x000fffff,
> +};
> +
> +static int x2600_can0_pins[] =3D { 0x47, 0x48, };
> +static int x2600_can1_pins[] =3D { 0x49, 0x4a, };
> +
> +static int x2600_cim_pins[] =3D {
> +	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07,
> +	0x08, 0x09, 0x0a, 0x0b,
> +};

[Severity: Medium]
Are the Port C and Port A masks in x2600_pull_ups and x2600_pull_downs
truncated?

The Port C entries (0x7ffbfff and 0x01ffff1) have only 7 hex digits instead
of 8, leaving bits 27..30 clear so ingenic_pinconf_set() rejects pull
configuration with -EINVAL on PC27..PC30 (0x5b..0x5e, used by
x2600_msc1_1bit_c_pins, x2600_msc1_4bit_c_pins, and the ssi1-*-c25 groups).
Similarly, the Port A mask 0x000007ff only covers 11 pins (0x00..0x0a),
which causes group pull configuration on cim-data to fail with -EINVAL on
PA11 (0x0b).

[ ... ]

> +static int x2600_lcd_sync_pins[] =3D { 0x3c, 0x3d, 0x3e, 0x3f, };
> +
> +static int x2600_lcd_none_pins[] =3D { };

[Severity: Low]
Does defining x2600_lcd_none_pins as an empty array break
ingenic_pinconf_group_get() for the "lcd-none" group?

When npins is 0, the loop in ingenic_pinconf_group_get() does not execute
and the function returns 0 without updating *config:

drivers/pinctrl/pinctrl-ingenic.c:ingenic_pinconf_group_get() {
	...
	for (i =3D 0; i < npins; i++) {
		if (ingenic_pinconf_get(pctldev, pins[i], config))
			return -ENOTSUPP;
	...
	return 0;
}

Reading debugfs pinconf-groups then reports every generic pin_config_param
as active on "lcd-none", and selecting "lcd-none" in
ingenic_pinmux_set_mux() is a no-op that configures no pins.

[ ... ]

> +	/* I2S (Audio) & PCM */
> +	INGENIC_PIN_GROUP("i2s-clk-rx", x2600_i2s_clk_rx, 1),
> +	INGENIC_PIN_GROUP("i2s-sysclk", x2600_i2s_sysclk, 1),
> +	INGENIC_PIN_GROUP("i2s-clk-tx", x2600_i2s_clk_tx, 1),
> +	INGENIC_PIN_GROUP("i2s-data", x2600_i2s_data, 1),
> +	INGENIC_PIN_GROUP("pcm", x2600_pcm, 3),

[ ... ]

> +	INGENIC_PIN_GROUP("pwm10-c", x2600_pwm10_c, 0),
> +	INGENIC_PIN_GROUP("pwm10-e", x2600_pwm10_e, 2),
> +	INGENIC_PIN_GROUP("pwm11", x2600_pwm11, 0),
> +	INGENIC_PIN_GROUP("pwm12", x2600_pwm12, 0),
> +	INGENIC_PIN_GROUP("pwm13", x2600_pwm13, 0),
> +	INGENIC_PIN_GROUP("pwm14", x2600_pwm14, 0),
> +	INGENIC_PIN_GROUP("pwm15", x2600_pwm15, 0),
> +	INGENIC_PIN_GROUP("pwm-trig-c", x2600_pwm_trig_c, 1),
> +	INGENIC_PIN_GROUP("pwm-trig-d", x2600_pwm_trig_d, 1),

[ ... ]

> +	/* WAIT */
> +	INGENIC_PIN_GROUP("wait", x2600_wait, 3),
> +};

[ ... ]

> +static const struct pinfunction x2600_functions[] =3D {
> +	INGENIC_PIN_FUNCTION("can0", x2600_can0),
> +	INGENIC_PIN_FUNCTION("can1", x2600_can1),
> +	INGENIC_PIN_FUNCTION("cim", x2600_cim),
> +	INGENIC_PIN_FUNCTION("exclk", x2600_clk),
> +	INGENIC_PIN_FUNCTION("dmic", x2600_dmic),
> +	INGENIC_PIN_FUNCTION("i2c0", x2600_i2c0),
> +	INGENIC_PIN_FUNCTION("i2c1", x2600_i2c1),
> +	INGENIC_PIN_FUNCTION("i2c2", x2600_i2c2),
> +	INGENIC_PIN_FUNCTION("i2c3", x2600_i2c3),
> +	INGENIC_PIN_FUNCTION("i2s", x2600_i2s),
> +	INGENIC_PIN_FUNCTION("lcd", x2600_lcd),
> +	INGENIC_PIN_FUNCTION("mac", x2600_mac),
> +	INGENIC_PIN_FUNCTION("mmc0", x2600_msc0),
> +	INGENIC_PIN_FUNCTION("mmc1", x2600_msc1),
> +	INGENIC_PIN_FUNCTION("otg", x2600_otg),
> +	INGENIC_PIN_FUNCTION("pwm0", x2600_pwm0),
> +	INGENIC_PIN_FUNCTION("pwm1", x2600_pwm1),
> +	INGENIC_PIN_FUNCTION("pwm2", x2600_pwm2),
> +	INGENIC_PIN_FUNCTION("pwm3", x2600_pwm3),
> +	INGENIC_PIN_FUNCTION("pwm4", x2600_pwm4),
> +	INGENIC_PIN_FUNCTION("pwm5", x2600_pwm5),
> +	INGENIC_PIN_FUNCTION("pwm6", x2600_pwm6),
> +	INGENIC_PIN_FUNCTION("pwm7", x2600_pwm7),
> +	INGENIC_PIN_FUNCTION("pwm8", x2600_pwm8),
> +	INGENIC_PIN_FUNCTION("pwm9", x2600_pwm9),
> +	INGENIC_PIN_FUNCTION("pwm10", x2600_pwm10),
> +	INGENIC_PIN_FUNCTION("sfc", x2600_sfc),
> +	INGENIC_PIN_FUNCTION("slcd", x2600_slcd),
> +	INGENIC_PIN_FUNCTION("ssi0", x2600_ssi0),
> +	INGENIC_PIN_FUNCTION("ssi1", x2600_ssi1),
> +	INGENIC_PIN_FUNCTION("ssi-slv", x2600_ssi_slv),
> +	INGENIC_PIN_FUNCTION("uart0", x2600_uart0),
> +	INGENIC_PIN_FUNCTION("uart1", x2600_uart1),
> +	INGENIC_PIN_FUNCTION("uart2", x2600_uart2),
> +	INGENIC_PIN_FUNCTION("uart3", x2600_uart3),
> +	INGENIC_PIN_FUNCTION("uart4", x2600_uart4),
> +	INGENIC_PIN_FUNCTION("uart5", x2600_uart5),
> +	INGENIC_PIN_FUNCTION("uart6", x2600_uart6),
> +	INGENIC_PIN_FUNCTION("uart7", x2600_uart7),
> +	INGENIC_PIN_FUNCTION("tcu", x2600_tcu),
> +};

[Severity: Medium]
Were the "pcm", "pwm11" through "pwm15", "pwm-trig-c", "pwm-trig-d", and
"wait" pin groups left out of x2600_functions?

These nine groups are defined in x2600_groups, but they have no
corresponding group arrays or INGENIC_PIN_FUNCTION() entries in
x2600_functions, so pinmux_map_to_setting() will reject any pinctrl mapping
trying to mux them with -EINVAL.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1794557697.gi=
t.hns@goldelico.com?part=3D3
