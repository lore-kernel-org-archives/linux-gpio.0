From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/5] gpio: dwapb: drop irq_setup_generic_chip()
Date: Thu, 10 Apr 2014 19:35:14 +0200
Message-ID: <CACRpkdZOJMQV8YLyJ7za08MnyyuSX3RwJ77P+J0bC7qFQPar3w@mail.gmail.com>
References: <1396865589-9972-1-git-send-email-bigeasy@linutronix.de>
	<1396865589-9972-2-git-send-email-bigeasy@linutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1396865589-9972-2-git-send-email-bigeasy@linutronix.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Jamie Iles <jamie@jamieiles.com>, Alan Tull <atull@altera.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Dinh Nguyen <dinguyen@altera.com>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
List-Id: linux-gpio@vger.kernel.org

On Mon, Apr 7, 2014 at 12:13 PM, Sebastian Andrzej Siewior
<bigeasy@linutronix.de> wrote:

> The driver calls irq_alloc_domain_generic_chips() which creates a gc and
> adds it to gc_list. The driver later then calls irq_setup_generic_chip()
> which also initializes the gc and adds it to the gc_list() and this
> corrupts the list. Enable LIST_DEBUG and you see the kernel complain.
> This isn't required, irq_alloc_domain_generic_chips() did the init.
>
> Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Patch applied, adding Alan Tull's Tested-by.

Yours,
Linus Walleij
