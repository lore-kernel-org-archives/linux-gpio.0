Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794903109;
	b=lHJsKPBhhGiMqF46FdrlsoCK+7oj+M6eQ/qduCqXwLBnxZQeoV+pyTG0VrkfBKxgW5+f
	 IBrk/PSA38lTlFR44WrOsb1YEYur2zdz9OU96TcwuMWL5wpdjG67B5mtDGvgPHEKhV9gp
	 i7mSImsojmDCqrD08y5ndc1m+yTwqWtn/UwSa2HoN7da2XDWtrY2D6fo25RS39Dzh3rgy
	 dQjpoVoZ5WpCpvIkkscocPTFzeaDA2jTIbfUT4IaG5h8JGQONEB1ri+F+51kC8croUEmt
	 vKekY/X7CqY+Y92iCodRGHBUBxHyGPXtWmofEJxDl/5w+ApuU8mVuM5iw5B1XU+nWpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794903109;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=q0mOE/WXidGylHHvlzPC9fKsEennq4CBjN+ALniSGL0=;
	b=QTC1stvOqmB6Ep41Ne0DSKbUOTF74CqgrzgumOddh08FYCzFPZ49Hvt3KgiagoD8pIuc
	 d10mRPSEUUDEWSvf+a8HVzoDs/Z6kEzu7Ls6jYGngFkYTZbTY2CZTLteBweuotU+Sc6Fo
	 +hcGIUMKWZRg8lh4W5d6OO8LZ8NV4W1YZIpW47nIYOsUFKmN1Zz7UQuPYImo0VP+f3ij3
	 8/R/UWKtYjPTlXVNP+cZILU+bauaIfMVhtksrMHbCYE/eEzYRb4bylrCLsIvJtA0QUB4q
	 6TLJOB00fbw1n3wO55xVXLjELxRHlkCyuFZaPchFUcewc/OPvZ8jD2uQFmX7/sYX0QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="XrAG/eJI";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDB2606A31C;
	Tue, 17 Nov 2026 08:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XrAG/eJI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FBBB1F000C4;
	Tue, 17 Nov 2026 08:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794903108;
	bh=q0mOE/WXidGylHHvlzPC9fKsEennq4CBjN+ALniSGL0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XrAG/eJINjv6rYynjPml/Gz7AHzs5ZMmzQZBhV64cAHqjNk7w3nuVn7kP39jCVXkm
	 JyeIaVNngWAbtCpezl8QEE0bPtnMxAwiq6utd18vEcZcrazlAO8vTK5T/S50cpv2cd
	 3MCdTdndmFKa6CKapH69ndRh2GOlrcoLokFvkVfmDWagH31n0vIz0crExxRG2w5gkW
	 Z6SwE+TFiLrGnLfPvTWu82FOtHQxpaed19fVXU9SyawpvrO9bJ+Cz8ej5aq0DjwijM
	 37yyUHmfSw2Qrl2D1P6e5TMdhcbNj6L1qE9HdHvdjpw00M0goNjnBOlimdjrtWYM0M
	 VTeJ1PEYpeCnQ==
Message-ID: <sashiko-outbox-218397@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] pinctrl: qcom: Add qcs615 lpass lpi pinctrl
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Karthik S" <karthik.s@oss.qualcomm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261117075100.272535-3-karthik.s@oss.qualcomm.com>
References: <20261117075100.272535-1-karthik.s@oss.qualcomm.com>
 <20261117075100.272535-3-karthik.s@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 17 Nov 2026 08:11:48 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] pinctrl: qcom: missing LPI_FUNCTION(gpio) in qcs615_functions
- [Low] pinctrl: qcom: i2s2 functions in qcs615_functions mismatch DT
  binding
--

commit 90c734ca8b12506dd8f24f8affa76e931746bc81
Author: Karthik S <karthik.s@oss.qualcomm.com>

pinctrl: qcom: Add qcs615 lpass lpi pinctrl driver

This commit adds the LPASS LPI pinctrl driver for the Qualcomm QCS615
platform.

> diff --git a/drivers/pinctrl/qcom/pinctrl-qcs615-lpass-lpi.c b/drivers/pi=
nctrl/qcom/pinctrl-qcs615-lpass-lpi.c
> new file mode 100644
> index 0000000000000..0da85f69d9b04
> --- /dev/null
> +++ b/drivers/pinctrl/qcom/pinctrl-qcs615-lpass-lpi.c
> @@ -0,0 +1,161 @@

[ ... ]

> +enum lpass_lpi_functions {
> +	LPI_MUX_i2s1_clk,
> +	LPI_MUX_i2s1_ws,
> +	LPI_MUX_i2s1_data,
> +	LPI_MUX_spkr_i2s_mclk_a,
> +	LPI_MUX_i2s2_clk,
> +	LPI_MUX_i2s2_ws,
> +	LPI_MUX_i2s2_data,
> +	LPI_MUX_dmic1_clk,
> +	LPI_MUX_dmic1_data,
> +	LPI_MUX_dmic2_clk,
> +	LPI_MUX_dmic2_data,
> +	LPI_MUX_gpio,
> +	LPI_MUX__,
> +};

[ ... ]

> +static const char * const i2s1_clk_groups[] =3D { "gpio8" };
> +static const char * const i2s1_ws_groups[] =3D { "gpio9" };
> +static const char * const i2s1_data_groups[] =3D { "gpio10", "gpio11" };
> +static const char * const spkr_i2s_mclk_a_groups[] =3D { "gpio19" };
> +static const char * const i2s2_clk_groups[] =3D { "gpio23" };
> +static const char * const i2s2_ws_groups[] =3D { "gpio24" };
> +static const char * const i2s2_data_groups[] =3D { "gpio25", "gpio26", "=
gpio27", "gpio28" };
> +static const char * const dmic1_clk_groups[] =3D { "gpio26" };
> +static const char * const dmic1_data_groups[] =3D { "gpio27" };
> +static const char * const dmic2_clk_groups[] =3D { "gpio28" };
> +static const char * const dmic2_data_groups[] =3D { "gpio29" };
> +
> +static const struct lpi_pingroup qcs615_groups[] =3D {
> +	LPI_PINGROUP(0,  LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(1,  LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(2,  LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(3,  LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(4,  LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(5,  LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(6,  LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(7,  LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(8,  LPI_NO_SLEW, _, _, i2s1_clk, _),
> +	LPI_PINGROUP(9,  LPI_NO_SLEW, _, _, i2s1_ws, _),
> +	LPI_PINGROUP(10, LPI_NO_SLEW, _, _, _, i2s1_data),
> +	LPI_PINGROUP(11, LPI_NO_SLEW, _, i2s1_data, _, _),
> +	LPI_PINGROUP(12, LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(13, LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(14, LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(15, LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(16, LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(17, LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(18, LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(19, LPI_NO_SLEW, spkr_i2s_mclk_a, _, _, _),
> +	LPI_PINGROUP(20, LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(21, LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(22, LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(23, LPI_NO_SLEW, _, _, i2s2_clk, _),
> +	LPI_PINGROUP(24, LPI_NO_SLEW, i2s2_ws, _, _, _),
> +	LPI_PINGROUP(25, LPI_NO_SLEW, i2s2_data, _, _, _),
> +	LPI_PINGROUP(26, LPI_NO_SLEW, dmic1_clk, i2s2_data, _, _),
> +	LPI_PINGROUP(27, LPI_NO_SLEW, dmic1_data, i2s2_data, _, _),
> +	LPI_PINGROUP(28, LPI_NO_SLEW, dmic2_clk, i2s2_data, _, _),
> +	LPI_PINGROUP(29, LPI_NO_SLEW, dmic2_data, _, _, _),
> +	LPI_PINGROUP(30, LPI_NO_SLEW, _, _, _, _),
> +	LPI_PINGROUP(31, LPI_NO_SLEW, _, _, _, _),
> +};

[Severity: Low]
Are i2s2_clk, i2s2_ws and i2s2_data valid functions on QCS615 LPASS LPI?

The driver exposes them on gpio23 through gpio28 and in qcs615_functions[],
but Documentation/devicetree/bindings/pinctrl/qcom,qcs615-lpass-lpi-pinctrl=
.yaml
only allows dmic1_clk, dmic1_data, dmic2_clk, dmic2_data, gpio, i2s1_clk,
i2s1_data, i2s1_ws and spkr_i2s_mclk_a, so any Device Tree node using i2s2
will fail dtbs_check.

> +
> +static const struct lpi_function qcs615_functions[] =3D {
> +	LPI_FUNCTION(i2s1_clk),
> +	LPI_FUNCTION(i2s1_ws),
> +	LPI_FUNCTION(i2s1_data),
> +	LPI_FUNCTION(spkr_i2s_mclk_a),
> +	LPI_FUNCTION(i2s2_clk),
> +	LPI_FUNCTION(i2s2_ws),
> +	LPI_FUNCTION(i2s2_data),
> +	LPI_FUNCTION(dmic1_clk),
> +	LPI_FUNCTION(dmic1_data),
> +	LPI_FUNCTION(dmic2_clk),
> +	LPI_FUNCTION(dmic2_data),
> +};

[Severity: Medium]
Should qcs615_functions[] also include LPI_FUNCTION(gpio) with a matching
gpio_groups[] array?

LPI_MUX_gpio is defined in enum lpass_lpi_functions and placed in .funcs[0]
by LPI_PINGROUP() for all 32 pins (21 of which have no other function), and
the DT binding permits function =3D "gpio".  Without LPI_FUNCTION(gpio) in
qcs615_functions[], pinmux_func_name_to_selector() rejects function =3D "gp=
io"
with -EINVAL, and lpi_gpio_set_mux() can never select GPIO_FUNC because
lpi_gpio_pinmux_ops does not implement .gpio_request_enable.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261117075100.2725=
35-1-karthik.s@oss.qualcomm.com?part=3D2
