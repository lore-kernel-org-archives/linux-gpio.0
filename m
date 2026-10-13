Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB894A68AA
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 23:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791933916; cv=none; b=AkD54waiuXtoNpTavlYRJCwS7nN5+omUVBVsvImDMT7I9v6g0W6+jNQhDvmSYJFEIrikRuNdCrCf26uRZrVD/sTvra9lFNMUClYPwj5xR2G9t593PYAMCxkkmQEESELsXpSPhHK03+MeWgrjtsljyhqaFMzgtdfVK4+WLPP5aWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791933916; c=relaxed/simple;
	bh=pyp25QtKyLM8BrmBaxXVfW+c86ZxFuXNe529PVbugRo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hnYtjyXwh1SG+Gf9CXPDuvsThTguNAlsqTgpE3IA9kfw0fz0GX5xO3jS2UB1AiYp6UJQtE9FBJTZrj6qola4s8VdbooomrVvZNOY+WxNtWVu0/atDEuEY/t0sHwJjNComzrW6Y9b0YxSuZhfhiwHE+5rf7tklooUU08YiQzsubc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lHc+HFoI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lHc+HFoI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80DF41F0089E
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 23:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791933914;
	bh=bF+W4sghZSTsd+ZdP1W6Me6PZqk4DiSPea7R/+7acVg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=lHc+HFoIiIZdyHrYvGHCmk1Y68/+4V1TwAFb/64uLVSVRLfYYFmwTlT59RWrkryTI
	 TwdY62kwHmD8VHOxvTE2vR2I6RO1jBYXRvC/TwUAnDcIgTcCb/a91uY+NOFp9NIaIG
	 LQD0L6VPX5DK+CXT0XPWvBslR27YhMmrIRo1PPEgBB7DilKUMChL2WDm6UeVLoBsa2
	 7BZ8dPvD/bVGgk9aQP5+vuVZb0DZlGh4f39fq2zbYF4yR2rAO6jWCQBOHpQNdLEdUQ
	 NFtGj1gq7xOn4FcCxO6vIdaqTRHy0HIUsGHfmajYeJFsvOURsCXx3k4vdBqNWeyYoH
	 rs/KBnW3Y7I3A==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5bc18f54abbso1799376e87.1
        for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 16:25:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxp9uUK2rFD5hHZxnud8k1oHMmMZ0788is9hQyvam4nlirhpAOyYG5Iq411TVyt24g8vXT36pydgmjX@vger.kernel.org
X-Gm-Message-State: AFq9FYJ19l8J6deqUVLrW+nx6AU6PbOrcQjPPVOr4U/ae+p5gBVrq++1
	8T9oRnAkch5DizD/VZn+jz2DC7ic0GmeAuVNrdgFP2F8k6qK2aN92dpxixWuHgeiMDKt0LiajAY
	PdZzMJKYhUDTjEoCaB8zrjMMjNJFMOoo=
X-Received: by 2002:a05:6512:3d8a:b0:5b8:f048:473d with SMTP id
 2adb3069b0e04-5bcde35cad4mr4274371e87.7.1791933913215; Tue, 13 Oct 2026
 16:25:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012-lstp-usb-adapter-v1-0-aambrozewicz@nvidia.com> <20261012-lstp-usb-adapter-v1-6-aambrozewicz@nvidia.com>
In-Reply-To: <20261012-lstp-usb-adapter-v1-6-aambrozewicz@nvidia.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 14 Oct 2026 01:25:00 +0200
X-Gmail-Original-Message-ID: <CAD++jLkru2AL2_7ieOdbYrePAhNSFaa3wwEzCagiPsALgG2GwQ@mail.gmail.com>
X-Gm-Features: AclHuK8aDJrbMFX2SY9BpZEACe6CGzBOm9_cURajb8zp_6_hmnV2osIeBJ4Fdic
Message-ID: <CAD++jLkru2AL2_7ieOdbYrePAhNSFaa3wwEzCagiPsALgG2GwQ@mail.gmail.com>
Subject: Re: [PATCH 06/11] gpio: Add NVIDIA LSTP GPIO driver
To: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Donald Shannon <donalds@nvidia.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-usb@vger.kernel.org, llvm@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Adrian,

thanks for your patch!

On Mon, Oct 12, 2026 at 7:37=E2=80=AFPM Adrian Ambrozewicz
<aambrozewicz@nvidia.com> wrote:

> Add a driver for the GPIO channels of NVIDIA LSTP USB adapters. Each
> channel is registered as a GPIO chip with an interrupt controller for
> its pins; every line access is a USB transaction, so the chip can
> sleep. Pins the firmware reports as LEDs are not GPIO lines: the driver
> hands them to the LED driver as an auxiliary device.
>
> At probe the driver reads each pin's interrupt configuration from the
> device. A reply that misses the response timeout can answer a later
> request and shift every following pin's state by one, so a single read
> cannot simply be retried. After a timeout the driver reads all pins
> again, alternating ascending and descending order, until two
> consecutive passes without a timeout agree: at most five passes, ending
> within 10 s of the first timeout, after which the probe fails as
> before. The probe runs in the context that added the device, often the
> hub's worker, hence the bound.
>
> Signed-off-by: Adrian Ambrozewicz <aambrozewicz@nvidia.com>
(...)
> +++ b/drivers/gpio/Kconfig
> @@ -2051,6 +2051,20 @@ config GPIO_USBIO
>           This driver can also be built as a module. If so, the module
>           will be called gpio_usbio.
>
> +config GPIO_LSTP

GPIO_USBIO ... GPIO_LSTP?

These should be in alphabetical order.

> +#include <linux/atomic.h>
> +#include <linux/bitmap.h>
> +#include <linux/build_bug.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/err.h>
> +#include <linux/gpio/driver.h>
> +#include <linux/irq.h>
> +#include <linux/jiffies.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/seq_file.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/wait_bit.h>
> +#include <linux/workqueue.h>
> +#include <uapi/linux/gpio.h>

Do you really need all this?
Certainly <uapi/linux/gpio.h> is a mistake, look over all of these.

> +/* clang-format off */

I beg your pardon? What is this?

> +enum lstp_gpio_direction {
> +       LSTP_GPIO_OUTPUT =3D 0x00,
> +       LSTP_GPIO_INPUT =3D 0x01
> +} __packed;
> +enum lstp_gpio_pin_state {
> +       LSTP_GPIO_LOW =3D 0x00,
> +       LSTP_GPIO_HIGH =3D 0x01
> +} __packed;
> +enum lstp_gpio_drive_config {
> +       LSTP_GPIO_PUSH_PULL =3D 0x00,
> +       LSTP_GPIO_OPEN_DRAIN =3D 0x01,
> +       LSTP_GPIO_OPEN_SOURCE =3D 0x02
> +} __packed;
> +enum lstp_gpio_bias_config {
> +       LSTP_GPIO_NO_PULL =3D 0x00,
> +       LSTP_GPIO_PULL_UP =3D 0x01,
> +       LSTP_GPIO_PULL_DOWN =3D 0x02
> +} __packed;
> +enum lstp_gpio_led_support {
> +       LSTP_GPIO_NOT_LED =3D 0x00,
> +       LSTP_GPIO_LED_MODE_HOLD =3D 0x01, /* pattern brightness jumps bet=
ween steps */
> +       LSTP_GPIO_LED_MODE_INTERPOLATE =3D 0x02, /* pattern brightness in=
terpolates between steps */
> +} __packed; /* clang-format on */

This  looks very dense too..

At least a newline between the enums?

What's with the clang-format thing? I don't get it.

> +struct lstp_gpio_priv {

Just call it lstp_gpio

> +       struct lstp_channel *ch;
> +       struct gpio_chip gc;

Why? Normally drivers get the state container from the
chip not the other way around.

> +static int lstp_gpio_get_direction(struct gpio_chip *gc, unsigned int pi=
n)
> +{
> +       struct lstp_gpio_priv *priv =3D gpiochip_get_data(gc);
> +       u8 direction;
> +
> +       int ret =3D lstp_gpio_read_direction(priv, pin, &direction);
> +
> +       if (ret)
> +               return ret;
> +
> +       if (direction =3D=3D LSTP_GPIO_INPUT)
> +               return GPIO_LINE_DIRECTION_IN;
> +
> +       return GPIO_LINE_DIRECTION_OUT;
> +}
> +
> +static int lstp_gpio_direction_input(struct gpio_chip *gc, unsigned int =
pin)
> +{
> +       struct lstp_gpio_priv *priv =3D gpiochip_get_data(gc);
> +
> +       return lstp_gpio_require_direction(priv, pin, LSTP_GPIO_INPUT);
> +}
> +
> +static int lstp_gpio_direction_output(struct gpio_chip *gc, unsigned int=
 pin, int value)
> +{
> +       struct lstp_gpio_priv *priv =3D gpiochip_get_data(gc);
> +       int ret =3D lstp_gpio_require_direction(priv, pin, LSTP_GPIO_OUTP=
UT);
> +
> +       if (ret)
> +               return ret;
> +
> +       return lstp_gpio_set_value(gc, pin, value);
> +}

It seems some pins are only input and some are only output.

Have you considered using serialized register access over
regmap and use regmap-gpio with fixed direction bitmaps?

Yours,
Linus Walleij
