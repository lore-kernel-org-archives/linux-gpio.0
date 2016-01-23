From: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH] pinctrl: pxa: export pxa2xx_pinctrl_init()
Date: Sat, 23 Jan 2016 23:15:17 +0100
Message-ID: <87fuxoaqoa.fsf@belgarion.home>
References: <1453577113-14423-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp01.smtpout.orange.fr ([80.12.242.123]:21322 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754788AbcAWWPT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 23 Jan 2016 17:15:19 -0500
In-Reply-To: <1453577113-14423-1-git-send-email-yamada.masahiro@socionext.com>
	(Masahiro Yamada's message of "Sun, 24 Jan 2016 04:25:13 +0900")
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-gpio@vger.kernel.org, Haojian Zhuang <haojian.zhuang@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Daniel Mack <daniel@zonque.org>, linux-arm-kernel@lists.infradead.org

Masahiro Yamada <yamada.masahiro@socionext.com> writes:

> Building pinctrl-pxa27x.c as a module causes a link error:
>
> ERROR: "pxa2xx_pinctrl_init" [drivers/pinctrl/pxa/pinctrl-pxa27x.ko] undefined!
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
Yeah, I see no other way out to spare namespace polution.

Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>

Cheers.

-- 
Robert
