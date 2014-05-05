From: Javier Martinez Canillas <javier@dowhile0.org>
Subject: Re: [PATCH 0/4] use BIT() macro instead manually shifting bits
Date: Mon, 5 May 2014 13:02:11 +0200
Message-ID: <CABxcv=m1=RMQqXo5k3Huu4meU3tCiCGg7VUBS6ta_xhrESzUAA@mail.gmail.com>
References: <1398556850-27751-1-git-send-email-javier@dowhile0.org>
	<CACRpkdYdE3YfVguC+GV6JaTSNd9mnik7D4N+TspDGsD5XpZOMA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f48.google.com ([74.125.82.48]:58506 "EHLO
	mail-wg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752570AbaEELCM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 5 May 2014 07:02:12 -0400
Received: by mail-wg0-f48.google.com with SMTP id b13so1971426wgh.31
        for <linux-gpio@vger.kernel.org>; Mon, 05 May 2014 04:02:11 -0700 (PDT)
In-Reply-To: <CACRpkdYdE3YfVguC+GV6JaTSNd9mnik7D4N+TspDGsD5XpZOMA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Santosh Shilimkar <santosh.shilimkar@ti.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, inux-omap@vger.kernel.org

Hello Linus,

On Sat, May 3, 2014 at 9:15 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Sat, Apr 26, 2014 at 5:00 PM, Javier Martinez Canillas
> <javier@dowhile0.org> wrote:
>
>> Hello Linus and Alexandre,
>>
>> While learning coccinelle towards doing the big gpio_chip/gpio_chip_ops
>> split refactoring I wrote this trivial semantic patch that replaces a
>> manual bit shift by using the BIT macro from <linux/bitops.h>
>
> Nice semantic patch!
>

Thanks

> And all patches applied with Alex's ACK.
>
> However I will edit the commit messages to remove the word
> "manual". This just breaks my heart everytime I see that word
> used in code, manual means a person is typing the keys or something
> I bet it's still a computer doing the heavy lifting here.
>

Yes, I agree that the wording was not the best. Thanks a lot for
fixing the commit messages.

> Yours,
> Linus Walleij

Best regards,
Javier
