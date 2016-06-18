From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] [NEXT] gpiolib: make lineevent_irq_thread static
Date: Sat, 18 Jun 2016 11:05:26 +0200
Message-ID: <CACRpkdZ-gdCq476uojVrny=UuzNP=W3BfXa9YvgXr_QmFCKLXA@mail.gmail.com>
References: <1466175793-19006-1-git-send-email-ben.dooks@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f46.google.com ([209.85.218.46]:33921 "EHLO
	mail-oi0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750918AbcFRJF1 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sat, 18 Jun 2016 05:05:27 -0400
Received: by mail-oi0-f46.google.com with SMTP id d132so148818763oig.1
        for <linux-gpio@vger.kernel.org>; Sat, 18 Jun 2016 02:05:27 -0700 (PDT)
In-Reply-To: <1466175793-19006-1-git-send-email-ben.dooks@codethink.co.uk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Ben Dooks <ben.dooks@codethink.co.uk>
Cc: linux-kernel@lists.codethink.co.uk, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <gnurou@gmail.com>

On Fri, Jun 17, 2016 at 5:03 PM, Ben Dooks <ben.dooks@codethink.co.uk> wrote:

> The lineevent_irq_thread is not exported, so make it static
> to fix the following warning:
>
> drivers/gpio/gpiolib.c:654:13: warning: symbol 'lineevent_irq_thread' was not declared. Should it be static?
>
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
> Cc: linux-gpio@vger.kernel.org
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Alexandre Courbot <gnurou@gmail.com>

Patch applied, thanks a lot Ben, awesome!

Yours,
Linus Walleij
