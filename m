Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CA4A415B8E
	for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 09:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790154480; cv=none; b=sT9dWc2fkJlBSHxQJ/RVG1AnlUHCHhvuswZMNoYhayHZ1jh3RG6ajupCmKyTGebIu4092uIkRvsTIN84hNhTPoYRcG5zxQQWXAm/Ehht5CU5lU/x+uYsx4wpy68a+27roCUKvmIxeYs6FI/bqPIA+qp7ulJcNbOEX8P9Ojjzeuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790154480; c=relaxed/simple;
	bh=IUM/k86M0HMHRzXZI25n7LcEaTa2SkGEuLDxUp6qdUc=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lcP4d9EKQ1YrMorUCPpuD+qIZCKbyFyMw0EmZo7+3g6UUg0CJ86d9nNg+/7W6Xsq9D3j5gDaluPi69mZK+RGJAw/9dVzTLyqHlkCH0uJxWauzPb3Nrq84PZocBH5hbUwTTNT9ojYJdbWeFQQG9cSiiaLfagkMYsEkj6YE16dC4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I2E79h5q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I2E79h5q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E15B81F000FF
	for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 09:07:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790154478;
	bh=rvHgMZ0dWD7lgj67arf01dNq7VRxt7WQ1KerphseR/I=;
	h=From:In-Reply-To:References:Date:Subject:To:Cc;
	b=I2E79h5qGmkWNKLad2jpLfAwEsr1ed39/6c+BnoFNvLbuRyP7Q7T0HJoRqPhkC2+Q
	 4134bosc/dtHT+sWrpFDp4DZjPGgOPLnQei2gHDu1EEtT9PA5gCt3iin1h0XO7glzg
	 StHlbrYaPJLUdi+4bEpD8O/gSZFQwDdpLvC4BAWoGebJl7u5SjRYF7VhQFjf5xqMV7
	 KtKsqY6XXw2E2Wn7iE2D/rGF7fxokGPk5RmblFvELjyO71aNwhSThHt0CTmRXtSoQk
	 lu9jmg+bLmJT0YTUd7wlj5xsp7QEeEmnr/xSV9v8VxzmebgmwCVJQTSov6XLjeJY0T
	 fGM53uuuXIH2Q==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f1e428so211806e87.1
        for <linux-gpio@vger.kernel.org>; Wed, 23 Sep 2026 02:07:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxfndTE6A/k3hUL8WLdYK+hM6yyc2otaLVZsOmpOENH1hcHosITVk6o8a2yIPIA0K0bzaNY3hInT/21@vger.kernel.org
X-Gm-Message-State: AFuF++lkqpy2uUtfj7gsW6EritNhWD+iXYN+hUVmpTV34MvXjYUubnMn
	fiKZr+8BBuURkUwzfCN7JnGupE52Rs4qerEeGzM45cppSSUYGDebOQvB4oapqr6oCA70vjSnNuQ
	W35se33YCf1pucyLGFLjaR/ziypj9Cd8uaFaVqDj7Rw==
X-Received: by 2002:a05:6512:2243:b0:5aa:62df:cd0f with SMTP id
 2adb3069b0e04-5b8d863a8efmr644237e87.2.1790154477561; Wed, 23 Sep 2026
 02:07:57 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 23 Sep 2026 02:07:56 -0700
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 23 Sep 2026 02:07:56 -0700
From: Bartosz Golaszewski <brgl@kernel.org>
In-Reply-To: <20260922065908.477523-1-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922065908.477523-1-shengchao.guo@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 02:07:56 -0700
X-Gmail-Original-Message-ID: <CAMRc=MfrBwqdMnT5TynJ0NVBf3OWKF7BSGr1cy4YjyCVrZdX1A@mail.gmail.com>
X-Gm-Features: AcwNN1V3JM8lRZKBpz6lxEaP1AAZEm_g_UsomoC_BosRwITdPdApr_IvPVD7mTg
Message-ID: <CAMRc=MfrBwqdMnT5TynJ0NVBf3OWKF7BSGr1cy4YjyCVrZdX1A@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: spmi-gpio: make direction changes exclusive
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Yu Zhang <yu.zhang@oss.qualcomm.com>, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Linus Walleij <linusw@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Tue, 22 Sep 2026 08:59:08 +0200, Shawn Guo
<shengchao.guo@oss.qualcomm.com> said:
> pmic_gpio_populate() seeds pad->input_enabled and pad->output_enabled from
> the hardware MODE_CTL register, so a pad left in DIGITAL_INPUT or
> DIGITAL_INPUT_OUTPUT mode by the bootloader starts out with the input
> buffer enabled.  Neither direction callback clears the opposite buffer:
> .direction_output() only packs PIN_CONFIG_LEVEL, which sets
> output_enabled, and .direction_input() only packs PIN_CONFIG_INPUT_ENABLE,
> which sets input_enabled.  Requesting either direction on such a pad
> therefore programs MODE_DIGITAL_INPUT_OUTPUT rather than the requested
> direction.
>
> That silently breaks both directions.  After gpiod_direction_input() the
> pad keeps driving the line, since the output buffer is never disabled.
> And after gpiod_direction_output() pmic_gpio_get_direction() still reports
> GPIO_LINE_DIRECTION_IN, because it cannot tell plain input from
> input+output, which makes gpiolib consider the line an input while the
> driver is driving it.  On a board where several regulator-fixed nodes
> share one PMIC GPIO the shared GPIO proxy reads that direction back and
> rejects every consumer after the first:
>
>   reg-fixed-voltage regulator-wcn-core-vm-1p35: setup of GPIO (default) failed: -1
>   reg-fixed-voltage regulator-wcn-core-vm-1p35: error -EPERM: can't get GPIO
>
> Pack the opposite buffer's PIN_CONFIG_*_ENABLE along with the requested
> direction so that the resulting MODE_CTL is DIGITAL_INPUT or
> DIGITAL_OUTPUT, never both.  pmic_gpio_config_set() programs the registers
> once after walking all configs, so this stays a single register write.
>
> Pads that are genuinely bidirectional can still be described that way
> through pinconf, which is the interface that has always been able to
> express it; the gpiolib direction callbacks now mean what gpiolib says
> they mean.
>
> Fixes: 263447532463 ("pinctrl: qcom: spmi-gpio: implement .get_direction()")
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> ---
> Changes for v2:
> - Drop GPIO shared-proxy patch
> - Update Fixes tag (Thanks Neil!)
> - Link to v1: https://lore.kernel.org/all/20260915014447.282121-1-shengchao.guo@oss.qualcomm.com/
>
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index f6dc43e27b38..eb4431591331 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -741,22 +741,26 @@ static int pmic_gpio_get_direction(struct gpio_chip *chip, unsigned pin)
>  static int pmic_gpio_direction_input(struct gpio_chip *chip, unsigned pin)
>  {
>  	struct pmic_gpio_state *state = gpiochip_get_data(chip);
> -	unsigned long config;
> +	unsigned long configs[2];
>
> -	config = pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE, 1);
> +	configs[0] = pinconf_to_config_packed(PIN_CONFIG_OUTPUT_ENABLE, 0);
> +	configs[1] = pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE, 1);
>
> -	return pmic_gpio_config_set(state->ctrl, pin, &config, 1);
> +	return pmic_gpio_config_set(state->ctrl, pin, configs,
> +				    ARRAY_SIZE(configs));
>  }
>
>  static int pmic_gpio_direction_output(struct gpio_chip *chip,
>  				      unsigned pin, int val)
>  {
>  	struct pmic_gpio_state *state = gpiochip_get_data(chip);
> -	unsigned long config;
> +	unsigned long configs[2];
>
> -	config = pinconf_to_config_packed(PIN_CONFIG_LEVEL, val);
> +	configs[0] = pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE, 0);

Sashiko's comment basically says that for open-drain GPIOs, if we set direction
to output via GPIOLIB and disable the input buffer, then later call
gpiod_get_value() on that GPIO, we'll never read what's really on the wire. Can
we not disable the input buffer for open-drain pins?

Bart
