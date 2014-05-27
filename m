From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Subject: Re: [PATCH v3] gpio: dwapb: use a second irq chip
Date: Tue, 27 May 2014 18:30:11 +0200
Message-ID: <5384BD93.6030502@linutronix.de>
References: <CACRpkdY=oVyBCwRkppq11B0tkn2bMw+-h_fDhy538eatVUJ=pQ@mail.gmail.com>	<1401137894-6096-1-git-send-email-bigeasy@linutronix.de> <CACRpkdYx9Zwoig5QZmpF1w_Gcyoga8erPZd0RwvHsiC3prjNTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from www.linutronix.de ([62.245.132.108]:56246 "EHLO
	Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752688AbaE0QaT (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 27 May 2014 12:30:19 -0400
In-Reply-To: <CACRpkdYx9Zwoig5QZmpF1w_Gcyoga8erPZd0RwvHsiC3prjNTA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jamie Iles <jamie@jamieiles.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Alan Tull <atull@altera.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@altera.com>

On 05/27/2014 04:21 PM, Linus Walleij wrote:
> OK this version applied worked fine.

Thank you.

> Please check the result because I had to rebase it a little.

Looks good. What remains in my queue is:

* gpio: dwapb: use irq_linear_revmap() for the faster lookup
* gpio: dwapb: use irq_gc_lock() for locking instead bc's lock
* gpio: dwapb: use d->mask instead of BIT(bit)

what do we do about those?

> Yours,
> Linus Walleij
> 
Sebastian
