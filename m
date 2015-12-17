From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 092/182] pinctrl: bcm2835: use gpiochip data pointer
Date: Thu, 17 Dec 2015 14:40:28 +0100
Message-ID: <CACRpkdbo0B3Cb=O0j_Lh4GzFCg06bLjdcg3Mh69ALdFGMHtZng@mail.gmail.com>
References: <1449667836-1932-1-git-send-email-linus.walleij@linaro.org>
	<566A5D30.2040401@wwwdotorg.org>
	<CACRpkdZxzin43oHNo9dcwq8br=ibFyPdsAZYi8cULZ9vQ7Ng4A@mail.gmail.com>
	<87y4cwvrft.fsf@eliezer.anholt.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:35023 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750936AbbLQNk3 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 17 Dec 2015 08:40:29 -0500
Received: by mail-oi0-f47.google.com with SMTP id l9so13987011oia.2
        for <linux-gpio@vger.kernel.org>; Thu, 17 Dec 2015 05:40:29 -0800 (PST)
In-Reply-To: <87y4cwvrft.fsf@eliezer.anholt.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Eric Anholt <eric@anholt.net>
Cc: Stephen Warren <swarren@wwwdotorg.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, Michael Welling <mwelling@ieee.org>, Markus Pargmann <mpa@pengutronix.de>

On Mon, Dec 14, 2015 at 7:03 PM, Eric Anholt <eric@anholt.net> wrote:
> Linus Walleij <linus.walleij@linaro.org> writes:
>
>> On Fri, Dec 11, 2015 at 6:20 AM, Stephen Warren <swarren@wwwdotorg.org> wrote:
>>> On 12/09/2015 06:30 AM, Linus Walleij wrote:
>>>> This makes the driver use the data pointer added to the gpio_chip
>>>> to store a pointer to the state container instead of relying on
>>>> container_of().
>>>
>>> This looks like it's fine, but I wonder what is the justification for
>>> the change? It might be good to mention that in the commit description.
>>
>> It is in patch 000/182:
>> http://marc.info/?l=linux-gpio&m=144966662402660&w=2
>
> Thanks, that helps.
>
> I don't think it makes much sense to remove a module for a device that's
> opened,

That is not what we're afraid of really. We are afraid of the actual
device going away, like a GPIO on a USB cable that someone
unplugs.

> Acked-by: Eric Anholt <eric@anholt.net>

Thanks.

Yours,
Linus Walleij
