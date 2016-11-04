From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] pinctrl: bcm2835: reduce GPPUD set-up time
Date: Fri, 4 Nov 2016 16:29:22 +0100
Message-ID: <CACRpkdap=+mEbHDoEO4HUrAPKAQ3mGvHT=icHG4FyJiA8qP7Ow@mail.gmail.com>
References: <1477920093-28180-1-git-send-email-stefan.wahren@i2se.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qk0-f180.google.com ([209.85.220.180]:36056 "EHLO
        mail-qk0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935809AbcKDP3X (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 4 Nov 2016 11:29:23 -0400
Received: by mail-qk0-f180.google.com with SMTP id o68so101352737qkf.3
        for <linux-gpio@vger.kernel.org>; Fri, 04 Nov 2016 08:29:23 -0700 (PDT)
In-Reply-To: <1477920093-28180-1-git-send-email-stefan.wahren@i2se.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stefan Wahren <stefan.wahren@i2se.com>
Cc: Stephen Warren <swarren@wwwdotorg.org>, Eric Anholt <eric@anholt.net>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Oct 31, 2016 at 2:21 PM, Stefan Wahren <stefan.wahren@i2se.com> wrote:

> Since the BCM2835 datasheet doesn't exactly specify the set-up time for
> the GPIO Pull-up/down Clock Registers there was an assumption of 150 cycles
> at a clock rate of 1 MHz. During a discussion [1] in the Raspberry Pi forum
> it turns out that clock rate refers to the VPU which has a rate of 250 MHz.
> So we can reduce the delay to a sensible value and update the comment above.
>
> I tested this optimization with a Raspberry Pi B and a multimeter.
>
> [1] - https://www.raspberrypi.org/forums/viewtopic.php?f=72&t=163352
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

Patch applied with Eric's review tag.

Yours,
Linus Walleij
