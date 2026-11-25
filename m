Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795629999;
	b=WpNme160ExMS2av2rMhfW92UHbckaRJd02CLCnkruDOOvK41pDL2DV++xPww77c5wIaa
	 ySHTVqLkW0PVpPn2dxTvvTNbpgQxAExMQ6pTFcfAa2YryW1djafUlFQUM2teiNxbJ+a9v
	 G2aPn9cJDQUyc92jS+VjNh0obX/QDpgt2VbQ/pfamLW5XcDOWehPSB9RI5IZUgvP/3yHf
	 r1NevYCkOBjiJIbzC7UJroIL0mRislMN1JDl8QnsPZGk+eXvoI8GCrtxnbFkEz40FiSfC
	 m9fb0IyCy+ASR5LE886Qyij1S1YITtrmGLqJv+BON41mAZv1uYHgPMHDA5rROVaSMMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795629999;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Vfpqfghp8rtJ0ttiLbaqibQehjgOthc7Xhwq+CR89LA=;
	b=oHPSwOe0tK7980JnD7wseYUnmXdlSEtGPH1fEfT4r4stFg5KE6AXRZpBjjBZp2RVKlh8
	 mqLGtl/piunYg3SE0sjca98cjZM++w85O+DHp2k8mE+p4Bl8E+9OGRYMR40JG3xs7Sqc8
	 tKEGpgEhCVFr42ShevTrKXlvtoON+S2WniezHTSOskChDBfeIdfcJ2NPYe703m3ZQRHl4
	 Xc3CDZ/V5NQKKBSZX+Az4EsJR9fJk3FG6hXioY3ZYh34SQCZQf85bGyPTwCvbkpdF0721
	 0/E+wri1YxCpesFjTP13ochOvRp7zDN+U4v+OGG26ZzZe6ALV00gjBt+XuAYZbBsT2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ULmO+bnX;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B90C4606A326
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 18:06:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ULmO+bnX
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F0351F00A19
	for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 18:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795629999;
	bh=Vfpqfghp8rtJ0ttiLbaqibQehjgOthc7Xhwq+CR89LA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ULmO+bnXi7PFZD226VAWRBnKz5WR4LDSEbP0tNUK+LrfDOFb7VrGIgBLTgZGWZBky
	 Y4usFC9BXJanyoFrP8UTW4Rh6SaaXE48vhC7qmUNQQTbslCe6tP75JWGBtpbDKkWmX
	 AR66ew6g7FKpr6fp5uCp2H5QSBFwjOpCoUPZapAPbvbL6/lst4xm6+sE8K7frf/1ro
	 cUB6yl+h9J2/elGh8HFk+k4Js0C7ElvsDAIoUMNEsdIJRx+kIzC6bnYMAMR2ZXniOx
	 0JlGg30LTvfbSCr0mflz55y/uMcbC394TzNv7soG6UlMFqpbZmy5XZ/tkn9Fga7aJV
	 a25dHYFcYmG0A==
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3adfed9a887so55911541fa.3
        for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 10:06:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErHQlnJIsZnWszIPq1N0tFFcLdy1AI3VhxaA6dJEi3MF6EnzbytcH81cCXSce+/Vd13f7GIy1hgSBQLq@vger.kernel.org
X-Gm-Message-State: APuU4Z/ccpjmu6vmO+J6lImvpIuMa1wZBaQ3XXWUeqc9wbmzxHNHkZKS
	WkgFGDLEVh25h6FZtnkYNUn4eU+IOYuTtvlkRbGPcs5ZXvTQdOB5ggihEU2TXpWsAHwaFsf/+vU
	ZHQL/rnd4gY9xa/ghbuoSWDmux3Qk57M=
X-Received: by 2002:a05:6512:61aa:b0:5c0:e5:7e49 with SMTP id
 2adb3069b0e04-5c1bc806f13mr5272038e87.44.1795629998006; Wed, 25 Nov 2026
 10:06:38 -0800 (PST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261110142058.354518-1-mstrozek@opensource.cirrus.com>
In-Reply-To: <20261110142058.354518-1-mstrozek@opensource.cirrus.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 25 Nov 2026 19:06:24 +0100
X-Gmail-Original-Message-ID: <CAD++jLmUNxbVBLXg1aGysRGCjcQFjo=JSwx4-=8TWa7bj-iXuA@mail.gmail.com>
X-Gm-Features: Aa3M54qrOtW7v88959U2QkIHeP3Sl4QoSZukrMhtwzQVb3_px1CPH3x87TWk2cQ
Message-ID: <CAD++jLmUNxbVBLXg1aGysRGCjcQFjo=JSwx4-=8TWa7bj-iXuA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: cs42l43: Add GPIO controlled mic/spk mute LEDs
To: Maciej Strozek <mstrozek@opensource.cirrus.com>, Andy Shevchenko <andy@kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: brgl@kernel.org, patches@opensource.cirrus.com, linux-gpio@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Top posting to loop in more people.

(Andy & Mika)

On Tue, Nov 10, 2026 at 3:21=E2=80=AFPM Maciej Strozek
<mstrozek@opensource.cirrus.com> wrote:

> Add ability to use cs42l43's GPIOs to drive speaker and microphone mute
> LEDs. The LEDs must be described using
> 01fa-global-mute-led-(spk|mic)-mute-gpio ACPI property, which tells
> which of the 3 available cs42l43's GPIOs to use for the respective
> function.
>
> Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>

ACPI property, so Andy and Mika need to decide if this is a reasonable
way to go about this issue.

> ---
>  drivers/pinctrl/cirrus/pinctrl-cs42l43.c | 156 +++++++++++++++++++++++
>  1 file changed, 156 insertions(+)
>
> diff --git a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c b/drivers/pinctrl/c=
irrus/pinctrl-cs42l43.c
> index 8990fab0446cf..7e4e43783ef14 100644
> --- a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
> +++ b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
> @@ -5,11 +5,15 @@
>  // Copyright (c) 2023 Cirrus Logic, Inc. and
>  //                    Cirrus Logic International Semiconductor Ltd.
>
> +#include <linux/acpi.h>
>  #include <linux/array_size.h>
>  #include <linux/bits.h>
>  #include <linux/build_bug.h>
>  #include <linux/err.h>
> +#include <linux/gpio/consumer.h>
>  #include <linux/gpio/driver.h>
> +#include <linux/gpio/machine.h>
> +#include <linux/leds.h>
>  #include <linux/mfd/cs42l43.h>
>  #include <linux/mfd/cs42l43-regs.h>
>  #include <linux/module.h>
> @@ -29,9 +33,18 @@
>
>  #define CS42L43_NUM_GPIOS 3
>
> +struct cs42l43_mute_led {
> +       struct led_classdev cdev;
> +       struct gpio_desc *gpio;
> +       u32 gpio_num;
> +};
> +
>  struct cs42l43_pin {
>         struct gpio_chip gpio_chip;
>
> +       struct cs42l43_mute_led spk_mute_led;
> +       struct cs42l43_mute_led mic_mute_led;
> +
>         struct device *dev;
>         struct regmap *regmap;
>         bool shutters_locked;
> @@ -535,6 +548,143 @@ static void cs42l43_fwnode_put(void *data)
>         fwnode_handle_put(data);
>  }
>
> +#if IS_REACHABLE(CONFIG_LEDS_CLASS)
> +static int cs42l43_find_mute_gpios(struct cs42l43_pin *priv, struct fwno=
de_handle *fwnode)
> +{
> +       struct cs42l43_mute_led *mic =3D &priv->mic_mute_led;
> +       struct cs42l43_mute_led *spk =3D &priv->spk_mute_led;
> +       int ret;
> +
> +       fwnode_for_each_child_node_scoped(fwnode, child_fwnode) {
> +               struct fwnode_handle *ext_fwnode __free(fwnode_handle) =
=3D
> +                       fwnode_get_named_child_node(child_fwnode,
> +                                                   "mipi-sdca-function-e=
xpansion-subproperties");
> +               bool mic_present, spk_present;
> +
> +               if (!ext_fwnode)
> +                       continue;
> +
> +               mic_present =3D fwnode_property_present(ext_fwnode,
> +                                                     "01fa-global-mute-l=
ed-mic-mute-gpio");
> +               spk_present =3D fwnode_property_present(ext_fwnode,
> +                                                     "01fa-global-mute-l=
ed-spk-mute-gpio");
> +               if (!mic_present && !spk_present)
> +                       continue;
> +
> +               if (mic_present) {
> +                       ret =3D fwnode_property_read_u32(ext_fwnode,
> +                                                      "01fa-global-mute-=
led-mic-mute-gpio",
> +                                                      &mic->gpio_num);
> +                       if (ret)
> +                               return dev_err_probe(priv->dev, ret,
> +                                                    "Invalid mic-mute LE=
D GPIO property\n");
> +               }
> +
> +               if (spk_present) {
> +                       ret =3D fwnode_property_read_u32(ext_fwnode,
> +                                                      "01fa-global-mute-=
led-spk-mute-gpio",
> +                                                      &spk->gpio_num);
> +                       if (ret)
> +                               return dev_err_probe(priv->dev, ret,
> +                                                    "Invalid spk-mute LE=
D GPIO property\n");
> +               }
> +
> +               return 0;
> +       }
> +
> +       return 0;
> +}
> +
> +static int cs42l43_mute_led_set(struct led_classdev *cdev, enum led_brig=
htness value)
> +{
> +       struct cs42l43_mute_led *led =3D container_of(cdev, struct cs42l4=
3_mute_led, cdev);
> +
> +       return gpiod_set_value_cansleep(led->gpio, value !=3D LED_OFF);
> +}
> +
> +static void cs42l43_mute_led_gpio_free(void *data)
> +{
> +       struct cs42l43_mute_led *led =3D data;
> +
> +       gpiochip_free_own_desc(led->gpio);
> +}
> +
> +static int cs42l43_mute_led_register(struct cs42l43_pin *priv,
> +                                    struct cs42l43_mute_led *led,
> +                                    const char *function, const char *tr=
igger)
> +{
> +       int ret;
> +
> +       led->gpio =3D gpiochip_request_own_desc(&priv->gpio_chip, led->gp=
io_num - 1,
> +                                             trigger, GPIO_ACTIVE_HIGH,
> +                                             GPIOD_OUT_LOW);
> +       if (IS_ERR(led->gpio))
> +               return dev_err_probe(priv->dev, PTR_ERR(led->gpio),
> +                                    "Failed to request GPIO%u for %s LED=
\n",
> +                                    led->gpio_num, trigger);
> +
> +       ret =3D devm_add_action_or_reset(priv->dev, cs42l43_mute_led_gpio=
_free, led);
> +       if (ret)
> +               return ret;
> +
> +       led->cdev.name =3D devm_kasprintf(priv->dev, GFP_KERNEL, "%s::%s"=
,
> +                                       dev_name(priv->dev), function);
> +       if (!led->cdev.name)
> +               return -ENOMEM;
> +
> +       led->cdev.default_trigger =3D trigger;
> +       led->cdev.brightness_set_blocking =3D cs42l43_mute_led_set;
> +       led->cdev.max_brightness =3D 1;
> +
> +       ret =3D devm_led_classdev_register(priv->dev, &led->cdev);
> +       if (ret)
> +               return dev_err_probe(priv->dev, ret, "Failed to register =
%s LED\n",
> +                                    trigger);
> +
> +       dev_dbg(priv->dev, "%s LED uses codec GPIO%u\n", trigger, led->gp=
io_num);
> +
> +       return 0;
> +}
> +
> +static int cs42l43_mute_leds_register(struct cs42l43_pin *priv,
> +                                     struct fwnode_handle *fwnode)
> +{
> +       struct cs42l43_mute_led *mic =3D &priv->mic_mute_led;
> +       struct cs42l43_mute_led *spk =3D &priv->spk_mute_led;
> +       int ret;
> +
> +       if (!is_acpi_node(fwnode))
> +               return 0;
> +
> +       ret =3D cs42l43_find_mute_gpios(priv, fwnode);
> +       if (ret)
> +               return ret;
> +
> +       if (mic->gpio_num > CS42L43_NUM_GPIOS ||
> +           spk->gpio_num > CS42L43_NUM_GPIOS ||
> +           (mic->gpio_num && mic->gpio_num =3D=3D spk->gpio_num))
> +               return dev_err_probe(priv->dev, -EINVAL,
> +                                    "Invalid or shared mute LED GPIOs: m=
ic=3D%u, spk=3D%u\n",
> +                                    mic->gpio_num, spk->gpio_num);
> +
> +       if (mic->gpio_num) {
> +               ret =3D cs42l43_mute_led_register(priv, mic, LED_FUNCTION=
_MICMUTE,
> +                                               "audio-micmute");
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       if (spk->gpio_num) {
> +               ret =3D cs42l43_mute_led_register(priv, spk, LED_FUNCTION=
_MUTE,
> +                                               "audio-mute");
> +               if (ret)
> +                       return ret;
> +       }
> +
> +       return 0;
> +}
> +#endif
> +
>  static int cs42l43_pin_probe(struct platform_device *pdev)
>  {
>         struct cs42l43 *cs42l43 =3D dev_get_drvdata(pdev->dev.parent);
> @@ -598,6 +748,12 @@ static int cs42l43_pin_probe(struct platform_device =
*pdev)
>                 return dev_err_probe(priv->dev, ret,
>                                      "Failed to register gpiochip\n");
>
> +#if IS_REACHABLE(CONFIG_LEDS_CLASS)
> +       ret =3D cs42l43_mute_leds_register(priv, dev_fwnode(cs42l43->dev)=
);
> +       if (ret)
> +               return ret;
> +#endif
> +
>         return 0;
>  }
>
> --
> 2.47.3
>
