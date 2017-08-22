From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v8 0/7] genirq/gpio: Add driver for ThunderX and OCTEON-TX SoCs
Date: Tue, 22 Aug 2017 14:32:43 +0200
Message-ID: <CACRpkdYShFyRDP9yaizJm+baLD1udQJtUS5nycDTTxYbHBeA2g@mail.gmail.com>
References: <1503017616-3252-1-git-send-email-david.daney@cavium.com>
 <alpine.DEB.2.20.1708181123330.1929@nanos> <f663518b-6330-dfc7-1c55-79b4a5de33fe@caviumnetworks.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f663518b-6330-dfc7-1c55-79b4a5de33fe@caviumnetworks.com>
Sender: linux-kernel-owner@vger.kernel.org
To: David Daney <ddaney@caviumnetworks.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, David Daney <david.daney@cavium.com>, Alexandre Courbot <gnurou@gmail.com>, Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <marc.zyngier@arm.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

On Fri, Aug 18, 2017 at 8:07 PM, David Daney <ddaney@caviumnetworks.com> wrote:

> Thanks everybody for helping me work through the challenges of preparing
> this patch set.  Touching multiple subsystems under the stewardship of
> multiple maintainers can be difficult, but I think this worked out well.

I side with Thomas: thanks for working hard and doing the right thing
here where many would have given up.

It's exactly this deep integration of new drivers that make the kernel
provide such great infrastructure and clean drivers.

Now I feel I need to understand this think good enough to spot
the second driver that needs to do this already during early
review ...

Yours,
Linus Walleij
