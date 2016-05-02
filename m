From: Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH] pinctrl: sh-pfc: Let gpio_chip.to_irq() return -ENXIO on error
Date: Mon, 2 May 2016 11:04:44 +0200
Message-ID: <CAMuHMdWxaPOfh-eU9ASTQmrbt74pyoiOT7oSyizvxbZ8zN0g8g@mail.gmail.com>
References: <1461914677-24899-1-git-send-email-geert+renesas@glider.be>
	<CACRpkdayGoAsU2+dOg4Y9BcyOORVp4OmUUCbE_cW5gPzR=D7nw@mail.gmail.com>
	<CAMuHMdW+O-qtrfbfpORX_dWCATZ9goTqQQa_sD9h1Jq=7H9DMA@mail.gmail.com>
	<CACRpkdbtwSmGmCfBLBUi2w9NHkVTLhwg8Q5srMCxNLNjze6msg@mail.gmail.com>
	<CAMuHMdX6Qrx=zjyOgag1wdYVoG-u_kmFz=Kxzs8-mriYe-2y9g@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-renesas-soc-owner@vger.kernel.org>
In-Reply-To: <CAMuHMdX6Qrx=zjyOgag1wdYVoG-u_kmFz=Kxzs8-mriYe-2y9g@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-renesas-soc@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

On Mon, May 2, 2016 at 10:53 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Mon, May 2, 2016 at 10:30 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Mon, May 2, 2016 at 10:03 AM, Geert Uytterhoeven
>> <geert@linux-m68k.org> wrote:
>>> On Sun, May 1, 2016 at 10:48 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
>>>>>   - Drivers that call irq_find_mapping(), irq_create_mapping(), or
>>>>>     irq_create_fwspec_mapping() return zero!  This also applies to the
>>>>>     core helper gpiochip_to_irq().
>>>>
>>>> Zero means NO_IRQ.
>>>>
>>>> Reminder:
>>>> http://lwn.net/Articles/470820/
>>>>
>>>> What we should do is patch all drivers to return 0 on failure, and
>>>> patch any consumers like mctrl_gpio_init() to handle that correctly.
>>>
>>> That's the Long Term Plan. There are still too many non-zero NO_IRQ
>>> definitions in use...
>>>
>>> Is -ENXIO acceptable for the short term?
>>
>> I don't understand. You say you have a problem  with
>> mctrl_gpio_init() which looks like this:
>>
>>         ret = gpiod_to_irq(gpios->gpio[i]);
>>         if (ret <= 0) {
>>             dev_err(port->dev, (...)
>>
>> This function is already *correctly* handling zero as NO_IRQ
>> i.e. an error.
>>
>> Just make your driver return 0/NO_IRQ and it is fixed.
>>
>> Or are there other problems that you're not telling about?

[silly response deleted]

Scrap it.

The only annoying thing is that 0 cannot easily be propagated upstream as
an error code, so it has to be tested for explicitly.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
