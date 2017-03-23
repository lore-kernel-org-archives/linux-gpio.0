From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCH 4/6] pinctrl: aramda-37xx: Add irqchip support
Date: Thu, 23 Mar 2017 15:41:11 +0100
Message-ID: <87inn0dpiw.fsf@free-electrons.com>
References: <20161222172501.16121-1-gregory.clement@free-electrons.com>
        <20161222172501.16121-5-gregory.clement@free-electrons.com>
        <CACRpkdbR-WRT0rJp2CuN6CkZF=J35JUgGHjW7beyaimipz0ehw@mail.gmail.com>
        <87zigdeczh.fsf@free-electrons.com>
        <CACRpkdaVDQMoPXmT++vJ4v9mUejYSy28Ybwb0v2519OeCSPvXg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:42107 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751249AbdCWOlO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Mar 2017 10:41:14 -0400
In-Reply-To: <CACRpkdaVDQMoPXmT++vJ4v9mUejYSy28Ybwb0v2519OeCSPvXg@mail.gmail.com>
        (Linus Walleij's message of "Thu, 23 Mar 2017 11:36:52 +0100")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Nadav Haklai <nadavh@marvell.com>, Victor Gu <xigu@marvell.com>, Omri Itach <omrii@marvell.com>, Marcin Wojtas <mw@semihalf.com>, Wilson Ding <dingwei@marvell.com>, Hua Jing <jinghua@marvell.com>, Terry Zhou <bjzhou@marvell.com>

Hi Linus,
 
 On jeu., mars 23 2017, Linus Walleij <linus.walleij@linaro.org> wrote:

>> I switched to the use of GPIOLIB_IRQCHIP however it didn't really simplify
>> my code, during the development on the v2 I did a commit only for this
>> change and here it is the diffstat:
>> 110     72      drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
>>
>> In my first version I used the generic irqchip so I was able to benefit
>> of this framework, by switching to GPIOLIB_IRQCHIP I had to implement
>> again some of the functions such as .mask, .unmask an ack.
>
> I still think this is better, so thanks.

Yes, I understand that from the point of view of the gpio subsystem it
is better to share as code as possible between the driver.

>
> If you have ideas of how we could combine generic irqchip with
> GPIOLIB_IRQCHIP in an efficient manner, I'd be happy to hear
> about it? I want gpiolib core to be involved setting things like
> the .irq_request/release_resources() for example, so if you
> would proceed with this solution, I would have had you add those
> duplicating the gpiolib helpers instead.

Indeed it could be interesting to be able to combine both, however it
does not seem an easy task: at first sight both subsystem would need to
be modified. It is obviously beyond the scope of this driver, but I will
try to have a look on it to see what I could propose in a separate
series.

Gregory

>
> Yours,
> Linus Walleij

-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
