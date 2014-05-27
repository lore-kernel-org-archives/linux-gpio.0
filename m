From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v3] gpio: dwapb: use a second irq chip
Date: Tue, 27 May 2014 16:21:16 +0200
Message-ID: <CACRpkdYx9Zwoig5QZmpF1w_Gcyoga8erPZd0RwvHsiC3prjNTA@mail.gmail.com>
References: <CACRpkdY=oVyBCwRkppq11B0tkn2bMw+-h_fDhy538eatVUJ=pQ@mail.gmail.com>
	<1401137894-6096-1-git-send-email-bigeasy@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:58352 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752671AbaE0OVR (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 27 May 2014 10:21:17 -0400
Received: by mail-ob0-f182.google.com with SMTP id wn1so9447176obc.27
        for <linux-gpio@vger.kernel.org>; Tue, 27 May 2014 07:21:17 -0700 (PDT)
In-Reply-To: <1401137894-6096-1-git-send-email-bigeasy@linutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Jamie Iles <jamie@jamieiles.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Alan Tull <atull@altera.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, linux-kernel <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@altera.com>

On Mon, May 26, 2014 at 10:58 PM, Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:

> Right new have one irq chip running always in level mode. It would nicer
> to have two irq chips where one is handling level type interrupts and
> the other one is doing edge interrupts. So we can have at runtime two users
> where one is using edge and the other level.
>
> Acked-by: Alan Tull <delicious.quinoa@gmail.com>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> ---
> v2..v3: added acked-by
> v1..v2 - using the lopp again but breaking the assignment of type and
>         handler out of the loop as suggested by delicious quinoa.

OK this version applied worked fine.

Please check the result because I had to rebase it a little.

Yours,
Linus Walleij
