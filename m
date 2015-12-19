From: SF Markus Elfring <elfring@users.sourceforge.net>
Subject: Re: pinctrl-adi2: Use a signed return type for adi_gpio_irq_startup()
Date: Sat, 19 Dec 2015 23:20:33 +0100
Message-ID: <5675D831.2070307@users.sourceforge.net>
References: <56758D34.2070806@users.sourceforge.net>
 <20151219201213.GP5284@mwanda> <5675C0BB.9020204@users.sourceforge.net>
 <20151219204501.GV5284@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.web.de ([212.227.17.11]:55100 "EHLO mout.web.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932727AbbLSWUm (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sat, 19 Dec 2015 17:20:42 -0500
In-Reply-To: <20151219204501.GV5284@mwanda>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org, Julia Lawall <julia.lawall@lip6.fr>

>>> This introduces a compile warning.
>>
>> How do you think about to show the exact message you get?
> 
> I can't actually compile it myself.

It seems that I can understand your feedback also a bit better
since I received the information from a background process
like "kbuild test robot".

Will it become acceptable to adjust the data structure "irq_chip"
for the variable "adi_gpio_irqchip"?

Should I just skip my update suggestion for this specific source
code area?
http://lxr.free-electrons.com/source/include/linux/irq.h?v=4.3#L320

Regards,
Markus
