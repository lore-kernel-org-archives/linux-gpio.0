From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v8 0/7] genirq/gpio: Add driver for ThunderX and OCTEON-TX
 SoCs
Date: Fri, 18 Aug 2017 11:24:57 +0200 (CEST)
Message-ID: <alpine.DEB.2.20.1708181123330.1929@nanos>
References: <1503017616-3252-1-git-send-email-david.daney@cavium.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1503017616-3252-1-git-send-email-david.daney@cavium.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Daney <david.daney@cavium.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

On Thu, 17 Aug 2017, David Daney wrote:

> The ThunderX/OCTEON-TX GPIO hardware looks like a PCIe device, with
> the interrupt signal from each GPIO line being routed to a dedicated
> MSI-X.  This interrupt routing requires that we add some custom
> processing to the beginning of the MSI-X irqdomain hierarchy.

I merged the irq core patches into

  git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git irq/for-gpio

This branch can be pulled into the GPIO tree to avoid pull request
dependencies.

Thanks,

	tglx
