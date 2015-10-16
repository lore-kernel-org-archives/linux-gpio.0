From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: omap: fix static checker warning
Date: Fri, 16 Oct 2015 16:37:43 +0200
Message-ID: <CACRpkdaHzi0hRmeLszonwLhfFewVfiqFkRBsV=kOCY3imBP3Mg@mail.gmail.com>
References: <1443207962-16982-1-git-send-email-grygorii.strashko@ti.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f48.google.com ([209.85.218.48]:34500 "EHLO
	mail-oi0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752037AbbJPOho (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 16 Oct 2015 10:37:44 -0400
Received: by oies66 with SMTP id s66so25512465oie.1
        for <linux-gpio@vger.kernel.org>; Fri, 16 Oct 2015 07:37:43 -0700 (PDT)
In-Reply-To: <1443207962-16982-1-git-send-email-grygorii.strashko@ti.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Santosh Shilimkar <ssantosh@kernel.org>, Tony Lindgren <tony@atomide.com>, Javier Martinez Canillas <javier@dowhile0.org>, Linux-OMAP <linux-omap@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Fri, Sep 25, 2015 at 9:06 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:

> This patch fixes below static checker warning by changing
> type of irq field in struct gpio_bank from u16 to int.

Nobody's saying anything, I'll just apply this.

Yours,
Linus Walleij
