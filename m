From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] GPIO: Add GPIO support for the ACCES 104-IDIO-16
Date: Tue, 6 Oct 2015 09:19:30 +0200
Message-ID: <CACRpkdaa3XT2gP0NXhz3Mw4SqOSaMmswLk_z8bk9j9Jrqy62kA@mail.gmail.com>
References: <20151001015832.GA11317@sophia>
	<CACRpkdaimDeCZZXfma4sLRRRC=0YQCy7_7=V-qzubMRAY8HF6w@mail.gmail.com>
	<56130A82.4000105@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f179.google.com ([209.85.214.179]:35645 "EHLO
	mail-ob0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751704AbbJFHTa (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Oct 2015 03:19:30 -0400
Received: by obbzf10 with SMTP id zf10so147420416obb.2
        for <linux-gpio@vger.kernel.org>; Tue, 06 Oct 2015 00:19:30 -0700 (PDT)
In-Reply-To: <56130A82.4000105@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: William Breathitt Gray <vilhelm.gray@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Oct 6, 2015 at 1:40 AM, William Breathitt Gray
<vilhelm.gray@gmail.com> wrote:
> On 10/05/2015 04:29 AM, Linus Walleij wrote:
>>> +struct a_104_idio_16_gpio {
>>> +       struct gpio_chip chip;
>>> +       spinlock_t lock;
>>> +       unsigned base;
>>
>> Isn't this void __iomem *base?
>
> The 'base' member is used to hold the I/O port base address passed to the
> inb/outb functions for port-mapped I/O operations. Since the addresses are
> not dereferenced, I don't believe an __iomem pointer would be correct.

You're right, sorry I was confused.

>>> +static const unsigned A_104_IDIO_16_EXTENT = 8;
>>
>> Looks like it could be a #define A_104_IDIO_16_EXTENT 8
>
> I used a const variable for the benefit of type-safety; I assumed the
> compiler would optimize it. What is the advantage of a #define constant?

Usually we use #define's for compile-time constants.

>>> +static void __exit a_104_idio_16_exit(void)
>>> +{
>>> +       pr_info("104-idio-16: Exiting 104-idio-16 module\n");
>>> +
>>> +       gpiochip_remove(&gp.chip);
>>
>> Where is that &gp.chip? Not in this file. Nor should you use any globals.
>
> I agree that using a global data structure isn't good practice, but I'm not
> sure how else to expose the gpio_chip structure in the respective module
> _init and _exit functions since they have void parameter lists. Would it be
> more appropriate to use the platform device API in this situation to avoid
> the global data structure?

It depends where your device is spawn. If there is a natural place to
instantiate the platform device like from a MFD or PCI driver or something
then yes.

>>> +static int a_104_idio_16_gpio_get(struct gpio_chip *chip, unsigned offset)
>>> +{
>>> +       struct a_104_idio_16_gpio *a104i16gp = to_a104i16gp(chip);
>>> +       const unsigned BIT_MASK = 1U << (offset-16);
>>> +
>>> +       if (offset < 16)
>>> +               return 0;
>>
>> Always return 0, why? Is that really correct?
>
> GPIO 0-15 are output-only. The kerneldoc for 'struct gpio_chip' states that
> for output signals the get function should return the value actually sensed,
> or zero. Since I cannot sense the output signals, I return zero in these cases.
> Is this behavior correct?

I guess, we recently augmented the gpiolib core so you can actually
return an error code as -ENODEV here. No strong preference though.
Maybe I should have...

Yours,
Linus Walleij
