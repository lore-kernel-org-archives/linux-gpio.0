Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9700371885
	for <linux-gpio@vger.kernel.org>; Wed,  2 Sep 2026 17:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788370332; cv=none; b=LZtUSFnFB7EcQvvFjdUd0IACcbCIueitLhDkAjrYmWUsU8Sx9pX+lxleja8DHkEOEIkB42q/gJanJF7xcT7HY1QlNgCjkVVhDiIAfji9ZXGMvn44Ry2Xz2cs2IsBdbEdUeolXUAXEqNeBxmH1AAiM7v00u6R0q6gmastTfcD6n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788370332; c=relaxed/simple;
	bh=CPu7LxPLFCv6NAT9Za83Ro6/HgP1YcldWvsjgKvb/Mc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DRBfLznh9SFk8UrZRjA+snivmBj0rEm/b766rNrr/dMohv0P9QUbPVzKBlUeNNyPff/WbPGjyQ/li64Rd5G+DXa8GQG7zWtVDT+6CsCZ681Pn5VeVh70OKUdxPGeH2Dut8iJcxTQpDvNcEP3f46umGMgn6zHHd/Vyzvj96IPXuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YWzAxUkc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YWzAxUkc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 631991F00A3A
	for <linux-gpio@vger.kernel.org>; Wed,  2 Sep 2026 17:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788370330;
	bh=rxRL2muMlRMq3lG+Synw0npDThgz7pBJMw6th2fO8iY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=YWzAxUkchjbFpDsKRVyjM/67rBwfdKzvk+b938ePGwzaQDxPbSIzRh2TnrBJ5JXEq
	 mqgH9V+wvoADR4fALkyHWu9TEwv0rrIVqfl8wpYE9OSIYlcHBU3FpG47CxYtvuDvKB
	 RtlWi+0xAO/TYxXjU0bcP48K8IOt5aCFGanNCrh9wl1Y7I/M+1/J6fgHm3uzX0CCDa
	 x+HXCiAXEzutpmgf9AHR+Z4A8iBd+0NedpthtSO5ue5/oCLz341+ydH+DwvyfFgkp3
	 1HUVweLHTDYzMxHo113EBuhWWFFLQ9o6fZBgM5O/aQwJvJs5vCRs8lWzWAaBFZ/1TO
	 E0M8OiI6wnZ5w==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5b4ae0b3308so1013688e87.3
        for <linux-gpio@vger.kernel.org>; Wed, 02 Sep 2026 10:32:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvByfFEApZRzHEqJFdWQL8Q0FkdGa8ghC7u45cLkfhbQOizjS5tFG6Uuc0sb+jBNurnwUanWZ9l1UqZHO@vger.kernel.org
X-Gm-Message-State: AFuF++n8k14+hO3c3A8qs45LJjc7HAN3m1jaT/M2eEirE8UsGeV/VBao
	RDmw57uaK8J9JI4wEBINz3gP2evC+/+cyKiGKrEKkgiONK+5FYy6+Gc0u+0F5n+2McDDN/9y2Fl
	pzacomdFQzdkcXGMs5HYrTDEcVm9uX7k=
X-Received: by 2002:a05:6512:6193:b0:5ae:ba8f:f9fa with SMTP id
 2adb3069b0e04-5b608696c7emr2002421e87.18.1788370328999; Wed, 02 Sep 2026
 10:32:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260902154525.4090276-1-mehmet.fide@gmail.com> <20260902154525.4090276-3-mehmet.fide@gmail.com>
In-Reply-To: <20260902154525.4090276-3-mehmet.fide@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 2 Sep 2026 19:31:56 +0200
X-Gmail-Original-Message-ID: <CAD++jLmJ1+ZT=j_L79SuOzZS3PjOBgrCwhO8egaHfOU1ScLPkg@mail.gmail.com>
X-Gm-Features: AcwNN1Ufz2hwBVYNzOhxeTRLMRRl22w2wWZvYy2iKpxvY8shYC6JncpMYjsiQr0
Message-ID: <CAD++jLmJ1+ZT=j_L79SuOzZS3PjOBgrCwhO8egaHfOU1ScLPkg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] gpio: mmio: track the direction of chips without
 direction registers
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, imx@lists.linux.dev, 
	linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mehmet Fide <mehmet.fide@screeningeagle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Mehmet,

thanks for your patch!

On Wed, Sep 2, 2026 at 5:45=E2=80=AFPM Mehmet Fide <mehmet.fide@gmail.com> =
wrote:

> From: Mehmet Fide <mehmet.fide@screeningeagle.com>
>
> A generic chip with GPIO_GENERIC_PINCTRL_BACKEND and no direction
> registers sets the direction through pinctrl but has no get_direction
> callback, so every gpiod_get_direction() call trips the WARN in gpiolib
> and the direction gpiolib reports is whatever it assumed. On a Vybrid
> Colibri module that is 21 backtraces per boot.
>
> Keep the direction of such a chip in the existing shadow: the direction
> setters update sdir under the chip lock, and get_direction() is the
> shadow-reading path already used for unreadable direction registers.
> That keeps the callback usable in atomic context, which it has to be:
> gpiochip_lock_as_irq() calls it for !can_sleep chips from
> gpiochip_irq_domain_activate(), under the irq descriptor lock.
>
> The pad's actual state is read once, in process context, when a line is
> requested: gpiolib calls request() right before get_direction() for a
> new line, so the shadow is seeded from PIN_CONFIG_OUTPUT_ENABLE there and
> the line reports what the pin controller says. Lines pinctrl cannot
> answer for keep the input default, which is what gpiolib assumed before.
>
> Suggested-by: Bartosz Golaszewski <brgl@kernel.org>
> Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>

For one I really like the approach to ask the pin controller
back-end about the direction state when the GPIO registers
doesn't know this!

I have more of an implementation question here:

gpiolib already supports this:

struct gpio_chip {
(...)
        int                     (*set_config)(struct gpio_chip *gc,
                                              unsigned int offset,
                                              unsigned long config);

this sets one specific config at a time. With a generic pin control
back-end it is simply populated with gpiochip_generic_config()
from gpiolib.c which will call pinctrl_gpio_set_config() for
the corresponding pin.

What about just implementing generic optional get_config()
in struct gpio_chip, implement a likewise generic
gpiochip_generic_get_config() in gpiolib and use that as
the fallback?

        int                     (*get_config)(struct gpio_chip *gc,
                                              unsigned int offset,
                                              unsigned long *config);


Then the implementation becomes pretty straight-forward
from that point, and this:

+static void gpio_mmio_seed_dir_from_pinctrl(struct gpio_chip *gc,
+                                           unsigned int gpio)
+{
+       struct gpio_generic_chip *chip =3D to_gpio_generic_chip(gc);
+       unsigned long config;
+
+       if (!IS_ENABLED(CONFIG_PINCTRL) || chip->reg_dir_out ||
chip->reg_dir_in)
+               return;
+
+       config =3D pinconf_to_config_packed(PIN_CONFIG_OUTPUT_ENABLE, 0);
+       if (pinctrl_gpio_get_config(gc, gpio, &config))
+               return;

Can drop all the checks for !IS_ENABLED(CONFIG_PINCTRL) as this is done
generically in in gpiolib and:

+       config =3D pinconf_to_config_packed(PIN_CONFIG_OUTPUT_ENABLE, 0);
+       if (gc->get_config(gc, gpio, &config))
+               return;

I don't think it is necessary to provide any consumer API for this
such as gpiod_get_config(gpiod); as no-one really needs it, we can
keep it as a private thing in struct gpio_chip for now.

Yours,
Linus Walleij
