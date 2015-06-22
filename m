From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: Re: [PATCH 2/2] gpio: altera: fix return value of altera_gpio_remove()
Date: Mon, 22 Jun 2015 19:04:42 +0900
Message-ID: <CAK7LNASvYHyYSBNymq5d+2Bon2PYSgRqBsUDDKgjaqJutXqcsA@mail.gmail.com>
References: <1434542383-21314-1-git-send-email-yamada.masahiro@socionext.com>
	<1434542383-21314-2-git-send-email-yamada.masahiro@socionext.com>
	<CAAVeFuJoeN4O6Cc1Wsm+Ev+K6sT0PqNq1QtX-ZQp1ePGVUbiPA@mail.gmail.com>
	<1434936985.20199.8.camel@ubuntu>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from conssluserg003.nifty.com ([202.248.44.41]:46837 "EHLO
	conssluserg003-v.nifty.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S932951AbbFVKEs (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Mon, 22 Jun 2015 06:04:48 -0400
In-Reply-To: <1434936985.20199.8.camel@ubuntu>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Tien Hock Loh <thloh@altera.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linus Walleij <linus.walleij@linaro.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Tien,


2015-06-22 10:36 GMT+09:00 Tien Hock Loh <thloh@altera.com>:
> Sorry I was away from my mail for the past few weeks.
> This isn't intentional, should be a bug I overlook. The fix is correct.
>

OK, then could you issue your Acked-by credit?


Also, do the followings look good?

http://patchwork.ozlabs.org/patch/485370/
http://patchwork.ozlabs.org/patch/486669/

Thanks.

-- 
Best Regards
Masahiro Yamada
--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
