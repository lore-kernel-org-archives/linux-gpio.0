From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2 1/3] gpiolib: debugfs: display gpios requested as irq only
Date: Mon, 1 Jun 2015 14:50:30 +0200
Message-ID: <CACRpkdYYmByiaJ15nj5-PRj+CJhQqV1ovUN+xG6gteguJR8hdg@mail.gmail.com>
References: <1432117823-1834-1-git-send-email-grygorii.strashko@linaro.org>
	<1432117823-1834-2-git-send-email-grygorii.strashko@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f170.google.com ([209.85.214.170]:35069 "EHLO
	mail-ob0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751983AbbFAMua (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 1 Jun 2015 08:50:30 -0400
Received: by obcnx10 with SMTP id nx10so96796238obc.2
        for <linux-gpio@vger.kernel.org>; Mon, 01 Jun 2015 05:50:30 -0700 (PDT)
In-Reply-To: <1432117823-1834-2-git-send-email-grygorii.strashko@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Johan Hovold <johan@kernel.org>

On Wed, May 20, 2015 at 12:30 PM, Grygorii Strashko
<grygorii.strashko@linaro.org> wrote:

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
> Hence, improve GPIO debugfs code to show such kind of GPIOs
>
> After this patch sys/kernel/debug/gpio will produce following output:
>
>  # cat /debug/gpio
> ...
> GPIOs 160-191, platform/4805d000.gpio, gpio:
>  gpio-171 ((null)              ) in  hi IRQ
>
> GPIOs 192-223, platform/48051000.gpio, gpio:
>  gpio-203 (vtt_fixed           ) out hi
>
> Cc: Johan Hovold <johan@kernel.org>
> Signed-off-by: Grygorii Strashko <grygorii.strashko@linaro.org>

OK why not.

Patch applied.

Yours,
Linus Walleij
