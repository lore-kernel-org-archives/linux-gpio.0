From: Robert Abel <rabel@cit-ec.uni-bielefeld.de>
Subject: Re: [PATCH] GPIOD, OF: parse flags into gpiod
Date: Mon, 05 May 2014 12:07:38 +0200
Message-ID: <536762EA.8020605@cit-ec.uni-bielefeld.de>
References: <1398775115-6842-1-git-send-email-rabel@cit-ec.uni-bielefeld.de> <CAAVeFuK-ZSr__nLq9ZU7ASD_CsXOUBYqtZv4F4MTd5+XSxTGdg@mail.gmail.com>
Reply-To: rabel@cit-ec.uni-bielefeld.de
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ee0-f41.google.com ([74.125.83.41]:61226 "EHLO
	mail-ee0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756078AbaEEKHl (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 5 May 2014 06:07:41 -0400
Received: by mail-ee0-f41.google.com with SMTP id t10so1588748eei.0
        for <linux-gpio@vger.kernel.org>; Mon, 05 May 2014 03:07:40 -0700 (PDT)
In-Reply-To: <CAAVeFuK-ZSr__nLq9ZU7ASD_CsXOUBYqtZv4F4MTd5+XSxTGdg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

On 01.05.2014 08:24, Alexandre Courbot wrote:
> This considerably changes the behavior of of_get_named_gpiod_flags(), 
> and makes it apply DT flags to the GPIO descriptor no matter what.
Which should be done anyway, IMHO.

> In effect, it makes the flags argument completely unneeded.
Except for drivers who use the old integer interface and call 
desc_to_gpio themselves. Which is why I kept it.
> of_get_named_gpiod_flags() ought to be gpiolib-private actually (I 
> still need to send a patch fixing that) since its only user is 
> of_find_gpio(), which correctly applies the flags.
of_find_gpio does _not_ apply the flags correctly. I'm looking at 
dd34c37aa3e81715a1ed8da61fa438072428e188 here (head of for-next branch):

> static struct gpio_desc *of_find_gpio(struct device *dev, const char 
> *con_id,
>                       unsigned int idx,
>                       enum gpio_lookup_flags *flags)
> {
>     ...
>     enum of_gpio_flags of_flags;
>     struct gpio_desc *desc;
>
>     ...
>
>         desc = of_get_named_gpiod_flags(dev->of_node, prop_name, idx,
>                         &of_flags);
>     ...
>
>     if (of_flags & OF_GPIO_ACTIVE_LOW)
>         *flags |= GPIO_ACTIVE_LOW;
>
>     return desc;
> }

It just translates the parsed of_gpio_flags to gpio_lookup_flags for the 
passed flags argument --which btw must not be NULL, which it can be for 
many other exported functions. So the descriptor is strill _wrong_, i.e. 
desc->flags not set, and any subsequent call to set the gpio will behave 
incorrectly when flags were applied in the DT.
Which is why I fixed it in of_get_named_gpiod_flags to begin with.
IMHO gpio_desc should be a welcomed change to get away from drivers 
having to manage their I/O polarity themselves. But right now it's 
royally broken.

> We have users of of_get_named_gpio_flags() that could at first sight 
> benefit from your change. However, your change will return them a GPIO 
> which will behave differently from what they expect since the 
> active_low property will be set on its GPIO descriptor.
They shouldn't expect anything. gpio_desc is an opaque type for exactly 
that reason. Drivers should neither know nor care about the gpio_desc 
flags. It's an API inconsistency to actually let them see the flags in 
the first place -- but that's for historical reasons, apparently.

> Callers of of_get_named_gpio_flags(), working on integer GPIOs, 
> typically manage that property themselves. This will result in the 
> active_low property being applied twice, effectively canceling its effect.
The integer GPIO use-case is to convert gpio_desc to integers and call 
the appropriate integer functions (gpio_*) depending on the flags. All 
integer functions gpio_* call their gpiod_*_raw_* counterpart. The flags 
are _not_ applied twice. They're applied once if the driver is aware of 
them or not at all if the driver ignores them.

Any driver that mixes gpio_* and gpiod_* calls should not be expected to 
be stable and work anyways, correct? The flags might be applied twice if 
the driver parses them, is aware of them, but calls gpiod_* functions 
depending on the parsed flags. However, this is incorrect driver 
behavior. Though, to be fair, this distinction is less than ideally 
documented...

> Also, for future contributions could you use "gpiod:of: " in your 
> patch subject to keep the style consistent with existing practices in 
> drivers/gpio?
I didn't see any such usage, but OK.
>> ---
>> +#if defined(CONFIG_OF)
>> +void gpiod_translate_flags(struct gpio_desc *desc, enum of_gpio_flags *flags)
> This function translates device tree flags - not just any tag. Its
> name should reflect that.
I had gpiod_translate_of_flags at first, but that sounded awkward, as 
anything using the of abbreviation.
>> +{
>> +
>> +       desc->flags = 0;
>> +
>> +       if (*flags & OF_GPIO_ACTIVE_LOW)
>> +               set_bit(FLAG_ACTIVE_LOW, &desc->flags);
>> +
>> +}
> You could also use this function to set the flags in of_find_gpio(),
> since the code is the same.
That would be ideal.
>> +EXPORT_SYMBOL_GPL(gpiod_translate_flags);
> I don't think this function should have been exported. It is only to
> be used in gpiolib-of.o, which will always be linked to gpiolib.o
> anyway.
I had trouble compiling without the export. I'll try again.

> Again, this should not be part of the public API. These declarations
> should have be moved into the gpiolib.h header.
OK.
>
>>   #else /* CONFIG_GPIOLIB */
>>
>> --
>> 1.9.2
>>
>> --
>> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html

