From: Stefan Wahren <stefan.wahren@i2se.com>
Subject: Re: [PATCH 3/3] pinctrl: bcm: clean up modular vs. non-modular
 distinctions
Date: Tue, 23 May 2017 22:11:55 +0200 (CEST)
Message-ID: <812482107.237697.1495570315919@email.1und1.de>
References: <20170522205648.23545-1-paul.gortmaker@windriver.com>
 <20170522205648.23545-4-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.134]:50863 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1031126AbdEWUMq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 May 2017 16:12:46 -0400
In-Reply-To: <20170522205648.23545-4-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>, Eric Anholt <eric@anholt.net>, bcm-kernel-feedback-list@broadcom.com, linux-gpio@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>, linux-rpi-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jon Mason <jonmason@broadcom.com>, Sherman Yin <syin@broadcom.com>


> Paul Gortmaker <paul.gortmaker@windriver.com> hat am 22. Mai 2017 um 22:56 geschrieben:
> 
> 
> Fixups here tend to be more of a conglomerate of some of the other
> repeated/systematic ones we've seen in the earlier pinctrl cleanups.
> 
> We remove module.h from code that isn't doing anything modular at
> all;  if they have __init sections, then replace it with init.h
> 
> One driver has a .remove that would be dispatched on module_exit,
> and as that code is essentially orphaned, so we remove it.  In case
> anyone was previously doing the (pointless) unbind to get to that
> function, we disable unbind for this one driver as well.
> 
> A couple bool drivers (hence non-modular) are converted over to
> to builtin_platform_driver().
> 
> Since module_platform_driver() uses the same init level priority as
> builtin_platform_driver() the init ordering remains unchanged with
> this commit.
> 
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
> 
> We also delete the MODULE_LICENSE tag etc. since all that information
> was (or is now) contained at the top of the file in the comments.
> 
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Florian Fainelli <f.fainelli@gmail.com>
> Cc: Jon Mason <jonmason@broadcom.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Ray Jui <rjui@broadcom.com>
> Cc: Scott Branden <sbranden@broadcom.com>
> Cc: Stefan Wahren <stefan.wahren@i2se.com>
> Cc: Sherman Yin <syin@broadcom.com>
> Cc: bcm-kernel-feedback-list@broadcom.com
> Cc: linux-gpio@vger.kernel.org
> Cc: linux-rpi-kernel@lists.infradead.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
> ---
>  drivers/pinctrl/bcm/pinctrl-bcm281xx.c   | 16 ++++++++--------
>  drivers/pinctrl/bcm/pinctrl-bcm2835.c    | 20 +++-----------------

Tested-by: Stefan Wahren <stefan.wahren@i2se.com>

for pinctrl-bcm2835
