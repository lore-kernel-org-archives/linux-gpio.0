From: Peter Rosin <peda@axentia.se>
Subject: Re: [REGRESSION] mux/gpio.c is not able to get any gpio pins
Date: Wed, 17 Jan 2018 00:57:23 +0100
Message-ID: <69f82f18-8334-1b88-97ee-04f77ea1ee03@axentia.se>
References: <6c711f96-e412-f7a6-125b-59c61829d802@axentia.se>
 <CACRpkdZ0zDhxrNoAaytpr2cfMxTNZ4zj+U4WcZSQgVReuUQ=9g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdZ0zDhxrNoAaytpr2cfMxTNZ4zj+U4WcZSQgVReuUQ=9g@mail.gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Andrew Jeffery <andrew@aj.id.au>, Charles Keepax <ckeepax@opensource.cirrus.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On 2018-01-17 00:18, Linus Walleij wrote:
> On Tue, Jan 16, 2018 at 10:47 PM, Peter Rosin <peda@axentia.se> wrote:
> 
>> diff between the two:
>>
>> --- bootlog.good        2018-01-16 22:39:29.196022434 +0100
>> +++ bootlog.bad 2018-01-16 22:39:51.474264534 +0100
>> @@ -118,7 +118,7 @@
>>  0x000000180000-0x0000001a0000 : "oftree"
>>  0x000000200000-0x000000700000 : "kernel"
>>  0x000000800000-0x000020000000 : "rootfs"
>> -gpio-mux mux-controller: 8-way mux-controller registered
>> +gpio-mux mux-controller: failed to get gpios: -517
>>  NET: Registered protocol family 10
>>  Segment Routing with IPv6
>>  sit: IPv6, IPv4 and MPLS over IPv4 tunneling driver
>> @@ -128,15 +128,7 @@
>>  [drm] No driver support for vblank timestamp query.
>>  atmel-hlcdc-display-controller atmel-hlcdc-dc: fb0:  frame buffer device
>>  [drm] Initialized atmel-hlcdc 1.0.0 20141504 for atmel-hlcdc-dc on minor 0
>> -i2c i2c-0: Added multiplexed i2c bus 3
>> -i2c i2c-0: Added multiplexed i2c bus 4
>> -i2c i2c-0: Added multiplexed i2c bus 5
>> -i2c i2c-0: Added multiplexed i2c bus 6
>> -i2c i2c-0: Added multiplexed i2c bus 7
>> -i2c i2c-0: Added multiplexed i2c bus 8
>> -i2c i2c-0: Added multiplexed i2c bus 9
>> -i2c i2c-0: Added multiplexed i2c bus 10
>> -i2c-mux-gpmux i2c-mux: 8-port mux on AT91 adapter
>> +gpio-mux mux-controller: failed to get gpios: -517
> 
> It would be clearer with a trace, really.
> 
> Not that I'm especially good at using ftrace myself :/

Never used it...

> I think gpiod_set_transitory() calls chip->set_config(chip, gpio, packed);
> which calls  gpiochip_generic_config() which calls
> pinctrl_gpio_set_config() which calls
> pinctrl_get_device_gpio_range() which returns -EPROBE_DEFER;
> if it can't find a range to map the GPIO to pin control.
> 
> Can you confirm this with e.g. debug prints in
> pinctrl_get_device_gpio_range() in drivers/pinctrl/core.c?

Yep, a debug print hits, so that that seems to be the origin of
the -EPROBE_DEFER.

> To fix this, I think sx150x_probe() need to be rewritten
> to register the pin controller first, then the GPIO chip,
> so the range mapping is up and kicking when the chip gets
> initialized.

I tried with:

diff --git a/drivers/pinctrl/pinctrl-sx150x.c b/drivers/pinctrl/pinctrl-sx150x.c
index fb242c542dc9..049dd15e04ef 100644
--- a/drivers/pinctrl/pinctrl-sx150x.c
+++ b/drivers/pinctrl/pinctrl-sx150x.c
@@ -1144,6 +1144,27 @@ static int sx150x_probe(struct i2c_client *client,
 	if (ret)
 		return ret;
 
+	/* Pinctrl_desc */
+	pctl->pinctrl_desc.name = "sx150x-pinctrl";
+	pctl->pinctrl_desc.pctlops = &sx150x_pinctrl_ops;
+	pctl->pinctrl_desc.confops = &sx150x_pinconf_ops;
+	pctl->pinctrl_desc.pins = pctl->data->pins;
+	pctl->pinctrl_desc.npins = pctl->data->npins;
+	pctl->pinctrl_desc.owner = THIS_MODULE;
+
+	ret = devm_pinctrl_register_and_init(dev, &pctl->pinctrl_desc,
+					     pctl, &pctl->pctldev);
+	if (ret) {
+		dev_err(dev, "Failed to register pinctrl device\n");
+		return ret;
+	}
+
+	ret = pinctrl_enable(pctl->pctldev);
+	if (ret) {
+		dev_err(dev, "Failed to enable pinctrl device\n");
+		return ret;
+	}
+
 	/* Register GPIO controller */
 	pctl->gpio.label = devm_kstrdup(dev, client->name, GFP_KERNEL);
 	pctl->gpio.base = -1;
@@ -1217,20 +1238,6 @@ static int sx150x_probe(struct i2c_client *client,
 					    client->irq);
 	}
 
-	/* Pinctrl_desc */
-	pctl->pinctrl_desc.name = "sx150x-pinctrl";
-	pctl->pinctrl_desc.pctlops = &sx150x_pinctrl_ops;
-	pctl->pinctrl_desc.confops = &sx150x_pinconf_ops;
-	pctl->pinctrl_desc.pins = pctl->data->pins;
-	pctl->pinctrl_desc.npins = pctl->data->npins;
-	pctl->pinctrl_desc.owner = THIS_MODULE;
-
-	pctl->pctldev = pinctrl_register(&pctl->pinctrl_desc, dev, pctl);
-	if (IS_ERR(pctl->pctldev)) {
-		dev_err(dev, "Failed to register pinctrl device\n");
-		return PTR_ERR(pctl->pctldev);
-	}
-
 	return 0;
 }
 

No disco. I also tried with the pinctrl_enable call last in the probe
but that was no different.

Cheers,
Peter
