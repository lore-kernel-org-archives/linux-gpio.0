From: Bin Gao <bin.gao@linux.intel.com>
Subject: Re: [PATCH v4] gpio: add Intel WhiskeyCove GPIO driver
Date: Mon, 11 Jul 2016 17:12:33 -0700
Message-ID: <20160712001233.GA168694@worksta>
References: <20160627235616.GA9303@worksta>
 <CACRpkdZJ0AUWmxLApzryCZbQcQmwWO1A-NLMP46WsLkJBZgprQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:32638 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751365AbcGLAIU (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 11 Jul 2016 20:08:20 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdZJ0AUWmxLApzryCZbQcQmwWO1A-NLMP46WsLkJBZgprQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Andy Shevchenko <andy.shevchenko@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ajay Thomas <ajay.thomas.david.rajamanickam@intel.com>, Yegnesh S Iyer <yegnesh.s.iyer@intel.com>, Bin Gao <bin.gao@intel.com>

On Wed, Jul 06, 2016 at 10:57:19AM +0200, Linus Walleij wrote:
> > +       gpiochip_irqchip_add(&wg->chip, &wcove_irqchip, 0,
> > +                            handle_simple_irq, IRQ_TYPE_NONE);
> 
> Reexamine the use of handle_simple_irq() here. We have two kinds of
> irq hardware: those with one register for ACKing and reading the status
> of an IRQ, and those with two registers for it: one where you ACK the
> IRQ (so it can immediately re-trigger) and one to read the status of
> whether it happened. Sometimes different handling is needed for
> levek and edge IRQs even (c.f. gpio-pl061.c).
> 
> Only the hardware with just one register for both things should use
> handle_simple_irq(). This seems to be the case here but I want you
> to verify.

Yes, our case is handle_simple_irq(), not handle_edge_irq(), handle_level_irq() or
handle_fasteoi_irq(), etc. because there is no ACK mechanism inside the
GPIO controller's interrupt logic - all we need to do is read the status
register to get the status and write-to-clear the status register so that
a new interrupt can be triggered, i.e. there is only one register for both.

> 
> Yours,
> Linus Walleij
