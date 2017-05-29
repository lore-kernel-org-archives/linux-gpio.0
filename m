From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 3/3] pinctrl: bcm: clean up modular vs. non-modular distinctions
Date: Mon, 29 May 2017 10:31:22 +0200
Message-ID: <CACRpkdbQTDkqy+ChBq=pg1BnHH5ARL0+J-zL_gipEEotujOxbA@mail.gmail.com>
References: <20170522205648.23545-1-paul.gortmaker@windriver.com> <20170522205648.23545-4-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170522205648.23545-4-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Eric Anholt <eric@anholt.net>, Florian Fainelli <f.fainelli@gmail.com>, Jon Mason <jonmason@broadcom.com>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Stefan Wahren <stefan.wahren@i2se.com>, Sherman Yin <syin@broadcom.com>, bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-rpi-kernel <linux-rpi-kernel@lists.infradead.org>
List-Id: linux-gpio@vger.kernel.org

On Mon, May 22, 2017 at 10:56 PM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

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

Patch applied with Stefan Wahren's Tested-by tag.

I can't take header standardization into account, header files are not
ABI, further see
Documentation/process/stable-api-nonsense.rst

Yours,
Linus Walleij
