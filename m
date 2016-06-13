From: William Breathitt Gray <vilhelm.gray@gmail.com>
Subject: Re: [PATCH] gpio: 104-idi-48: Fix missing spin_lock_init for ack_lock
Date: Mon, 13 Jun 2016 08:22:12 -0400
Message-ID: <20160613122152.GA18880@sophia>
References: <1465796933.11725.1.camel@ingics.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-yw0-f194.google.com ([209.85.161.194]:32916 "EHLO
	mail-yw0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1161084AbcFMMWU (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jun 2016 08:22:20 -0400
Received: by mail-yw0-f194.google.com with SMTP id y6so15970343ywe.0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Jun 2016 05:22:19 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1465796933.11725.1.camel@ingics.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Axel Lin <axel.lin@ingics.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org

On Mon, Jun 13, 2016 at 01:48:53PM +0800, Axel Lin wrote:
>Fixes: 9ae482104cb9 ("gpio: 104-idi-48: Clear pending interrupt once in IRQ handler")
>Signed-off-by: Axel Lin <axel.lin@ingics.com>
>---
> drivers/gpio/gpio-104-idi-48.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/drivers/gpio/gpio-104-idi-48.c b/drivers/gpio/gpio-104-idi-48.c
>index 6c75c83..2d2763e 100644
>--- a/drivers/gpio/gpio-104-idi-48.c
>+++ b/drivers/gpio/gpio-104-idi-48.c
>@@ -247,6 +247,7 @@ static int idi_48_probe(struct device *dev, unsigned int id)
> 	idi48gpio->irq = irq[id];
> 
> 	spin_lock_init(&idi48gpio->lock);
>+	spin_lock_init(&idi48gpio->ack_lock);
> 
> 	dev_set_drvdata(dev, idi48gpio);
> 
>-- 
>2.5.0

Acked-by: William Breathitt Gray <vilhelm.gray@gmail.com>

Thanks,

William Breathitt Gray
