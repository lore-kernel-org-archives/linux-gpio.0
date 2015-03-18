From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: at91: move lock/unlock_as_irq calls into
 request/release resources methods
Date: Wed, 18 Mar 2015 02:06:03 +0100
Message-ID: <CACRpkdbS1sYR9D8iBjnKUt3Urv5VXn3axR5OddPQOVhxvh7GAQ@mail.gmail.com>
References: <1423419822-6258-1-git-send-email-boris.brezillon@free-electrons.com>
	<CACRpkdazTt+_9m-iWEee2gJy4MQ+QNo3Rb2JY9hVSSXK2-dJRw@mail.gmail.com>
	<54FEAC8F.1040206@atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:34827 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753930AbbCRBGE convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Mar 2015 21:06:04 -0400
Received: by oiag65 with SMTP id g65so24043342oia.2
        for <linux-gpio@vger.kernel.org>; Tue, 17 Mar 2015 18:06:03 -0700 (PDT)
In-Reply-To: <54FEAC8F.1040206@atmel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Nicolas Ferre <nicolas.ferre@atmel.com>
Cc: Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>, Boris Brezillon <boris.brezillon@free-electrons.com>, Alexandre Belloni <alexandre.belloni@free-electrons.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Jean-Jacques Hiblot <jjhiblot@traphandler.com>

On Tue, Mar 10, 2015 at 9:34 AM, Nicolas Ferre <nicolas.ferre@atmel.com=
> wrote:
> Le 09/03/2015 17:14, Linus Walleij a =C3=A9crit :
>> On Sun, Feb 8, 2015 at 7:23 PM, Boris Brezillon
>> <boris.brezillon@free-electrons.com> wrote:
>>
>>> The gpiochip_lock_as_irq call can fail and return an error, while t=
he
>>> irq_startup is not expected to fail (returns an unsigned int which =
is not
>>> checked by irq core code).
>>>
>>> irq_request/release_resources functions have been created to addres=
s this
>>> problem.
>>>
>>> Move gpiochip_lock/unlock_as_irq calls into
>>> irq_request/release_resources functions to prevent using a gpio as =
an irq
>>> if the gpiochip_lock_as_irq call failed.
>>>
>>> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>>
>> Patch applied with all the ACKs.
>
> Hi Linus,
>
> As suggested earlier, do you think it can be scheduled for the 4.0-rc
> phase as a "fix"?

OK argh had to rebase my tree to get the patch out of the devel
branch but what can I do.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
