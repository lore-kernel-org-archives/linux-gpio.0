From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: xtensa: depend on HAVE_XTENSA_GPIO32
Date: Thu, 2 Jan 2014 18:04:57 +0100
Message-ID: <CACRpkdYcFJA1tDzS3yh3yhMGFG15Db0B5eg=fxPuxrLFKxyqHw@mail.gmail.com>
References: <70c25715a89328b38e636f5f1f84ca34e4590d58.1387177140.git.baruch@tkos.co.il>
	<CACRpkdZ7+=KDskPWDWsS--74DRyW+7_gzX7gpPu1EvkiWXkNMA@mail.gmail.com>
	<20140102121842.GB6589@tarshish>
	<CACRpkdakv+Ht+fvxWyAzbUqO2hfJKX=94FwA5SNakx5FcbA+yA@mail.gmail.com>
	<20140102133333.GF6589@tarshish>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f44.google.com ([209.85.219.44]:44015 "EHLO
	mail-oa0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751833AbaABRE5 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jan 2014 12:04:57 -0500
Received: by mail-oa0-f44.google.com with SMTP id m1so15068217oag.17
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jan 2014 09:04:57 -0800 (PST)
In-Reply-To: <20140102133333.GF6589@tarshish>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Baruch Siach <baruch@tkos.co.il>
Cc: Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-xtensa@linux-xtensa.org

On Thu, Jan 2, 2014 at 2:33 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> On Thu, Jan 02, 2014 at 02:21:12PM +0100, Linus Walleij wrote:
>> On Thu, Jan 2, 2014 at 1:18 PM, Baruch Siach <baruch@tkos.co.il> wrote:
>> > On Thu, Jan 02, 2014 at 01:07:24PM +0100, Linus Walleij wrote:
>> >> On Mon, Dec 16, 2013 at 8:05 AM, Baruch Siach <baruch@tkos.co.il> wrote:
>> >>
>> >> > Prevent build failure when the selected variant does not support GPIO32.
>> >> >
>> >> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>> >> (...)
>> >> > +config HAVE_XTENSA_GPIO32
>> >> > +       bool
>> >> > +
>> >> >  config GPIO_XTENSA
>> >> >         bool "Xtensa GPIO32 support"
>> >> >         depends on XTENSA
>> >> > +       depends on HAVE_XTENSA_GPIO32
>> >>
>> >> This is just a tautology, you don't need a helper bool
>> >> for this.
>> >>
>> >> Instead just select GPIO_XTENSA from your affected
>> >> platforms.
>> >
>> > But then you force this driver on all users. Why not leave the option to
>> > disable this driver when the user needs direct access to this hardware, or
>> > just wants to remove unused code?
>>
>> Hmm you're right. But if the build fails on !XTENSA, can you not
>> put a
>>
>> depends on XTENSA_VARIANT_FSF || XTENSA_VARIANT_DC232B || XTENSA_VARIANT_DC233C
>>
>> Into drivers/gpio/Kconfig?
>>
>> It's a simple oneliner...
>
> IMO, having a 'select HAVE_XTENSA_GPIO32' in arch/xtensa/Kconfig would makes
> it clear that this is something to consider when adding another Xtensa
> variant. Also, this dependency line might (hopefully will) become quite long.
> But if you object I'll change that.

I have no strong opinion on this, I would leave that decision to the
Xtensa maintainer.

Yours,
Linus Walleij
