From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: baytrail: show output gpio state correctly on
 Intel Baytrail
Date: Fri, 31 Oct 2014 09:12:16 +0100
Message-ID: <CACRpkdaN5hNWFUOFbHLm8HgZEKVSETUgVF4Cn4UbMQxNEg46Vw@mail.gmail.com>
References: <1412355319-18946-1-git-send-email-david.a.cohen@linux.intel.com>
	<1413224639-21552-1-git-send-email-david.a.cohen@linux.intel.com>
	<20141013191405.GB29810@saruman>
	<20141013192404.GB4034@psi-dev26.jf.intel.com>
	<20141013192632.GC29810@saruman>
	<20141013193618.GD29810@saruman>
	<CACRpkdYDiFvwsPwqACXS2bZU9peUyJEn-fpzVqZKYXseuEFGGA@mail.gmail.com>
	<20141028144249.GD8123@saruman>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ie0-f169.google.com ([209.85.223.169]:42867 "EHLO
	mail-ie0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750894AbaJaIMR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 31 Oct 2014 04:12:17 -0400
Received: by mail-ie0-f169.google.com with SMTP id tr6so782984ieb.14
        for <linux-gpio@vger.kernel.org>; Fri, 31 Oct 2014 01:12:16 -0700 (PDT)
In-Reply-To: <20141028144249.GD8123@saruman>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>
Cc: David Cohen <david.a.cohen@linux.intel.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, stable <stable@vger.kernel.org>

On Tue, Oct 28, 2014 at 3:42 PM, Felipe Balbi <balbi@ti.com> wrote:
> On Tue, Oct 28, 2014 at 11:15:20AM +0100, Linus Walleij wrote:
>> On Mon, Oct 13, 2014 at 9:36 PM, Felipe Balbi <balbi@ti.com> wrote:
>> > On Mon, Oct 13, 2014 at 02:26:32PM -0500, Felipe Balbi wrote:
>>
>> > I also noticed that this is missing:
>> >
>> > diff --git a/drivers/pinctrl/pinctrl-baytrail.c b/drivers/pinctrl/pinctrl-baytrail.c
>> > index e12e5b0..7db5ab9 100644
>> > --- a/drivers/pinctrl/pinctrl-baytrail.c
>> > +++ b/drivers/pinctrl/pinctrl-baytrail.c
>> > @@ -614,3 +614,9 @@ static int __init byt_gpio_init(void)
>> >  }
>> >
>> >  subsys_initcall(byt_gpio_init);
>> > +
>> > +static void __exit byt_gpio_exit(void)
>> > +{
>> > +       platform_driver_unregister(&byt_gpio_driver);
>> > +}
>> > +module_exit(byt_gpio_exit);
>>
>> But the Baytrail driver is not a loadable module, it is bool:
>>
>> config PINCTRL_BAYTRAIL
>>         bool "Intel Baytrail GPIO pin control"
>>         depends on GPIOLIB && ACPI && X86
>>
>> (...)
>>
>> So I guess it won't need handling for removal, as it can only
>> be compiled-in.
>
> you can still unbind it through sysfs, right ? The thing also already
> provides a ->remove() method anyway.

Yes you're right of course...

But another way to get rid of the dilemma is to set
.suppress_bind_attrs = true on the .driver field of the
device driver. The one can't unbind it through sysfs anymore.

        .driver = {
                .name   = "foo",
                .suppress_bind_attrs = true,
        },

So one of them need to be done.

I suspect this is a kind of common problem...

Yours,
Linus Walleij
