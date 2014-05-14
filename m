From: Robert Abel <rabel@cit-ec.uni-bielefeld.de>
Subject: Re: [PATCH] GPIOD, OF: parse flags into gpiod
Date: Wed, 14 May 2014 02:44:58 +0200
Message-ID: <5372BC8A.5090307@cit-ec.uni-bielefeld.de>
References: <1398775115-6842-1-git-send-email-rabel@cit-ec.uni-bielefeld.de>	<CAAVeFuK-ZSr__nLq9ZU7ASD_CsXOUBYqtZv4F4MTd5+XSxTGdg@mail.gmail.com>	<536767A1.5090701@cit-ec.uni-bielefeld.de>	<CAAVeFuJB21n04qKbwxyPCVi=s882sTfgvftG8GgaBLqH-cjFCQ@mail.gmail.com>	<53679B6D.2030603@cit-ec.uni-bielefeld.de>	<CAAVeFuL22kTEy+QZgPE8ZTVGkD9N1dMx1m+7AxjkPPD=s+oriw@mail.gmail.com>	<53720DE0.4010005@cit-ec.uni-bielefeld.de> <CABxcv=kH61o0+uo0CHv1pE5j4VSPNdpcZVbtMUGKuEygMQ+DZg@mail.gmail.com>
Reply-To: rabel@cit-ec.uni-bielefeld.de
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ee0-f51.google.com ([74.125.83.51]:38742 "EHLO
	mail-ee0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750776AbaENApA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 13 May 2014 20:45:00 -0400
Received: by mail-ee0-f51.google.com with SMTP id e51so856581eek.10
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2014 17:44:59 -0700 (PDT)
In-Reply-To: <CABxcv=kH61o0+uo0CHv1pE5j4VSPNdpcZVbtMUGKuEygMQ+DZg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
Cc: Javier Martinez Canillas <javier@dowhile0.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

Hi Javier, Hi Alexandre,

I'm going to mix and match and reorder your two e-mails. Sorry about the 
big mid-section.

On 13.05.2014 15:38, Javier Martinez Canillas wrote:
> Well is not an arbitrary place but in the function that GPIO consumers
> are supposed to use to get a properly configured GPIO.
Well, that's not very obvious. I just looked for the gpiod equivalent of 
the integer gpio function and wound up with of_get_named_gpiod_flags. 
This seemed the logical place to start for me. Too bad it returns 
invalid gpio_desc.

On 13.05.2014 15:38, Javier Martinez Canillas wrote:
> In that case we should just remove that parameter and fill the flags
> passed to of_get_named_gpio_flags() from the returned gpio_desc by
> right of_get_named_gpiod_flags().
On 13.05.2014 16:24, Alexandre Courbot wrote:
> I don't want this function to be public because it leaks a flags
> parameter that the outside does not need to see.
On 13.05.2014 16:24, Alexandre Courbot wrote:
> Which is why we don't leak a descriptor's flags to users of
> the gpiod API.

But those are enum of_gpio_flags -- not the gpio_desc.flags. So there is 
no "leak" so to speak and user code cannot mess with the opaque 
gpio_desc that way.
 From what I see, the flags argument is just there for the legacy 
integer gpio lib, i.e. of_get_named_gpio_flags calls 
of_get_named_gpiod_flags. That's their only point as far as I'm concerned.
IMHO, the argument should be kept for now and be removed after all 
mainline drivers transitioned to gpiod.

On 13.05.2014 16:24, Alexandre Courbot wrote:
> I feel quite strongly that this whole
> issue could easily be fixed on your private tree, but you are not very
> verbose about your use case and it doesn't seem like this is a
> solution you are looking for here anyway.
Oh believe you me, it is fixed in my tree -- using my patch. However, I 
felt the general need to bring this to mainline attention, because it 
breaks gpiod drivers who rely on DT for polarity.
I literally posted my code for getting gpios in one of the other emails, 
so I'm not sure what about my use case is so unclear:
Acquire gpios from a DT node to use in my driver.

On 13.05.2014 15:38, Javier Martinez Canillas wrote:
> That's a disadvantage of having code out of the mainline kernel and
> one of the reasons why is much better to work upstream.
Which is why I sent my patch upstream, because I thought other people 
might very well run into the same trouble as I did.

On 13.05.2014 15:38, Javier Martinez Canillas wrote:
>> Removing something from a *public* API is never ok post hoc.
>
> That's certainly not true in the kernel, in fact we don't have an
> stable internal API, only the external ABI with user-space i stable.
> This allows to keep improving the kernel and to correct previous
> mistakes (like the one you are pointing out on of_get_gpiod_flags).
> Please read Documentation/stable_api_nonsense.txt in the kernel source
> directory.
On 13.05.2014 16:24, Alexandre Courbot wrote:

> http://www.mjmwired.net/kernel/Documentation/stable_api_nonsense.txt
Well, I should have said /removing it on a whim/, but I concede I did not know about this policy (nor necessarily agree completely with it).

On 13.05.2014 16:24, Alexandre Courbot wrote:
> Blah blah, sticks and stones...
You might not care about function-level correctness, but I do. And I 
hold it's not a matter of taste whether functions return valid or 
invalid results. Use correct functions as building blocks for 
higher-level functions and you're all set. Use functions that return 
correct results four out of five times and higher-level functions will 
break every so often.

On 13.05.2014 16:24, Alexandre Courbot wrote:
> I explained to you
> that we could consider another function that does not return that
> flag, but you decided to ignore it.
I decided not to have a solution that reinvents the wheel. The current 
function is perfectly fine once the flags are fixed. Why would there be 
need for *of_get_named_gpiod_flags* as well as 
*of_get_named_gpiod_flags_actually_return_proper_gpio_desc*? There 
isn't. Let's fix of_get_named_gpiod_flags and move on.

On 13.05.2014 16:24, Alexandre Courbot wrote:

> Do you understand that your solution would require to handle the flags
> in gpiod_find(), of_find_gpio() and acpi_find_gpio(), while the
> solution that handles things in a single place (gpiod_get_index()) is
> the one that is currently implemented?
No, I'm actually not aware of this. I proposed a fix in 
of_get_named_gpiod_flags.
- of_find_gpio calls of_get_named_gpiod_flags. If the latter returns a 
valid gpio_desc, so will of_find_gpio. The point of my patch - it 
handles the DT case in a single place. All other functions relying on 
of_get_named_gpiod_flags will return valid gpio_desc by design. Without 
specific implementation-dependent knowledge.
=> of_find_gpio works; does not interfere with integer gpio API.

- acpi_get_gpiod_by_index does not handle flag parsing itself.
It relies upon acpi_get_gpiod, which in turn implicitly relies upon the 
gpio_desc.flags being correctly set in the gpiochip descriptor list. 
acpi_find_gpio currently translates the flags from an acpi_gpio_info 
structure after the fact (coming from the gpiochip) anyway. So this does 
not seem like a big concern. Translate to gpio_desc.flags there right 
away, you even save a level of translation in the end. The implicit 
reliance on the gpiochip desc table might be a point of contention for 
another day.
=> no interference by of_get_named_gpiod_flags; a level of translation 
anyway.

- gpiod_find has the same reliance on the gpiochip descriptor table as 
acpi_get_gpiod_by_index, but does no translation of its own. It relies 
upon valid descriptors being in the gpiochip descriptor table
=> no interference by of_get_named_gpiod_flags; total reliance on 
gpiochip platform(?) data as you pointed out.

Needless to say, the gpio chips don't usually set up these descriptor 
tables, so individual descriptors are likely incorrect before first use 
anyway. That's why the acpi calls add another level of translation using 
the acpi_gpio_info structure.

I expect gpiod_find, acpi_get_gpiod_by_index, as well as of_find_gpio to 
return a valid gpio_desc, because they promise to do just that by merit 
of their function signature.
I knew that of_find_gpio was breaking this promise. That's why I went to 
the lowest common denominator function and fixed it.

I suspect gpiod_find lies about the gpio_desc it returns (because it 
does not translation anywhere). But I'm currently not in a position to 
test that hypothesis.

I propose acpi_get_gpiod_by_index should not apply flags to gpio_desc 
and should do no translation of its own:
Currently acpi uses ACPI_* flags, which it -- as a crutch -- translates 
to enum gpio_lookup_flags which in turn gpiolib -- knowing the flags 
were not applied -- translates enum gpio_lookup_flags to gpiod_flags in 
gpiod_get.

Now apply function-level correctness:
acpi_get_gpiod_by_index promises to return a valid gpio_desc. => _Make 
it so_. Take out a level of re-translation and you end up with functions 
that perform correctly on their own.
In general, translation of flags has to be applied anyways, because 
gpio-supplier-specific flags are there to stay. However, translation 
logic should be in gpio-supplier code, not in code built atop 
gpio-supplier functions that /happens to undocumentedly(!) know/ that 
the functions lie and return invalid results.

To recap:

On 13.05.2014 16:24, Alexandre Courbot wrote:

> Do you understand that your solution would require to handle the flags
> in gpiod_find(), of_find_gpio() and acpi_find_gpio(), while the
> solution that handles things in a single place (gpiod_get_index()) is
> the one that is currently implemented?
I understand that the flags are already being handled/translated all 
over the place. I propose:
- to move gpio-supplier-specific logic into gpio-supplier code, where it 
belongs,
- have all gpio-suppliers adhere to the gpiod interface, i.e. return 
valid gpio_desc with appropriate flags set,
- remove translation of enum gpio_lookup_flags to gpio_desc.flags in 
gpiolib, and thereby
- decouple gpio-supplier code from gpiolib, especially mitigate 
higher-level functions doing jobs which their lower-level callees 
neglected to do

On 13.05.2014 16:24, Alexandre Courbot wrote:

> Why would authors of gpiod_ functions use functions of the old integer API?
Because gpiod_get_index uses it:
> struct gpio_desc *__must_check gpiod_get_index(...)
> {
>     ...
>
>     /* Using device tree? */
>     if (IS_ENABLED(CONFIG_OF) && dev && dev->of_node) {
>         ...
>         desc = of_find_gpio(dev, con_id, idx, &flags);
>     }...

On 13.05.2014 16:24, Alexandre Courbot wrote:

> gpiod_find()'s sole purpose is to be called by gpiod_get_index() to
> lookup for platform-defined GPIOs. [...]
> Where in its name or prototype is it hinted that it
> should set the flags itself?

Well, right here:

> static struct gpio_desc *gpiod_find(...) ^^^^^^^^^^^^^^^^
If I cannot rely upon gpiod_find to return a valid gpio_desc, then I have to /know/ that. This implies that all programmers have to be familiar with what you just said. Which ultimately implies that all users have to work around gpiod_find not returning a valid gpio_desc. Let's fix that, have function-level correctness and less headache while improving gpiolib and gpiolib-acpi.

Regards,

Robert

