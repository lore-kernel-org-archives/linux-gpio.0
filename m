Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE32B2C2360
	for <linux-gpio@vger.kernel.org>; Sat, 26 Sep 2026 22:35:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790462129; cv=none; b=C8Gc5XBIpYODUBbWWNuuXNY/6d+bOGZXT4+siaoA5NublCurKv9frLXPhNlLm2sGx6FDkGUcBfALcFCkKCq97hT0bmFZcPbaF2j/d4SAkEfzCVlS0azugHPrZum2Mz1Fw/fU9lc4WGuGHsdHllGZexjgVMs0iboe8sNL9u8NPWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790462129; c=relaxed/simple;
	bh=XbeBt17n53buFEuUFIwiHhEOrMc/kxrKrQ8+RfPTFRE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=imciS2Gbup+1KUJSZG/N0Xlv4N58wxcgSBbyO6OzfAmmqG/BovF/N9bbJ0XleMrzDcKukIrRovOCLyqBAKGy4Yxl4pHmU43ueiONxhUAIV+c/w8BVVdNEWvT/3AhQPhlSMrNbRvV2Q1fHuafALCrIlB2PaXc1MrHpYsW1RRLv1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cF3Gnvep; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cF3Gnvep"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B38A1F0089A
	for <linux-gpio@vger.kernel.org>; Sat, 26 Sep 2026 22:35:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790462127;
	bh=MK5SHYxXLJAvLu7cLrqWwZej2N+QB4omlWiFjp3JXW4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=cF3GnvepXKHDAEMd9IqPfYoAQ12LklT82LcTQmYzCRIjf/zyqlFnzVY+R6lCU+tyF
	 n5EQzOzhyb9lqopcwgn0CgJEZ+2gS6iDBJyhoqJM5SljGNI/7ONbfqN0QD3ndhB2GD
	 xEKQm/OzFQKoKY5nmXTP7jjpb44wfBc7NwIkClCsABX2M54tp7PhSzm7IMXwPn8eXu
	 Nx0LwGpx0grfP1sDB2/hvSc36B+o6EQCkLoMf9WvvO8RpHznI0jLesbxocxypWX6Ro
	 yB5CcnrceYcb8amTich5JngjhsA5KwFG5ZT3jqGQX8+TZwnW2cbTaEsgdpNcdqE2Ji
	 Ajfa+N93CtwvQ==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8f5ae6fa8so31058e87.2
        for <linux-gpio@vger.kernel.org>; Sat, 26 Sep 2026 15:35:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzZDOLEkjSKSfORv+vqZb7N7TPq4lghmNWzN+N/AIRboTGfufc7vfWGf/uUaYpHnApTsbD5YPcLqYHU@vger.kernel.org
X-Gm-Message-State: AFq9FYIhkMwJL5OKzHSv6N3/cljcKDXDo0jYiGaXXAsa43dknLIgwF/2
	4gbycQGLoNKTPUL5fci2SRATH9NgGVE6d/kmtj9bfvHqsGNJsgOA+LiE7ykJNrHHkMglTbWP76B
	WHSOi8tzkhS/JAh3UW3fxnCKtNKCj0VQ=
X-Received: by 2002:a05:6512:33cf:b0:5b8:f356:694d with SMTP id
 2adb3069b0e04-5b8f35669e3mr509348e87.42.1790462126146; Sat, 26 Sep 2026
 15:35:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260924070323.983528-1-shengchao.guo@oss.qualcomm.com>
In-Reply-To: <20260924070323.983528-1-shengchao.guo@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sun, 27 Sep 2026 00:35:13 +0200
X-Gmail-Original-Message-ID: <CAD++jLkj-9=2sduOOJDA6bTN=HWVNeHwKcN1N6YvYNg4YNT6Cg@mail.gmail.com>
X-Gm-Features: AclHuK88PDOBsokjieKeZXQVtMMVCkLLoYpQXgQGraJp_IQrA8KT8Hdi_-BMVOY
Message-ID: <CAD++jLkj-9=2sduOOJDA6bTN=HWVNeHwKcN1N6YvYNg4YNT6Cg@mail.gmail.com>
Subject: Re: [PATCH v4] pinctrl: qcom: spmi-gpio: make direction changes exclusive
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Yu Zhang <yu.zhang@oss.qualcomm.com>, 
	linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shawn,

thanks for your patch!

On Thu, Sep 24, 2026 at 9:03=E2=80=AFAM Shawn Guo
<shengchao.guo@oss.qualcomm.com> wrote:

> pmic_gpio_populate() seeds pad->input_enabled and pad->output_enabled fro=
m
> the hardware MODE_CTL register, so a pad left in DIGITAL_INPUT or
> DIGITAL_INPUT_OUTPUT mode by the bootloader starts out with the input
> buffer enabled.  Neither direction callback clears the opposite buffer:
> .direction_output() only packs PIN_CONFIG_LEVEL, which sets
> output_enabled, and .direction_input() only packs PIN_CONFIG_INPUT_ENABLE=
,
> which sets input_enabled.  Requesting either direction on such a pad
> therefore programs MODE_DIGITAL_INPUT_OUTPUT rather than the requested
> direction.
>
> That silently breaks both directions.  After gpiod_direction_input() the
> pad keeps driving the line.  And after gpiod_direction_output()
> pmic_gpio_get_direction() still reports GPIO_LINE_DIRECTION_IN, because i=
t
> cannot tell plain input from input+output, which makes gpiolib consider
> the line an input while the driver is driving it.  On a board where
> several regulator-fixed nodes share one PMIC GPIO the shared GPIO proxy
> reads that direction back and rejects every consumer after the first:
>
>   reg-fixed-voltage regulator-wcn-core-vm-1p35: setup of GPIO (default) f=
ailed: -1
>   reg-fixed-voltage regulator-wcn-core-vm-1p35: error -EPERM: can't get G=
PIO
>
> Pack the opposite buffer's PIN_CONFIG_*_ENABLE along with the requested
> direction so that the resulting MODE_CTL is DIGITAL_INPUT or
> DIGITAL_OUTPUT, never both.  pmic_gpio_config_set() programs the register=
s
> once after walking all configs, so this stays a single register write.
>
> Open-drain and open-source outputs are the exception: such a pad only eve=
r
> drives one rail, so DIGITAL_INPUT_OUTPUT is physically correct for it, an=
d
> pmic_gpio_get() needs the input buffer to sample the line rather than
> return the value last written.  So .direction_output() programs the input
> buffer from pad->buffer_type in either case, rather than only clearing it
> for a CMOS pad: the buffer may have been left off by the bootloader or by
> an earlier direction change made with a different buffer type, and an
> open-drain pad that keeps it off would fall back to reporting the value
> last written.  gpiolib applies PIN_CONFIG_DRIVE_OPEN_DRAIN before calling
> .direction_output(), so pad->buffer_type is up to date there.  Key
> pmic_gpio_get_direction() off output_enabled so that these pads still rea=
d
> back as outputs.
>
> An input must not drive the line whatever the buffer type, so
> .direction_input() clears output_enabled unconditionally.
>
> Pads that are genuinely bidirectional can still be described that way
> through pinconf, which is the interface that has always been able to
> express it; the gpiolib direction callbacks now mean what gpiolib says
> they mean.
>
> Fixes: 263447532463 ("pinctrl: qcom: spmi-gpio: implement .get_direction(=
)")
> Assisted-by: LLM
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

It's a bit in the style of LLM:s to write overly verbose commit
logs, can you put this into your AGENTS.md file:

- Use terse commit messages.

>  static int pmic_gpio_direction_output(struct gpio_chip *chip,
>                                       unsigned pin, int val)
>  {
>         struct pmic_gpio_state *state =3D gpiochip_get_data(chip);
> -       unsigned long config;
> +       struct pmic_gpio_pad *pad =3D state->ctrl->desc->pins[pin].drv_da=
ta;
> +       unsigned long configs[2];
>
> -       config =3D pinconf_to_config_packed(PIN_CONFIG_LEVEL, val);
> +       /*
> +        * An open-drain or open-source pad only ever drives one rail, so=
 the
> +        * line can still be sampled while the pad is an output.  Keep th=
e input
> +        * buffer enabled for those, so that pmic_gpio_get() reports what=
 is on
> +        * the wire rather than the value last written, and disable it fo=
r a
> +        * CMOS pad, so that the pad ends up in DIGITAL_OUTPUT rather tha=
n
> +        * DIGITAL_INPUT_OUTPUT.  Program it either way, as the buffer ma=
y have
> +        * been left in the opposite state by the bootloader or by an ear=
lier
> +        * direction change with a different buffer type.  gpiolib applie=
s
> +        * PIN_CONFIG_DRIVE_OPEN_DRAIN before calling this, so buffer_typ=
e is
> +        * already up to date here.
> +        */
> +       configs[0] =3D pinconf_to_config_packed(PIN_CONFIG_INPUT_ENABLE,
> +                                            pad->buffer_type !=3D PMIC_G=
PIO_OUT_BUF_CMOS);
> +       configs[1] =3D pinconf_to_config_packed(PIN_CONFIG_LEVEL, val);

It is also typical for LLMs to insert verbose comments like that.

BUT! I like the comment, so it can stay!

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij
