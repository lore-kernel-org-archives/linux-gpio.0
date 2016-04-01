From: Alexander Stein <alexander.stein@systec-electronic.com>
Subject: gpio irqchip initialization race
Date: Fri, 01 Apr 2016 10:28:54 +0200
Message-ID: <44236018.b6N0xPzKYW@ws-stein>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from webbox1416.server-home.net ([77.236.96.61]:39561 "EHLO
	webbox1416.server-home.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753064AbcDAI3D (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 1 Apr 2016 04:29:03 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>

Hi,

I'm currently observing a (supposedly) race condition during system start.
My board is running an SMP kernel on 2 cores and uses a MCP23S17 where some 
buttons are attached to. In the device tree the buttons are configured to used 
by gpio-keys, thus some GPIOs on MCP23S17 will be used as interrupts.
In probably most cases init is fine and buttons can be used by evtest. But on 
some boots I get 2 different error messages:
> gpio-keys user_sw: Unable to claim irq 0; error -22
and
> gpio-keys user_sw: Unable to get irq number for GPIO 376, error -6
GPIO 376 is Pin 8 on MCP23S17.
I suspect this depends on the time when gpio-keys is being probed. It will not 
be probed (or actually deferred) before mcp23s08_probe_one calls 
gpiochip_add_data as the parent GPIo controller to buttons is not present yet.
I guess those error messages raise when gpio-keys is probed after 
gpiochip_add_data but before gpiochip_irqchip_add or 
gpiochip_set_chained_irqchip (in mcp23s08_irq_setup).

The comment to _gpiochip_irqchip_add states the gpiochip has to be registered 
when calling. So to me this opens a rather small window where childs to 
gpiochip can be probed (parent is registered) but registering an interrupt 
will fail as the parent IRQ setup has not finished yet.
Any suggestions how to fix that?

Best regards,
Alexander

