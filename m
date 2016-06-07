From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 6/9] pinctrl: palmas: make it explicitly non-modular
Date: Tue, 7 Jun 2016 12:06:51 +0530
Message-ID: <57566B83.3060008@nvidia.com>
References: <1465267388-17884-1-git-send-email-paul.gortmaker@windriver.com> <1465267388-17884-7-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1465267388-17884-7-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org


On Tuesday 07 June 2016 08:13 AM, Paul Gortmaker wrote:
> The Kconfig currently controlling compilation of this code is:
>
> config PINCTRL_PALMAS
>          bool "Pinctrl driver for the PALMAS Series MFD devices"
>
> ...meaning that it currently is not being built as a module by anyone.
>
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
>
> Since module_platform_driver() uses the same init level priority as
> builtin_platform_driver() the init ordering remains unchanged with
> this commit.
>
> We also delete the MODULE_LICENSE tag etc. since all that information
> is already contained at the top of the file in the comments.
>
> Cc: Laxman Dewangan <ldewangan@nvidia.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>


Let's make the driver as tristate.

tristate "Pinctrl driver for the PALMAS Series MFD devices"
