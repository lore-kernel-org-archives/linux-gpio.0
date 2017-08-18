From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v8 2/7] genirq: Add handle_fasteoi_{level,edge}_irq flow
 handlers.
Date: Fri, 18 Aug 2017 11:32:08 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1708181131540.1929@nanos>
References: <1503017616-3252-1-git-send-email-david.daney@cavium.com> <1503017616-3252-3-git-send-email-david.daney@cavium.com> <6100c1d2-537e-7cb0-0f38-18c0f6b78aa6@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from Galois.linutronix.de ([146.0.238.70]:40984 "EHLO
        Galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750905AbdHRJcN (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 18 Aug 2017 05:32:13 -0400
In-Reply-To: <6100c1d2-537e-7cb0-0f38-18c0f6b78aa6@arm.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Marc Zyngier <marc.zyngier@arm.com>
Cc: David Daney <david.daney@cavium.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Fri, 18 Aug 2017, Marc Zyngier wrote:

> On 18/08/17 01:53, David Daney wrote:
> > Follow-on patch for gpio-thunderx uses a irqdomain hierarchy which
> > requires slightly different flow handlers, add them to chip.c which
> > contains most of the other flow handlers.  Make these conditionally
> > compiled based on CONFIG_IRQ_FASTEOI_HIERARCHY_HANDLERS.
> > 
> > Signed-off-by: David Daney <david.daney@cavium.com>
> 
> Nit: $SUBJECT doesn't reflect the new function names.

Bah, too late ....
