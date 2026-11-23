Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795460155;
	b=CyxbMOL9jLq1mTj14EGsLrapn5v1kyxM1W2QrzvfmpOZXfYGvO4M1haYR6UNX0n/mf9M
	 tO2BPrjI2FU7OMvH3gN2rSx0fSKhA+LNRkP2+j8n+MrqSiuby8p6VXxUmku/gT8W40jli
	 0wDjoh1bXYi7v0h7kudhdTwadTz1U45CF8ShPPNo4HcYnbBIKIjdnKcQMVTUagWGa5ZeX
	 Den6tEw10iMzO7nbKshsuCWaYlIFgDBrGXItkiXbj7ZlQl/lxADBoHqU/yaFcPsefL6KP
	 7VCaAAeDHjwW/YCGq42Dj9wW7fFY4Lp5rOM0MrhlJv1zexDFVsB7CKPYd3n8V/M8MXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795460155;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=SZAQqMButyP2tMLf6h4QZvmumV2dcczmMYB0U2+e69Q=;
	b=FHtT44n4ACjZxwikXoOJmGUNAYvB5pvXapDwh9S1ht0s7TJh1/pB7uMdLyaUqXr3PdC6
	 8ULh3hqKBfPkGLvtvQfnh0cGCbHmUgnUE8SCvDw0Y99WRkMKcih9s1IuQsYhq6PAiAFr5
	 4S8o4g6sYR8k3Axx8W5T+k+oipTftvan3svRe83+1sQ0iQ0c0wpNjIdwU8sSVO+mmEYU6
	 CYeecuN+cbhmI3xTPCQHRyzwUyL8GgYrPxUqMKkGGEymnnfh7etpoAhxIEHTrejZrJup8
	 7S3djR2cifgLyovJCvjIL/wKUZglA5a/Q4KycrufjYkE19meRh8dJtx4gcXyFPnBpTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mAsIm9nG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9703A606A31A;
	Mon, 23 Nov 2026 18:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mAsIm9nG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF0B71F000CA;
	Mon, 23 Nov 2026 18:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795460155;
	bh=SZAQqMButyP2tMLf6h4QZvmumV2dcczmMYB0U2+e69Q=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=mAsIm9nGek6GGPaW6jwxV8zPptNi7HM+BYX/fLGLZSoF8L+Bw5P34KKF/+AEB03dj
	 TG+ZYKV6giTYWjCVeu/0EdukJ2ah1OuZ6F34tUV6SMuqtawETDVA4VsutibSMPRpAl
	 YONUXSZX2AUsTaJfKtdgPeZ02KNibhULeaeS1ff9mBDmlVOTZgac4X2V8mle6BF4bv
	 qi7HNp1/fw9xpfYVUob62tMbHs8rL7o80Tmw7yHvrcnY4oPAJ0CIc6DCA1S6CTbxhX
	 K/JVlg2VH2CgriDygq8a1J+6INIHuSlgOH+qoxRSVN9+NyAL9aR2QT8P346Z4kDg6V
	 JVhZ1cA4hf7Vg==
Message-ID: <sashiko-outbox-229885@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 4/5] pinctrl: Add Cortina Systems CS7542 pin multiplexer
Reply-To: sashiko-reviews@lists.linux.dev
To: "Fil Dunsky" <filipp.dunsky@gmail.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261123-cs7542-syscon-v1-4-49858e631449@gmail.com>
References: <20261123-cs7542-syscon-v1-0-49858e631449@gmail.com>
 <20261123-cs7542-syscon-v1-4-49858e631449@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 18:55:54 +0000
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Medium] pinctrl: cs7542: missing function_is_gpio() breaks strict
  GPIO requests
--

commit e26847f7ebd3df4b67ad59e0473df47cbaeaa5df
Author: Fil Dunsky <filipp.dunsky@gmail.com>

pinctrl: Add Cortina Systems CS7542 pin multiplexer

This commit adds a pin multiplexer driver for the Cortina Systems CS7542
SoC supporting GPIO on all 160 lines and six UART pins via the global
syscon regmap.

> diff --git a/drivers/pinctrl/pinctrl-cs7542.c b/drivers/pinctrl/pinctrl-c=
s7542.c
> new file mode 100644
> index 0000000000000..977c4ce98100d
> --- /dev/null
> +++ b/drivers/pinctrl/pinctrl-cs7542.c
> @@ -0,0 +1,188 @@

[ ... ]

> +enum cs7542_function {
> +	CS7542_FUNCTION_GPIO,
> +	CS7542_FUNCTION_UART,
> +};

[ ... ]

> +static int cs7542_gpio_request_enable(struct pinctrl_dev *pctldev,
> +				      struct pinctrl_gpio_range *range,
> +				      unsigned int pin)
> +{
> +	return cs7542_set_mux(pctldev, CS7542_FUNCTION_GPIO, pin);
> +}
> +
> +static const struct pinmux_ops cs7542_pinmux_ops =3D {
> +	.get_functions_count =3D cs7542_get_functions_count,
> +	.get_function_name =3D cs7542_get_function_name,
> +	.get_function_groups =3D cs7542_get_function_groups,
> +	.set_mux =3D cs7542_set_mux,
> +	.gpio_request_enable =3D cs7542_gpio_request_enable,
> +	.strict =3D true,
> +};

[Severity: Medium]
Should cs7542_pinmux_ops implement .function_is_gpio?

Because cs7542_pinmux_ops sets .strict =3D true and exposes "gpio"
(CS7542_FUNCTION_GPIO) as a pinmux function without providing
.function_is_gpio, activating a pinctrl state or hog with function =3D "gpi=
o"
sets desc->mux_usecount and desc->mux_setting on the pin.  When that pin is
then requested as a GPIO, pin_request() leaves gpio_ok false and rejects
the request with -EINVAL:

drivers/pinctrl/pinmux.c:pin_request() {
	...
		if (mux_setting) {
			if (ops->function_is_gpio)
				gpio_ok =3D ops->function_is_gpio(pctldev,
								mux_setting->func);
		} else {
			gpio_ok =3D true;
		}

		if ((!gpio_range || ops->strict) && !gpio_ok &&
		    desc->mux_usecount && strcmp(desc->mux_owner, owner)) {
	...
}

pinmux_can_be_used_for_gpio() likewise returns false for any pin muxed to
CS7542_FUNCTION_GPIO via pinctrl.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-cs7542-sys=
con-v1-0-49858e631449@gmail.com?part=3D4
