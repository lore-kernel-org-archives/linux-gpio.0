From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [BUG] LPC32xx gpio driver broken by commit 762c2e46 in 4.9-rc1
Date: Mon, 24 Oct 2016 16:51:03 +0900
Message-ID: <CAK7LNARwVD=OLd0bM31F1kcqWJbQftw8z+bOjzTfPBD8BWLRgw@mail.gmail.com>
References: <1476807799.10214.25.camel@localhost> <CACRpkdZiG8B4K2Hf0mEcuOcq45=Q4n1yD4TDVJgJ+T7K1PMKAg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:47502 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932954AbcJXHvT (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 24 Oct 2016 03:51:19 -0400
Received: from mail-yb0-f172.google.com (mail-yb0-f172.google.com [209.85.213.172]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id u9O7p4mU006032
        for <linux-gpio@vger.kernel.org>; Mon, 24 Oct 2016 16:51:05 +0900
Received: by mail-yb0-f172.google.com with SMTP id g68so68870436ybi.0
        for <linux-gpio@vger.kernel.org>; Mon, 24 Oct 2016 00:51:05 -0700 (PDT)
In-Reply-To: <CACRpkdZiG8B4K2Hf0mEcuOcq45=Q4n1yD4TDVJgJ+T7K1PMKAg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sylvain Lemieux <slemieux.tyco@gmail.com>, Vladimir Zapolskiy <vz@mleia.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, slemieux@tycoint.com

Hi.

2016-10-24 9:46 GMT+09:00 Linus Walleij <linus.walleij@linaro.org>:
> On Tue, Oct 18, 2016 at 6:23 PM, Sylvain Lemieux
> <slemieux.tyco@gmail.com> wrote:
>
>> the current LPC32xx GPIO driver is broken by commit 762c2e46
>> (gpio: of: remove of_gpiochip_and_xlate() and struct gg_data).
>>
>> A call to "of_get_named_gpio" to retrieve the GPIO will
>> always return -EINVAL, except for the first GPIO bank.
>>
>> Prior to this commit, the driver was working properly
>> because of the side-effect of the match function called by
>> "gpiochip_find" inside "of_get_named_gpiod_flags" function.
> (...)
>> Is there any short-term solution that can be done with
>> the existing driver to keep the LPC32xx platform working
>> properly in the 4.9 mainline kernel?
>
> Masahiro, what do you think is the best course to proceed here?
> Can we
> - Restore the behaviour prior to the patches or
> - Fix up all users or
> - Do we have to revert these two patches?
>
> I would prefer not to revert, because I liked the cleanup a lot ...
>


Personally, I do not want to revert, either.

I guess, this discussion comes down to
"is it justified to register multiple chips
associated to a single DT node?"


I feel like, DT properties such as
"gpio-hog", "gpio-ranges" assume one gpio_chip for one node.

We can register multi gpio_chip if we like, but
it looks odd to parse the same DT properties over and over again
looping gpio_chips.


If we move forward to single gpio_chip solution,
please check my RFC
"gpio: of: fix GPIO drivers with multiple gpio_chip for a single node"
as a long-term (but not too long) solution.



-- 
Best Regards
Masahiro Yamada
