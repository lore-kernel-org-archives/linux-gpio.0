From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] gpio: Add driver for TI TPIC2810
Date: Wed, 10 Feb 2016 15:23:43 +0100
Message-ID: <CACRpkdaZvQ0eazTnxbxKmhHWCk2yT3mkBHM=vAMytLK3H6VFyw@mail.gmail.com>
References: <1453738452-23633-1-git-send-email-afd@ti.com>
	<CACRpkdbkwd4K3rav+gfoSO_TqVQqfPXykGF2TWLQ7xWFOOtSaA@mail.gmail.com>
	<56AA2C30.2040708@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f180.google.com ([209.85.214.180]:36641 "EHLO
	mail-ob0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750778AbcBJOXo (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 10 Feb 2016 09:23:44 -0500
Received: by mail-ob0-f180.google.com with SMTP id ba1so28490194obb.3
        for <linux-gpio@vger.kernel.org>; Wed, 10 Feb 2016 06:23:43 -0800 (PST)
In-Reply-To: <56AA2C30.2040708@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Andrew F. Davis" <afd@ti.com>
Cc: "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>, Alexandre Courbot <gnurou@gmail.com>, Javier Martinez Canillas <javier@dowhile0.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Jan 28, 2016 at 3:56 PM, Andrew F. Davis <afd@ti.com> wrote:

>> I understand that it can also be used as a GPIO (and that it
>> is then nice to put leds-gpio on top of it) but then
>> I want a reference to the hardware that actually went ahead
>> and used this as a GPIO chip rather than using a proper
>> GPIO expander.
>
> These don't really have the traditional LED features (current control,
> HW blinking, etc), and all the use cases I've found treat them as GPO,
> including our Industrial Dev Kits (although they run them to test LEDs
> as well as the IO header):
>
> http://www.ti.com/tool/tmdsice3359
> http://www.ti.com/tool/tmdxidk437x
>
> And a couple more that I don't think have any public schematics yet.
>
> Like you said, they can still be used for LEDs with leds-gpio, as they
> don't have any LED specific features I figure this way we get both
> uses with one driver.

Fair enough, merged as you see.

Yours,
Linus Walleij
