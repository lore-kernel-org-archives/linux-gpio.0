From: =?UTF-8?B?SmnFmcOtIFByY2hhbA==?= <jiri.prchal@aksignal.cz>
Subject: Re: [PATCH] gpio: add gpio_of_helper
Date: Wed, 29 Oct 2014 08:55:45 +0100
Message-ID: <54509D81.4070907@aksignal.cz>
References: <4b0bcf4679163c0da53e412a47eecd4bb03849b8.1413966148.git.jiri.prchal@aksignal.cz> <CAAVeFuJrmea6yZn2J28ihs3+=FYkZ2QxDv6F7qiq+TPpv_odpw@mail.gmail.com> <E5E0C172-C51D-46DC-AE15-71308BDC9829@antoniou-consulting.com> <CAAVeFuLh99MJXNNuh=L37pNzgun-Qi=3J4uK4eUSC5Qy107Gzw@mail.gmail.com> <E44127F1-1B6B-4BB0-866A-7B142F295FAE@antoniou-consulting.com> <CACRpkdaHOq64NToHa7_ZiBkuQXY03h0J1hZXqskeOnwiGx+p_g@mail.gmail.com> <6090A789-9F1B-4787-A9C6-9770A598525D@antoniou-consulting.com>
Reply-To: jiri.prchal@aksignal.cz
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from router.aksignal.cz ([188.175.113.102]:46804 "EHLO
	router.aksignal.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755860AbaJ2Hzu (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Oct 2014 03:55:50 -0400
In-Reply-To: <6090A789-9F1B-4787-A9C6-9770A598525D@antoniou-consulting.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Pantelis Antoniou <panto@antoniou-consulting.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Grant Likely <grant.likely@secretlab.ca>

Hi all,

Dne 28.10.2014 v 18:28 Pantelis Antoniou napsal(a):
> Hi Linus,
>
>> On Oct 28, 2014, at 19:09 , Linus Walleij <linus.walleij@linaro.org>=
 wrote:
>>
>> On Wed, Oct 22, 2014 at 11:58 AM, Pantelis Antoniou
>> <panto@antoniou-consulting.com> wrote:
>>>> On Oct 22, 2014, at 12:41 PM, Alexandre Courbot <gnurou@gmail.com>=
 wrote:
>>
>>>> Pinmux configuration sounds like a job for pinmux more than GPIO, =
and
>>>> exporting potentially many GPIOs to user-space sounds like a work =
for
>>>> a proper driver.
>>>
>>> I=E2=80=99m afraid that=E2=80=99s not the case. A great many users =
(...)
>>
>> How many are many? How long is a piece of string? "Many" may
>> refer to every system on the market or me and my friends.
>> That claim has to be more specific.
>>
>
> On every embedded product board that I have worked on for a customer,
> invariably user-space GPIO was required for some odd pieces of hardwa=
re.
>
> I guess that=E2=80=99s in the dozen range for me, and Jiri that origi=
nally posted
> seems to be doing something similar too.
Yes.
>
>>> do not require anything
>>> more than setting a pinmux
>>
>> Which can be done (from device tree if need be) using pin control
>> hogs.
>>
>
>>> and the GPIO configuration (input/output).
>>
>> And we have GPIO hogs for that in the pipe.
>>
>
> The original proposal was on January, and there=E2=80=99s a RFC poste=
d just a few days back.
> I will take a look.
>
>>> They can then do low speed I/O using the sysfs interface, without h=
aving to
>>> use any complex APIs (shell works just fine).
>>
>> So what is added is export capability, which could be done by suppla=
nting
>> the GPIO hogging mechanism with some linux,export thing.
>>
>
> Yes, that would be nice.
That would be nice for me too, I'll try it later, now I have more urgen=
t work.
>
>>> Think of stuff like controlling a sprinkler valve, or something lik=
e a mechanical
>>> door detection open state.
>>
>> OK it's in the department of automatic control, which is arguably th=
e
>> only technical area where userspace GPIO handling actually makes
>> sense.
>>
>
> Err, let=E2=80=99s just say that I completely disagree, but whatever.
>
> If the new GPIO hogging methods make it in mainline along with the ex=
port
> mechanism it=E2=80=99d be fine by me.
>
>> Yours,
>> Linus Walleij
>
> Regards
>
> =E2=80=94 Pantelis

Yours
Jiri
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
