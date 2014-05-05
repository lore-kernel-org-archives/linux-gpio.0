From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] GPIOD, OF: parse flags into gpiod
Date: Tue, 6 May 2014 00:14:56 +0900
Message-ID: <CAAVeFuL22kTEy+QZgPE8ZTVGkD9N1dMx1m+7AxjkPPD=s+oriw@mail.gmail.com>
References: <1398775115-6842-1-git-send-email-rabel@cit-ec.uni-bielefeld.de>
 <CAAVeFuK-ZSr__nLq9ZU7ASD_CsXOUBYqtZv4F4MTd5+XSxTGdg@mail.gmail.com>
 <536767A1.5090701@cit-ec.uni-bielefeld.de> <CAAVeFuJB21n04qKbwxyPCVi=s882sTfgvftG8GgaBLqH-cjFCQ@mail.gmail.com>
 <53679B6D.2030603@cit-ec.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ve0-f181.google.com ([209.85.128.181]:60631 "EHLO
	mail-ve0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752014AbaEEPQw (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 5 May 2014 11:16:52 -0400
Received: by mail-ve0-f181.google.com with SMTP id pa12so7741866veb.26
        for <linux-gpio@vger.kernel.org>; Mon, 05 May 2014 08:16:51 -0700 (PDT)
In-Reply-To: <53679B6D.2030603@cit-ec.uni-bielefeld.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Robert ABEL <rabel@cit-ec.uni-bielefeld.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

On Mon, May 5, 2014 at 11:08 PM, Robert ABEL
<rabel@cit-ec.uni-bielefeld.de> wrote:
> On 05 May 2014 15:10, Alexandre Courbot wrote:
>>
>> Consider the following code in pwm_bl.c:
>>
>>      data->enable_gpio = of_get_named_gpio_flags(node, "enable-gpios", 0,
>>                              &flags);
>>
>>      if (gpio_is_valid(data->enable_gpio) && (flags & OF_GPIO_ACTIVE_LOW))
>>          data->enable_gpio_flags |= PWM_BACKLIGHT_GPIO_ACTIVE_LOW;
>>
>>      ....
>>
>>          if (pb->enable_gpio_flags & PWM_BACKLIGHT_GPIO_ACTIVE_LOW)
>>              gpio_set_value(pb->enable_gpio, 0);
>>          else
>>              gpio_set_value(pb->enable_gpio, 1);
>>
>> User code of the legacy GPIO API handles the active_low property by
>> itself because of_get_named_gpio_flags() did not apply that property
>> on the descriptor. If you change this, the signal on an active-low
>> GPIO will become the inverse of what it used to be. That's the reason
>> why this patch cannot be accepted.
>
> Let me expand your own example for you by expanding all functions:
>
>
>     data->enable_gpio = of_get_named_gpio_flags(node, "enable-gpios", 0,
>                             &flags); /* assume gpio_desc.flags is populated
> here */
>
>
>     if (gpio_is_valid(data->enable_gpio) && (flags & OF_GPIO_ACTIVE_LOW))
>         data->enable_gpio_flags |= PWM_BACKLIGHT_GPIO_ACTIVE_LOW;
>
>     ....
>
>         if (pb->enable_gpio_flags & PWM_BACKLIGHT_GPIO_ACTIVE_LOW)
>             gpio_set_value(pb->enable_gpio, 0);
>             => __gpio_set_value(pb->enable_gpio, 0);
>             => gpiod_set_raw_value(gpio_to_desc(pb->enable_gpio), 0)
>             => _gpiod_set_raw_value(gpio_to_desc(pb->enable_gpio), 0) /*
> gpio_desc.flags is ignored here */
>         else
>             gpio_set_value(pb->enable_gpio, 1);
>             => __gpio_set_value(pb->enable_gpio, 1);
>             => gpiod_set_raw_value(gpio_to_desc(pb->enable_gpio), 1)
>             => _gpiod_set_raw_value(gpio_to_desc(pb->enable_gpio), 1) /*
> gpio_desc.flags is ignored here */
>
> As you see, gpio_to_desc(pb->enable_gpio).flags are ignored along the way.
> Thus, this change will *not* break integer usage.

Ok, you are obviously correct here.

> And because gpio_desc are opaque, this will not affect drivers using gpiod,
> because they should not have cared about the flags in the first place,
> because
> they cannot see them anyway.
>
>
>
>> If you do that you will have to update the hundreds of direct and
>> indirect users of of_get_named_gpio(), or face their wrath because
>> their code will stop working all of a sudden. More detailed
>> explanation later in this mail.
>
> See above.
>
>> As explainer earlier, of_get_named_gpiod_flags() should never have
>> been public in the first place. This is being addressed by
>> https://lkml.org/lkml/2014/5/3/155 .
>>
>> Now that it is private, if you take a look at how it is used, you will
>> see that its current design actually makes sense.
>
> I dispute that, see below.
>>
>> There might be some DT users that did not follow that rule and got
>> away with it because the old GPIO API is more permissive. These will
>> not be able to update to gpiod easily [...].
>
> This is exactly what I meant with breakage.
>
>> That's correct - because the flags are actually applied one level
>> higher by the only caller of of_find_gpio(), namely gpiod_get(). The
>> reason why this is done there and not earlier is because there are
>> other GPIO providers (ACPI, platform data) and we want the flags code
>> to be handled in a single place.
>
> Let's consider my use case for a minute here. I use a table to get gpios
> from a dt node:
>
>     /* parse GPIOs */
>     for (; *pin_desc; pin_desc++, gpios++) {
>
>         index = of_property_match_string(np, "gpio-names",
> (*pin_desc)->name);
>         if (index >= 0)
>             *gpios = of_get_gpiod_flags(np, index, NULL);
>
>         [...]
>
>     }
>
> Now I had no way of knowing that I'm not supposed to use of_get_gpiod_flags.
> Because every other driver uses of_get_gpio(_flags), I used the similarly
> named *public* gpiolib functions, because I like the concept of opaque gpio
> descriptors.

I am not seeing this "gpio-names" property being used anywhere in
mainline to lookup GPIOs, nor do I see usages of of_get_gpiod_flags()
outside of gpiolib, so I had no way of knowing you decided to use it.

Besides I don't have a high-level view on your code, but (at first
sight) couldn't your call to of_get_gpiod_flags() simply be replaced
by gpiod_get()?

> Now, you might argue I'm not supposed to do it that way and whatnot all you
> want. Your of_get_gpiod_flags function is *broken*, because it does not give
> me the correct gpio_desc.

of_get_gpiod_flags() works the same way as of_get_gpio_flags() which
it mirrors and is correct in that respect. Returning a flags parameter
for the caller to apply while having applied these flags already is
what makes no sense to me. Taste and colours...

If you really need a function that will return GPIO descriptor from an
arbitrary DT property (or maybe a version of gpiod_get() working on a
DT node and not a device instance), that's another story and we can
discuss that if it is well motivated. But if we go that way, then
let's craft a proper function for this and not use that horror
inherited from the dark ages.

Also, clearly and calmly explaining your needs will serve you much
better than screaming around and arbitrarily calling things "broken".

> You can now go ahead and make *all* functions
> except for gpiod_get etc. private, because they're all apparently not
> supposed to be used, although they are public and not a word is spent
> explaining that they will not return a valid gpio_desc that has been parsed
> from DT.

Well, that was a mistake that went through the review process. We
wanted to make a perfect GPIO API but unfortunately you were not
around to advise us.

>
> Or you could go the route and actually make all these functions work
> correctly. They all ought to return a correct gpio_desc that has all its
> fields fully populated.

Good news, once of_get_gpiod_flags() becomes private all public gpiod_
functions should return a correct gpio_desc.

>
> How you can claim this is all good and well and how it quote "doesn't seem
> broken to [you]" is frankly beyond me!!

And here we go again...

>
> These functions should all just be correct on their own. And they would be,
> if the gpio_desc fields are correctly populated at the _lowest_ level of the
> API instead of at some arbitrary higher level that might change in the
> future. All these functions should return a correctly parsed and valid
> gpio_desc for the same input. Right now some function (like gpiod_get)
> return a correct gpio_desc, while of_get_gpiod_flags returns an incorrect
> gpio_desc.

Again, the issue was of_get_gpiod_flags() being public in the first place.

As for where to set the descriptor's properties, having it done in
gpiod_get() allows us to handle this in a single place, without having
to rely on lower-level functions to remember doing it themselves. Can
this design be challenged? Sure. It can also go on and on for months
if no solution is clearly superior to the other, and that's likely the
path it will take.

> It's time to fix this issue. I have already demonstrated how this does not
> affect integer drivers. This will only affect gpiod drivers which parse the
> flags and invert logic levels internally due to incorrect gpio_desc returned
> to them in the first place.
> Don't weaken the whole concept of gpio_desc by making half the API unusable
> or private. Don't pretend this state is A-Okay either, please!

To make things clear, here is my stance on the question:

1) of_get_gpiod_flags() being public was a mistake that is being addressed.
2) There are no user of of_get_gpiod_flags() in mainline, therefore
removing it from the public API is perfectly ok. We cannot keep track
of all the external trees to see who is using what, and the kernel has
a long history of much more drastic API changes.
3) If the accepted way of looking up GPIOs does not cover your needs,
please explain clearly how the current gpiod_get() function is
insufficient and we can work something out. But if all it takes to fix
your issue is some small changes in out-of-mainline code, then I will
advocate this rather than adding functions to the gpiod API.

And yeah, the gpiod API is young and we are still dealing with the
(hopefully) last issues of this kind, so please try to be more
tolerant towards your fellow developers.

Alex.
