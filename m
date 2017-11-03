From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] pinctrl: armada-37xx: remove unused variable
Date: Fri, 3 Nov 2017 10:11:21 +0100
Message-ID: <CAK8P3a2eL_PDic4J_5oMNeLBYU1698TsCBbDaWLxuP+wS30FzA@mail.gmail.com>
References: <20171102142932.774199-1-arnd@arndb.de> <CACRpkdbAfBXMbgiG3avQ7CUwZdoY1_qGJt-tq-sDLoR4z0zOew@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ot0-f193.google.com ([74.125.82.193]:51029 "EHLO
        mail-ot0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754141AbdKCJLW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Nov 2017 05:11:22 -0400
In-Reply-To: <CACRpkdbAfBXMbgiG3avQ7CUwZdoY1_qGJt-tq-sDLoR4z0zOew@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Ken Ma <make@marvell.com>, Thierry Reding <treding@nvidia.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Nov 3, 2017 at 8:46 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Thu, Nov 2, 2017 at 3:29 PM, Arnd Bergmann <arnd@arndb.de> wrote:
>
>> A cleanup left behind a temporary variable that is now unused:
>>
>> drivers/pinctrl/mvebu/pinctrl-armada-37xx.c: In function 'armada_37xx_irq_startup':
>> drivers/pinctrl/mvebu/pinctrl-armada-37xx.c:693:20: error: unused variable 'chip' [-Werror=unused-variable]
>>
>> This removes the declarations as well.
>>
>> Fixes: 3ee9e605caea ("pinctrl: armada-37xx: Stop using struct gpio_chip.irq_base")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>
> It is used on the head of development, so it's fixed in -next.
>
> Is it such a big issue for v4.14 that you think I should send it
> to Torvalds as a fix at this point or can I just leave it?

I'm confused. The build warning showed up in linux-next yesterday after
3ee9e605caea got merged, which removes the user of that variable.
In v4.14 it is still used.

         Arnd
