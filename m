From: Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH] gpio: keep the GPIO line names internal
Date: Sun, 4 Oct 2015 15:37:42 +0200
Message-ID: <20151004133742.GO4284@localhost>
References: <1443050853-24601-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f176.google.com ([209.85.212.176]:36800 "EHLO
	mail-wi0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751562AbbJDQIR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 4 Oct 2015 12:08:17 -0400
Received: by wicgb1 with SMTP id gb1so89085178wic.1
        for <linux-gpio@vger.kernel.org>; Sun, 04 Oct 2015 09:08:16 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1443050853-24601-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Markus Pargmann <mpa@pengutronix.de>

On Wed, Sep 23, 2015 at 04:27:33PM -0700, Linus Walleij wrote:
> This refactors the changes to the GPIO line naming mechanism to
> not have so widespread effects, instead we conclude the patch series
> by having created a name attribute in the GPIO descriptor, that need
> not be globally unique, and it will be initialized from the old
> .names array in struct gpio_chip if it exists, then used in the legacy
> sysfs code like the array was used previously.
> 
> The associated changes to name lines from the device tree are
> controversial and need to stand alone from this. Resulting changes:
> 
> 1. Remove the export and the header for the gpio_name_to_desc() as so
> far the only use is inside gpiolib.c. Staticize gpio_name_to_desc()
> and move it above the only function using it.
> 
> 2. Only print a warning if there are two GPIO lines with the same name.
> The reason is to preserve current behaviour: before the previous
> changes to the naming mechanism this would not reject probing the
> driver, instead the error would occur when trying to export the line
> in sysfs, so restore this behaviour, but print a friendly warning
> if names collide.

This looks good (apart from the checkpatch warning for the warning
message string).

You also need to revert ddd5404007b8 ("gpio-sysfs: Use gpio descriptor
name instead of gpiochip names array") however as this is an ABI change.  
Otherwise pins with a name in DT will now be exported using the gpio name
rather than number as they used to be. [ The current behaviour is
maintained by exporting names from chip->names for hard coded names
only. ]

Thanks,
Johan
