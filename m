From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 18/19] pinctrl: imx28: make it explicitly non-modular
Date: Wed, 29 Jun 2016 09:55:57 +0200
Message-ID: <CACRpkdbvSR2M8Gi+AKopGa1fuTE5davrDGMcyM1uuhCU3D5_WQ@mail.gmail.com>
References: <20160626024652.5081-1-paul.gortmaker@windriver.com> <20160626024652.5081-19-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160626024652.5081-19-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Shawn Guo <shawn.guo@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Sun, Jun 26, 2016 at 4:46 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:

> The Kconfig currently controlling compilation of this code is:
>
> drivers/pinctrl/freescale/Kconfig:config PINCTRL_IMX28
> drivers/pinctrl/freescale/Kconfig:      bool
>
> ...meaning that it currently is not being built as a module by anyone.
>
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
>
> We explicitly disallow a driver unbind, since that doesn't have a
> sensible use case anyway, and it allows us to drop the ".remove"
> code for non-modular drivers.
>
> Since module_init was not in use by this driver, the init ordering
> remains unchanged with this commit.
>
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
>
> We also delete the MODULE_LICENSE tag etc. since all that information
> was (or is now) contained at the top of the file in the comments.
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Shawn Guo <shawn.guo@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Patch applied.

Yours,
Linus Walleij
