From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 4/6] pinctrl: aramda-37xx: Add irqchip support
Date: Thu, 23 Mar 2017 11:36:52 +0100
Message-ID: <CACRpkdaVDQMoPXmT++vJ4v9mUejYSy28Ybwb0v2519OeCSPvXg@mail.gmail.com>
References: <20161222172501.16121-1-gregory.clement@free-electrons.com>
 <20161222172501.16121-5-gregory.clement@free-electrons.com>
 <CACRpkdbR-WRT0rJp2CuN6CkZF=J35JUgGHjW7beyaimipz0ehw@mail.gmail.com> <87zigdeczh.fsf@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f180.google.com ([209.85.223.180]:34117 "EHLO
        mail-io0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751620AbdCWKgy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Mar 2017 06:36:54 -0400
Received: by mail-io0-f180.google.com with SMTP id b140so79846577iof.1
        for <linux-gpio@vger.kernel.org>; Thu, 23 Mar 2017 03:36:53 -0700 (PDT)
In-Reply-To: <87zigdeczh.fsf@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>, Omri Itach <omrii@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, Hua Jing <jinghua@marvell.com>, Terry Zhou <bjzhou@marvell.com>

On Wed, Mar 22, 2017 at 1:02 PM, Gregory CLEMENT
<gregory.clement@free-electrons.com> wrote:
>  On ven., d=C3=A9c. 30 2016, Linus Walleij <linus.walleij@linaro.org> wro=
te:
>
>> On Thu, Dec 22, 2016 at 6:24 PM, Gregory CLEMENT
>> <gregory.clement@free-electrons.com> wrote:
>>
>>> The Armada 37xx SoCs can handle interrupt through GPIO. However it can
>>> only manage the edge ones.
>>>
>>> The way the interrupt are managed are classical so we can use the gener=
ic
>>> interrupt chip model.
>>>
>>> The only unusual "feature" is that many interrupts are connected to the
>>> parent interrupt controller. But we do not take advantage of this and u=
se
>>> the chained irq with all of them.
>>>
>>> Signed-off-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
>>
>> So this is very simple and should use GPIOLIB_IRQCHIP.
>>
>> Begin with select GPIOLIB_IRQCHIP in your Kconfig and then look
>> at conversions such as commit 85ae9e512f437cd09bf61564bdba29ab88bab3e3
>> ("pinctrl: bcm2835: switch to GPIOLIB_IRQCHIP")
>> for inspiration.
>
> I switched to the use of GPIOLIB_IRQCHIP however it didn't really simplif=
y
> my code, during the development on the v2 I did a commit only for this
> change and here it is the diffstat:
> 110     72      drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
>
> In my first version I used the generic irqchip so I was able to benefit
> of this framework, by switching to GPIOLIB_IRQCHIP I had to implement
> again some of the functions such as .mask, .unmask an ack.

I still think this is better, so thanks.

If you have ideas of how we could combine generic irqchip with
GPIOLIB_IRQCHIP in an efficient manner, I'd be happy to hear
about it? I want gpiolib core to be involved setting things like
the .irq_request/release_resources() for example, so if you
would proceed with this solution, I would have had you add those
duplicating the gpiolib helpers instead.

Yours,
Linus Walleij
