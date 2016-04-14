From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] MAINTAINERS: gpio: add DT bindings directory
Date: Thu, 14 Apr 2016 13:29:27 +0200
Message-ID: <CACRpkdYRA55-YPedSzf49fwVg6GG9r6vdjB7Cvzs7jdcituq0w@mail.gmail.com>
References: <1460476673-3133-1-git-send-email-wsa@the-dreams.de>
	<CACRpkdad2Ps6bqgPJRv7-8jx848UPiAEQh9FWyUEx9uuAgzc0g@mail.gmail.com>
	<CAMuHMdV79ZSUkTCO0Cde6VGE9R-8AdqDod1nmRV8L89K3NCRJQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f41.google.com ([209.85.218.41]:35423 "EHLO
	mail-oi0-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752595AbcDNL32 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 14 Apr 2016 07:29:28 -0400
Received: by mail-oi0-f41.google.com with SMTP id p188so90191339oih.2
        for <linux-gpio@vger.kernel.org>; Thu, 14 Apr 2016 04:29:27 -0700 (PDT)
In-Reply-To: <CAMuHMdV79ZSUkTCO0Cde6VGE9R-8AdqDod1nmRV8L89K3NCRJQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-renesas-soc@vger.kernel.org

On Wed, Apr 13, 2016 at 10:11 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Wed, Apr 13, 2016 at 9:23 AM, Linus Walleij <linus.walleij@linaro.org> wrote:
>> On Tue, Apr 12, 2016 at 5:57 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
>>
>>> From: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>>
>>> Helps get_maintainer.pl to find the right people.
>>>
>>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>>
>> OK patch applied.
>>
>> Maybe we should move the ACPI specs into the kernel
>> as well as that stuff is taking my time as well now, apart
>> from DT :/
>
> Wasn't the plan to move the DT bindings out of the kernel tree instead?

That never seems to happen. Who would dare to try even.

The effect of doing that would probably not be desireable: the
kernel maintainers would maybe stop caring about DT bindings
and not providing any help at all, and noone would be able to
sensibly enforce that drivers and bindings go hand-in-hand.

I would think it was a good idea if there was an entity
outside the kernel community with the right manpower and
time budget to actually just do DT reviews, participating on
bindings and kernel driver reviews alike. But that needs to
come first, then *maybe* this entity can maintain their
own tree, with a copy in the kernel for a trial period and
then move it out.

Yours,
Linus Walleij
