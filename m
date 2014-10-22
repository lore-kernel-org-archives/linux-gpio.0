From: =?UTF-8?B?SmnFmcOtIFByY2hhbA==?= <jiri.prchal@aksignal.cz>
Subject: Re: [PATCH] gpio: add gpio_of_helper
Date: Wed, 22 Oct 2014 13:05:54 +0200
Message-ID: <54478F92.9040305@aksignal.cz>
References: <4b0bcf4679163c0da53e412a47eecd4bb03849b8.1413966148.git.jiri.prchal@aksignal.cz> <CAAVeFuJrmea6yZn2J28ihs3+=FYkZ2QxDv6F7qiq+TPpv_odpw@mail.gmail.com> <E5E0C172-C51D-46DC-AE15-71308BDC9829@antoniou-consulting.com> <CAAVeFuLh99MJXNNuh=L37pNzgun-Qi=3J4uK4eUSC5Qy107Gzw@mail.gmail.com> <E44127F1-1B6B-4BB0-866A-7B142F295FAE@antoniou-consulting.com>
Reply-To: jiri.prchal@aksignal.cz
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from [188.175.113.102] ([188.175.113.102]:59158 "EHLO
	router.aksignal.cz" rhost-flags-FAIL-FAIL-OK-OK) by vger.kernel.org
	with ESMTP id S932499AbaJVLGb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Oct 2014 07:06:31 -0400
In-Reply-To: <E44127F1-1B6B-4BB0-866A-7B142F295FAE@antoniou-consulting.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Pantelis Antoniou <panto@antoniou-consulting.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>

Hi all,

Dne 22.10.2014 v 11:58 Pantelis Antoniou napsal(a):
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
>>>>>        gpio {
>>>>>                compatible =3D "gpio-of-helper";
>>>>>                status =3D "okay";
>>>>>                pinctrl-names =3D "default";
>>>>>                pinctrl-0 =3D <&pinctrl_gpio>;
>>>>>
>>>>>                gsm_on {
>>>>>                        gpio-name =3D "gsm_on";
>>>>>                        gpio =3D <&pioB 13 GPIO_ACTIVE_HIGH>;
>>>>>                        output;
>>>>>                        init-low;
>>>>>                };
>>>>>        };
>>>>>
>>>>> This patch needs Alexey Ignatov [PATCH] gpiolib: allow exporting =
gpios with
>>>>> custom names.
>>>>
>>>> We will need to see whether the pre-requisite patch can get merged
>>>> first, but there are a couple of things that are wrong with your p=
atch
>>>> anyway:

Let's continue discussion that "someone" need gpio_export_name.
>>>>
>>>> - it is missing a bindings documentation
>>>> - it is using the legacy integer GPIOs instead of the descriptor
>>>> interface (see include/linux/gpio/consumer.h). Since this is DT-ba=
sed,
>>>> there is absolutely no reason to not use the descriptors interface=
=2E
>>>> - it seems quite long for what it needs to do
>>>> - the MODULE_AUTHOR has not signed-off this patch (?)

OK, this was just first try mainly to open discussion.
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

Dirty, but is functional.
I'm using something like this from 2.6.38! Than I switched to 3.8, devi=
cetree,
find and apply this patch, but for other reasons moved to newer kernels=
 and every
time need to rebase this.
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

That is exactly what we need.
>
> Think of stuff like controlling a sprinkler valve, or something like =
a mechanical
> door detection open state.
>
>> We need to understand why this is needed, and then see if the DT
>> bindings are acceptable before going any further.
>
> I can take care of the bindings if we get into some kind of agreement=
 on the basic
> interface. I=E2=80=99m CCing device tree and the DT maintainer.
>
> Regards
>
> =E2=80=94 Pantelis
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio"=
 in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
