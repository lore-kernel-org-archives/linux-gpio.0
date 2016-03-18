From: Phil Reid <preid@electromag.com.au>
Subject: [PATCH 0/1] gpio: mcp23s08: switch to use gpiolib irqchip helpers
Date: Fri, 18 Mar 2016 16:07:05 +0800
Message-ID: <1458288426-39144-1-git-send-email-preid@electromag.com.au>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from 203-59-230-133.perm.iinet.net.au ([203.59.230.133]:53241 "EHLO
	preid-centos7.electromag.com.au" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751188AbcCRIHN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Fri, 18 Mar 2016 04:07:13 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org
Cc: Phil Reid <preid@electromag.com.au>

As requested switch to GPIOLIB_IRQCHIP.
Following similar changes in gpio-stmpe.c
Test with SPI mcp23s18, with input keys connected to GPIO.
IRQ's triggered ok. 
I'm a little unclear on the remove path, but it looks like the GPIOLIB
now takes care of the irq_dispose_mapping and remove irq_domain_remove.


Phil Reid (1):
  gpio: mcp23s08: switch to use gpiolib irqchip helpers

 drivers/gpio/Kconfig         |  1 +
 drivers/gpio/gpio-mcp23s08.c | 85 ++++++++++++++++----------------------------
 2 files changed, 31 insertions(+), 55 deletions(-)

-- 
1.8.3.1

