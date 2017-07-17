From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [bug report] gpio: Add ROHM BD9571MWV-M PMIC GPIO driver
Date: Mon, 17 Jul 2017 22:20:50 +0300
Message-ID: <20170717192049.6n54skiklvrawfy3@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:48720 "EHLO
        aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751314AbdGQTVB (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jul 2017 15:21:01 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: marek.vasut@gmail.com
Cc: linux-gpio@vger.kernel.org

Hello Marek Vasut,

The patch 9384793036af: "gpio: Add ROHM BD9571MWV-M PMIC GPIO driver"
from Apr 25, 2017, is missing an include:

drivers/gpio/gpio-bd9571mwv.c
    15   * Based on the TPS65086 driver
    16   *
    17   * NOTE: Interrupts are not supported yet.
    18   */
    19  
    20  #include <linux/gpio/driver.h>
    21  #include <linux/module.h>
    22  #include <linux/platform_device.h>
    23  
    24  #include <linux/mfd/bd9571mwv.h>
                  ^^^^^^^^^^^^^^^^^^^^^
Where is this file?

    25  
    26  struct bd9571mwv_gpio {
    27          struct gpio_chip chip;
    28          struct bd9571mwv *bd;
    29  };
    30  

regards,
dan carpenter
