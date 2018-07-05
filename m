From: "H. Nikolaus Schaller" <hns@goldelico.com>
Subject: Re: [PATCHv3 0/5] pinctrl fixes for generic functions and groups
Date: Thu, 5 Jul 2018 15:28:41 +0200
Message-ID: <927EBDA8-8A94-4D7D-9EEF-32A02F5346BD@goldelico.com>
References: <20180705091018.60524-1-tony@atomide.com>
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180705091018.60524-1-tony@atomide.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, Christ van Willegen <cvwillegen@gmail.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Paul Cercueil <paul@crapouillou.net>, Sean Wang <sean.wang@mediatek.com>
List-Id: linux-gpio@vger.kernel.org

Hi Tony and Linus,

> Am 05.07.2018 um 11:10 schrieb Tony Lindgren <tony@atomide.com>:
> 
> Here is a resend of fixes for a race issues for generic group and
> functions reported by H. Nikolaus Schaller <hns@goldelico.com>.

Thanks for adding me.

I have tested these patches on our OMAP3 based device where the problem
was quite reproducible and testable by adding some printk. With
these patches it seems now to be correct. Each group selector is
assigned only once, even if driver probing fails and is redone later.

Code review of the call paths has convinced us that we now have
proper mutex around the radix tree function calls and races are
no longer a problem.

So you can add my

	Tested-By: H. Nikolaus Schaller <hns@goldelico.com>

BR and thanks,
Nikolaus

> 
> Regards,
> 
> Tony
> 
> 
> Changes since v2:
> 
> - Added Nikolaus to Cc as Reported-by did not do it
> 
> Changes since v1:
> 
> - Check if a function or group already exists as suggested by
>  Andy Shevchenko
> 
> - Make sure we always have a valid name for functions and groups
>  as suggested by Christ van Willegen
> 
> - Prettify rza1 variables as suggested by Jacopo Mondi
> 
> Tony Lindgren (5):
>  pinctrl: core: Return selector to the pinctrl driver
>  pinctrl: pinmux: Return selector to the pinctrl driver
>  pinctrl: single: Fix group and function selector use
>  pinctrl: rza1: Fix selector use for groups and functions
>  pinctrl: core: Remove broken remove_last group and pinmux functions
> 
> drivers/pinctrl/core.c           | 35 ++++++++++--
> drivers/pinctrl/core.h           |  6 ---
> drivers/pinctrl/pinctrl-rza1.c   | 24 +++++----
> drivers/pinctrl/pinctrl-single.c | 91 +++++++++++++++++++-------------
> drivers/pinctrl/pinmux.c         | 16 ++++--
> drivers/pinctrl/pinmux.h         |  7 ---
> 6 files changed, 112 insertions(+), 67 deletions(-)
> 
> -- 
> 2.17.1
