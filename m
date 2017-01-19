From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3 3/8] gpio: gpio-rz: GPIO driver for Renesas RZ series
Date: Thu, 19 Jan 2017 10:38:49 +0100
Message-ID: <CACRpkdZ2bQH0EfSUzxV4uojfbKbnoU7A8n6P+AsufNGh=0bwug@mail.gmail.com>
References: <1484568772-18137-1-git-send-email-jacopo+renesas@jmondi.org>
 <1484568772-18137-4-git-send-email-jacopo+renesas@jmondi.org>
 <CACRpkdaghtD3DUEECVAy=MLHx=KX-Ty=AJva2=MPyFQMTGMOLg@mail.gmail.com>
 <CAMuHMdWeSa5noMMnxg_87rNUmtJ0W3x=vZmF0qPNZBEDUq3L7g@mail.gmail.com>
 <CACRpkdYLrojYdgcKe=Eh2vQ5O+WJBuiUt2_kXyY0qJ35fR1jEQ@mail.gmail.com> <CAMuHMdXvzG5gDhY3zhtd1db1jnj1Kd=wxvAU8ZwYYUKwPcXqqw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f175.google.com ([209.85.216.175]:35206 "EHLO
        mail-qt0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751095AbdASJkW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 19 Jan 2017 04:40:22 -0500
Received: by mail-qt0-f175.google.com with SMTP id x49so58295863qtc.2
        for <linux-gpio@vger.kernel.org>; Thu, 19 Jan 2017 01:38:50 -0800 (PST)
In-Reply-To: <CAMuHMdXvzG5gDhY3zhtd1db1jnj1Kd=wxvAU8ZwYYUKwPcXqqw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>, Magnus Damm <magnus.damm@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Chris Brandt <chris.brandt@renesas.com>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Thu, Jan 19, 2017 at 10:36 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Thu, Jan 19, 2017 at 10:27 AM, Linus Walleij
> <linus.walleij@linaro.org> wrote:
>> On Wed, Jan 18, 2017 at 3:06 PM, Geert Uytterhoeven
>> <geert@linux-m68k.org> wrote:
>>> On Wed, Jan 18, 2017 at 2:58 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
>>>>> +       gpio_chip->request = rz_gpio_request;
>>>>> +       gpio_chip->free = rz_gpio_free;
>>>>> +       gpio_chip->label = dev_name(&pdev->dev);
>>>>> +       gpio_chip->parent = &pdev->dev;
>>>>> +       gpio_chip->owner = THIS_MODULE;
>>>>> +       gpio_chip->base = -1;
>>>>> +       gpio_chip->ngpio = ret == 0 ? args.args[2] : RZ_GPIOS_PER_PORT;
>>>>
>>>> bgpio_init() will have already set this up to 16 (RZ_GPIOS_PER_PORT)
>>>> as we pass width 2 bytes.
>>>
>>> Note that some banks have less than 16 GPIOs, cfr. the last value of the
>>> gpio-ranges tuple being less than 16.
>>
>> Aha OK then it is fine to override this default value calculate from
>> the register size.
>>
>> But for that case we should use the standard DT property
>> ngpios described in
>> Documentation/devicetree/bindings/gpio/gpio.txt
>> It is for exactly this purpose.
>
> IC.
>
> Note that gpio-rcar uses the same method, switching to "ngpios" would
> break backwards compatibility.

Can we support both?

Yours,
Linus Walleij
