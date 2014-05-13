From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] GPIOD, OF: parse flags into gpiod
Date: Tue, 13 May 2014 23:24:26 +0900
Message-ID: <CAAVeFuJi6eAnie+Ku_w4LQsFq8pY-45L4URDAB7pHtV_q9+Yzg@mail.gmail.com>
References: <1398775115-6842-1-git-send-email-rabel@cit-ec.uni-bielefeld.de>
 <CAAVeFuK-ZSr__nLq9ZU7ASD_CsXOUBYqtZv4F4MTd5+XSxTGdg@mail.gmail.com>
 <536767A1.5090701@cit-ec.uni-bielefeld.de> <CAAVeFuJB21n04qKbwxyPCVi=s882sTfgvftG8GgaBLqH-cjFCQ@mail.gmail.com>
 <53679B6D.2030603@cit-ec.uni-bielefeld.de> <CAAVeFuL22kTEy+QZgPE8ZTVGkD9N1dMx1m+7AxjkPPD=s+oriw@mail.gmail.com>
 <53720DE0.4010005@cit-ec.uni-bielefeld.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-vc0-f177.google.com ([209.85.220.177]:54209 "EHLO
	mail-vc0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932891AbaEMOYr convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 13 May 2014 10:24:47 -0400
Received: by mail-vc0-f177.google.com with SMTP id if17so528068vcb.36
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2014 07:24:47 -0700 (PDT)
In-Reply-To: <53720DE0.4010005@cit-ec.uni-bielefeld.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Robert ABEL <rabel@cit-ec.uni-bielefeld.de>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

On Tue, May 13, 2014 at 9:19 PM, Robert ABEL
<rabel@cit-ec.uni-bielefeld.de> wrote:
> On 05 May 2014 17:14, Alexandre Courbot wrote:
>>
>> Ok, you are obviously correct here.
>
> But you won't accept my patch, because you don't want to. Not because=
 I'm
> correct, right? Good, thought so.

This example has nothing to do with the validity of having this or
that function public.

Besides I have no authority to accept your patch - that's Linus' job.
If he likes your patch nothing that I say will prevent him from
merging it.

>
>> of_get_gpiod_flags() works the same way as of_get_gpio_flags() which
>> it mirrors and is correct in that respect. Returning a flags paramet=
er
>> for the caller to apply while having applied these flags already is
>> what makes no sense to me. Taste and colours...
>
> No, it's definitely _not_ a matter of taste. My version fixes this mi=
stake
> at the earliest possible moment (when the fully parsed gpio is return=
ed from
> the call to the chip), the root cause of the problem. Your version ap=
plies
> this fix at on arbitrary point -- too bad for all other functions whi=
ch
> assume a valid gpio_desc is returned from the lower levels. Because i=
t
> isn't.
> But of course, that's just my taste that I like non-broken functions.=
 If you
> like broken functions, you're free to like them.

Blah blah, sticks and stones...

>
>> If you really need a function that will return GPIO descriptor from =
an
>> arbitrary DT property (or maybe a version of gpiod_get() working on =
a
>> DT node and not a device instance), that's another story and we can
>> discuss that if it is well motivated.
>
> Good news :) Such a function was already implemented and available to
> everybody and his dog!
> Bad news :( You just made that function private because you wouldn't =
accept
> my patch to root out this flag application problem.

I don't want this function to be public because it leaks a flags
parameter that the outside does not need to see. I explained to you
that we could consider another function that does not return that
flag, but you decided to ignore it.

Not that we should even feel obliged to consider this solution if
mainline does not need it - your private tree is, well, your tree.
"Deal with it".

>
>
>> Also, clearly and calmly explaining your needs will serve you much
>> better than screaming around and arbitrarily calling things "broken"=
=2E
>
> I'll call broken code *broken*. If you don't like it, that's fine. Bu=
t I
> won't call broken code *working and in order* just because you get yo=
ur
> panties in a twist otherwise.
>
>> Well, that was a mistake that went through the review process. We
>> wanted to make a perfect GPIO API but unfortunately you were not
>> around to advise us.
>
> A real shame indeed.
>
>> Good news, once of_get_gpiod_flags() becomes private all public gpio=
d_
>> functions should return a correct gpio_desc.
>
> Wrong. First of all, every new gpiod_* function that might be added i=
n the
> future will probably need two revisions, because the authors might no=
t be
> aware that of_find_gpio returns an invalid gpio_desc.

Why would authors of gpiod_ functions use functions of the old integer =
API?

> gpiod_find remains
> broken as well, as it implicitly relies on gpio_desc stored per chip =
to have
> valid gpio_desc.flags.

gpiod_find()'s sole purpose is to be called by gpiod_get_index() to
lookup for platform-defined GPIOs. The flags are set in the platform
lookup table and returned to gpiod_find_index() which treats the flags
in one place for descriptors returned by DT, ACPI and platform lookup.

That's the sole use of gpiod_find(). It is not exported. It is static
to gpiolib.c. Where in its name or prototype is it hinted that it
should set the flags itself?

>
>
>> As for where to set the descriptor's properties, having it done in
>> gpiod_get() allows us to handle this in a single place, without havi=
ng
>> to rely on lower-level functions to remember doing it themselves. Ca=
n
>> this design be challenged? Sure. It can also go on and on for months
>> if no solution is clearly superior to the other, and that's likely t=
he
>> path it will take.
>
> The solution to parse the flags when the gpio_desc is fist used is cl=
early
> superior, because all other functions depending on that function will=
 /just
> work/.
> Fixing things at some arbitrary branch of the caller tree while leavi=
ng all
> other branches to fend on their own is poor, dare I say *broken*, des=
ign.
>
> The single place where things need to be handled at is the lowest com=
mon
> denominator, which all other functions can rely on. If higher level
> functions cannot rely on a low-level function, because it lies and do=
es not
> return a valid gpio_desc, then they will in turn return an invalid
> gpio_desc. And so on.

Do you understand that your solution would require to handle the flags
in gpiod_find(), of_find_gpio() and acpi_find_gpio(), while the
solution that handles things in a single place (gpiod_get_index()) is
the one that is currently implemented?

>
>
>> To make things clear, here is my stance on the question:
>>
>> 1) of_get_gpiod_flags() being public was a mistake that is being
>> addressed.
>
> No, it was useful and now you broke my and possibly many other progra=
mmer's
> code in making it private. Already by name it was supposed to be the =
gpiod_
> equivalent to be called when using DT nodes. Thanks again for breakin=
g this
> and possibly getting it into mainline.
> Now I need two patches in my private tree: one to fix the flag issue =
and one
> to re-export that function.
>
>> 2) There are no user of of_get_gpiod_flags() in mainline, therefore
>> removing it from the public API is perfectly ok. We cannot keep trac=
k
>> of all the external trees to see who is using what, and the kernel h=
as
>> a long history of much more drastic API changes.
>
> Removing something from a *public* API is never ok post hoc. Never. W=
hen
> things get to API level there are certain guarantees that have to be =
met.
> One would be that functions don't just vanish from revision to revisi=
on.

http://www.mjmwired.net/kernel/Documentation/stable_api_nonsense.txt

>
>> 3) If the accepted way of looking up GPIOs does not cover your needs=
,
>> please explain clearly how the current gpiod_get() function is
>> insufficient and we can work something out. But if all it takes to f=
ix
>> your issue is some small changes in out-of-mainline code, then I wil=
l
>> advocate this rather than adding functions to the gpiod API.
>
> How come your way is now the accepted way? I thought the accepted way=
 was
> that gpio_desc were an opaque type whose flags are set in low-level c=
ode and
> who can be relied upon to /just work/.

Exactly. Which is why we don't leak a descriptor's flags to users of
the gpiod API.

> Which comes back to this statement, which seems to be the fundamental
> problem here:
>
>> Returning a flags parameter
>> for the caller to apply while having applied these flags already is
>> what makes no sense to me.
>
> The flags parameter is not returned to be applied by the user.
> First of all, gpio_desc is an opaque type, so the user cannot (and in=
deed
> must not) apply these flags to gpio_desc.flags.
> However, I think with apply you mean this:
> The flags are returned so the user can implement his own logic for
> inverting/open draining signals etc.
> However, the whole point of the exercise is precisely that no externa=
l
> user-logic is required for open drain, open source, low-active, high-=
active
> etc. However, this will duplicate all the code that's already in gpio=
lib in
> the user code. This cannot be!
>
> As I see it, the flags are returned as a piece of information to the =
user
> code. This is for historic reasons, because integer gpios rely upon t=
hese
> flags and because gpio_desc is an opaque type, so the flags cannot be
> /easily/ acquired from somewhere else for the current gpio.
> However, user code _must not_ change its behavior depending on the fl=
ags,
> and neither must gpiolib code. Users must be able to trust that the
> gpio_desc returned to them is valid. They must be able to trust that =
the
> Right Thing=E2=84=A2 happens when they call gpiod_set_value(&my_desc,=
 1) on their
> gpio: it is asserted -- irrespective of what asserted means in the DT=
=2E
>
> Your approach catapults us back into the real dark ages. With your ap=
proach,
> we are back to *driver-level* support for active-low, open-drain, etc=
=2E And
> that's why the flags *have* to be applied by gpiolib, else the whole =
design
> is *broken*. Deal with it.

Like I said Linus is the one who accepts or rejects patches
ultimately. I am trying to help said patches getting in shape but
apparently you are not very appreciative of the initiative nor are you
willing to consider my attempts to reach a common ground through
another, less leaking function. I feel quite strongly that this whole
issue could easily be fixed on your private tree, but you are not very
verbose about your use case and it doesn't seem like this is a
solution you are looking for here anyway.

=46inally, since the tone and vocabulary of your messages make it clear
that to your eyes I am not in a position to help you with this, I will
let you settle this issue with Linus.

Alex.
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
