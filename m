From: Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCHv3 0/5] pinctrl fixes for generic functions and groups
Date: Thu, 5 Jul 2018 16:55:40 +0300
Message-ID: <CAHp75VfR+hKW4sGifOP_UvCf6dAzM_jmZH-fZA61zjVt31iJtA@mail.gmail.com>
References: <20180705091018.60524-1-tony@atomide.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180705091018.60524-1-tony@atomide.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Tony Lindgren <tony@atomide.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Christ van Willegen <cvwillegen@gmail.com>, "H. Nikolaus Schaller" <hns@goldelico.com>, Haojian Zhuang <haojian.zhuang@linaro.org>, Jacopo Mondi <jacopo+renesas@jmondi.org>, Paul Cercueil <paul@crapouillou.net>, Sean Wang <sean.wang@mediatek.com>
List-Id: linux-gpio@vger.kernel.org

On Thu, Jul 5, 2018 at 12:10 PM, Tony Lindgren <tony@atomide.com> wrote:
> Here is a resend of fixes for a race issues for generic group and
> functions reported by H. Nikolaus Schaller <hns@goldelico.com>.
>

Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

I think for ACPI case we would use generic helpers, so this change is
quite useful to not screw up with new stuff.

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
>   Andy Shevchenko
>
> - Make sure we always have a valid name for functions and groups
>   as suggested by Christ van Willegen
>
> - Prettify rza1 variables as suggested by Jacopo Mondi
>
> Tony Lindgren (5):
>   pinctrl: core: Return selector to the pinctrl driver
>   pinctrl: pinmux: Return selector to the pinctrl driver
>   pinctrl: single: Fix group and function selector use
>   pinctrl: rza1: Fix selector use for groups and functions
>   pinctrl: core: Remove broken remove_last group and pinmux functions
>
>  drivers/pinctrl/core.c           | 35 ++++++++++--
>  drivers/pinctrl/core.h           |  6 ---
>  drivers/pinctrl/pinctrl-rza1.c   | 24 +++++----
>  drivers/pinctrl/pinctrl-single.c | 91 +++++++++++++++++++-------------
>  drivers/pinctrl/pinmux.c         | 16 ++++--
>  drivers/pinctrl/pinmux.h         |  7 ---
>  6 files changed, 112 insertions(+), 67 deletions(-)
>
> --
> 2.17.1



-- 
With Best Regards,
Andy Shevchenko
