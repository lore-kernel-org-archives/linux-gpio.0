From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCHv2 0/6] mcp23s08 pinconf support
Date: Fri, 19 May 2017 10:20:42 +0200
Message-ID: <CAK8P3a3D4r2QTjhnaRrJi2fQxm6TM=-Dsudd+sfnDHpVswv2Rw@mail.gmail.com>
References: <20170427141937.762-1-sebastian.reichel@collabora.co.uk>
 <CACRpkdZVQJ+KvoKVzfMjGeaPMJ4MT+uf3HSr5JixBx5MgJ8xeQ@mail.gmail.com>
 <20170428084344.exegdfcfblbx3k5w@earth> <CACRpkdYo3M2_f-36KiYcRCJEwDXj6Mqpf=qpovmK=rhgVzbp0w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:33522 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755621AbdESIUn (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 19 May 2017 04:20:43 -0400
In-Reply-To: <CACRpkdYo3M2_f-36KiYcRCJEwDXj6Mqpf=qpovmK=rhgVzbp0w@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sebastian Reichel <sebastian.reichel@collabora.co.uk>, Alexandre Courbot <gnurou@gmail.com>, Steven Miao <realmz6@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Sylvain Lemieux <slemieux.tyco@gmail.com>, Enric Balletbo i Serra <enric.balletbo@collabora.co.uk>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, adi-buildroot-devel@lists.sourceforge.net, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, May 11, 2017 at 3:38 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Fri, Apr 28, 2017 at 10:43 AM, Sebastian Reichel
> <sebastian.reichel@collabora.co.uk> wrote:
>> On Fri, Apr 28, 2017 at 10:22:24AM +0200, Linus Walleij wrote:
>>> On Thu, Apr 27, 2017 at 4:19 PM, Sebastian Reichel
>>> <sebastian.reichel@collabora.co.uk> wrote:
>>>
>>> > Back in January I sent patches adding pinconf support
>>> > for configuring mcp23s08's pull-ups. Apart from my
>>> > custom Raspberry Pi setup the pull-up support is also
>>> > needed by Toby Churchill SL50.
>>> >
>>> > Changes since PATCHv1:
>>> >  * Add patch moving mcp23s08 from gpio/ to pinctrl/
>>> >  * Add patches updating config references in arch/
>>> >  * Add patch removing pdata support for pullup config
>>>
>>> I like this and I would like to queue it early in the v4.13
>>> development cycle.
>>
>> Thanks.
>
> I wanna queue this.
>
> Can you resend this patch set based on Torvald's HEAD or v4.12-rc1
> when that is out after the weekend and:
>
> - Request explicit ACKs from blackfin and ARM maintainers.
>   (The ARM people are at arm@kernel.org)

In case you are still waiting (sorry for the delay)

Acked-by: Arnd Bergmann <arnd@arndb.de>
