From: Jamie Iles <jamie@jamieiles.com>
Subject: Re: [PATCH v3] gpio: dwapb: use a second irq chip
Date: Tue, 27 May 2014 10:55:08 +0100
Message-ID: <20140527095508.GA25440@page.Home>
References: <CACRpkdY=oVyBCwRkppq11B0tkn2bMw+-h_fDhy538eatVUJ=pQ@mail.gmail.com>
 <1401137894-6096-1-git-send-email-bigeasy@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wg0-f45.google.com ([74.125.82.45]:59538 "EHLO
	mail-wg0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750881AbaE0JzM (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 27 May 2014 05:55:12 -0400
Received: by mail-wg0-f45.google.com with SMTP id m15so9011329wgh.28
        for <linux-gpio@vger.kernel.org>; Tue, 27 May 2014 02:55:10 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <1401137894-6096-1-git-send-email-bigeasy@linutronix.de>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Jamie Iles <jamie@jamieiles.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Alan Tull <atull@altera.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>, dinguyen@altera.com

On Mon, May 26, 2014 at 10:58:14PM +0200, Sebastian Andrzej Siewior wrote:
> Right new have one irq chip running always in level mode. It would nicer
> to have two irq chips where one is handling level type interrupts and
> the other one is doing edge interrupts. So we can have at runtime two users
> where one is using edge and the other level.
> 
> Acked-by: Alan Tull <delicious.quinoa@gmail.com>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Acked-by: Jamie Iles <jamie@jamieiles.com>
