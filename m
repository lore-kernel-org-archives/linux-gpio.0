From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 1/9] pinctrl: as3722: make it explicitly non-modular
Date: Tue, 7 Jun 2016 12:06:18 +0530
Message-ID: <57566B62.3060908@nvidia.com>
References: <1465267388-17884-1-git-send-email-paul.gortmaker@windriver.com> <1465267388-17884-2-git-send-email-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hqemgate15.nvidia.com ([216.228.121.64]:16027 "EHLO
	hqemgate15.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753464AbcFGGtK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jun 2016 02:49:10 -0400
In-Reply-To: <1465267388-17884-2-git-send-email-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>, linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org


On Tuesday 07 June 2016 08:13 AM, Paul Gortmaker wrote:
> The Kconfig currently controlling compilation of this code is:
>
> config PINCTRL_AS3722
>          bool "Pinctrl and GPIO driver for ams AS3722 PMIC"
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
> Since module_platform_driver() uses the same init level priority as
> builtin_platform_driver() the init ordering remains unchanged with
> this commit.
>
> Also note that MODULE_ALIAS and MODULE_DEVICE_TABLE are a no-op for
> non-modular code and hence both are removed.
>
> We also delete the MODULE_LICENSE tag etc. since all that information
> is already contained at the top of the file in the comments.
>
> Cc: Laxman Dewangan <ldewangan@nvidia.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>
>


I will say lets make the driver as tristate.

tristate "Pinctrl and GPIO driver for ams AS3722 PMIC"


