From: Robert ABEL <rabel@cit-ec.uni-bielefeld.de>
Subject: Re: [PATCH] GPIOD, OF: parse flags into gpiod
Date: Tue, 13 May 2014 14:19:44 +0200
Message-ID: <53720DE0.4010005@cit-ec.uni-bielefeld.de>
References: <1398775115-6842-1-git-send-email-rabel@cit-ec.uni-bielefeld.de> <CAAVeFuK-ZSr__nLq9ZU7ASD_CsXOUBYqtZv4F4MTd5+XSxTGdg@mail.gmail.com> <536767A1.5090701@cit-ec.uni-bielefeld.de> <CAAVeFuJB21n04qKbwxyPCVi=s882sTfgvftG8GgaBLqH-cjFCQ@mail.gmail.com> <53679B6D.2030603@cit-ec.uni-bielefeld.de> <CAAVeFuL22kTEy+QZgPE8ZTVGkD9N1dMx1m+7AxjkPPD=s+oriw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ee0-f54.google.com ([74.125.83.54]:34758 "EHLO
	mail-ee0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752570AbaEMMT2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 13 May 2014 08:19:28 -0400
Received: by mail-ee0-f54.google.com with SMTP id b57so347900eek.41
        for <linux-gpio@vger.kernel.org>; Tue, 13 May 2014 05:19:27 -0700 (PDT)
In-Reply-To: <CAAVeFuL22kTEy+QZgPE8ZTVGkD9N1dMx1m+7AxjkPPD=s+oriw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

On 05 May 2014 17:14, Alexandre Courbot wrote:
> Ok, you are obviously correct here.=20
But you won't accept my patch, because you don't want to. Not because=20
I'm correct, right? Good, thought so.
> of_get_gpiod_flags() works the same way as of_get_gpio_flags() which
> it mirrors and is correct in that respect. Returning a flags paramete=
r
> for the caller to apply while having applied these flags already is
> what makes no sense to me. Taste and colours...
No, it's definitely _not_ a matter of taste. My version fixes this=20
mistake at the earliest possible moment (when the fully parsed gpio is=20
returned from the call to the chip), the root cause of the problem. You=
r=20
version applies this fix at on arbitrary point -- too bad for all other=
=20
functions which assume a valid gpio_desc is returned from the lower=20
levels. Because it isn't.
But of course, that's just my taste that I like non-broken functions. I=
f=20
you like broken functions, you're free to like them.
> If you really need a function that will return GPIO descriptor from a=
n
> arbitrary DT property (or maybe a version of gpiod_get() working on a
> DT node and not a device instance), that's another story and we can
> discuss that if it is well motivated.
Good news :) Such a function was already implemented and available to=20
everybody and his dog!
Bad news :( You just made that function private because you wouldn't=20
accept my patch to root out this flag application problem.

> Also, clearly and calmly explaining your needs will serve you much
> better than screaming around and arbitrarily calling things "broken".
I'll call broken code *broken*. If you don't like it, that's fine. But =
I=20
won't call broken code *working and in order* just because you get your=
=20
panties in a twist otherwise.
> Well, that was a mistake that went through the review process. We
> wanted to make a perfect GPIO API but unfortunately you were not
> around to advise us.
A real shame indeed.
> Good news, once of_get_gpiod_flags() becomes private all public gpiod=
_
> functions should return a correct gpio_desc.
Wrong. First of all, every new gpiod_* function that might be added in=20
the future will probably need two revisions, because the authors might=20
not be aware that of_find_gpio returns an invalid gpio_desc. gpiod_find=
=20
remains broken as well, as it implicitly relies on gpio_desc stored per=
=20
chip to have valid gpio_desc.flags.

> As for where to set the descriptor's properties, having it done in
> gpiod_get() allows us to handle this in a single place, without havin=
g
> to rely on lower-level functions to remember doing it themselves. Can
> this design be challenged? Sure. It can also go on and on for months
> if no solution is clearly superior to the other, and that's likely th=
e
> path it will take.
The solution to parse the flags when the gpio_desc is fist used is=20
clearly superior, because all other functions depending on that functio=
n=20
will /just work/.
=46ixing things at some arbitrary branch of the caller tree while leavi=
ng=20
all other branches to fend on their own is poor, dare I say *broken*,=20
design.

The single place where things need to be handled at is the lowest commo=
n=20
denominator, which all other functions can rely on. If higher level=20
functions cannot rely on a low-level function, because it lies and does=
=20
not return a valid gpio_desc, then they will in turn return an invalid=20
gpio_desc. And so on.

> To make things clear, here is my stance on the question:
>
> 1) of_get_gpiod_flags() being public was a mistake that is being addr=
essed.
No, it was useful and now you broke my and possibly many other=20
programmer's code in making it private. Already by name it was supposed=
=20
to be the gpiod_ equivalent to be called when using DT nodes. Thanks=20
again for breaking this and possibly getting it into mainline.
Now I need two patches in my private tree: one to fix the flag issue an=
d=20
one to re-export that function.
> 2) There are no user of of_get_gpiod_flags() in mainline, therefore
> removing it from the public API is perfectly ok. We cannot keep track
> of all the external trees to see who is using what, and the kernel ha=
s
> a long history of much more drastic API changes.
Removing something from a *public* API is never ok post hoc. Never. Whe=
n=20
things get to API level there are certain guarantees that have to be=20
met. One would be that functions don't just vanish from revision to=20
revision.
> 3) If the accepted way of looking up GPIOs does not cover your needs,
> please explain clearly how the current gpiod_get() function is
> insufficient and we can work something out. But if all it takes to fi=
x
> your issue is some small changes in out-of-mainline code, then I will
> advocate this rather than adding functions to the gpiod API.
How come your way is now the accepted way? I thought the accepted way=20
was that gpio_desc were an opaque type whose flags are set in low-level=
=20
code and who can be relied upon to /just work/.
Which comes back to this statement, which seems to be the fundamental=20
problem here:
> Returning a flags parameter
> for the caller to apply while having applied these flags already is
> what makes no sense to me.
The flags parameter is not returned to be applied by the user.
=46irst of all, gpio_desc is an opaque type, so the user cannot (and=20
indeed must not) apply these flags to gpio_desc.flags.
However, I think with apply you mean this:
The flags are returned so the user can implement his own logic for=20
inverting/open draining signals etc.
However, the whole point of the exercise is precisely that no external=20
user-logic is required for open drain, open source, low-active,=20
high-active etc. However, this will duplicate all the code that's=20
already in gpiolib in the user code. This cannot be!

As I see it, the flags are returned as a piece of information to the=20
user code. This is for historic reasons, because integer gpios rely upo=
n=20
these flags and because gpio_desc is an opaque type, so the flags canno=
t=20
be /easily/ acquired from somewhere else for the current gpio.
However, user code _must not_ change its behavior depending on the=20
flags, and neither must gpiolib code. Users must be able to trust that=20
the gpio_desc returned to them is valid. They must be able to trust tha=
t=20
the Right Thing=E2=84=A2 happens when they call gpiod_set_value(&my_des=
c, 1) on=20
their gpio: it is asserted -- irrespective of what asserted means in th=
e DT.

Your approach catapults us back into the real dark ages. With your=20
approach, we are back to *driver-level* support for active-low,=20
open-drain, etc. And that's why the flags *have* to be applied by=20
gpiolib, else the whole design is *broken*. Deal with it.

Regards,

Robert
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
