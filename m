From: Pantelis Antoniou <panto@antoniou-consulting.com>
Subject: Re: [PATCH] gpio: add gpio_of_helper
Date: Wed, 22 Oct 2014 12:58:19 +0300
Message-ID: <E44127F1-1B6B-4BB0-866A-7B142F295FAE@antoniou-consulting.com>
References: <4b0bcf4679163c0da53e412a47eecd4bb03849b8.1413966148.git.jiri.prchal@aksignal.cz> <CAAVeFuJrmea6yZn2J28ihs3+=FYkZ2QxDv6F7qiq+TPpv_odpw@mail.gmail.com> <E5E0C172-C51D-46DC-AE15-71308BDC9829@antoniou-consulting.com> <CAAVeFuLh99MJXNNuh=L37pNzgun-Qi=3J4uK4eUSC5Qy107Gzw@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from li42-95.members.linode.com ([209.123.162.95]:45516 "EHLO
	li42-95.members.linode.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754013AbaJVJ6Z convert rfc822-to-8bit
	(ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 22 Oct 2014 05:58:25 -0400
In-Reply-To: <CAAVeFuLh99MJXNNuh=L37pNzgun-Qi=3J4uK4eUSC5Qy107Gzw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Jiri Prchal <jiri.prchal@aksignal.cz>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, devicetree-discuss@lists.ozlabs.org, Grant Likely <grant.likely@secretlab.ca>

Hi Alexandre,

> On Oct 22, 2014, at 12:41 PM, Alexandre Courbot <gnurou@gmail.com> wr=
ote:
>=20
> On Wed, Oct 22, 2014 at 6:24 PM, Pantelis Antoniou
> <panto@antoniou-consulting.com> wrote:
>> Hi Alexandre,
>>=20
>>> On Oct 22, 2014, at 12:18 PM, Alexandre Courbot <gnurou@gmail.com> =
wrote:
>>>=20
>>> On Wed, Oct 22, 2014 at 5:26 PM, Jiri Prchal <jiri.prchal@aksignal.=
cz> wrote:
>>>> This patch adds new driver "gpio-of-helper", witch has possibility=
 to export
>>>> gpios defined in dt. It exports them in defined name under
>>>> /sysfs/class/gpio/name.
>>>> It's rebased from Pantelis Antoniou patch to new kernel.
>>>> Usage example:
>>>>       gpio {
>>>>               compatible =3D "gpio-of-helper";
>>>>               status =3D "okay";
>>>>               pinctrl-names =3D "default";
>>>>               pinctrl-0 =3D <&pinctrl_gpio>;
>>>>=20
>>>>               gsm_on {
>>>>                       gpio-name =3D "gsm_on";
>>>>                       gpio =3D <&pioB 13 GPIO_ACTIVE_HIGH>;
>>>>                       output;
>>>>                       init-low;
>>>>               };
>>>>       };
>>>>=20
>>>> This patch needs Alexey Ignatov [PATCH] gpiolib: allow exporting g=
pios with
>>>> custom names.
>>>=20
>>> We will need to see whether the pre-requisite patch can get merged
>>> first, but there are a couple of things that are wrong with your pa=
tch
>>> anyway:
>>>=20
>>> - it is missing a bindings documentation
>>> - it is using the legacy integer GPIOs instead of the descriptor
>>> interface (see include/linux/gpio/consumer.h). Since this is DT-bas=
ed,
>>> there is absolutely no reason to not use the descriptors interface.
>>> - it seems quite long for what it needs to do
>>> - the MODULE_AUTHOR has not signed-off this patch (?)
>>>=20
>>> But what makes me nervous is that this encourages more usage of the
>>> sysfs interface, an in a way that is potentially harmful.
>>>=20
>>> Also, I don't know if the DT people will be happy with this idea.
>>> Since this concerns DT, please also add the devicetree list and get=
 a
>>> Acked-by for the bindings you want to push by a DT maintainer.
>>=20
>> Since I=E2=80=99m the original perpetrator, let me put a few words h=
ere for posterity.
>>=20
>> This patch was meant as a quick and dirty method for doing the autom=
atic export
>> and pinmux configuration from DT on a 3.8 kernel. The kernel APIs ha=
ve moved on
>> since. It wasn=E2=80=99t meant to be submitted for mainline right as=
 it is.
>>=20
>> Unfortunately (or fortunately for many people) it does what a lot of=
 people need
>> i.e. configures a board with heavily pinmuxed GPIO right at boot tim=
e.
>>=20
>> I=E2=80=99m open at having a small discussion about how to do what t=
he users of this patch
>> do =E2=80=98right=E2=80=99.
>=20
> Sure, although the discussion might turn out to not be that "small". =
:)
>=20

Heh ;)

> Pinmux configuration sounds like a job for pinmux more than GPIO, and
> exporting potentially many GPIOs to user-space sounds like a work for
> a proper driver.
>=20

I=E2=80=99m afraid that=E2=80=99s not the case. A great many users do n=
ot require anything
more than setting a pinmux and the GPIO configuration (input/output).
They can then do low speed I/O using the sysfs interface, without havin=
g to
use any complex APIs (shell works just fine).

Think of stuff like controlling a sprinkler valve, or something like a =
mechanical
door detection open state.

> We need to understand why this is needed, and then see if the DT
> bindings are acceptable before going any further.

I can take care of the bindings if we get into some kind of agreement o=
n the basic
interface. I=E2=80=99m CCing device tree and the DT maintainer.

Regards

=E2=80=94 Pantelis

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
