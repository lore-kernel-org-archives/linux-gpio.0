From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [Question] How to implement GPIO driver for sparse hw numbers?
Date: Thu, 16 Jul 2015 13:07:20 +0900
Message-ID: <CAK7LNATaT74Cr8S6WBkgezQJfnh6w4qRe8dqxS0_Zz6c_onJfA@mail.gmail.com>
References: <CAK7LNARNUqjwcOvTwjsq8ck=hPgn83Gk=1vikkmq5KUxmYSjnQ@mail.gmail.com>
	<CACRpkdYU62-2VV0FoJAO6-YA587w3wQ7ZpPXDEYTM9DdN51rUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conssluserg001.nifty.com ([202.248.44.39]:25697 "EHLO
	conssluserg001-v.nifty.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751188AbbGPEHb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Thu, 16 Jul 2015 00:07:31 -0400
In-Reply-To: <CACRpkdYU62-2VV0FoJAO6-YA587w3wQ7ZpPXDEYTM9DdN51rUw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Linus,


2015-07-15 7:04 GMT+09:00 Linus Walleij <linus.walleij@linaro.org>:
> On Fri, Jun 19, 2015 at 5:27 AM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>
>> In my understanding, the GPIO driver framework requires that
>> the hw numbers should be contiguous within each GPIO chip.
>
> Yes but noone says that .request() to the driver has to succeed
> on every GPIO so just cover all GPIOs from 0 to 307 with
> your GPIO chip and then implement your "holes" in the GPIO
> range from 0 to 307 by letting .request() fail.

Thanks,
At first I also thought about it, but finally I did not adopt it.

Having holes in the GPIO range is not handy because:

[1] When we map a gpio range into a pin range,
    we must divide "gpio-ranges" property into many lines
       gpio-ranges = <phandle  0    x      8
                      phandle  10   (x+8)  8
                      phandle  20   (x+16) 8
                      phandle  30   (x+24) 8
                              ...

[2] implementation of .set_multiple() gets more complicated




-- 
Best Regards
Masahiro Yamada
