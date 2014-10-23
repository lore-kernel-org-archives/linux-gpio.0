From: Pantelis Antoniou <panto@antoniou-consulting.com>
Subject: Re: [PATCH] gpio: add gpio_of_helper
Date: Thu, 23 Oct 2014 14:23:46 +0300
Message-ID: <F82900FA-5999-4B39-8E7E-6FAA99ABDB2D@antoniou-consulting.com>
References: <4b0bcf4679163c0da53e412a47eecd4bb03849b8.1413966148.git.jiri.prchal@aksignal.cz> <CAAVeFuJrmea6yZn2J28ihs3+=FYkZ2QxDv6F7qiq+TPpv_odpw@mail.gmail.com> <E5E0C172-C51D-46DC-AE15-71308BDC9829@antoniou-consulting.com> <CAAVeFuLh99MJXNNuh=L37pNzgun-Qi=3J4uK4eUSC5Qy107Gzw@mail.gmail.com> <E44127F1-1B6B-4BB0-866A-7B142F295FAE@antoniou-consulting.com> <CAAVeFuKj66r4UNZ33z3BT5m=7iB3tMC-u_eUDcJmvaNFj-0y5Q@mail.gmail.com> <54489EC9.4020108@aksignal.cz> <CAAVeFuK4HxzwKye-RJCMeOSHNGNcvXV49hxnKL+u6ttidze7Tg@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from li42-95.members.linode.com ([209.123.162.95]:34013 "EHLO
	li42-95.members.linode.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932446AbaJWLXx convert rfc822-to-8bit
	(ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 23 Oct 2014 07:23:53 -0400
In-Reply-To: <CAAVeFuK4HxzwKye-RJCMeOSHNGNcvXV49hxnKL+u6ttidze7Tg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Jiri Prchal <jiri.prchal@aksignal.cz>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Grant Likely <grant.likely@secretlab.ca>

Hi Alexandre,

> On Oct 23, 2014, at 11:53 AM, Alexandre Courbot <gnurou@gmail.com> wr=
ote:
>=20
> On Thu, Oct 23, 2014 at 3:23 PM, Ji=C5=99=C3=AD Prchal <jiri.prchal@a=
ksignal.cz> wrote:
>>=20
>>=20
>> Dne 23.10.2014 v 07:08 Alexandre Courbot napsal(a):
>>=20
>>> On Wed, Oct 22, 2014 at 6:58 PM, Pantelis Antoniou
>>> <panto@antoniou-consulting.com> wrote:
>>>>=20
>>>> Hi Alexandre,
>>>>=20
>>>>> On Oct 22, 2014, at 12:41 PM, Alexandre Courbot <gnurou@gmail.com=
>
>>>>> wrote:
>>>>>=20
>>>>> On Wed, Oct 22, 2014 at 6:24 PM, Pantelis Antoniou
>>>>> <panto@antoniou-consulting.com> wrote:
>>>>>>=20
>>>>>> Hi Alexandre,
>>>>>>=20
>>>>>>> On Oct 22, 2014, at 12:18 PM, Alexandre Courbot <gnurou@gmail.c=
om>
>>>>>>> wrote:
>>>>>>>=20
>>>>>>> On Wed, Oct 22, 2014 at 5:26 PM, Jiri Prchal <jiri.prchal@aksig=
nal.cz>
>>>>>>> wrote:
>>>>>>>>=20
>>>>>>>> This patch adds new driver "gpio-of-helper", witch has possibi=
lity to
>>>>>>>> export
>>>>>>>> gpios defined in dt. It exports them in defined name under
>>>>>>>> /sysfs/class/gpio/name.
>>>>>>>> It's rebased from Pantelis Antoniou patch to new kernel.
>>>>>>>> Usage example:
>>>>>>>>       gpio {
>>>>>>>>               compatible =3D "gpio-of-helper";
>>>>>>>>               status =3D "okay";
>>>>>>>>               pinctrl-names =3D "default";
>>>>>>>>               pinctrl-0 =3D <&pinctrl_gpio>;
>>>>>>>>=20
>>>>>>>>               gsm_on {
>>>>>>>>                       gpio-name =3D "gsm_on";
>>>>>>>>                       gpio =3D <&pioB 13 GPIO_ACTIVE_HIGH>;
>>>>>>>>                       output;
>>>>>>>>                       init-low;
>>>>>>>>               };
>>>>>>>>       };
>>>>>>>>=20
>>>>>>>> This patch needs Alexey Ignatov [PATCH] gpiolib: allow exporti=
ng
>>>>>>>> gpios with
>>>>>>>> custom names.
>>>>>>>=20
>>>>>>>=20
>>>>>>> We will need to see whether the pre-requisite patch can get mer=
ged
>>>>>>> first, but there are a couple of things that are wrong with you=
r patch
>>>>>>> anyway:
>>>>>>>=20
>>>>>>> - it is missing a bindings documentation
>>>>>>> - it is using the legacy integer GPIOs instead of the descripto=
r
>>>>>>> interface (see include/linux/gpio/consumer.h). Since this is DT=
-based,
>>>>>>> there is absolutely no reason to not use the descriptors interf=
ace.
>>>>>>> - it seems quite long for what it needs to do
>>>>>>> - the MODULE_AUTHOR has not signed-off this patch (?)
>>>>>>>=20
>>>>>>> But what makes me nervous is that this encourages more usage of=
 the
>>>>>>> sysfs interface, an in a way that is potentially harmful.
>>>>>>>=20
>>>>>>> Also, I don't know if the DT people will be happy with this ide=
a.
>>>>>>> Since this concerns DT, please also add the devicetree list and=
 get a
>>>>>>> Acked-by for the bindings you want to push by a DT maintainer.
>>>>>>=20
>>>>>>=20
>>>>>> Since I=E2=80=99m the original perpetrator, let me put a few wor=
ds here for
>>>>>> posterity.
>>>>>>=20
>>>>>> This patch was meant as a quick and dirty method for doing the
>>>>>> automatic export
>>>>>> and pinmux configuration from DT on a 3.8 kernel. The kernel API=
s have
>>>>>> moved on
>>>>>> since. It wasn=E2=80=99t meant to be submitted for mainline righ=
t as it is.
>>>>>>=20
>>>>>> Unfortunately (or fortunately for many people) it does what a lo=
t of
>>>>>> people need
>>>>>> i.e. configures a board with heavily pinmuxed GPIO right at boot=
 time.
>>>>>>=20
>>>>>> I=E2=80=99m open at having a small discussion about how to do wh=
at the users of
>>>>>> this patch
>>>>>> do =E2=80=98right=E2=80=99.
>>>>>=20
>>>>>=20
>>>>> Sure, although the discussion might turn out to not be that "smal=
l". :)
>>>>>=20
>>>>=20
>>>> Heh ;)
>>>>=20
>>>>> Pinmux configuration sounds like a job for pinmux more than GPIO,=
 and
>>>>> exporting potentially many GPIOs to user-space sounds like a work=
 for
>>>>> a proper driver.
>>>>>=20
>>>>=20
>>>> I=E2=80=99m afraid that=E2=80=99s not the case. A great many users=
 do not require
>>>> anything
>>>> more than setting a pinmux and the GPIO configuration (input/outpu=
t).
>>>> They can then do low speed I/O using the sysfs interface, without =
having
>>>> to
>>>> use any complex APIs (shell works just fine).
>>>>=20
>>>> Think of stuff like controlling a sprinkler valve, or something li=
ke a
>>>> mechanical
>>>> door detection open state.
>>>=20
>>>=20
>>> That sounds like any kind of arbitrary device that can be temporari=
ly
>>> connected to a set of GPIOs that will be bit-banged. Is my
>>> interpretation correct?
>>=20
>>=20
>> Not only temporarily. For example on/off switch of some hw on board =
like gsm
>> modem.
>=20
> ... which should be handled in-kernel.
>=20

Not really. This is part of some kind user-space ABI but which has to d=
o
with the mapping of an named GPIO in the board schematics to user-space=
=2E

>> Or some optocoupler isoleted in/outs for general use from userspace.
>=20
> ... which should thus be configured from userspace.
>=20

No. It is used from userspace, but the the configuration of such is per=
formed
by board specific means in the kernel.
=20
>>>=20
>>>=20
>>> In that case, I seriously doubt that this should be part of the DT.
>>> Right now the DT is part of the firmware, and an immutable descript=
ion
>>> of the hardware layout of a board - definitely such devices do not =
fit
>>=20
>> This is our case of gpio. It's like LEDs, they are hw layout of boar=
d,
>> but they are in/out instead of LEDs are only output.
>>>=20
>>> into that definition. This might change once the Device Tree Overla=
ys
>>> are merged, but we are not there yet. If the DT maintainers say thi=
s
>>> is a valid use-case for overlays, then I will reconsider my positio=
n,
>>> but in any case it really looks like this could/should be done from
>>> user-space.
>>=20
>> I don't think so as I explained - HW layout of boerd.
>=20
> If it is a static hardware layout that makes the case even clearer -
> these devices should have a proper kernel driver that configures thes=
e
> GPIOs, and exports a proper interface to userspace, not just raw
> GPIOs.

Raw GPIOs is what the user-space application wants to use. There is no
higher abstraction possible.

What these applications need are:

1. A way to map a GPIO to a name that is board invariant. Many boards
move GPIOs around but the function typically stays the same. So for
instance rev-0 might have GARAGE_DOOR to GPIO_A10, and on subsequent
revision rev-1 it might be GARAGE_DOOR to GPIO_B08. The user-space
application that controls everything does not want to deal with revisio=
ns
ideally, just to know that the named GARAGE_DOOR gpio exists.

2. A way to have the pinmux configuration of said GPIO configured witho=
ut
having to do anything explicit. I.e. on am335x the pinmux configuration=
 is
decoupled from the GPIO driver; having a GPIO configured as a GPIO does=
 not
alter the pinmux settings.

3. The user-space facing API must be simple, preferably file based like=
 the
sysfs method right now. It is very simple to use even from within scrip=
ts.
=20
>=20
>> In other way I'm looking forward for DT overlays.
>>>=20
>>>=20
>>> You have almost all the necessary pieces: you can export, configure
>>> and manipulate any GPIO from the sysfs interface. The only thing yo=
u
>>> would be missing is a way to give a name to a GPIO, something that =
can
>>> easily be fixed.
>>=20
>> But isn't it nice to have already exported gpios which are layouted =
out
>> from board. All other unexported gpios aren't connected to anywhere =
on
>> board. So user don't have to export or unexport anything.
>>>=20
>>>=20
>>> Since the devices you want to configure that way are typically
>>> removable or usage-specific, why would you want to store that
>>> information all the way up into the firmware? A commonly accepted
>>> wisdom is that what can be done in user-space should be done in
>>> user-space, and it really looks like this applies here.
>>=20
>> They are NOT removable.
>>>=20
>>>=20
>>> Say you buy a Jetson TK1 to control that sprinkler valve (a good us=
e
>>> for all these GPU cores!). The mainline DT has no knowledge about t=
he
>>> valve, so using your proposed way you will have to re-build and fla=
sh
>>> a custom device tree just to be able to use your sprinkler. If you
>>> decide to assign your board to something else, you will need anothe=
r
>>> DT.
>>=20
>> But if you buy more "real world ready" board with for example 8 powe=
r
>> outputs for sprinkler valves, why has user think about what gpio to
>> export, if there could be valve0 - 7 ready. If he will use only valv=
e0
>> does not mater, all unused gpio can't be used for anything else sinc=
e
>> they has layout for valves.
>=20
> The problem is indeed different.
>=20
> If your sprinkler valves are wired on your board and the lines cannot
> be used for anything else, then what you need is a driver for the
> valve that will acquire the GPIOs and export its own userspace
> interface under /sys/.
>=20
> You device tree must reflect the layout of the board ; in this case
> "here is a valve that uses this GPIO active-low". Saying "this GPIO i=
s
> output active-low and named valve0" is not a good description of your
> hardware.
>=20

There is no higher layer driver API. We don=E2=80=99t want to litter th=
e kernel
with =E2=80=98valve=E2=80=99 drivers, there=E2=80=99s no such thing. Th=
ere=E2=80=99s only digital I/Os
that=E2=80=99s connected to low speed devices.

If we are going for a higher layer API that would be something very thi=
n
like a user-space GPIO driver. Do you see the conundrum?

>>>=20
>>>=20
>>> Instead, have a shell script or a systemd unit tmpfile that will
>>> perform the correct setup at boot time. Then you can easily switch
>>> usages from user-space (systemctl stop sprinkler && systemctl start
>>> doordetect). This is much, much more flexible. At least until the
>>> Device Tree Overlays are merged, but even then this seems overkill.
>>=20
>> I seriously think about it, but I think if LEDs are in DT, GPIOs sho=
uld
>> be there too. In other way, I don't like exporting without given nam=
e.
>=20
> LEDs are actually a perfect example of what you should do. They are a
> simple device often plugged to a GPIO that controls them. We could
> very well do what you propose: export GPIOs named "ledXX" and call it
> a day. Instead we have a driver that exports a proper device node in
> /sys with the operations that are relevant to a LED.
>=20
> Once your GPIOs are assigned to a given function, they are not
> "general purpose" anymore. Therefore you should expose the right
> abstraction to your users, even if that means writing some more code.

Please, try to understand how our users use our linux kernel drivers.

Jiri=E2=80=99s concerns are valid and I have seen his use patterns in c=
ountless
other cases.

Regards

=E2=80=94 Pantelis
  --
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
