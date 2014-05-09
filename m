From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] RFT: pinctrl: sirf: switch to using allocated state container
Date: Fri, 9 May 2014 13:53:08 +0200
Message-ID: <CACRpkdbieXh8iHSCqai03vNbBZ2_2zV1SscXLY+4T9ZprWJEvQ@mail.gmail.com>
References: <1398287792-19831-1-git-send-email-linus.walleij@linaro.org>
	<1398287792-19831-2-git-send-email-linus.walleij@linaro.org>
	<CAGsJ_4wOdD53Fkf+_CtDqSg5Yvz-1kwaWzMJb357uq5BL9_-7Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f177.google.com ([209.85.214.177]:37273 "EHLO
	mail-ob0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754915AbaEILxJ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 9 May 2014 07:53:09 -0400
Received: by mail-ob0-f177.google.com with SMTP id gq1so4518082obb.36
        for <linux-gpio@vger.kernel.org>; Fri, 09 May 2014 04:53:08 -0700 (PDT)
In-Reply-To: <CAGsJ_4wOdD53Fkf+_CtDqSg5Yvz-1kwaWzMJb357uq5BL9_-7Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Barry Song <baohua@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Barry Song <Baohua.Song@csr.com>, Linux GPIO List <linux-gpio@vger.kernel.org>, DL-SHA-WorkGroupLinux <workgroup.linux@csr.com>

On Thu, May 1, 2014 at 2:29 PM, Barry Song <baohua@kernel.org> wrote:
> 2014-04-24 5:16 GMT+08:00 Linus Walleij <linus.walleij@linaro.org>:

>> This rewrites the SIRF pinctrl driver to allocate a state container
>> for the GPIO chip, just as is done for the pin controller, and
>> use the gpiochip_add_pin_range() to add the range from the gpiochip
>> side rather than adding the range from the pinctrl side.
>>
>> All resulting changes are done in order to pass around a state
>> container rather than refer to a static global object.
>>
>> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> Linus, thanks! but this breaks prima2 pinctrl subsystem, do you have an idea?
> otherwise i will do a debug to find the reason.

Unfortunately no :-(

This is the downside of dry-coding ... I rely on others to help out.

See it as a suggestion to what I think should be refactored and how,
I'll keep it on a branch as some "TODO" item for the moment.

Yours,
Linus Walleij
