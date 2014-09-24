From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio: Fix potentially NULL handler data passed to chained
 irqchip handler
Date: Wed, 24 Sep 2014 09:48:07 +0200
Message-ID: <CACRpkdaCb0pEncKJ_OD6BG6tgRBOj7k7OQJuE4de0EJn_7ZQUQ@mail.gmail.com>
References: <1410873795-31980-1-git-send-email-jarkko.nikula@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ig0-f182.google.com ([209.85.213.182]:38192 "EHLO
	mail-ig0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751371AbaIXHsI (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 24 Sep 2014 03:48:08 -0400
Received: by mail-ig0-f182.google.com with SMTP id hn15so6045803igb.15
        for <linux-gpio@vger.kernel.org>; Wed, 24 Sep 2014 00:48:07 -0700 (PDT)
In-Reply-To: <1410873795-31980-1-git-send-email-jarkko.nikula@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, Stable <stable@vger.kernel.org>

On Tue, Sep 16, 2014 at 3:23 PM, Jarkko Nikula
<jarkko.nikula@linux.intel.com> wrote:

> There is possibility with misconfigured pins that interrupt occurs instantly
> after setting irq_set_chained_handler() in gpiochip_set_chained_irqchip().
> Now if handler gets called before irq_set_handler_data() the handler gets
> NULL handler data.
>
> Fix this by moving irq_set_handler_data() call before
> irq_set_chained_handler() in gpiochip_set_chained_irqchip().
>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Cc: Stable <stable@vger.kernel.org> # 3.15+

Patch applied for fixes with Alex's review tag.

Yours,
Linus Walleij
