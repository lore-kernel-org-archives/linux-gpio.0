Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.15
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795678550;
	b=g/HlwbRfMdB3a4KZazSTvzxZ0fkhZHaA6GqFEGRkj+3Bj6DWWWbCNQPyod84xpiSrUaW
	 mic56Yi2+1ir6PUzppHDLKuWQxcp/MeVjghThdPzUW1hNAOQEuUH7b40kFtrpLl+KlEq3
	 JZu5uBWOtOmLTfQk3br31LtvSbBSzDQ+Spxpcun57p2/u9qH5s+kpP9fOH4NMqoc5Pzrl
	 CJiNrQTgYFUZx7hZ82IzLlb7MybxM7y6gciBcbrZ1poql8VjjlZ/GHc2s85S/zhXlUnnT
	 vC/efEYvPmjyO548ESPQrb+85tguDhB3b8j1sYgD0RtHP1XzGjg8Yfo72UsLKc/G/+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795678550;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To;
	bh=2eugPvCFuopdM2cplxwflGqsU9A8QEDx/1U3R4WAaHc=;
	b=d8f6zaXFw3udZ9xIxqym02ONkfPqEcKYrQ8Xb595NAR3kSKRnMg8TflJrQR9M9fU85nA
	 +he6C3h6qBWkLzd0TPeRfmaHzwgX1XAEbLMD3ty1Ck3lr1FOweJAk09ZcERBABWClTC7w
	 ToEleBFWAltvYyAcEULhTzeAadIrszboAnPXBgbGkLdrIH6RWutxzpL7C0Q/DNHp0s9Oe
	 WmZZvvhUpGXZk3wL9ryicpi/ZXx7zqx+jqaHrb1r9Qj1Mg2x2nsPsv16myAYuOyH0ZVKj
	 COP7LjBqOoRU4yTg6GIXGEyfuT61BpYJ2bEhkZaO8qAJLQ9vpw3CGY2UeUpzHqGsj1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IuYmYDsN;
	arc=none smtp.remote-ip=198.175.65.15
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459CE606A31C;
	Thu, 26 Nov 2026 07:35:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 459CE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IuYmYDsN
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795678549; x=1827214549;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=frTDRGBtprvjeW8e1zSOPrw9hbhdOFAeRBZMQNXbmgE=;
  b=IuYmYDsNpnXuBbIQm3P80s5f2xDdVNPbIrdb+Ge7aoRTiWjl9X3JPwgA
   NV3JtGKTWs+jmNSShTujnaGyCC/JSUrIuVK3EtELfMHe+RjcxsEJ8FZCL
   28ZaOLt4wBi1c5j0bSGMJKiqPiFZmHS62V1jhvRzgT+QRfn0kjy8RSIIH
   45VfA4jtwBq2F85ffqF07LpR4gxOBmmO63SgnBoFGMlkPUOC+garFNxKu
   S35JXhYbrBylaSPZ4ICn8wi98W0IENzr2Qwzb/GLSCDcpZO//dlBUtADT
   A4xX6qbonhdNkxsoUp6YoOhOz6QLxryHa936oXTxcgCckbbljOrn9NqZ/
   w==;
X-CSE-ConnectionGUID: 3sQMpprJSV6e8KfLb4P18Q==
X-CSE-MsgGUID: lIz7evS+TuuFyZzUSPlsaw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4565351"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4565351"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 23:35:48 -0800
X-CSE-ConnectionGUID: IAfJMe5YRzKfrVeBeUuE0A==
X-CSE-MsgGUID: uEOi2c1+QeGm5wuDaRGuKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="11880657"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 25 Nov 2026 23:35:47 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id B1F1098; Thu, 26 Nov 2026 08:35:45 +0100 (CET)
Date: Thu, 26 Nov 2026 08:35:45 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Maciej Strozek <mstrozek@opensource.cirrus.com>,
	Andy Shevchenko <andy@kernel.org>, brgl@kernel.org,
	patches@opensource.cirrus.com, linux-gpio@vger.kernel.org,
	linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pinctrl: cs42l43: Add GPIO controlled mic/spk mute LEDs
Message-ID: <20261126073545.GM191152@black.igk.intel.com>
References: <20261110142058.354518-1-mstrozek@opensource.cirrus.com>
 <CAD++jLmUNxbVBLXg1aGysRGCjcQFjo=JSwx4-=8TWa7bj-iXuA@mail.gmail.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jLmUNxbVBLXg1aGysRGCjcQFjo=JSwx4-=8TWa7bj-iXuA@mail.gmail.com>

Hi,

On Wed, Nov 25, 2026 at 07:06:24PM +0100, Linus Walleij wrote:
> Top posting to loop in more people.
> 
> (Andy & Mika)
> 
> On Tue, Nov 10, 2026 at 3:21 PM Maciej Strozek
> <mstrozek@opensource.cirrus.com> wrote:
> 
> > Add ability to use cs42l43's GPIOs to drive speaker and microphone mute
> > LEDs. The LEDs must be described using
> > 01fa-global-mute-led-(spk|mic)-mute-gpio ACPI property, which tells
> > which of the 3 available cs42l43's GPIOs to use for the respective
> > function.
> >
> > Signed-off-by: Maciej Strozek <mstrozek@opensource.cirrus.com>
> 
> ACPI property, so Andy and Mika need to decide if this is a reasonable
> way to go about this issue.

I think the properties themselves are already "known" so that should be
okay (but let's see if Andy has any comments), there is though a tiny
observation below.

> > ---
> >  drivers/pinctrl/cirrus/pinctrl-cs42l43.c | 156 +++++++++++++++++++++++
> >  1 file changed, 156 insertions(+)
> >
> > diff --git a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
> > index 8990fab0446cf..7e4e43783ef14 100644
> > --- a/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
> > +++ b/drivers/pinctrl/cirrus/pinctrl-cs42l43.c
> > @@ -5,11 +5,15 @@
> >  // Copyright (c) 2023 Cirrus Logic, Inc. and
> >  //                    Cirrus Logic International Semiconductor Ltd.
> >
> > +#include <linux/acpi.h>
> >  #include <linux/array_size.h>
> >  #include <linux/bits.h>
> >  #include <linux/build_bug.h>
> >  #include <linux/err.h>
> > +#include <linux/gpio/consumer.h>
> >  #include <linux/gpio/driver.h>
> > +#include <linux/gpio/machine.h>
> > +#include <linux/leds.h>
> >  #include <linux/mfd/cs42l43.h>
> >  #include <linux/mfd/cs42l43-regs.h>
> >  #include <linux/module.h>
> > @@ -29,9 +33,18 @@
> >
> >  #define CS42L43_NUM_GPIOS 3
> >
> > +struct cs42l43_mute_led {
> > +       struct led_classdev cdev;
> > +       struct gpio_desc *gpio;
> > +       u32 gpio_num;
> > +};
> > +
> >  struct cs42l43_pin {
> >         struct gpio_chip gpio_chip;
> >
> > +       struct cs42l43_mute_led spk_mute_led;
> > +       struct cs42l43_mute_led mic_mute_led;
> > +
> >         struct device *dev;
> >         struct regmap *regmap;
> >         bool shutters_locked;
> > @@ -535,6 +548,143 @@ static void cs42l43_fwnode_put(void *data)
> >         fwnode_handle_put(data);
> >  }
> >
> > +#if IS_REACHABLE(CONFIG_LEDS_CLASS)
> > +static int cs42l43_find_mute_gpios(struct cs42l43_pin *priv, struct fwnode_handle *fwnode)
> > +{
> > +       struct cs42l43_mute_led *mic = &priv->mic_mute_led;
> > +       struct cs42l43_mute_led *spk = &priv->spk_mute_led;
> > +       int ret;
> > +
> > +       fwnode_for_each_child_node_scoped(fwnode, child_fwnode) {
> > +               struct fwnode_handle *ext_fwnode __free(fwnode_handle) =
> > +                       fwnode_get_named_child_node(child_fwnode,
> > +                                                   "mipi-sdca-function-expansion-subproperties");
> > +               bool mic_present, spk_present;
> > +
> > +               if (!ext_fwnode)
> > +                       continue;
> > +
> > +               mic_present = fwnode_property_present(ext_fwnode,
> > +                                                     "01fa-global-mute-led-mic-mute-gpio");
> > +               spk_present = fwnode_property_present(ext_fwnode,
> > +                                                     "01fa-global-mute-led-spk-mute-gpio");
> > +               if (!mic_present && !spk_present)
> > +                       continue;
> > +
> > +               if (mic_present) {
> > +                       ret = fwnode_property_read_u32(ext_fwnode,
> > +                                                      "01fa-global-mute-led-mic-mute-gpio",
> > +                                                      &mic->gpio_num);
> > +                       if (ret)
> > +                               return dev_err_probe(priv->dev, ret,
> > +                                                    "Invalid mic-mute LED GPIO property\n");
> > +               }
> > +
> > +               if (spk_present) {
> > +                       ret = fwnode_property_read_u32(ext_fwnode,
> > +                                                      "01fa-global-mute-led-spk-mute-gpio",
> > +                                                      &spk->gpio_num);
> > +                       if (ret)
> > +                               return dev_err_probe(priv->dev, ret,
> > +                                                    "Invalid spk-mute LED GPIO property\n");
> > +               }
> > +
> > +               return 0;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int cs42l43_mute_led_set(struct led_classdev *cdev, enum led_brightness value)
> > +{
> > +       struct cs42l43_mute_led *led = container_of(cdev, struct cs42l43_mute_led, cdev);
> > +
> > +       return gpiod_set_value_cansleep(led->gpio, value != LED_OFF);
> > +}
> > +
> > +static void cs42l43_mute_led_gpio_free(void *data)
> > +{
> > +       struct cs42l43_mute_led *led = data;
> > +
> > +       gpiochip_free_own_desc(led->gpio);
> > +}
> > +
> > +static int cs42l43_mute_led_register(struct cs42l43_pin *priv,
> > +                                    struct cs42l43_mute_led *led,
> > +                                    const char *function, const char *trigger)
> > +{
> > +       int ret;
> > +
> > +       led->gpio = gpiochip_request_own_desc(&priv->gpio_chip, led->gpio_num - 1,
> > +                                             trigger, GPIO_ACTIVE_HIGH,
> > +                                             GPIOD_OUT_LOW);
> > +       if (IS_ERR(led->gpio))
> > +               return dev_err_probe(priv->dev, PTR_ERR(led->gpio),
> > +                                    "Failed to request GPIO%u for %s LED\n",
> > +                                    led->gpio_num, trigger);
> > +
> > +       ret = devm_add_action_or_reset(priv->dev, cs42l43_mute_led_gpio_free, led);
> > +       if (ret)
> > +               return ret;
> > +
> > +       led->cdev.name = devm_kasprintf(priv->dev, GFP_KERNEL, "%s::%s",
> > +                                       dev_name(priv->dev), function);
> > +       if (!led->cdev.name)
> > +               return -ENOMEM;
> > +
> > +       led->cdev.default_trigger = trigger;
> > +       led->cdev.brightness_set_blocking = cs42l43_mute_led_set;
> > +       led->cdev.max_brightness = 1;
> > +
> > +       ret = devm_led_classdev_register(priv->dev, &led->cdev);
> > +       if (ret)
> > +               return dev_err_probe(priv->dev, ret, "Failed to register %s LED\n",
> > +                                    trigger);
> > +
> > +       dev_dbg(priv->dev, "%s LED uses codec GPIO%u\n", trigger, led->gpio_num);
> > +
> > +       return 0;
> > +}
> > +
> > +static int cs42l43_mute_leds_register(struct cs42l43_pin *priv,
> > +                                     struct fwnode_handle *fwnode)
> > +{
> > +       struct cs42l43_mute_led *mic = &priv->mic_mute_led;
> > +       struct cs42l43_mute_led *spk = &priv->spk_mute_led;
> > +       int ret;
> > +
> > +       if (!is_acpi_node(fwnode))
> > +               return 0;
> > +
> > +       ret = cs42l43_find_mute_gpios(priv, fwnode);
> > +       if (ret)
> > +               return ret;
> > +
> > +       if (mic->gpio_num > CS42L43_NUM_GPIOS ||
> > +           spk->gpio_num > CS42L43_NUM_GPIOS ||
> > +           (mic->gpio_num && mic->gpio_num == spk->gpio_num))
> > +               return dev_err_probe(priv->dev, -EINVAL,
> > +                                    "Invalid or shared mute LED GPIOs: mic=%u, spk=%u\n",
> > +                                    mic->gpio_num, spk->gpio_num);
> > +
> > +       if (mic->gpio_num) {
> > +               ret = cs42l43_mute_led_register(priv, mic, LED_FUNCTION_MICMUTE,
> > +                                               "audio-micmute");
> > +               if (ret)
> > +                       return ret;
> > +       }
> > +
> > +       if (spk->gpio_num) {
> > +               ret = cs42l43_mute_led_register(priv, spk, LED_FUNCTION_MUTE,
> > +                                               "audio-mute");
> > +               if (ret)
> > +                       return ret;
> > +       }
> > +
> > +       return 0;
> > +}
> > +#endif

If you do this:

#else
static inline int cs42l43_mute_leds_register(struct cs42l43_pin *priv,
					     struct fwnode_handle *fwnode)
{
	return 0;
}
#endif

> > +
> >  static int cs42l43_pin_probe(struct platform_device *pdev)
> >  {
> >         struct cs42l43 *cs42l43 = dev_get_drvdata(pdev->dev.parent);
> > @@ -598,6 +748,12 @@ static int cs42l43_pin_probe(struct platform_device *pdev)
> >                 return dev_err_probe(priv->dev, ret,
> >                                      "Failed to register gpiochip\n");
> >
> > +#if IS_REACHABLE(CONFIG_LEDS_CLASS)
> > +       ret = cs42l43_mute_leds_register(priv, dev_fwnode(cs42l43->dev));
> > +       if (ret)
> > +               return ret;
> > +#endif

then this reads better:

	ret = cs42l43_mute_leds_register(priv, dev_fwnode(cs42l43->dev));
	if (ret)
		return ret;

> > +
> >         return 0;
> >  }
> >
> > --
> > 2.47.3
> >
