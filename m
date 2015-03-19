From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: [PATCH] gpio-dwapb: reset mask register on probe
Date: Thu, 19 Mar 2015 08:44:01 +0000
Message-ID: <1426754640.2742.19.camel@synopsys.com>
References: <1425372461-17859-1-git-send-email-abrodkin@synopsys.com>
	 <CACRpkdaknfTMb=1LVqNLTtV8Te+mjRdSZ=grk4NUGxKBt6gpCg@mail.gmail.com>
	 <1425934566.2312.16.camel@synopsys.com>
	 <CACRpkdYMtAzWyshP0_x-qucz2j=1JE_=DE3Y7TARWGxDQxnurA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-7"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <CACRpkdYMtAzWyshP0_x-qucz2j=1JE_=DE3Y7TARWGxDQxnurA@mail.gmail.com>
Content-Language: en-US
Content-ID: <0E7029821DD768499A63737BB69A7BA2@internal.synopsys.com>
Sender: linux-kernel-owner@vger.kernel.org
To: "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Vineet.Gupta1@synopsys.com" <Vineet.Gupta1@synopsys.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "gnurou@gmail.com" <gnurou@gmail.com>
List-Id: linux-gpio@vger.kernel.org

Hi Linus,

On Tue, 2015-03-17 at 17:54 +-0100, Linus Walleij wrote:
+AD4- +AD4APg- +-    /+ACo- Mask out and disable all interrupts +ACo-/
+AD4- +AD4APg- +-    dwapb+AF8-write(gpio, GPIO+AF8-INTMASK, 0xffffffff)+ADs-
+AD4- +AD4APg- +-    dwapb+AF8-write(gpio, GPIO+AF8-INTEN, 0)+ADs-
+AD4- +AD4-
+AD4- +AD4- This looks good to me - it's always a good idea to make sure defaults
+AD4- +AD4- are set as we expect.
+AD4- 
+AD4- So should I cook a patch doing just these two lines?
+AD4- 
+AD4- But the initial patch unmasking all IRQs then? Is that even needed?

Oops, my bad here :)

I intentionally wrote 0 to MASK register to return it to default state
(if pre-bootloader messes it). As I explained if we really mask all
interrupts (together with disabling them all via INTEN) then interrupts
will never happen.

If we look at DW APB GPIO databook it says:
---+AD4-8---
Whenever a 1 is written to a bit of this register +AFs-GPIO+AF8-INTEN+AF0-, it
configures the corresponding bit on Port A to become an interrupt+ADs-
otherwise, Port A operates as a normal GPIO signal.
---+AD4-8---

While for GPIO+AF8-INTMASK it says:
---+AD4-8---
Controls whether an interrupt on Port A can create an interrupt for the
interrupt controller by not masking it. By default, all interrupts bits
are unmasked.
---+AD4-8---

So IMHO we need to update +ACI-gpio-dwapb+ACI- driver in the following manner:

 +AFs-1+AF0- In dwapb+AF8-configure+AF8-irqs() in accordance to +ACI-snps,nr-gpios+ACI- in the
first bank set a value in GPIO+AF8-INTEN. This way we turn N pins in that
port/bank in +ACI-interrupt+ACI- mode from their default gpio mode.

 +AFs-2+AF0- Don't expose dwapb+AF8-irq+AF8-enable()/dwapb+AF8-irq+AF8-disable() through
ct-+AD4-chip.irq+AF8-enable/ct-+AD4-chip.irq+AF8-disable. Because we don't want to
toggle modes of pins, right?

 +AFs-3+AF0- Use ct-+AD4-chip.irq+AF8-mask/ct-+AD4-chip.irq+AF8-unmask for purpose of real
enabling/disabling interrupts.

If I'm not missing something that would be implementation that matches
real device specification.

If we do these changes then indeed we'll want to make sure GPIO+AF8-INTMASK
is initialized with all interrupts masked out:
---+AD4-8---
dwapb+AF8-write(gpio, GPIO+AF8-INTMASK, 0xffffffff)+ADs-
---+AD4-8---

Let me know if my proposal makes sense and then I'll send patch that
implements it.

-Alexey
