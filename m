From: Phil Reid <preid@electromag.com.au>
Subject: RFI: pinctrl & mcp32s08 driver
Date: Thu, 5 Oct 2017 14:54:31 +0800
Message-ID: <d8f851ad-9d8b-d422-6ab5-6b52d211a62f@electromag.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from anchovy1.45ru.net.au ([203.30.46.145]:59758 "EHLO
        anchovy.45ru.net.au" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1751271AbdJEGyx (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 5 Oct 2017 02:54:53 -0400
Content-Language: en-AU
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

G'day All,

The mcp32s08 driver was recently moved from the drivers/gpio to drivers/pinctlr.

My system (SOCFPGA) doesn't have a pinctrl so it never set kconfig PINCTRL variable.
So I can't get access to enable the new PINCTRL_MCP23S08 variable to enable the driver.

Not sure what I'm supposed to do here. Documentation suggests pinctrl is platform specific,
but the mcp32s08 driver isn't really soc specific being an i2c/spi device.

For testing I've edited the pinctrl/Kconfig to make PINCTRL a menuconfig variable same as GPIOLIB


In addition my hardware has a mcp23017 & mcp23018 sharing an irq line.
So this requires an active low open drain output.
This line is then routed via fpga fabric to the SOCFPGA arm processor generic interrupt input
which only accepts active high inputs. So it's inverted in the fpga fabric.

The mcp23s08 driver in mcp23s08_irq_setup forces the irq flag based on the chip
configuration. Which breaks this.

ie setting IRQ_TYPE_LEVEL_HIGH in the device tree for the mcp irq is effectively ignored.

What's the correct approach here. Shouldn't this just honour the device tree?



Also noticed when compiling the driver in new mcp_pinconf_set()

	case PIN_CONFIG_BIAS_PULL_UP:
		val = arg ? 0xFFFF : 0x0000;
		mask = BIT(pin);
		ret = mcp_set_bit(mcp, MCP_GPPU, pin, arg);
		break;

val & mask aren't used.

I'm not sure which part is the typo.



-- 
Regards
Phil Reid
