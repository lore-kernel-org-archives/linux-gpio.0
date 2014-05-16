From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: make of_get_named_gpiod_flags() private
Date: Fri, 16 May 2014 17:25:35 +0200
Message-ID: <CACRpkdYPcG-16aeMRKdbqGiz+coXE68p3u_tZNV2cYJgdp6j0g@mail.gmail.com>
References: <1399175125-6430-1-git-send-email-acourbot@nvidia.com>
	<CACRpkdYM5W2oVT0y25u+BhWHpVma5fRP8MgmEH46dAyu8L8-2g@mail.gmail.com>
	<CAAVeFuLqF6d+-BHhFzL+w9bFNxbxWV97dsx1Kbd2GD1PNf3UFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f178.google.com ([209.85.214.178]:38544 "EHLO
	mail-ob0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932347AbaEPPZf (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 May 2014 11:25:35 -0400
Received: by mail-ob0-f178.google.com with SMTP id va2so3144703obc.9
        for <linux-gpio@vger.kernel.org>; Fri, 16 May 2014 08:25:35 -0700 (PDT)
In-Reply-To: <CAAVeFuLqF6d+-BHhFzL+w9bFNxbxWV97dsx1Kbd2GD1PNf3UFg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Tue, May 13, 2014 at 3:23 PM, Alexandre Courbot <gnurou@gmail.com> wrote:
> On Tue, May 13, 2014 at 10:17 PM, Linus Walleij
> <linus.walleij@linaro.org> wrote:

>>> This results in all references to gpiod_* functions in of_gpio.h being
>>> gone, which is the way it should be since this file is part of the old
>>> integer GPIO interface.
>>>
>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>
>> This patch broke a lot of drivers so I had to take it out again...
>
> That's unexpected - what happens with it?

I got a horde of mails from Fengguang's autobuilder, I think you got
them as well ... else tell me and I'll dig them up.

Yours,
Linus Walleij
