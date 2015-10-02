From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: add DT bindings for existing consumer flags
Date: Fri, 2 Oct 2015 04:25:27 -0700
Message-ID: <CACRpkdau3MKZmdyxU7_7Z+sNYGXdUpXi8LF-Q-rDjXPeAD7TUw@mail.gmail.com>
References: <1443132555-8244-1-git-send-email-linus.walleij@linaro.org>
	<EBC28AC7-9506-4445-861E-9E751467BE03@goldelico.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f45.google.com ([209.85.218.45]:35959 "EHLO
	mail-oi0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751800AbbJBLZ2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 2 Oct 2015 07:25:28 -0400
Received: by oibi136 with SMTP id i136so56203001oib.3
        for <linux-gpio@vger.kernel.org>; Fri, 02 Oct 2015 04:25:28 -0700 (PDT)
In-Reply-To: <EBC28AC7-9506-4445-861E-9E751467BE03@goldelico.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Tony Lindgren <tony@atomide.com>, Grygorii Strashko <grygorii.strashko@ti.com>

On Thu, Sep 24, 2015 at 11:09 PM, H. Nikolaus Schaller
<hns@goldelico.com> wrote:
> Am 25.09.2015 um 00:09 schrieb Linus Walleij <linus.walleij@linaro.or=
g>:

>> @@ -65,6 +69,13 @@ Example of a node using GPIOs:
>> GPIO_ACTIVE_HIGH is 0, so in this example gpio-specifier is "18 0" a=
nd encodes
>> GPIO pin number, and GPIO flags as accepted by the "qe_pio_e" gpio-c=
ontroller.
>>
>> +Optional standard bitfield specifiers for the last cell:
>> +
>> +- Bit 0: 0 means active high, 1 means active low
>> +- Bit 1: 1 means open drain/open collector, see:
>> +           https://en.wikipedia.org/wiki/Open_collector
>> +- Bit 2: 1 means open source/open emitter
(...)
>> #define GPIO_ACTIVE_HIGH 0
>> #define GPIO_ACTIVE_LOW 1
>> +#define GPIO_OPEN_DRAIN 2
>> +#define GPIO_OPEN_SOURCE 4
>
> this would allow to specify open drain and source
> in parallel (6) - which would mean a completely floating
> output=E2=80=A6 Is this intended?

OK...

> Some hardware may also have open_collector
> or open_emitter - which is logically the same.
>
> So I have tried to find a common term covering all
> these cases. It appears to be =E2=80=9Csingle-ended=E2=80=9D
> https://en.wikipedia.org/wiki/Single-ended_triode
> as opposite to =E2=80=9Cpush-pull" outputs (and =E2=80=9Ctri-state").

This is good.

> So I would suggest:
>
> #define GPIO_PUSH_PULL 0
> #define GPIO_SINGLE_ENDED 2
>
> and the distinction with pull-down (open drain/collector)
> and pull-up (open source/emitter) to be combined with
> ACTIVE_HIGH/LOW:
>
> #define GPIO_OPEN_DRAIN (GPIO_SINGLE_ENDED  | GPIO_ACTIVE_LOW)
> #define GPIO_OPEN_SOURCE (GPIO_SINGLE_ENDED  | GPIO_ACTIVE_HIGH)

Makes perfect sense. I'll try to fix the patch.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
