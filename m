From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: bcm2835: Fix initial value for direction_output
Date: Thu, 10 Dec 2015 19:08:59 +0100
Message-ID: <CACRpkdaTM-1hD1h_R8gQWOyru_eAd-bvwCM9XBvMyGUmvinmow@mail.gmail.com>
References: <1447893147-9458-1-git-send-email-stefan.wahren@i2se.com>
	<565E6B22.3060808@wwwdotorg.org>
	<565EFF99.7020704@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f47.google.com ([209.85.218.47]:36355 "EHLO
	mail-oi0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752746AbbLJSJA (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Dec 2015 13:09:00 -0500
Received: by oiww189 with SMTP id w189so50916467oiw.3
        for <linux-gpio@vger.kernel.org>; Thu, 10 Dec 2015 10:09:00 -0800 (PST)
In-Reply-To: <565EFF99.7020704@i2se.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Lee Jones <lee@kernel.org>, Eric Anholt <eric@anholt.net>, linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, Martin Sperl <kernel@martin.sperl.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Wed, Dec 2, 2015 at 3:26 PM, Stefan Wahren <stefan.wahren@i2se.com> wrote:
> Am 02.12.2015 um 04:53 schrieb Stephen Warren:
>> On 11/18/2015 05:32 PM, Stefan Wahren wrote:
>>> Currently the provided initial value for bcm2835_gpio_direction_output
>>> has no effect. So fix this issue by changing the value before
>>> changing the GPIO direction. As a result we need to move the function below
>>> bcm2835_gpio_set.
>> Acked-by: Stephen Warren <swarren@wwwdotorg.org>
>>
>
> Should i resend the patch with
>
> Suggested-by: Martin Sperl <kernel@martin.sperl.org>

No, I added this when applying the patch.

Yours,
Linus Walleij
