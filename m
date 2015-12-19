From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: Re: pinctrl-adi2: Use a signed return type for adi_gpio_irq_startup()
Date: Sat, 19 Dec 2015 21:40:27 +0100
Message-ID: <5675C0BB.9020204@users.sourceforge.net>
References: <56758D34.2070806@users.sourceforge.net>
 <20151219201213.GP5284@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.15.3]:61909 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S964956AbbLSUkf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sat, 19 Dec 2015 15:40:35 -0500
In-Reply-To: <20151219201213.GP5284@mwanda>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

> This introduces a compile warning.

How do you think about to show the exact message you get?


> These functions are supposed to return 1 if there is an IRQ pending.
> Change the -EINVAL to 0.

Is there any more source code clean-up needed around the comment "FIXME"
in the affected function?

Regards,
Markus
