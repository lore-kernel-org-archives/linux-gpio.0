From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2 1/2] irqchip: stm32: Optimizes and cleans up stm32-exti
 irq_domain
Date: Fri, 23 Feb 2018 09:42:38 +0100 (CET)
Message-ID: <alpine.DEB.2.21.1802230938510.11168@nanos.tec.linutronix.de>
References: <cover.1519374248.git.radoslaw.pietrzyk@gmail.com>
 <6491f248c6748f21a2acf310e186d2be4f9b4e4c.1519374248.git.radoslaw.pietrzyk@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <6491f248c6748f21a2acf310e186d2be4f9b4e4c.1519374248.git.radoslaw.pietrzyk@gmail.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Radoslaw Pietrzyk <radoslaw.pietrzyk@gmail.com>
Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>, Jason Cooper <jason@lakedaemon.net>, Marc Zyngier <marc.zyngier@arm.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Ludovic BARRE <ludovic.barre@st.com>, Benjamin Gaignard <benjamin.gaignard@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-arm-kernel@lists.infradead.org, Alexandre Torgue <alexandre.torgue@st.com>
List-Id: linux-gpio@vger.kernel.org

Radoslaw,

On Fri, 23 Feb 2018, Radoslaw Pietrzyk wrote:

> - discards setting handle_simple_irq handler for hierarchy interrupts
> - removes acking in chained irq handler as this is done by
> irq_chip itself inside handle_edge_irq
> - removes unneeded irq_domain_ops.xlate callback

if that's all functionally correct, then this is a nice cleanup. Though
from the above changelog its hard to tell because it merily tells WHAT the
patch does, but not WHY. The WHY is the important information for a
reviewer who is not familiar with the particular piece of code/hardware.

Can you please amend the changelog with proper explanations why a
particular piece of code is not needed or has to be changed to something
else?

Thanks,

	tglx
