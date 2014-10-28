From: Pantelis Antoniou <panto@antoniou-consulting.com>
Subject: Re: [PATCH] gpio: add gpio_of_helper
Date: Tue, 28 Oct 2014 19:28:35 +0200
Message-ID: <6090A789-9F1B-4787-A9C6-9770A598525D@antoniou-consulting.com>
References: <4b0bcf4679163c0da53e412a47eecd4bb03849b8.1413966148.git.jiri.prchal@aksignal.cz> <CAAVeFuJrmea6yZn2J28ihs3+=FYkZ2QxDv6F7qiq+TPpv_odpw@mail.gmail.com> <E5E0C172-C51D-46DC-AE15-71308BDC9829@antoniou-consulting.com> <CAAVeFuLh99MJXNNuh=L37pNzgun-Qi=3J4uK4eUSC5Qy107Gzw@mail.gmail.com> <E44127F1-1B6B-4BB0-866A-7B142F295FAE@antoniou-consulting.com> <CACRpkdaHOq64NToHa7_ZiBkuQXY03h0J1hZXqskeOnwiGx+p_g@mail.gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from li42-95.members.linode.com ([209.123.162.95]:44945 "EHLO
	li42-95.members.linode.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751591AbaJ1R2k convert rfc822-to-8bit
	(ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 28 Oct 2014 13:28:40 -0400
In-Reply-To: <CACRpkdaHOq64NToHa7_ZiBkuQXY03h0J1hZXqskeOnwiGx+p_g@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, Jiri Prchal <jiri.prchal@aksignal.cz>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Grant Likely <grant.likely@secretlab.ca>

Hi Linus,

> On Oct 28, 2014, at 19:09 , Linus Walleij <linus.walleij@linaro.org> =
wrote:
>=20
> On Wed, Oct 22, 2014 at 11:58 AM, Pantelis Antoniou
> <panto@antoniou-consulting.com> wrote:
>>> On Oct 22, 2014, at 12:41 PM, Alexandre Courbot <gnurou@gmail.com> =
wrote:
>=20
>>> Pinmux configuration sounds like a job for pinmux more than GPIO, a=
nd
>>> exporting potentially many GPIOs to user-space sounds like a work f=
or
>>> a proper driver.
>>=20
>> I=E2=80=99m afraid that=E2=80=99s not the case. A great many users (=
=2E..)
>=20
> How many are many? How long is a piece of string? "Many" may
> refer to every system on the market or me and my friends.
> That claim has to be more specific.
>=20

On every embedded product board that I have worked on for a customer,
invariably user-space GPIO was required for some odd pieces of hardware=
=2E

I guess that=E2=80=99s in the dozen range for me, and Jiri that origina=
lly posted
seems to be doing something similar too.

>> do not require anything
>> more than setting a pinmux
>=20
> Which can be done (from device tree if need be) using pin control
> hogs.
>=20

>> and the GPIO configuration (input/output).
>=20
> And we have GPIO hogs for that in the pipe.
>=20

The original proposal was on January, and there=E2=80=99s a RFC posted =
just a few days back.
I will take a look.

>> They can then do low speed I/O using the sysfs interface, without ha=
ving to
>> use any complex APIs (shell works just fine).
>=20
> So what is added is export capability, which could be done by supplan=
ting
> the GPIO hogging mechanism with some linux,export thing.
>=20

Yes, that would be nice.

>> Think of stuff like controlling a sprinkler valve, or something like=
 a mechanical
>> door detection open state.
>=20
> OK it's in the department of automatic control, which is arguably the
> only technical area where userspace GPIO handling actually makes
> sense.
>=20

Err, let=E2=80=99s just say that I completely disagree, but whatever.

If the new GPIO hogging methods make it in mainline along with the expo=
rt
mechanism it=E2=80=99d be fine by me.

> Yours,
> Linus Walleij

Regards

=E2=80=94 Pantelis

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
