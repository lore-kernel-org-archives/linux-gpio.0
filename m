From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: re: gpio: add TS-4800 fpga GPIO support
Date: Tue, 9 Feb 2016 22:26:46 +0300
Message-ID: <20160209192646.GA17803@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:21812 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932162AbcBIT05 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Feb 2016 14:26:57 -0500
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: julien.grossholtz@savoirfairelinux.com
Cc: linux-gpio@vger.kernel.org

Hello Julien Grossholtz,

The patch 5041e791440a: "gpio: add TS-4800 fpga GPIO support" from
Jan 13, 2016, leads to the following static checker warning:

	drivers/gpio/gpio-ts4800.c:52 ts4800_gpio_probe()
	warn: odd binop '0x1 & 0x8'

drivers/gpio/gpio-ts4800.c
    43          retval = of_property_read_u32(node, "ngpios", &ngpios);
    44          if (retval == -EINVAL)
    45                  ngpios = DEFAULT_PIN_NUMBER;
    46          else if (retval)
    47                  return retval;
    48  
    49          retval = bgpio_init(chip, &pdev->dev, 2, base_addr + INPUT_REG_OFFSET,
    50                              base_addr + OUTPUT_REG_OFFSET, NULL,
    51                              base_addr + DIRECTION_REG_OFFSET, NULL,
    52                              BGPIOF_BIG_ENDIAN & BGPIOF_BIG_ENDIAN_BYTE_ORDER);

Probably | was intended instead of &.

    53          if (retval) {
    54                  dev_err(&pdev->dev, "bgpio_init failed\n");
    55                  return retval;
    56          }
    57  

regards,
dan carpenter
