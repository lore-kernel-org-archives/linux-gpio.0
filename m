From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH] pinctrl: uniphier: remove pointless SD pin-mux setting
 for PH1-LD11
Date: Wed, 29 Jun 2016 17:58:42 +0900
Message-ID: <CAK7LNAQYi3Na1=HwYiXXHmn6sp+22m-LVLPcGZ9LdvkfK0VyvA@mail.gmail.com>
References: <1467189910-14125-1-git-send-email-yamada.masahiro@socionext.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:65512 "EHLO
	conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751427AbcF2I7N (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 29 Jun 2016 04:59:13 -0400
In-Reply-To: <1467189910-14125-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2016-06-29 17:45 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> This SoC has no SD card controller.  This pin-muxing has no point.
>
> Fixes: 70f2f9c4cf25 ("pinctrl: uniphier: add UniPhier PH1-LD11 pinctrl driver")
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>


I found another mistake in this driver.

So, I'd like to replace this patch with the following one:
http://patchwork.ozlabs.org/patch/641896/


(Copy-paste work often ends up several mistakes...)



-- 
Best Regards
Masahiro Yamada
