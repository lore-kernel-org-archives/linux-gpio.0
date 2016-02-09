From: Julien Grossholtz <julien.grossholtz@savoirfairelinux.com>
Subject: Re: gpio: add TS-4800 fpga GPIO support
Date: Tue, 9 Feb 2016 18:20:16 -0500 (EST)
Message-ID: <1337284402.592467.1455060016500.JavaMail.zimbra@savoirfairelinux.com>
References: <20160209192646.GA17803@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.savoirfairelinux.com ([208.88.110.44]:50786 "EHLO
	mail.savoirfairelinux.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752411AbcBIXUU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Feb 2016 18:20:20 -0500
In-Reply-To: <20160209192646.GA17803@mwanda>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-gpio@vger.kernel.org

Hello Dan,

Thank you for pointing that out. It made me figure out there
is no need for any of those flags for this driver.

I will send a fix for this soon.

Julien Grossholtz

----- Original Message -----
From: "Dan Carpenter" <dan.carpenter@oracle.com>
To: "julien grossholtz" <julien.grossholtz@savoirfairelinux.com>
Cc: linux-gpio@vger.kernel.org
Sent: Tuesday, February 9, 2016 2:26:46 PM
Subject: re: gpio: add TS-4800 fpga GPIO support

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
