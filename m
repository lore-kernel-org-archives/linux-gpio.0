From: "Grygorii.Strashko@linaro.org" <grygorii.strashko@linaro.org>
Subject: Re: gpio: omap: fix error handling in omap_gpio_irq_type
Date: Tue, 09 Jun 2015 17:01:18 +0300
Message-ID: <5576F1AE.10306@linaro.org>
References: <20150609090237.GA3605@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f44.google.com ([209.85.215.44]:35639 "EHLO
	mail-la0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751075AbbFIOBX (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Jun 2015 10:01:23 -0400
Received: by labko7 with SMTP id ko7so13062091lab.2
        for <linux-gpio@vger.kernel.org>; Tue, 09 Jun 2015 07:01:21 -0700 (PDT)
In-Reply-To: <20150609090237.GA3605@mwanda>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, linux-gpio@vger.kernel.org, Grygorii Strashko <grygorii.Strashko@ti.com>, Javier Martinez Canillas <javier@dowhile0.org>

On 06/09/2015 12:02 PM, Dan Carpenter wrote:
>
> The patch 1562e4618ded: "gpio: omap: fix error handling in
> omap_gpio_irq_type" from May 22, 2015, leads to the following static
> checker warning:
>
> 	drivers/gpio/gpio-omap.c:523 omap_gpio_irq_type()
> 	warn: inconsistent returns 'spin_lock:&bank->lock'.

Fix for this issue has been posted already.
http://www.spinics.net/lists/linux-gpio/msg06440.html


-- 
regards,
-grygorii
