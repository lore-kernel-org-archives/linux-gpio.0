From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] RFT: pinctrl: sirf: switch to using allocated state container
Date: Tue, 27 May 2014 15:27:36 +0200
Message-ID: <CACRpkdbQeJwoP7oOzbuhJeuFWxbB5RjFvzqqp8E_1x3=6p-hnQ@mail.gmail.com>
References: <1398287792-19831-1-git-send-email-linus.walleij@linaro.org>
	<1398287792-19831-2-git-send-email-linus.walleij@linaro.org>
	<CAGsJ_4wOdD53Fkf+_CtDqSg5Yvz-1kwaWzMJb357uq5BL9_-7Q@mail.gmail.com>
	<CACRpkdbieXh8iHSCqai03vNbBZ2_2zV1SscXLY+4T9ZprWJEvQ@mail.gmail.com>
	<CAGsJ_4ygjo_cUFR8bUoWsGrZYHSubam4WWcb-TjQJNjgy9rvKQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f54.google.com ([209.85.219.54]:56455 "EHLO
	mail-oa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752191AbaE0N1h (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 27 May 2014 09:27:37 -0400
Received: by mail-oa0-f54.google.com with SMTP id j17so9656519oag.27
        for <linux-gpio@vger.kernel.org>; Tue, 27 May 2014 06:27:36 -0700 (PDT)
In-Reply-To: <CAGsJ_4ygjo_cUFR8bUoWsGrZYHSubam4WWcb-TjQJNjgy9rvKQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Barry Song <baohua@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Barry Song <Baohua.Song@csr.com>, Linux GPIO List <linux-gpio@vger.kernel.org>, DL-SHA-WorkGroupLinux <workgroup.linux@csr.com>

On Sun, May 25, 2014 at 10:26 AM, Barry Song <baohua@kernel.org> wrote:
> 2014-05-09 19:53 GMT+08:00 Linus Walleij <linus.walleij@linaro.org>:
>> On Thu, May 1, 2014 at 2:29 PM, Barry Song <baohua@kernel.org> wrote:
>>> 2014-04-24 5:16 GMT+08:00 Linus Walleij <linus.walleij@linaro.org>:
>>
>>>> This rewrites the SIRF pinctrl driver to allocate a state container
>>>> for the GPIO chip, just as is done for the pin controller, and
>>>> use the gpiochip_add_pin_range() to add the range from the gpiochip
>>>> side rather than adding the range from the pinctrl side.
>>>>
>>>> All resulting changes are done in order to pass around a state
>>>> container rather than refer to a static global object.
>>>>
>>>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>>>
>>> Linus, thanks! but this breaks prima2 pinctrl subsystem, do you have an idea?
>>> otherwise i will do a debug to find the reason.
>>
>> Unfortunately no :-(
>>
>> This is the downside of dry-coding ... I rely on others to help out.
>>
>> See it as a suggestion to what I think should be refactored and how,
>> I'll keep it on a branch as some "TODO" item for the moment.
>>
>
> after moving pinctrl name from sirfsoc-gpio* to dev_name(&pdev->dev) as below:
> - err = gpiochip_add_pin_range(&sgpio->chip.gc, "sirfsoc-gpio*",
> + err = gpiochip_add_pin_range(&sgpio->chip.gc, dev_name(&pdev->dev),
>
> Acked-by: Barry Song <Baohua.Song@csr.com>

Does this mean it works with that change so it's a Tested-by?

I don't want to apply it if something breaks...

Yours,
Linus Walleij
