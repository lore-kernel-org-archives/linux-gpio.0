From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 31/50] pinctrl: uniphier: Use devm_pinctrl_register() for
 pinctrl registration
Date: Fri, 26 Feb 2016 19:06:29 +0900
Message-ID: <CAK7LNATP6vBz3CvD5cJ+DwbL3g8e_UJ40W8zZJwzQrKXnWokkg@mail.gmail.com>
References: <1456319775-3216-1-git-send-email-ldewangan@nvidia.com>
	<1456319775-3216-32-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conssluserg002.nifty.com ([202.248.44.40]:16976 "EHLO
	conssluserg002-v.nifty.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1750883AbcBZKHB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Fri, 26 Feb 2016 05:07:01 -0500
In-Reply-To: <1456319775-3216-32-git-send-email-ldewangan@nvidia.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Laxman Dewangan <ldewangan@nvidia.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jonathan Corbet <corbet@lwn.net>, lee@kernel.org, linux-doc@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-gpio@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Broadcom Kernel Feedback List <bcm-kernel-feedback-list@broadcom.com>, "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>

2016-02-24 22:15 GMT+09:00 Laxman Dewangan <ldewangan@nvidia.com>:
> Use devm_pinctrl_register() for pin control registration and remove
> need of .remove callback.
>
> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
> Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Acked-by: Masahiro Yamada <yamada.masahiro@socionext.com>


Thanks!



-- 
Best Regards
Masahiro Yamada
