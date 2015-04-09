From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: [PATCH] gpio: dwapb: enable for ARC
Date: Thu, 9 Apr 2015 07:48:06 +0000
Message-ID: <1428565685.2536.4.camel@synopsys.com>
References: <1427790607-24842-1-git-send-email-abrodkin@synopsys.com>
	 <CACRpkdYTpLKXRdeCVMkCnXmBg84HEsc0qzfPai5dFOnQ1G+ZVg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-7"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtprelay2.synopsys.com ([198.182.60.111]:34595 "EHLO
	smtprelay.synopsys.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751381AbbDIHvL convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Apr 2015 03:51:11 -0400
In-Reply-To: <CACRpkdYTpLKXRdeCVMkCnXmBg84HEsc0qzfPai5dFOnQ1G+ZVg@mail.gmail.com>
Content-Language: en-US
Content-ID: <0D6809D63CB4574DA33BEAED3EBF1756@internal.synopsys.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "linus.walleij@linaro.org" <linus.walleij@linaro.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Vineet.Gupta1@synopsys.com" <Vineet.Gupta1@synopsys.com>, "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "arnd@arndb.de" <arnd@arndb.de>

On Wed, 2015-04-08 at 17:03 +-0200, Linus Walleij wrote:
+AD4- On Tue, Mar 31, 2015 at 10:30 AM, Alexey Brodkin
+AD4- +ADw-Alexey.Brodkin+AEA-synopsys.com+AD4- wrote:
+AD4- 
+AD4- +AD4- From: Vineet Gupta +ADw-vgupta+AEA-synopsys.com+AD4-
+AD4- +AD4-
+AD4- +AD4- Synopsys SDP platform uses DW GPIO controller in design with
+AD4- +AD4- ARC cores. So adding ARC to architectures that may select this
+AD4- +AD4- GPIO controller.
+AD4- +AD4-
+AD4- +AD4- Even though support for Synopsys SDP is yet to be submitted we'll need
+AD4- +AD4- this tiny option enabled at least for properly working interrupts (DW
+AD4- +AD4- GPIO controller is used as interrupt controller).
+AD4- +AD4-
+AD4- +AD4- Signed-off-by: Vineet Gupta +ADw-vgupta+AEA-synopsys.com+AD4-
+AD4- +AD4- Signed-off-by: Alexey Brodkin +ADw-abrodkin+AEA-synopsys.com+AD4-
+AD4- +AD4- Cc: Andy Shevchenko +ADw-andriy.shevchenko+AEA-linux.intel.com+AD4-
+AD4- +AD4- Cc: Linus Walleij +ADw-linus.walleij+AEA-linaro.org+AD4-
+AD4- 
+AD4- Patch applied.
+AD4- 
+AD4- But ...
+AD4- 
+AD4- +AD4- -       depends on ((ARM +AHwAfA- ARM64) +ACYAJg- OF+AF8-GPIO) +AHwAfA- X86+AF8-INTEL+AF8-QUARK
+AD4- +AD4- +-       depends on ((ARC +AHwAfA- ARM +AHwAfA- ARM64) +ACYAJg- OF+AF8-GPIO) +AHwAfA- X86+AF8-INTEL+AF8-QUARK
+AD4- 
+AD4- This is getting a bit silly. What stops us from actually just enabling
+AD4- it for any architecture?

Agree. That looks like nonsense now.
Origin of arch-limitation is
http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/drivers/gpio/Kconfig?id+AD0-1972c97db5b0c125918f662cd084c7d5370674c0

---+AD4-8---
gpio: dwapb: fix compile errors
Whereas the DWAPB driver does not really depend on the ARM
architecture, it uses +AFs-readl+AHw-writel+AF0AXw-relaxed() not found on
arch such as Blackfin, so restrict this to ARM until there is
another architecture that can make use of it.

It is also using the of+AF8-node of the gpiochip, so fix this
too by requiring OF+AF8-GPIO.

All error/warnings:

make.cross ARCH+AD0-blackfin
drivers/gpio/gpio-dwapb.c: In function 'dwapb+AF8-irq+AF8-handler':
drivers/gpio/gpio-dwapb.c:91:2: error: implicit declaration of function
'readl+AF8-relaxed' +AFs--Werror+AD0-implicit-function-declaration+AF0-
drivers/gpio/gpio-dwapb.c: In function 'dwapb+AF8-configure+AF8-irqs':
drivers/gpio/gpio-dwapb.c:212:32: error: 'struct gpio+AF8-chip' has no
member named 'of+AF8-node'
drivers/gpio/gpio-dwapb.c:221:16: error: 'struct gpio+AF8-chip' has no
member named 'of+AF8-node'
drivers/gpio/gpio-dwapb.c: In function 'dwapb+AF8-gpio+AF8-add+AF8-port':
drivers/gpio/gpio-dwapb.c:331:14: error: 'struct gpio+AF8-chip' has no
member named 'of+AF8-node'
cc1: some warnings being treated as errors
---+AD4-8---

Probably better fix is to make dwgpio depend on +ACE-BLACKFIN because we
know it won't be built for it. If there're other arches that don't
define +AFs-readl+AHw-writel+AF0AXw-relaxed() we may add them as well.

-Alexey
