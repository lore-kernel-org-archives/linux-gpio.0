From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: Re: [PATCH] GPIO: Add GPIO support for the ACCES 104-IDIO-16
Date: Mon, 5 Oct 2015 19:40:50 -0400
Message-ID: <56130A82.4000105@gmail.com>
References: <20151001015832.GA11317@sophia>
 <CACRpkdaimDeCZZXfma4sLRRRC=0YQCy7_7=V-qzubMRAY8HF6w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yk0-f174.google.com ([209.85.160.174]:34283 "EHLO
	mail-yk0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751214AbbJEXkw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Oct 2015 19:40:52 -0400
In-Reply-To: <CACRpkdaimDeCZZXfma4sLRRRC=0YQCy7_7=V-qzubMRAY8HF6w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On 10/05/2015 04:29 AM, Linus Walleij wrote:
>> +struct a_104_idio_16_gpio {
>> +       struct gpio_chip chip;
>> +       spinlock_t lock;
>> +       unsigned base;
> 
> Isn't this void __iomem *base?

The 'base' member is used to hold the I/O port base address passed to the
inb/outb functions for port-mapped I/O operations. Since the addresses are
not dereferenced, I don't believe an __iomem pointer would be correct.

>> +static const unsigned A_104_IDIO_16_EXTENT = 8;
> 
> Looks like it could be a #define A_104_IDIO_16_EXTENT 8

I used a const variable for the benefit of type-safety; I assumed the
compiler would optimize it. What is the advantage of a #define constant?

>> +static void __exit a_104_idio_16_exit(void)
>> +{
>> +       pr_info("104-idio-16: Exiting 104-idio-16 module\n");
>> +
>> +       gpiochip_remove(&gp.chip);
> 
> Where is that &gp.chip? Not in this file. Nor should you use any globals.
> 

I agree that using a global data structure isn't good practice, but I'm not
sure how else to expose the gpio_chip structure in the respective module
_init and _exit functions since they have void parameter lists. Would it be
more appropriate to use the platform device API in this situation to avoid
the global data structure?

>> +static int a_104_idio_16_gpio_get(struct gpio_chip *chip, unsigned offset)
>> +{
>> +       struct a_104_idio_16_gpio *a104i16gp = to_a104i16gp(chip);
>> +       const unsigned BIT_MASK = 1U << (offset-16);
>> +
>> +       if (offset < 16)
>> +               return 0;
> 
> Always return 0, why? Is that really correct?

GPIO 0-15 are output-only. The kerneldoc for 'struct gpio_chip' states that
for output signals the get function should return the value actually sensed,
or zero. Since I cannot sense the output signals, I return zero in these cases.
Is this behavior correct?

- William

