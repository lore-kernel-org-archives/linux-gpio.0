From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: [PATCH] gpio: add gpio_of_helper
Date: Wed, 22 Oct 2014 18:41:34 +0900
Message-ID: <CAAVeFuLh99MJXNNuh=L37pNzgun-Qi=3J4uK4eUSC5Qy107Gzw@mail.gmail.com>
References: <4b0bcf4679163c0da53e412a47eecd4bb03849b8.1413966148.git.jiri.prchal@aksignal.cz>
 <CAAVeFuJrmea6yZn2J28ihs3+=FYkZ2QxDv6F7qiq+TPpv_odpw@mail.gmail.com> <E5E0C172-C51D-46DC-AE15-71308BDC9829@antoniou-consulting.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f181.google.com ([209.85.223.181]:34694 "EHLO
	mail-ie0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932123AbaJVJlz convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Oct 2014 05:41:55 -0400
Received: by mail-ie0-f181.google.com with SMTP id y20so2955812ier.26
        for <linux-gpio@vger.kernel.org>; Wed, 22 Oct 2014 02:41:55 -0700 (PDT)
In-Reply-To: <E5E0C172-C51D-46DC-AE15-71308BDC9829@antoniou-consulting.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Pantelis Antoniou <panto@antoniou-consulting.com>
Cc: Jiri Prchal <jiri.prchal@aksignal.cz>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>

On Wed, Oct 22, 2014 at 6:24 PM, Pantelis Antoniou
<panto@antoniou-consulting.com> wrote:
> Hi Alexandre,
>
>> On Oct 22, 2014, at 12:18 PM, Alexandre Courbot <gnurou@gmail.com> w=
rote:
>>
>> On Wed, Oct 22, 2014 at 5:26 PM, Jiri Prchal <jiri.prchal@aksignal.c=
z> wrote:
>>> This patch adds new driver "gpio-of-helper", witch has possibility =
to export
>>> gpios defined in dt. It exports them in defined name under
>>> /sysfs/class/gpio/name.
>>> It's rebased from Pantelis Antoniou patch to new kernel.
>>> Usage example:
>>>        gpio {
>>>                compatible =3D "gpio-of-helper";
>>>                status =3D "okay";
>>>                pinctrl-names =3D "default";
>>>                pinctrl-0 =3D <&pinctrl_gpio>;
>>>
>>>                gsm_on {
>>>                        gpio-name =3D "gsm_on";
>>>                        gpio =3D <&pioB 13 GPIO_ACTIVE_HIGH>;
>>>                        output;
>>>                        init-low;
>>>                };
>>>        };
>>>
>>> This patch needs Alexey Ignatov [PATCH] gpiolib: allow exporting gp=
ios with
>>> custom names.
>>
>> We will need to see whether the pre-requisite patch can get merged
>> first, but there are a couple of things that are wrong with your pat=
ch
>> anyway:
>>
>> - it is missing a bindings documentation
>> - it is using the legacy integer GPIOs instead of the descriptor
>> interface (see include/linux/gpio/consumer.h). Since this is DT-base=
d,
>> there is absolutely no reason to not use the descriptors interface.
>> - it seems quite long for what it needs to do
>> - the MODULE_AUTHOR has not signed-off this patch (?)
>>
>> But what makes me nervous is that this encourages more usage of the
>> sysfs interface, an in a way that is potentially harmful.
>>
>> Also, I don't know if the DT people will be happy with this idea.
>> Since this concerns DT, please also add the devicetree list and get =
a
>> Acked-by for the bindings you want to push by a DT maintainer.
>
> Since I=E2=80=99m the original perpetrator, let me put a few words he=
re for posterity.
>
> This patch was meant as a quick and dirty method for doing the automa=
tic export
> and pinmux configuration from DT on a 3.8 kernel. The kernel APIs hav=
e moved on
> since. It wasn=E2=80=99t meant to be submitted for mainline right as =
it is.
>
> Unfortunately (or fortunately for many people) it does what a lot of =
people need
> i.e. configures a board with heavily pinmuxed GPIO right at boot time=
=2E
>
> I=E2=80=99m open at having a small discussion about how to do what th=
e users of this patch
> do =E2=80=98right=E2=80=99.

Sure, although the discussion might turn out to not be that "small". :)

Pinmux configuration sounds like a job for pinmux more than GPIO, and
exporting potentially many GPIOs to user-space sounds like a work for
a proper driver.

We need to understand why this is needed, and then see if the DT
bindings are acceptable before going any further.
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
