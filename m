From: Alexey Khoroshilov <khoroshilov@ispras.ru>
Subject: Deadlock in grgpio_irq_unmap()
Date: Sun,  2 Aug 2015 23:15:22 +0700
Message-ID: <1438532122-25368-1-git-send-email-khoroshilov@ispras.ru>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.ispras.ru ([83.149.199.45]:52281 "EHLO mail.ispras.ru"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751090AbbHBQPj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Sun, 2 Aug 2015 12:15:39 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andreas Larsson <andreas@gaisler.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Alexey Khoroshilov <khoroshilov@ispras.ru>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, ldv-project@linuxtesting.org

Dear colleagus,

grgpio_irq_unmap() code looks quite suspicious regarding usage of
priv->bgc.lock spinlock.

It locks the spinlock in line 310:
        spin_lock_irqsave(&priv->bgc.lock, flags);
and then it can call grgpio_set_imask() in line 317:
        grgpio_set_imask(priv, i, 0);

But grgpio_set_imask() unconditionally locks the spinlock by itself.

static void grgpio_set_imask(struct grgpio_priv *priv, unsigned int offset,
			     int val)
{
	struct bgpio_chip *bgc = &priv->bgc;
	unsigned long mask = bgc->pin2mask(bgc, offset);
	unsigned long flags;

	spin_lock_irqsave(&bgc->lock, flags);

	if (val)
		priv->imask |= mask;
	else
		priv->imask &= ~mask;
	bgc->write_reg(priv->regs + GRGPIO_IMASK, priv->imask);

	spin_unlock_irqrestore(&bgc->lock, flags);
}

So, it looks like unavoidable deadlock here.

Found by Linux Driver Verification project (linuxtesting.org).

--
Alexey Khoroshilov
Linux Verification Center, ISPRAS
web: http://linuxtesting.org

