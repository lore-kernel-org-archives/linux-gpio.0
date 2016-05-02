From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: Let gpio_chip.to_irq() return -ENXIO on error
Date: Mon, 2 May 2016 11:25:30 +0200
Message-ID: <CACRpkdZGOe+RaO-cZ+zYSBgzen4hi=C86kLF+MLKvH3ZdNZeqg@mail.gmail.com>
References: <1461914677-24899-1-git-send-email-geert+renesas@glider.be>
	<CACRpkdayGoAsU2+dOg4Y9BcyOORVp4OmUUCbE_cW5gPzR=D7nw@mail.gmail.com>
	<CAMuHMdW+O-qtrfbfpORX_dWCATZ9goTqQQa_sD9h1Jq=7H9DMA@mail.gmail.com>
	<CACRpkdbtwSmGmCfBLBUi2w9NHkVTLhwg8Q5srMCxNLNjze6msg@mail.gmail.com>
	<CAMuHMdX6Qrx=zjyOgag1wdYVoG-u_kmFz=Kxzs8-mriYe-2y9g@mail.gmail.com>
	<CAMuHMdWxaPOfh-eU9ASTQmrbt74pyoiOT7oSyizvxbZ8zN0g8g@mail.gmail.com>
	<CACRpkdZLSRQfUfc4d=uO0CtH3svN+a17HLbEQYtdy8kMAS_sUA@mail.gmail.com>
	<CAMuHMdWiBq+rexBr_OYOStLHAQwfE2CbodxSF0RgtQZL7+Pe7g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:33721 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752940AbcEBJZb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 2 May 2016 05:25:31 -0400
Received: by mail-oi0-f51.google.com with SMTP id v145so149295349oie.0
        for <linux-gpio@vger.kernel.org>; Mon, 02 May 2016 02:25:31 -0700 (PDT)
In-Reply-To: <CAMuHMdWiBq+rexBr_OYOStLHAQwfE2CbodxSF0RgtQZL7+Pe7g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-renesas-soc@vger.kernel.org

On Mon, May 2, 2016 at 11:10 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Mon, May 2, 2016 at 11:06 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Mon, May 2, 2016 at 11:04 AM, Geert Uytterhoeven
>> <geert@linux-m68k.org> wrote:
>>
>>> [silly response deleted]
>>>
>>> Scrap it.
>>
>> :D
>>
>>> The only annoying thing is that 0 cannot easily be propagated upstream as
>>> an error code, so it has to be tested for explicitly.
>>
>> Well with the Big Penguin's clear opinion on the matter there is not
>> much we can do.
>>
>> What about this?
>>
>> diff --git a/drivers/tty/serial/serial_mctrl_gpio.c
>> b/drivers/tty/serial/serial_mctrl_gpio.c
>> index 02147361eaa9..2297ec781681 100644
>> --- a/drivers/tty/serial/serial_mctrl_gpio.c
>> +++ b/drivers/tty/serial/serial_mctrl_gpio.c
>> @@ -172,6 +172,13 @@ struct mctrl_gpios *mctrl_gpio_init(struct
>> uart_port *port, unsigned int idx)
>>                         dev_err(port->dev,
>>                                 "failed to find corresponding irq for
>> %s (idx=%d, err=%d)\n",
>>                                 mctrl_gpios_desc[i].name, idx, ret);
>> +                       /*
>> +                        * Satisfy the error code semantics for a missing IRQ,
>> +                        * 0 means NO_IRQ, but the framework needs to return
>> +                        * a negative to deal with the error.
>> +                        */
>> +                       if (!ret)
>> +                               ret = -ENOSYS;
>
> No, not -ENOSYS, as that triggers my initial problem again (please read the
> deleted silly response ;-)
> Checkpatch says: "ENOSYS means 'invalid syscall nr' and nothing else".
>
> -EINVAL?

Sure, whatever works with your semantics.

Will you test & send a patch?

Yours,
Linus Walleij
