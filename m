From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] gpiolib: debugfs: display gpios requested as irq only
Date: Mon, 18 May 2015 13:02:14 +0200
Message-ID: <20150518110214.GC28127@localhost>
References: <1431696321-7257-1-git-send-email-grygorii.strashko@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-la0-f54.google.com ([209.85.215.54]:32974 "EHLO
	mail-la0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751203AbbERLCR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 18 May 2015 07:02:17 -0400
Content-Disposition: inline
In-Reply-To: <1431696321-7257-1-git-send-email-grygorii.strashko@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: grygorii.strashko@linaro.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, May 15, 2015 at 04:25:21PM +0300, grygorii.strashko@linaro.org wrote:
> From: Grygorii Strashko <grygorii.strashko@linaro.org>
> 
> Now GPIOs, wich are requested as IRQ only, will not be displayed
> through GPIO debugfs. For example:
>  # cat /proc/interrupts
>             CPU0       CPU1
> ...
> 209:          0          0  4805d000.gpio  11 Edge      0-0021
> 
>  # cat /debug/gpio
> ...
> GPIOs 160-191, platform/4805d000.gpio, gpio:
> <--- no info about gpio used as IRQ only here
> 
> GPIOs 192-223, platform/48051000.gpio, gpio:
>  gpio-203 (vtt_fixed           ) out hi
> ...
> 
> Hence, improve GPIO debugfs code to show such kind of gpio and print
> IRQ number also. In addition, add marker "requested" for GPIOs wich
> were requested by using gpioX_request().
>
> After this patch sys/kernel/debug/gpio will produce following output:
> 
>  # cat /debug/gpio
> ...
> GPIOs 160-191, platform/4805d000.gpio, gpio:
>  gpio-171 ((null)              ) in  hi IRQ209
> 
> GPIOs 192-223, platform/48051000.gpio, gpio:
>  gpio-203 (vtt_fixed           ) out hi requested

This is backwards. All gpios *should* be requested. *If* we are to
include not-requested gpios in the debug output, then it is those pins
that need to be marked as not-requested.

The irq-number mapping could perhaps be useful, but it should go in a
separate patch. I'd suggest adding a '-' before the irq-number (e.g.
"IRQ-209").

Thanks,
Johan
