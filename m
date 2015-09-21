From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: re: gpio: omap: switch to use platform_get_irq
Date: Mon, 21 Sep 2015 19:26:45 +0300
Message-ID: <20150921162645.GF5648@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:28157 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756939AbbIUQ0z (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Sep 2015 12:26:55 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: grygorii.strashko@ti.com
Cc: linux-gpio@vger.kernel.org

Hello Grygorii Strashko,

The patch 89d18e3af8b9: "gpio: omap: switch to use platform_get_irq"
from Aug 18, 2015, leads to the following static checker warning:

	drivers/gpio/gpio-omap.c:1191 omap_gpio_probe()
	warn: assigning (-6) to unsigned variable 'bank->irq'

drivers/gpio/gpio-omap.c
  1188          bank->irq = platform_get_irq(pdev, 0);
  1189          if (bank->irq <= 0) {

bank->irq is u16.

  1190                  if (!bank->irq)
  1191                          bank->irq = -ENXIO;

Does not work.

  1192                  if (bank->irq != -EPROBE_DEFER)

Does not work.

  1193                          dev_err(dev,
  1194                                  "can't get irq resource ret=%d\n", bank->irq);
  1195                  return bank->irq;
  1196          }


regards,
dan carpenter
