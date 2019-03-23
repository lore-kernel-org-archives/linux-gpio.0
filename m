From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] genirq: Respect IRQCHIP_SKIP_SET_WAKE in
 irq_chip_set_wake_parent()
Date: Sat, 23 Mar 2019 10:42:58 +0100 (CET)
Message-ID: <alpine.DEB.2.21.1903231035140.2157@nanos.tec.linutronix.de>
References: <20190315200759.139479-1-swboyd@chromium.org>
 <alpine.DEB.2.21.1903211007310.1777@nanos.tec.linutronix.de>
 <155329862018.20095.14024385652448015564@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <155329862018.20095.14024385652448015564@swboyd.mtv.corp.google.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Boyd <swboyd@chromium.org>
Cc: Marc Zyngier <marc.zyngier@arm.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Lina Iyer <ilina@codeaurora.org>
List-Id: linux-gpio@vger.kernel.org

Stephen,

On Fri, 22 Mar 2019, Stephen Boyd wrote:
> Quoting Thomas Gleixner (2019-03-21 02:26:26)
> > 
> > set_irq_wake_real() returns 0 when the topmost chip has SKIP_SET_WAKE set.
> 
> Just to confirm, the topmost chip would be chip B or chip C below?

Yes. A is the parent of B, resp. the grandparent of C

> > 
> > So let's assume we have the following chains:
> > 
> >   chip A -> chip B 
> > 
> >   chip A -> chip B -> chip C
> > 
> > chip A has SKIP_SET_WAKE not set
> > chip B has SKIP_SET_WAKE set
> > chip C has SKIP_SET_WAKE not set and invokes irq_chip_set_wake_parent()
> > 
> > Now assume we have interrupt X connected to chip B and interrupt Y
> > connected to chip C.
> > 
> > If irq_set_wake() is called for interrupt X, then the function returns
> > without trying to invoke the set_wake() callback of chip A.
> 
> It's not clear to me that having SKIP_SET_WAKE set means "completely
> ignore set wake for irqs from this domain" vs. "skip setting wake here
> because the .irq_set_wake() is intentionally omitted for this chip".

That's a really good question, but I'd say that if one part of the
hierarchy does not require set wake, then this means no further action
required.

> Reading Santosh's reasoning in commit 60f96b41f71d ("genirq: Add
> IRQCHIP_SKIP_SET_WAKE flag") just further confuses me because it sounds
> like the latter.

That preceeds hierarchical irq domains. So back then a hierarchy was
expressed by weird callbacks, hardcoded dependencies, etc. That means if
the top level chip had SKIP_SET_WAKE set, the whole hierarchy was excluded.

> > If irq_set_wake() is called for interrupt Y, irq_chip_set_wake_parent() is
> > invoked from chip C which then skips chip B, but tries to invoke the
> > callback on chip A.
> > 
> > That's inconsistent and changes the existing behaviour. So IMO, the right
> > thing to do is to return 0 from irq_chip_set_wake_parent() when the parent
> > has SKIP_SET_WAKE set and not to try to follow the whole chain. That should
> > fix your problem nicely w/o changing behaviour.
> 
> Ok. I understand that with hierarchical chips you want it to be explicit
> in the code that a parent chip needs to be called or not. This works for

I think so.

> me, and it's actually how I had originally solved this problem. Will you
> merge your patch or do you want me to resend it with some updated commit
> text?

Please send a new version.

Thanks,

	tglx
