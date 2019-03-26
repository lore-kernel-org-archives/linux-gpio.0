From: Marc Zyngier <marc.zyngier@arm.com>
Subject: Re: [PATCH v2] genirq: Respect IRQCHIP_SKIP_SET_WAKE in
 irq_chip_set_wake_parent()
Date: Tue, 26 Mar 2019 11:11:56 +0000
Message-ID: <f53f4556-72f1-051b-0dbe-f1789521233e@arm.com>
References: <20190325181026.247796-1-swboyd@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20190325181026.247796-1-swboyd@chromium.org>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <swboyd@chromium.org>, Thomas Gleixner <tglx@linutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Lina Iyer <ilina@codeaurora.org>
List-Id: linux-gpio@vger.kernel.org

Hi Stephen,

On 25/03/2019 18:10, Stephen Boyd wrote:
> This function returns an error if a child irqchip calls
> irq_chip_set_wake_parent() but its parent irqchip has the
> IRQCHIP_SKIP_SET_WAKE flag set. Let's return 0 for success here instead
> because there isn't anything to do.
> 
> This keeps the behavior consistent with how set_irq_wake_real() is
> implemented. That function returns 0 when the irqchip has the
> IRQCHIP_SKIP_SET_WAKE flag set. It doesn't attempt to walk the chain of
> parents and set irq wake on any chips that don't have the flag set
> either. If the intent is to call the .irq_set_wake() callback of the
> parent irqchip, then we expect irqchip implementations to omit the
> IRQCHIP_SKIP_SET_WAKE flag and implement an .irq_set_wake() function
> that calls irq_chip_set_wake_parent().
> 
> This fixes a problem on my Qualcomm sdm845 device where I can't set wake
> on any GPIO interrupts after I apply work in progress wakeup irq patches
> to the GPIO driver. The chain of chips looks like this:
> 
>  ARM GIC (skip) -> QCOM PDC (skip) -> QCOM GPIO

nit: the parenting chain is actually built the other way around (we
don't express the 'child' relationship). This doesn't change anything to
the patch, but would make the reasoning a but easier to understand.

> 
> The GPIO controller is a child of the QCOM PDC irqchip which is a child
> of the ARM GIC irqchip. The QCOM PDC irqchip has the
> IRQCHIP_SKIP_SET_WAKE flag set, and so does the grandparent ARM GIC.
> 
> The GPIO driver doesn't know if the parent needs to set wake or not, so
> it unconditionally calls irq_chip_set_wake_parent() causing this
> function to return a failure because the parent irqchip (PDC) doesn't
> have the .irq_set_wake() callback set. Returning 0 instead makes
> everything work and irqs from the GPIO controller can be configured for
> wakeup.
> 
> Cc: Lina Iyer <ilina@codeaurora.org>
> Cc: Marc Zyngier <marc.zyngier@arm.com>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Fixes: 08b55e2a9208e ("genirq: Add irqchip_set_wake_parent")
Acked-by: Marc Zyngier <marc.zyngier@arm.com>

Thanks,

	M.
-- 
Jazz is not dead. It just smells funny...
