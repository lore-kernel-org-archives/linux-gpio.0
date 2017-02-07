From: Jisheng Zhang <jszhang@marvell.com>
Subject: Re: [PATCH 3/3] pinctrl: berlin: make bool drivers explicitly
 non-modular
Date: Tue, 7 Feb 2017 19:19:24 +0800
Message-ID: <20170207191924.7c3ff350@xhacker>
References: <20170206080352.17808-1-paul.gortmaker@windriver.com>
        <20170206080352.17808-4-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0b-0016f401.pphosted.com ([67.231.156.173]:35752 "EHLO
        mx0b-0016f401.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1752141AbdBGLYI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Feb 2017 06:24:08 -0500
In-Reply-To: <20170206080352.17808-4-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Antoine =?UTF-8?B?VMOpbmFydA==?= <antoine.tenart@free-electrons.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Hongzhou Yang <hongzhou.yang@mediatek.com>, Thomas Hebb <tommyhebb@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-gpio@vger.kernel.org

On Mon, 6 Feb 2017 03:03:52 -0500 Paul Gortmaker wrote:

> None of the Kconfigs for any of these drivers are tristate,
> meaning that they currently are not being built as a module by anyone.
> 
> Lets remove the modular code that is essentially orphaned, so that
> when reading the driver there is no doubt it is builtin-only.
> 
> Since module_platform_driver() uses the same init level priority as
> builtin_platform_driver() the init ordering remains unchanged with
> this commit.
> 
> Also note that MODULE_DEVICE_TABLE is a no-op for non-modular code.
> 
> We also delete the MODULE_LICENSE tag etc. since all that information
> is already contained at the top of the file in the comments.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: "Antoine Ténart" <antoine.tenart@free-electrons.com>
> Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Cc: Jisheng Zhang <jszhang@marvell.com>
> Cc: Hongzhou Yang <hongzhou.yang@mediatek.com>
> Cc: Thomas Hebb <tommyhebb@gmail.com>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Acked-by: Jisheng Zhang <jszhang@marvell.com>
