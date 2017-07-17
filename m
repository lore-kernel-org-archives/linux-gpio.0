From: Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [bug report] gpio: Add ROHM BD9571MWV-M PMIC GPIO driver
Date: Mon, 17 Jul 2017 21:35:29 +0200
Message-ID: <4a8aabc9-7b00-d3bc-872d-82a96c127473@gmail.com>
References: <20170717192049.6n54skiklvrawfy3@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65]:35984 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751316AbdGQTfc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Jul 2017 15:35:32 -0400
Received: by mail-wm0-f65.google.com with SMTP id 15so778171wmm.3
        for <linux-gpio@vger.kernel.org>; Mon, 17 Jul 2017 12:35:31 -0700 (PDT)
In-Reply-To: <20170717192049.6n54skiklvrawfy3@mwanda>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-gpio@vger.kernel.org, Lee Jones <lee.jones@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>

On 07/17/2017 09:20 PM, Dan Carpenter wrote:
> Hello Marek Vasut,

Hello Dan,

> The patch 9384793036af: "gpio: Add ROHM BD9571MWV-M PMIC GPIO driver"
> from Apr 25, 2017, is missing an include:

Unfortunately, the core code missed another MW, for details see:

https://patchwork.kernel.org/patch/9707899/

> drivers/gpio/gpio-bd9571mwv.c
>     15   * Based on the TPS65086 driver
>     16   *
>     17   * NOTE: Interrupts are not supported yet.
>     18   */
>     19  
>     20  #include <linux/gpio/driver.h>
>     21  #include <linux/module.h>
>     22  #include <linux/platform_device.h>
>     23  
>     24  #include <linux/mfd/bd9571mwv.h>
>                   ^^^^^^^^^^^^^^^^^^^^^
> Where is this file?
> 
>     25  
>     26  struct bd9571mwv_gpio {
>     27          struct gpio_chip chip;
>     28          struct bd9571mwv *bd;
>     29  };
>     30  
> 
> regards,
> dan carpenter
> 


-- 
Best regards,
Marek Vasut
