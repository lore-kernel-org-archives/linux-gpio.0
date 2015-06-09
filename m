From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: re: gpio: omap: fix error handling in omap_gpio_irq_type
Date: Tue, 9 Jun 2015 12:02:37 +0300
Message-ID: <20150609090237.GA3605@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:19038 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932396AbbFIJCv (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Jun 2015 05:02:51 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: grygorii.strashko@linaro.org
Cc: linux-gpio@vger.kernel.org

Hello Grygorii Strashko,

The patch 1562e4618ded: "gpio: omap: fix error handling in
omap_gpio_irq_type" from May 22, 2015, leads to the following static
checker warning:

	drivers/gpio/gpio-omap.c:523 omap_gpio_irq_type()
	warn: inconsistent returns 'spin_lock:&bank->lock'.

drivers/gpio/gpio-omap.c
  Locked on:   line 523
  Unlocked on: line 492
               line 496
               line 518
               line 523


   501          spin_lock_irqsave(&bank->lock, flags);
   502          retval = omap_set_gpio_triggering(bank, offset, type);
   503          if (retval)

Missing spin_unlock_irqrestore() before goto.

   504                  goto error;
   505          omap_gpio_init_irq(bank, offset);
   506          if (!omap_gpio_is_input(bank, offset)) {
   507                  spin_unlock_irqrestore(&bank->lock, flags);
   508                  retval = -EINVAL;
   509                  goto error;
   510          }
   511          spin_unlock_irqrestore(&bank->lock, flags);
   512  
   513          if (type & (IRQ_TYPE_LEVEL_LOW | IRQ_TYPE_LEVEL_HIGH))
   514                  __irq_set_handler_locked(d->irq, handle_level_irq);
   515          else if (type & (IRQ_TYPE_EDGE_FALLING | IRQ_TYPE_EDGE_RISING))
   516                  __irq_set_handler_locked(d->irq, handle_edge_irq);
   517  
   518          return 0;
   519  
   520  error:
   521          if (!BANK_USED(bank))
   522                  pm_runtime_put(bank->dev);
   523          return retval;
   524  }


Also:
drivers/gpio/gpio-omap.c:725 omap_gpio_irq_handler()
	what if bank->base is NULL but bank->regs->irqstatus is
	non-zero?

drivers/gpio/gpio-omap.c:1176 omap_gpio_probe() comma vs semicolon
drivers/gpio/gpio-omap.c:1175 omap_gpio_probe() comma vs semicolon
drivers/gpio/gpio-omap.c:1174 omap_gpio_probe() comma vs semicolon
drivers/gpio/gpio-omap.c:1173 omap_gpio_probe() comma vs semicolon
drivers/gpio/gpio-omap.c:1172 omap_gpio_probe() comma vs semicolon
drivers/gpio/gpio-omap.c:1171 omap_gpio_probe() comma vs semicolon
drivers/gpio/gpio-omap.c:1170 omap_gpio_probe() comma vs semicolon

regards,
dan carpenter
