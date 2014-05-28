From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] gpio: dwapb: use a second irq chip
Date: Wed, 28 May 2014 11:01:09 +0200
Message-ID: <CACRpkdaO+_d_WTE_Or0R1KXqoHyyviFP9eVSHKZ_pB8E8wKoOQ@mail.gmail.com>
References: <CACRpkdY=oVyBCwRkppq11B0tkn2bMw+-h_fDhy538eatVUJ=pQ@mail.gmail.com>
	<1401137894-6096-1-git-send-email-bigeasy@linutronix.de>
	<CACRpkdYx9Zwoig5QZmpF1w_Gcyoga8erPZd0RwvHsiC3prjNTA@mail.gmail.com>
	<5384BD93.6030502@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f54.google.com ([209.85.219.54]:46066 "EHLO
	mail-oa0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752322AbaE1JBK (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 28 May 2014 05:01:10 -0400
Received: by mail-oa0-f54.google.com with SMTP id j17so10774473oag.13
        for <linux-gpio@vger.kernel.org>; Wed, 28 May 2014 02:01:09 -0700 (PDT)
In-Reply-To: <5384BD93.6030502@linutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Jamie Iles <jamie@jamieiles.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Alan Tull <atull@altera.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@altera.com>

On Tue, May 27, 2014 at 6:30 PM, Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:

> What remains in my queue is:
>
> * gpio: dwapb: use irq_linear_revmap() for the faster lookup
> * gpio: dwapb: use irq_gc_lock() for locking instead bc's lock
> * gpio: dwapb: use d->mask instead of BIT(bit)
>
> what do we do about those?

Rebase on my devel branch and resend please ... but for linear
revmap I'd much prefer some effort being put into using the
gpiolib irqchip helpers with generic chips instead.

Yours,
Linus Walleij
