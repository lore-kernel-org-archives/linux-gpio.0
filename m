From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: RFI: pinctrl & mcp32s08 driver
Date: Sun, 8 Oct 2017 01:53:38 +0200
Message-ID: <CACRpkdZr1eyP_RhT-9sTUL9tz3ABoUcUPAJYr7-peNM3kVssxQ@mail.gmail.com>
References: <d8f851ad-9d8b-d422-6ab5-6b52d211a62f@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f182.google.com ([209.85.223.182]:49520 "EHLO
        mail-io0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752812AbdJGXxk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sat, 7 Oct 2017 19:53:40 -0400
Received: by mail-io0-f182.google.com with SMTP id 21so18721641iof.6
        for <linux-gpio@vger.kernel.org>; Sat, 07 Oct 2017 16:53:39 -0700 (PDT)
In-Reply-To: <d8f851ad-9d8b-d422-6ab5-6b52d211a62f@electromag.com.au>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>, Arnd Bergmann <arnd@arndb.de>, Marc Zyngier <marc.zyngier@arm.com>, Thomas Gleixner <tglx@linutronix.de>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Oct 5, 2017 at 8:54 AM, Phil Reid <preid@electromag.com.au> wrote:

> My system (SOCFPGA) doesn't have a pinctrl so it never set kconfig PINCTRL
> variable.
> So I can't get access to enable the new PINCTRL_MCP23S08 variable to enable
> the driver.
>
> Not sure what I'm supposed to do here. Documentation suggests pinctrl is
> platform specific,

Hm Torvalds had me hide the option because he don't want to be bothered
with stuff he don't care about.

I don't know if that is really appropriate now that we have pin controllers
on slow busses popping up.

A short term fix is just to select PINCTRL on SOCFPGA and ask the
ARM SoC maintainers what to do.

> but the mcp32s08 driver isn't really soc specific being an i2c/spi device.

Nope. But I guess mostly ARM devices use it?

> For testing I've edited the pinctrl/Kconfig to make PINCTRL a menuconfig
> variable same as GPIOLIB

Maybe you should propose that as a patch.
Arnd, what do you think?

> In addition my hardware has a mcp23017 & mcp23018 sharing an irq line.
> So this requires an active low open drain output.

Or an active high open source output. But OK.

> This line is then routed via fpga fabric to the SOCFPGA arm processor
> generic interrupt input
> which only accepts active high inputs. So it's inverted in the fpga fabric.
>
> The mcp23s08 driver in mcp23s08_irq_setup forces the irq flag based on the
> chip
> configuration. Which breaks this.
>
> ie setting IRQ_TYPE_LEVEL_HIGH in the device tree for the mcp irq is
> effectively ignored.
>
> What's the correct approach here. Shouldn't this just honour the device
> tree?

You need to model the inverter in the device tree and have something
pass it through I guess, but the IRQ maintainers are the ones to ask.
(Thomas Gleixner, Marc Zyngier)

> Also noticed when compiling the driver in new mcp_pinconf_set()
>
>         case PIN_CONFIG_BIAS_PULL_UP:
>                 val = arg ? 0xFFFF : 0x0000;
>                 mask = BIT(pin);
>                 ret = mcp_set_bit(mcp, MCP_GPPU, pin, arg);
>                 break;
>
> val & mask aren't used.
>
> I'm not sure which part is the typo.

Looks like a bug.

Sebastian Reichel wrote this code and can surely figure out what's wrong.

Yours,
Linus Walleij
