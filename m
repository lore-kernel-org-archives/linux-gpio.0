From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: add gpio_of_helper
Date: Tue, 28 Oct 2014 18:09:45 +0100
Message-ID: <CACRpkdaHOq64NToHa7_ZiBkuQXY03h0J1hZXqskeOnwiGx+p_g@mail.gmail.com>
References: <4b0bcf4679163c0da53e412a47eecd4bb03849b8.1413966148.git.jiri.prchal@aksignal.cz>
	<CAAVeFuJrmea6yZn2J28ihs3+=FYkZ2QxDv6F7qiq+TPpv_odpw@mail.gmail.com>
	<E5E0C172-C51D-46DC-AE15-71308BDC9829@antoniou-consulting.com>
	<CAAVeFuLh99MJXNNuh=L37pNzgun-Qi=3J4uK4eUSC5Qy107Gzw@mail.gmail.com>
	<E44127F1-1B6B-4BB0-866A-7B142F295FAE@antoniou-consulting.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f175.google.com ([209.85.223.175]:47487 "EHLO
	mail-ie0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751647AbaJ1RJq convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 28 Oct 2014 13:09:46 -0400
Received: by mail-ie0-f175.google.com with SMTP id at20so1139725iec.34
        for <linux-gpio@vger.kernel.org>; Tue, 28 Oct 2014 10:09:45 -0700 (PDT)
In-Reply-To: <E44127F1-1B6B-4BB0-866A-7B142F295FAE@antoniou-consulting.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Pantelis Antoniou <panto@antoniou-consulting.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Jiri Prchal <jiri.prchal@aksignal.cz>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Grant Likely <grant.likely@secretlab.ca>

On Wed, Oct 22, 2014 at 11:58 AM, Pantelis Antoniou
<panto@antoniou-consulting.com> wrote:
>> On Oct 22, 2014, at 12:41 PM, Alexandre Courbot <gnurou@gmail.com> w=
rote:

>> Pinmux configuration sounds like a job for pinmux more than GPIO, an=
d
>> exporting potentially many GPIOs to user-space sounds like a work fo=
r
>> a proper driver.
>
> I=E2=80=99m afraid that=E2=80=99s not the case. A great many users (.=
=2E.)

How many are many? How long is a piece of string? "Many" may
refer to every system on the market or me and my friends.
That claim has to be more specific.

> do not require anything
> more than setting a pinmux

Which can be done (from device tree if need be) using pin control
hogs.

> and the GPIO configuration (input/output).

And we have GPIO hogs for that in the pipe.

> They can then do low speed I/O using the sysfs interface, without hav=
ing to
> use any complex APIs (shell works just fine).

So what is added is export capability, which could be done by supplanti=
ng
the GPIO hogging mechanism with some linux,export thing.

> Think of stuff like controlling a sprinkler valve, or something like =
a mechanical
> door detection open state.

OK it's in the department of automatic control, which is arguably the
only technical area where userspace GPIO handling actually makes
sense.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
