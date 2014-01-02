From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: xtensa: depend on HAVE_XTENSA_GPIO32
Date: Thu, 2 Jan 2014 14:21:12 +0100
Message-ID: <CACRpkdakv+Ht+fvxWyAzbUqO2hfJKX=94FwA5SNakx5FcbA+yA@mail.gmail.com>
References: <70c25715a89328b38e636f5f1f84ca34e4590d58.1387177140.git.baruch@tkos.co.il>
	<CACRpkdZ7+=KDskPWDWsS--74DRyW+7_gzX7gpPu1EvkiWXkNMA@mail.gmail.com>
	<20140102121842.GB6589@tarshish>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f169.google.com ([209.85.214.169]:43088 "EHLO
	mail-ob0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750733AbaABNVN (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jan 2014 08:21:13 -0500
Received: by mail-ob0-f169.google.com with SMTP id wm4so14552737obc.0
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jan 2014 05:21:12 -0800 (PST)
In-Reply-To: <20140102121842.GB6589@tarshish>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Baruch Siach <baruch@tkos.co.il>
Cc: Chris Zankel <chris@zankel.net>, Max Filippov <jcmvbkbc@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-xtensa@linux-xtensa.org

On Thu, Jan 2, 2014 at 1:18 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> On Thu, Jan 02, 2014 at 01:07:24PM +0100, Linus Walleij wrote:
>> On Mon, Dec 16, 2013 at 8:05 AM, Baruch Siach <baruch@tkos.co.il> wrote:
>>
>> > Prevent build failure when the selected variant does not support GPIO32.
>> >
>> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>> (...)
>> > +config HAVE_XTENSA_GPIO32
>> > +       bool
>> > +
>> >  config GPIO_XTENSA
>> >         bool "Xtensa GPIO32 support"
>> >         depends on XTENSA
>> > +       depends on HAVE_XTENSA_GPIO32
>>
>> This is just a tautology, you don't need a helper bool
>> for this.
>>
>> Instead just select GPIO_XTENSA from your affected
>> platforms.
>
> But then you force this driver on all users. Why not leave the option to
> disable this driver when the user needs direct access to this hardware, or
> just wants to remove unused code?

Hmm you're right. But if the build fails on !XTENSA, can you not
put a

depends on XTENSA_VARIANT_FSF || XTENSA_VARIANT_DC232B || XTENSA_VARIANT_DC233C

Into drivers/gpio/Kconfig?

It's a simple oneliner...

Usually the only reason not to do this would be to get a wider compile
coverage but the patch says it only compiles on these platforms
anyway :-P

Yours,
Linus Walleij
