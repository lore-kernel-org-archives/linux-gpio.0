From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: arizona: Correct handling for reading input GPIOs
Date: Fri, 7 Apr 2017 12:14:34 +0200
Message-ID: <CACRpkdbHbg9eZVjZF6RSAMkgDUTAZdiysmNkW9PmfFPTVDoVhA@mail.gmail.com>
References: <1491407446-5891-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f50.google.com ([209.85.214.50]:34459 "EHLO
        mail-it0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751759AbdDGKOg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 7 Apr 2017 06:14:36 -0400
Received: by mail-it0-f50.google.com with SMTP id y18so3398251itc.1
        for <linux-gpio@vger.kernel.org>; Fri, 07 Apr 2017 03:14:36 -0700 (PDT)
In-Reply-To: <1491407446-5891-1-git-send-email-ckeepax@opensource.wolfsonmicro.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "open list:WOLFSON MICROELECTRONICS DRIVERS" <patches@opensource.wolfsonmicro.com>

On Wed, Apr 5, 2017 at 5:50 PM, Charles Keepax
<ckeepax@opensource.wolfsonmicro.com> wrote:

> The GPIO register is cached since all the configuration resides within
> it, however, this means for input GPIOs the driver will not return the
> actual state but the last value written to the register cache.
>
> To correct this in the case of reading an input GPIO resume the CODEC
> and drop the cache for the input register to ensure an actual hardware
> read takes place.
>
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>

Looks totally reasonable.
Patch applied.

Yours,
Linus Walleij
