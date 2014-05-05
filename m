From: Robert ABEL <rabel@cit-ec.uni-bielefeld.de>
Subject: Re: [PATCH] GPIOD, OF: parse flags into gpiod
Date: Mon, 05 May 2014 16:08:45 +0200
Message-ID: <53679B6D.2030603@cit-ec.uni-bielefeld.de>
References: <1398775115-6842-1-git-send-email-rabel@cit-ec.uni-bielefeld.de> <CAAVeFuK-ZSr__nLq9ZU7ASD_CsXOUBYqtZv4F4MTd5+XSxTGdg@mail.gmail.com> <536767A1.5090701@cit-ec.uni-bielefeld.de> <CAAVeFuJB21n04qKbwxyPCVi=s882sTfgvftG8GgaBLqH-cjFCQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ee0-f43.google.com ([74.125.83.43]:46712 "EHLO
	mail-ee0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932548AbaEEOI3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 5 May 2014 10:08:29 -0400
Received: by mail-ee0-f43.google.com with SMTP id d17so798812eek.30
        for <linux-gpio@vger.kernel.org>; Mon, 05 May 2014 07:08:28 -0700 (PDT)
In-Reply-To: <CAAVeFuJB21n04qKbwxyPCVi=s882sTfgvftG8GgaBLqH-cjFCQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

On 05 May 2014 15:10, Alexandre Courbot wrote:
> Consider the following code in pwm_bl.c:
>
>      data->enable_gpio = of_get_named_gpio_flags(node, "enable-gpios", 0,
>                              &flags);
>
>      if (gpio_is_valid(data->enable_gpio) && (flags & OF_GPIO_ACTIVE_LOW))
>          data->enable_gpio_flags |= PWM_BACKLIGHT_GPIO_ACTIVE_LOW;
>
>      ....
>
>          if (pb->enable_gpio_flags & PWM_BACKLIGHT_GPIO_ACTIVE_LOW)
>              gpio_set_value(pb->enable_gpio, 0);
>          else
>              gpio_set_value(pb->enable_gpio, 1);
>
> User code of the legacy GPIO API handles the active_low property by
> itself because of_get_named_gpio_flags() did not apply that property
> on the descriptor. If you change this, the signal on an active-low
> GPIO will become the inverse of what it used to be. That's the reason
> why this patch cannot be accepted.
Let me expand your own example for you by expanding all functions:

     data->enable_gpio = of_get_named_gpio_flags(node, "enable-gpios", 0,
                             &flags); /* assume gpio_desc.flags is 
populated here */

     if (gpio_is_valid(data->enable_gpio) && (flags & OF_GPIO_ACTIVE_LOW))
         data->enable_gpio_flags |= PWM_BACKLIGHT_GPIO_ACTIVE_LOW;

     ....

         if (pb->enable_gpio_flags & PWM_BACKLIGHT_GPIO_ACTIVE_LOW)
             gpio_set_value(pb->enable_gpio, 0);
             => __gpio_set_value(pb->enable_gpio, 0);
             => gpiod_set_raw_value(gpio_to_desc(pb->enable_gpio), 0)
             => _gpiod_set_raw_value(gpio_to_desc(pb->enable_gpio), 0) 
/* gpio_desc.flags is ignored here */
         else
             gpio_set_value(pb->enable_gpio, 1);
             => __gpio_set_value(pb->enable_gpio, 1);
             => gpiod_set_raw_value(gpio_to_desc(pb->enable_gpio), 1)
             => _gpiod_set_raw_value(gpio_to_desc(pb->enable_gpio), 1) 
/* gpio_desc.flags is ignored here */

As you see, gpio_to_desc(pb->enable_gpio).flags are ignored along the way.
Thus, this change will *not* break integer usage.
And because gpio_desc are opaque, this will not affect drivers using gpiod,
because they should not have cared about the flags in the first place, 
because
they cannot see them anyway.


> If you do that you will have to update the hundreds of direct and
> indirect users of of_get_named_gpio(), or face their wrath because
> their code will stop working all of a sudden. More detailed
> explanation later in this mail.
See above.
> As explainer earlier, of_get_named_gpiod_flags() should never have
> been public in the first place. This is being addressed by
> https://lkml.org/lkml/2014/5/3/155 .
>
> Now that it is private, if you take a look at how it is used, you will
> see that its current design actually makes sense.
I dispute that, see below.
> There might be some DT users that did not follow that rule and got
> away with it because the old GPIO API is more permissive. These will
> not be able to update to gpiod easily [...].
This is exactly what I meant with breakage.
> That's correct - because the flags are actually applied one level
> higher by the only caller of of_find_gpio(), namely gpiod_get(). The
> reason why this is done there and not earlier is because there are
> other GPIO providers (ACPI, platform data) and we want the flags code
> to be handled in a single place.
Let's consider my use case for a minute here. I use a table to get gpios 
from a dt node:

     /* parse GPIOs */
     for (; *pin_desc; pin_desc++, gpios++) {

         index = of_property_match_string(np, "gpio-names", 
(*pin_desc)->name);
         if (index >= 0)
             *gpios = of_get_gpiod_flags(np, index, NULL);

         [...]

     }

Now I had no way of knowing that I'm not supposed to use 
of_get_gpiod_flags. Because every other driver uses of_get_gpio(_flags), 
I used the similarly named *public* gpiolib functions, because I like 
the concept of opaque gpio descriptors.

Now, you might argue I'm not supposed to do it that way and whatnot all 
you want. Your of_get_gpiod_flags function is *broken*, because it does 
not give me the correct gpio_desc. You can now go ahead and make *all* 
functions except for gpiod_get etc. private, because they're all 
apparently not supposed to be used, although they are public and not a 
word is spent explaining that they will not return a valid gpio_desc 
that has been parsed from DT.

Or you could go the route and actually make all these functions work 
correctly. They all ought to return a correct gpio_desc that has all its 
fields fully populated.

How you can claim this is all good and well and how it quote "doesn't 
seem broken to [you]" is frankly beyond me!!

These functions should all just be correct on their own. And they would 
be, if the gpio_desc fields are correctly populated at the _lowest_ 
level of the API instead of at some arbitrary higher level that might 
change in the future. All these functions should return a correctly 
parsed and valid gpio_desc for the same input. Right now some function 
(like gpiod_get) return a correct gpio_desc, while of_get_gpiod_flags 
returns an incorrect gpio_desc.

It's time to fix this issue. I have already demonstrated how this does 
not affect integer drivers. This will only affect gpiod drivers which 
parse the flags and invert logic levels internally due to incorrect 
gpio_desc returned to them in the first place.
Don't weaken the whole concept of gpio_desc by making half the API 
unusable or private. Don't pretend this state is A-Okay either, please!
