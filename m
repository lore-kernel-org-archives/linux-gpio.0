Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792423999;
	b=Wk88lSOiCzIGyu1ZiSR3xgvxd8k+DCYiHkig+RF3oTD1fFFmLdktVQ699GFaKnCKCtIl
	 xqAlfvDjhqnkLhK6wmAeZ5r5Xf6A/9y93vqvwquSKAQJn3lbtzlGpTIaypyl0akmC9O9y
	 MT++ENty5FU8Z9AlQV8I50jEW2YyUN3KIACWxZtK/AiDyeawBBj0ecJUEPTDNxXbqBrXd
	 J4qiWoZw+Q09NgoNJq959yZtbloWqEqjYhHlfyr4UGG/UAXNr9OALvfubjP+tOXjs9E79
	 eWo0C4phdR7zCYoGTNYLU5nMwCQ9R8z1caVNAQCm3DiTQHfJYa5L1CzoQ9qZPnL84/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792423999;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=YW4DfEvFP6ZwiZk1r8ZaWiaUW6TDXm5eVfHWbjv2ies=;
	b=tqORDxdn0e5yNzj+01F0eaPIz68JSZyHAu/mZOVAqpBK7wGpTd2KCfdfX7yya/cdOh92
	 7YlInVlr7eEkmEsRmLwIOrzfBd8tKuL/OdfAvHArQVqBKYNHGUJDkvP8X5/J87IZi62Xh
	 xf+lzZJUuP1qTY6ucy7+bHttqmparjGfkpa3lWttDxrTJJMkAt/DmK7gVTn2M3UiYGY3H
	 Q2yGvsjuuDJ74UDbzZYqtHfvtiUwH+FjwL8s/Qptr3f2UROZUSgM6Rz3RnV9rOLgwl3ZN
	 WckBl3ti8Yu/JemnvhiEY/P2wSpFWH3agFIciC5QnDHHGYi/tEWuYkhA0UQycSMOfXQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ERp0U3oy;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F23D60774D3;
	Mon, 19 Oct 2026 15:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ERp0U3oy
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D2681F031CE;
	Mon, 19 Oct 2026 15:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792423998;
	bh=YW4DfEvFP6ZwiZk1r8ZaWiaUW6TDXm5eVfHWbjv2ies=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ERp0U3oyopIb0EIQ+ip9d7VPaSVy5ot4VDiAP8RhvjLU+di2LF2sp98RpkcTMXZvr
	 Smbez8m869oeCZfQrs4cy/d99gVCeU/JpMPNAIPbIxLDJ9p8L4py8EA35jmN+3aTFc
	 Ntx9R/n1ZjTo3Eb2KwsuaArx3pp3qBq3N6MdgalvSR4woDwEvHZGBAFbTjBLtDlTtf
	 +PJ7VGJLGyRVD9l0XLXWK+vdnYlf83HUwOz6H7svy+4GN+zuLIxFxSByE4sQKKVvrL
	 bhAjMDwV9YAfL2YNohSdLEX3O9sjlkeMUBNXe0wqr8kZjey4IFqVeQqfxsWBZIyknS
	 eiZ2tU3DNMyTg==
Message-ID: <sashiko-outbox-177755@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2] arm64: dts: qcom: sda660-inforce-ifc6560: fix
 ADV7535 interrupt pin
Reply-To: sashiko-reviews@lists.linux.dev
To: "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261019-ifc6560-adv-v2-1-ade625df3fe3@oss.qualcomm.com>
References: <20261019-ifc6560-adv-v2-1-ade625df3fe3@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 19 Oct 2026 15:33:18 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [High] arm64: dts: qcom: missing output-disable in adv7533_int_default
--

commit 18e53f95f5fe825b6b2171c0f9241c69a999af55
Author: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

arm64: dts: qcom: sda660-inforce-ifc6560: fix ADV7535 interrupt pin

This commit adds a default pinctrl state for the ADV7535 HDMI bridge on the
Inforce IFC6560 board to configure PM660L GPIO11 as a digital input with
internal bias disabled.

> diff --git a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts b/arch/a=
rm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
> index 9e14f53b552eb..10b454cc4218a 100644
> --- a/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
> +++ b/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts

[ ... ]

> @@ -285,6 +288,16 @@ sw_ctrl_default: sw-ctrl-default-state {
>  	};
>  };
> =20
> +&pm660l_gpios {
> +	adv7533_int_default: adv7533-int-default-state {
> +		pins =3D "gpio11";
> +		function =3D "normal";
> +		input-enable;
> +		/* pull-up on board */
> +		bias-disable;
> +	};
> +};
> +

[Severity: High]
Does adv7533-int-default-state also need output-disable?

When the bootloader leaves the pin in PMIC_GPIO_MODE_DIGITAL_OUTPUT,
pmic_gpio_populate() in drivers/pinctrl/qcom/pinctrl-spmi-gpio.c sets
pad->output_enabled =3D true:

	case PMIC_GPIO_MODE_DIGITAL_OUTPUT:
		pad->input_enabled =3D false;
		pad->output_enabled =3D true;
		break;

In pmic_gpio_config_set(), PIN_CONFIG_INPUT_ENABLE only updates
pad->input_enabled and leaves pad->output_enabled untouched unless
PIN_CONFIG_OUTPUT_ENABLE (output-disable) is also passed:

		case PIN_CONFIG_INPUT_ENABLE:
			pad->input_enabled =3D arg ? true : false;
			break;
		case PIN_CONFIG_OUTPUT_ENABLE:
			pad->output_enabled =3D arg ? true : false;
			break;

With both flags true, pmic_gpio_config_set() programs the mode to
PMIC_GPIO_MODE_DIGITAL_INPUT_OUTPUT rather than PMIC_GPIO_MODE_DIGITAL_INPU=
T:

	if (pad->analog_pass)
		val =3D PMIC_GPIO_MODE_ANALOG_PASS_THRU;
	else if (pad->output_enabled && pad->input_enabled)
		val =3D PMIC_GPIO_MODE_DIGITAL_INPUT_OUTPUT;
	else if (pad->output_enabled)
		val =3D PMIC_GPIO_MODE_DIGITAL_OUTPUT;
	else
		val =3D PMIC_GPIO_MODE_DIGITAL_INPUT;

Additionally, since commit 19fc4240358b ("pinctrl: qcom: spmi-gpio: make
direction changes exclusive"), pmic_gpio_get_direction() checks
pad->output_enabled:

	return pad->output_enabled ? GPIO_LINE_DIRECTION_OUT : GPIO_LINE_DIRECTION=
_IN;

Without output-disable to clear pad->output_enabled, won't the PMIC output
buffer remain active on the open-drain interrupt line and cause
pmic_gpio_get_direction() to still report GPIO_LINE_DIRECTION_OUT to
gpiochip_lock_as_irq()?

>  &qusb2phy0 {
>  	status =3D "okay";
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261019-ifc6560-ad=
v-v2-1-ade625df3fe3@oss.qualcomm.com?part=3D1
