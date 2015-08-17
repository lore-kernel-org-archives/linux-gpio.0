From: Alexandre Courbot <gnurou@gmail.com>
Subject: Re: Deadlock in grgpio_irq_unmap()
Date: Mon, 17 Aug 2015 17:24:19 +0900
Message-ID: <CAAVeFuKFZ3pyC--K3y57GQRkXyGGRmCLA2rLDbVBLNAXd53jnw@mail.gmail.com>
References: <1438532122-25368-1-git-send-email-khoroshilov@ispras.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f54.google.com ([209.85.218.54]:36695 "EHLO
	mail-oi0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753228AbbHQIYj (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 17 Aug 2015 04:24:39 -0400
In-Reply-To: <1438532122-25368-1-git-send-email-khoroshilov@ispras.ru>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexey Khoroshilov <khoroshilov@ispras.ru>
Cc: Andreas Larsson <andreas@gaisler.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ldv-project@linuxtesting.org

On Mon, Aug 3, 2015 at 1:15 AM, Alexey Khoroshilov
<khoroshilov@ispras.ru> wrote:
> Dear colleagus,
>
> grgpio_irq_unmap() code looks quite suspicious regarding usage of
> priv->bgc.lock spinlock.
>
> It locks the spinlock in line 310:
>         spin_lock_irqsave(&priv->bgc.lock, flags);
> and then it can call grgpio_set_imask() in line 317:
>         grgpio_set_imask(priv, i, 0);
>
> But grgpio_set_imask() unconditionally locks the spinlock by itself.

Indeed, this looks plain wrong. I have sent a fix that moves the
spinlock acquisition outside of grgpio_set_imask().
