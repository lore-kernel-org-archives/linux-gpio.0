From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] GPIOD, OF: parse flags into gpiod
Date: Mon, 5 May 2014 22:10:39 +0900
Message-ID: <CAAVeFuJB21n04qKbwxyPCVi=s882sTfgvftG8GgaBLqH-cjFCQ@mail.gmail.com>
References: <1398775115-6842-1-git-send-email-rabel@cit-ec.uni-bielefeld.de>
 <CAAVeFuK-ZSr__nLq9ZU7ASD_CsXOUBYqtZv4F4MTd5+XSxTGdg@mail.gmail.com> <536767A1.5090701@cit-ec.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vc0-f178.google.com ([209.85.220.178]:61388 "EHLO
	mail-vc0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932215AbaEENLB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 5 May 2014 09:11:01 -0400
Received: by mail-vc0-f178.google.com with SMTP id hu19so8780930vcb.9
        for <linux-gpio@vger.kernel.org>; Mon, 05 May 2014 06:11:01 -0700 (PDT)
In-Reply-To: <536767A1.5090701@cit-ec.uni-bielefeld.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Robert ABEL <rabel@cit-ec.uni-bielefeld.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

On Mon, May 5, 2014 at 7:27 PM, Robert Abel
<rabel@cit-ec.uni-bielefeld.de> wrote:
> On 01.05.2014 08:24, Alexandre Courbot wrote:
>>
>> This considerably changes the behavior of of_get_named_gpiod_flags(), and
>> makes it apply DT flags to the GPIO descriptor no matter what.
>
> Which should be done anyway, IMHO. I think this is correct and expected
> behavior.

If you do that you will have to update the hundreds of direct and
indirect users of of_get_named_gpio(), or face their wrath because
their code will stop working all of a sudden. More detailed
explanation later in this mail.

> Users (drivers, gpiolib, ...) expect to call of_get_named_gpiod_flags and
> get a usable and _correct_ gpio_desc back. However, right now, users _have_
> to use of_get_named_gpiod_flags with the flags argument as there is no way
> to recover the lost flags when calling of_get_named_gpiod_flags(..., NULL).
> I think correctness should start at the function level.
> of_get_named_gpiod_flags should be correct in and of itself. Even if
> private. Other functions should not have to be aware of the need to actively
> parse the flags to correct the gpio_desc->flags.

As explainer earlier, of_get_named_gpiod_flags() should never have
been public in the first place. This is being addressed by
https://lkml.org/lkml/2014/5/3/155 .

Now that it is private, if you take a look at how it is used, you will
see that its current design actually makes sense.

The first user of this function is of_get_named_gpio_flags() and its
siblings, which all implement the legacy (but still dominant in
user-code) integer-based GPIO interface. For this interface, handling
of GPIO properties is up to the consumer and done through the flags
parameter. I fully agree that this is not optimal ; however that's how
the code is used and changing this cannot be done without a lot of
refactoring and/or angry users.

gpiod has been introduced as a saner, easier-to-use interface for
GPIOs. For this interface, we *do* want GPIO properties to be handled
transparently. That's why the only way of requesting a GPIO is through
gpiod_get(), which takes care of this.

>> In effect, it makes the flags argument completely unneeded.
>
> Except for drivers who use the old integer interface and call desc_to_gpio
> themselves. Which is why I kept it.

Exactly. But if you also set the flag in their back in
of_get_named_gpiod_flags(), they are not going to be happy about it...

>> of_get_named_gpiod_flags() ought to be gpiolib-private actually (I still
>> need to send a patch fixing that)
>
> Well, a few lines above you complained how my patch considerably changed
> this function. Yet you want to take away the ability to have a DT node with
> gpio references in fields not named "gpios" or "%s-gpio(s|)"...
> Surely this is a much bigger breakage -- not just of the API?

No API is broken by this. GPIOs in the DT are to be defined using the
-gpios suffix (Documentation/gpio/board.txt ). Just like regulators
are defined with the -supply suffix. This is enforced by the gpiod API
and therefore direct access to of_get_named_gpiod_flags() is unneeded,
and actually dangerous.

There might be some DT users that did not follow that rule and got
away with it because the old GPIO API is more permissive. These will
not be able to update to gpiod easily (examples welcome if this is
what motivated your patch), but this patch is not the correct way of
addressing this issue.

>> since its only user is of_find_gpio(), which correctly applies the flags.
>
> of_find_gpio does _not_ apply the flags correctly. I'm looking at
> dd34c37aa3e81715a1ed8da61fa438072428e188 here (head of for-next branch):

That's correct - because the flags are actually applied one level
higher by the only caller of of_find_gpio(), namely gpiod_get(). The
reason why this is done there and not earlier is because there are
other GPIO providers (ACPI, platform data) and we want the flags code
to be handled in a single place.

>
>> static struct gpio_desc *of_find_gpio(struct device *dev, const char
>> *con_id,
>>                       unsigned int idx,
>>                       enum gpio_lookup_flags *flags)
>> {
>>     ...
>>     enum of_gpio_flags of_flags;
>>     struct gpio_desc *desc;
>>
>>     ...
>>
>>         desc = of_get_named_gpiod_flags(dev->of_node, prop_name, idx,
>>                         &of_flags);
>>     ...
>>
>>     if (of_flags & OF_GPIO_ACTIVE_LOW)
>>         *flags |= GPIO_ACTIVE_LOW;
>>
>>     return desc;
>> }
>
>
> It just translates the parsed of_gpio_flags to gpio_lookup_flags for the
> passed flags argument --which btw must not be NULL, which it can be for many
> other exported functions.
> So the descriptor is strill _wrong_, i.e. desc->flags not set, and any
> subsequent call to set the gpio will behave incorrectly when flags were
> applied in the DT. Which is why I fixed it in of_get_named_gpiod_flags to
> begin with.
> gpio_desc should be a welcomed change to get away from drivers having to
> manage their I/O polarity themselves. But right now it's royally broken.

Considering that gpiod_get() is now the entry point to all the
functions named above in the gpiod API, and that it *does* handle the
flags correctly, it doesn't seem broken to me.

>
>> We have users of of_get_named_gpio_flags() that could at first sight
>> benefit from your change. However, your change will return them a GPIO which
>> will behave differently from what they expect since the active_low property
>> will be set on its GPIO descriptor.
>
> They shouldn't expect anything. gpio_desc is an opaque type for exactly that
> reason. Drivers should neither know nor care about the gpio_desc flags. It's
> an API inconsistency to actually let them see the flags in the first place
> -- but that's for historical reasons, apparently.

For the integer-based GPIO interface, there is nothing we can do about it.

For the gpiod interface, you are right in that the flags should be
completely hidden to user-code. That's why GPIOs can now only be
acquired through gpiod_get() which takes care of this.

>
>> Callers of of_get_named_gpio_flags(), working on integer GPIOs, typically
>> manage that property themselves. This will result in the active_low property
>> being applied twice, effectively canceling its effect.
>
> The integer GPIO use-case is to convert gpio_desc to integers and call the
> appropriate integer functions gpio_* depending on the flags. All integer
> functions gpio_* call their gpiod_*_raw_* counterpart. The flags are _not_
> applied twice. They're applied once if the driver is aware of them or not at
> all if the driver ignores them.

Consider the following code in pwm_bl.c:

    data->enable_gpio = of_get_named_gpio_flags(node, "enable-gpios", 0,
                            &flags);

    if (gpio_is_valid(data->enable_gpio) && (flags & OF_GPIO_ACTIVE_LOW))
        data->enable_gpio_flags |= PWM_BACKLIGHT_GPIO_ACTIVE_LOW;

    ....

        if (pb->enable_gpio_flags & PWM_BACKLIGHT_GPIO_ACTIVE_LOW)
            gpio_set_value(pb->enable_gpio, 0);
        else
            gpio_set_value(pb->enable_gpio, 1);

User code of the legacy GPIO API handles the active_low property by
itself because of_get_named_gpio_flags() did not apply that property
on the descriptor. If you change this, the signal on an active-low
GPIO will become the inverse of what it used to be. That's the reason
why this patch cannot be accepted.

> Any driver that mixes gpio_* and gpiod_* API at a whim might not remain
> stable, granted.
> The flags might be applied twice if the driver parses them, is aware of
> them, but calls gpiod_* functions depending on the parsed flags. However,
> this is incorrect driver behavior and drivers that rely on this API duality
> should be fixed.
> Though, to be fair, this distinction might be less than ideally
> documented...
>
>
>> Also, for future contributions could you use "gpiod:of: " in your patch
>> subject to keep the style consistent with existing practices in
>> drivers/gpio?
>
> I didn't see any such usage, but OK.

git log -- drivers/gpio

Should be "gpio: of:" actually.

This is a common convention everywhere in the kernel.

Cheers,
Alex.

>>>
>>> ---
>>>
>>> +#if defined(CONFIG_OF)
>>> +void gpiod_translate_flags(struct gpio_desc *desc, enum of_gpio_flags
>>> *flags)
>>
>> This function translates device tree flags - not just any tag. Its
>> name should reflect that.
>
> I had gpiod_translate_of_flags at first, but that sounded awkward, as
> anything using the of abbreviation. <-- See what I did there?
>
>>> +{
>>> +
>>> +       desc->flags = 0;
>>> +
>>> +       if (*flags & OF_GPIO_ACTIVE_LOW)
>>> +               set_bit(FLAG_ACTIVE_LOW, &desc->flags);
>>> +
>>> +}
>>
>> You could also use this function to set the flags in of_find_gpio(),
>> since the code is the same.
>
> That would be ideal if it turns out this will be necessary in the future.
>
>>> +EXPORT_SYMBOL_GPL(gpiod_translate_flags);
>>
>> I don't think this function should have been exported. It is only to
>> be used in gpiolib-of.o, which will always be linked to gpiolib.o
>> anyway.
>
> I had trouble compiling without the export. I'll try again.
>
>>> +#if defined(CONFIG_OF)
>>> +enum of_gpio_flags;
>>> +void gpiod_translate_flags(struct gpio_desc *desc, enum of_gpio_flags
>>> *flags);
>>> +#endif /* CONFIG_OF */
>>
>> Again, this should not be part of the public API. These declarations
>> should have be moved into the gpiolib.h header.
>
> OK.
>
