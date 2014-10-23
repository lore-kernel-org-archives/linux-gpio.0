From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: add gpio_of_helper
Date: Thu, 23 Oct 2014 14:08:17 +0900
Message-ID: <CAAVeFuKj66r4UNZ33z3BT5m=7iB3tMC-u_eUDcJmvaNFj-0y5Q@mail.gmail.com>
References: <4b0bcf4679163c0da53e412a47eecd4bb03849b8.1413966148.git.jiri.prchal@aksignal.cz>
 <CAAVeFuJrmea6yZn2J28ihs3+=FYkZ2QxDv6F7qiq+TPpv_odpw@mail.gmail.com>
 <E5E0C172-C51D-46DC-AE15-71308BDC9829@antoniou-consulting.com>
 <CAAVeFuLh99MJXNNuh=L37pNzgun-Qi=3J4uK4eUSC5Qy107Gzw@mail.gmail.com> <E44127F1-1B6B-4BB0-866A-7B142F295FAE@antoniou-consulting.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f179.google.com ([209.85.223.179]:38645 "EHLO
	mail-ie0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751010AbaJWFIi convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Oct 2014 01:08:38 -0400
Received: by mail-ie0-f179.google.com with SMTP id ar1so277777iec.24
        for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2014 22:08:37 -0700 (PDT)
In-Reply-To: <E44127F1-1B6B-4BB0-866A-7B142F295FAE@antoniou-consulting.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Pantelis Antoniou <panto@antoniou-consulting.com>
Cc: Jiri Prchal <jiri.prchal@aksignal.cz>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Grant Likely <grant.likely@secretlab.ca>

On Wed, Oct 22, 2014 at 6:58 PM, Pantelis Antoniou
<panto@antoniou-consulting.com> wrote:
> Hi Alexandre,
>
>> On Oct 22, 2014, at 12:41 PM, Alexandre Courbot <gnurou@gmail.com> w=
rote:
>>
>> On Wed, Oct 22, 2014 at 6:24 PM, Pantelis Antoniou
>> <panto@antoniou-consulting.com> wrote:
>>> Hi Alexandre,
>>>
>>>> On Oct 22, 2014, at 12:18 PM, Alexandre Courbot <gnurou@gmail.com>=
 wrote:
>>>>
>>>> On Wed, Oct 22, 2014 at 5:26 PM, Jiri Prchal <jiri.prchal@aksignal=
=2Ecz> wrote:
>>>>> This patch adds new driver "gpio-of-helper", witch has possibilit=
y to export
>>>>> gpios defined in dt. It exports them in defined name under
>>>>> /sysfs/class/gpio/name.
>>>>> It's rebased from Pantelis Antoniou patch to new kernel.
>>>>> Usage example:
>>>>>       gpio {
>>>>>               compatible =3D "gpio-of-helper";
>>>>>               status =3D "okay";
>>>>>               pinctrl-names =3D "default";
>>>>>               pinctrl-0 =3D <&pinctrl_gpio>;
>>>>>
>>>>>               gsm_on {
>>>>>                       gpio-name =3D "gsm_on";
>>>>>                       gpio =3D <&pioB 13 GPIO_ACTIVE_HIGH>;
>>>>>                       output;
>>>>>                       init-low;
>>>>>               };
>>>>>       };
>>>>>
>>>>> This patch needs Alexey Ignatov [PATCH] gpiolib: allow exporting =
gpios with
>>>>> custom names.
>>>>
>>>> We will need to see whether the pre-requisite patch can get merged
>>>> first, but there are a couple of things that are wrong with your p=
atch
>>>> anyway:
>>>>
>>>> - it is missing a bindings documentation
>>>> - it is using the legacy integer GPIOs instead of the descriptor
>>>> interface (see include/linux/gpio/consumer.h). Since this is DT-ba=
sed,
>>>> there is absolutely no reason to not use the descriptors interface=
=2E
>>>> - it seems quite long for what it needs to do
>>>> - the MODULE_AUTHOR has not signed-off this patch (?)
>>>>
>>>> But what makes me nervous is that this encourages more usage of th=
e
>>>> sysfs interface, an in a way that is potentially harmful.
>>>>
>>>> Also, I don't know if the DT people will be happy with this idea.
>>>> Since this concerns DT, please also add the devicetree list and ge=
t a
>>>> Acked-by for the bindings you want to push by a DT maintainer.
>>>
>>> Since I=E2=80=99m the original perpetrator, let me put a few words =
here for posterity.
>>>
>>> This patch was meant as a quick and dirty method for doing the auto=
matic export
>>> and pinmux configuration from DT on a 3.8 kernel. The kernel APIs h=
ave moved on
>>> since. It wasn=E2=80=99t meant to be submitted for mainline right a=
s it is.
>>>
>>> Unfortunately (or fortunately for many people) it does what a lot o=
f people need
>>> i.e. configures a board with heavily pinmuxed GPIO right at boot ti=
me.
>>>
>>> I=E2=80=99m open at having a small discussion about how to do what =
the users of this patch
>>> do =E2=80=98right=E2=80=99.
>>
>> Sure, although the discussion might turn out to not be that "small".=
 :)
>>
>
> Heh ;)
>
>> Pinmux configuration sounds like a job for pinmux more than GPIO, an=
d
>> exporting potentially many GPIOs to user-space sounds like a work fo=
r
>> a proper driver.
>>
>
> I=E2=80=99m afraid that=E2=80=99s not the case. A great many users do=
 not require anything
> more than setting a pinmux and the GPIO configuration (input/output).
> They can then do low speed I/O using the sysfs interface, without hav=
ing to
> use any complex APIs (shell works just fine).
>
> Think of stuff like controlling a sprinkler valve, or something like =
a mechanical
> door detection open state.

That sounds like any kind of arbitrary device that can be temporarily
connected to a set of GPIOs that will be bit-banged. Is my
interpretation correct?

In that case, I seriously doubt that this should be part of the DT.
Right now the DT is part of the firmware, and an immutable description
of the hardware layout of a board - definitely such devices do not fit
into that definition. This might change once the Device Tree Overlays
are merged, but we are not there yet. If the DT maintainers say this
is a valid use-case for overlays, then I will reconsider my position,
but in any case it really looks like this could/should be done from
user-space.

You have almost all the necessary pieces: you can export, configure
and manipulate any GPIO from the sysfs interface. The only thing you
would be missing is a way to give a name to a GPIO, something that can
easily be fixed.

Since the devices you want to configure that way are typically
removable or usage-specific, why would you want to store that
information all the way up into the firmware? A commonly accepted
wisdom is that what can be done in user-space should be done in
user-space, and it really looks like this applies here.

Say you buy a Jetson TK1 to control that sprinkler valve (a good use
for all these GPU cores!). The mainline DT has no knowledge about the
valve, so using your proposed way you will have to re-build and flash
a custom device tree just to be able to use your sprinkler. If you
decide to assign your board to something else, you will need another
DT.

Instead, have a shell script or a systemd unit tmpfile that will
perform the correct setup at boot time. Then you can easily switch
usages from user-space (systemctl stop sprinkler && systemctl start
doordetect). This is much, much more flexible. At least until the
Device Tree Overlays are merged, but even then this seems overkill.

So I don't see any good reason to accept this patch for now. I'm ready
to discuss and work on the required improvements to the sysfs
interface though - actually this might be a good opportunity to write
a better alternative sysfs interface that does not depend on the
integer GPIO space, something I have in mind since some time already.
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
