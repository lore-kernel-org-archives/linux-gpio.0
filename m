From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: [PATCH] gpio-dwapb: reset mask register on probe
Date: Mon, 9 Mar 2015 20:56:06 +0000
Message-ID: <1425934566.2312.16.camel@synopsys.com>
References: <1425372461-17859-1-git-send-email-abrodkin@synopsys.com>
	 <CACRpkdaknfTMb=1LVqNLTtV8Te+mjRdSZ=grk4NUGxKBt6gpCg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-7"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdaknfTMb=1LVqNLTtV8Te+mjRdSZ=grk4NUGxKBt6gpCg@mail.gmail.com>
Content-Language: en-US
Content-ID: <DA1D258C6A3C4A4AB5213C26F90F052A@internal.synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Vineet.Gupta1@synopsys.com" <Vineet.Gupta1@synopsys.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "gnurou@gmail.com" <gnurou@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

On Mon, 2015-03-09 at 14:59 +-0100, Linus Walleij wrote:
+AD4- On Tue, Mar 3, 2015 at 9:47 AM, Alexey Brodkin
+AD4- +ADw-Alexey.Brodkin+AEA-synopsys.com+AD4- wrote:

+AD4- +AD4- +-+-+- b/drivers/gpio/gpio-dwapb.c
+AD4- +AD4- +AEAAQA- -370,6 +-370,9 +AEAAQA- static void dwapb+AF8-configure+AF8-irqs(struct dwapb+AF8-gpio +ACo-gpio,
+AD4- +AD4-                 irq+AF8-create+AF8-mapping(gpio-+AD4-domain, hwirq)+ADs-
+AD4- +AD4-
+AD4- +AD4-         port-+AD4-bgc.gc.to+AF8-irq +AD0- dwapb+AF8-gpio+AF8-to+AF8-irq+ADs-
+AD4- +AD4- +-
+AD4- +AD4- +-       /+ACo- Reset mask register +ACo-/
+AD4- +AD4- +-       dwapb+AF8-write(gpio, GPIO+AF8-INTMASK, 0)+ADs-
+AD4- 
+AD4- I don't get this. This looks like you just enable all interrupts. The
+AD4- driver also contains this in .suspend():

DW APB GPIO has 2 separate registers related to interrupts:

 +AFs-1+AF0- Mask interrupt register
 +AFs-2+AF0- Enable interrupt register

So what I do in my patch I unmask all interrupts. But before at least
one interrupt is enabled output interrupt line will never get in active
state. And by default all interrupts are disabled (reset value +AD0- 0).

+AD4- /+ACo- Mask out interrupts +ACo-/
+AD4- dwapb+AF8-write(gpio, GPIO+AF8-INTMASK, 0xffffffff)+ADs-
+AD4- 
+AD4- If +ACo-anything+ACo- the probe should +ACo-mask+ACo- all interrupts so that the
+AD4- .unmask() callback can enable them selectively.

I'm going to agree with this statement, but this requires a bit more
significant change in driver. I just wanted to fix an issue I discovered
on my setup.

Interestingly what I observed in my testing that if both
enable()/disable() and mask()/unmask() are implemented in driver then
only enable()/disable() pair will be actually used.

Look at how generic irq+AF8-enable() function is implemented -
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/kernel/irq/chip.c+ACM-n208

 ---+AD4-8---
 void irq+AF8-enable(struct irq+AF8-desc +ACo-desc)
 +AHs-
	irq+AF8-state+AF8-clr+AF8-disabled(desc)+ADs-
	if (desc-+AD4-irq+AF8-data.chip-+AD4-irq+AF8-enable)
		desc-+AD4-irq+AF8-data.chip-+AD4-irq+AF8-enable(+ACY-desc-+AD4-irq+AF8-data)+ADs-
	else
		desc-+AD4-irq+AF8-data.chip-+AD4-irq+AF8-unmask(+ACY-desc-+AD4-irq+AF8-data)+ADs-
	irq+AF8-state+AF8-clr+AF8-masked(desc)+ADs-
 +AH0- 
 ---+AD4-8---

+AD4- The real problem I think is that struct irq+AF8-chip contains
+AD4- mask()/unmask() callbacks that are not implemented
+AD4- by this driver.

I'd say that mask()/unmask() callbacks are implemented in this driver
already.

See
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/tree/drivers/gpio/gpio-dwapb.c+ACM-n334
 ---+AD4-8---
		ct-+AD4-chip.irq+AF8-mask +AD0- irq+AF8-gc+AF8-mask+AF8-set+AF8-bit+ADs-
		ct-+AD4-chip.irq+AF8-unmask +AD0- irq+AF8-gc+AF8-mask+AF8-clr+AF8-bit+ADs-
		ct-+AD4-chip.irq+AF8-set+AF8-type +AD0- dwapb+AF8-irq+AF8-set+AF8-type+ADs-
		ct-+AD4-chip.irq+AF8-enable +AD0- dwapb+AF8-irq+AF8-enable+ADs-
		ct-+AD4-chip.irq+AF8-disable +AD0- dwapb+AF8-irq+AF8-disable+ADs-
 ---+AD4-8---

It actually uses generic implementation of mask set bit and clear bit:
irq+AF8-gc+AF8-mask+AF8-set+AF8-bit()/irq+AF8-gc+AF8-mask+AF8-clr+AF8-bit() that operate under
GPIO+AF8-INTMASK register. And I may confirm that these functions correctly
set/reset bits in mask register of GPIO controller.


+AD4- Can you please test the below (untested) patch instead:
+AD4- 
+AD4- From: Linus Walleij +ADw-linus.walleij+AEA-linaro.org+AD4-
+AD4- Date: Mon, 9 Mar 2015 14:56:18 +-0100
+AD4- Subject: +AFs-PATCH+AF0- RFC: gpio: dwapb: handle mask/unmask properly
+AD4- 
+AD4- This implements the callbacks for masking/unmasking IRQs in the
+AD4- special IRQ mask/unmask register of the DWAPB GPIO block.
+AD4- Previously these mask bits were unhandled and relied on
+AD4- boot-up defaults.
+AD4- 
+AD4- Reported-by: Alexey Brodkin +ADw-Alexey.Brodkin+AEA-synopsys.com+AD4-
+AD4- Signed-off-by: Linus Walleij +ADw-linus.walleij+AEA-linaro.org+AD4-
+AD4- ---
+AD4-  drivers/gpio/gpio-dwapb.c +AHw- 30 +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-
+AD4-  1 file changed, 30 insertions(+-)
+AD4- 
+AD4- diff --git a/drivers/gpio/gpio-dwapb.c b/drivers/gpio/gpio-dwapb.c
+AD4- index 58faf04fce5d..1396f26bac5d 100644
+AD4- --- a/drivers/gpio/gpio-dwapb.c
+AD4- +-+-+- b/drivers/gpio/gpio-dwapb.c
+AD4- +AEAAQA- -158,6 +-158,30 +AEAAQA- static void dwapb+AF8-irq+AF8-handler(u32 irq, struct
+AD4- irq+AF8-desc +ACo-desc)
+AD4-          chip-+AD4-irq+AF8-eoi(irq+AF8-desc+AF8-get+AF8-irq+AF8-data(desc))+ADs-
+AD4-  +AH0-
+AD4- 
+AD4- +-static void dwapb+AF8-irq+AF8-mask(struct irq+AF8-data +ACo-d)
+AD4- +-+AHs-
+AD4- +-    struct irq+AF8-chip+AF8-generic +ACo-igc +AD0- irq+AF8-data+AF8-get+AF8-irq+AF8-chip+AF8-data(d)+ADs-
+AD4- +-    struct dwapb+AF8-gpio +ACo-gpio +AD0- igc-+AD4-private+ADs-
+AD4- +-
+AD4- +-    spin+AF8-lock+AF8-irqsave(+ACY-bgc-+AD4-lock, flags)+ADs-
+AD4- +-    val +AD0- dwapb+AF8-read(gpio, GPIO+AF8-INTMASK)+ADs-
+AD4- +-    val +AHwAPQ- BIT(d-+AD4-hwirq)+ADs-
+AD4- +-    dwapb+AF8-write(gpio, GPIO+AF8-INTMASK, val)+ADs-
+AD4- +-    spin+AF8-unlock+AF8-irqrestore(+ACY-bgc-+AD4-lock, flags)+ADs-
+AD4- +-+AH0-
+AD4- +-
+AD4- +-static void dwapb+AF8-irq+AF8-unmask(struct irq+AF8-data +ACo-d)
+AD4- +-+AHs-
+AD4- +-    struct irq+AF8-chip+AF8-generic +ACo-igc +AD0- irq+AF8-data+AF8-get+AF8-irq+AF8-chip+AF8-data(d)+ADs-
+AD4- +-    struct dwapb+AF8-gpio +ACo-gpio +AD0- igc-+AD4-private+ADs-
+AD4- +-
+AD4- +-    spin+AF8-lock+AF8-irqsave(+ACY-bgc-+AD4-lock, flags)+ADs-
+AD4- +-    val +AD0- dwapb+AF8-read(gpio, GPIO+AF8-INTMASK)+ADs-
+AD4- +-    val +ACYAPQ- +AH4-BIT(d-+AD4-hwirq)+ADs-
+AD4- +-    dwapb+AF8-write(gpio, GPIO+AF8-INTMASK, val)+ADs-
+AD4- +-    spin+AF8-unlock+AF8-irqrestore(+ACY-bgc-+AD4-lock, flags)+ADs-
+AD4- +-+AH0-

Why would we need these custom functions if there're already
irq+AF8-gc+AF8-mask+AF8-set+AF8-bit()/irq+AF8-gc+AF8-mask+AF8-clr+AF8-bit() implemented in
kernel/irq/generic-chip.c

+AD4-  static void dwapb+AF8-irq+AF8-enable(struct irq+AF8-data +ACo-d)
+AD4-  +AHs-
+AD4-      struct irq+AF8-chip+AF8-generic +ACo-igc +AD0- irq+AF8-data+AF8-get+AF8-irq+AF8-chip+AF8-data(d)+ADs-
+AD4- +AEAAQA- -302,6 +-326,10 +AEAAQA- static void dwapb+AF8-configure+AF8-irqs(struct dwapb+AF8-gpio +ACo-gpio,
+AD4-      struct irq+AF8-chip+AF8-type +ACo-ct+ADs-
+AD4-      int err, i+ADs-
+AD4- 
+AD4- +-    /+ACo- Mask out and disable all interrupts +ACo-/
+AD4- +-    dwapb+AF8-write(gpio, GPIO+AF8-INTMASK, 0xffffffff)+ADs-
+AD4- +-    dwapb+AF8-write(gpio, GPIO+AF8-INTEN, 0)+ADs-

This looks good to me - it's always a good idea to make sure defaults
are set as we expect.

+AD4-      gpio-+AD4-domain +AD0- irq+AF8-domain+AF8-add+AF8-linear(node, ngpio,
+AD4-                           +ACY-irq+AF8-generic+AF8-chip+AF8-ops, gpio)+ADs-
+AD4-      if (+ACE-gpio-+AD4-domain)
+AD4- +AEAAQA- -334,6 +-362,8 +AEAAQA- static void dwapb+AF8-configure+AF8-irqs(struct dwapb+AF8-gpio +ACo-gpio,
+AD4-          ct-+AD4-chip.irq+AF8-mask +AD0- irq+AF8-gc+AF8-mask+AF8-set+AF8-bit+ADs-
+AD4-          ct-+AD4-chip.irq+AF8-unmask +AD0- irq+AF8-gc+AF8-mask+AF8-clr+AF8-bit+ADs-
+AD4-          ct-+AD4-chip.irq+AF8-set+AF8-type +AD0- dwapb+AF8-irq+AF8-set+AF8-type+ADs-
+AD4- +-        ct-+AD4-chip.irq+AF8-mask +AD0- dwapb+AF8-irq+AF8-mask+ADs-
+AD4- +-        ct-+AD4-chip.irq+AF8-unmask +AD0- dwapb+AF8-irq+AF8-unmask+ADs-

Looks like we set +ACI-ct-+AD4-chip.irq+AF8-mask+ACI- and +ACI-ct-+AD4-chip.irq+AF8-unmask+ACI- twice,
don't we?

-Alexey
