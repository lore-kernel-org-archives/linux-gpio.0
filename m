From: Clemens Gruber <clemens.gruber@pqgruber.com>
Subject: gpio-pca953x: Spurious interrupts
Date: Mon, 13 Jul 2015 14:18:46 +0200
Message-ID: <20150713121845.GA1043@pqgruber.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.pqgruber.com ([178.189.19.235]:54573 "EHLO
	mail.pqgruber.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751123AbbGMMSt (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Jul 2015 08:18:49 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linux Walleij <linus.walleij@linaro.org>, Alexandre Courbot <acourbot@nvidia.com>

Hi,

after some more research, I found the reason why the pca953x driver in its
current state does not work well with my use case:
The problem occurs when using a PCA9555 and rapidly changing input states which
asserts and deasserts the INT line rapidly.

For the PCA9555 there is no solution, other than requiring that the interrupt
stays asserted until the inputs are read and that they do not change in between.

The PCAL9555A can latch its inputs and not assert the interrupt again until the
inputs are read. To find out which interrupt triggered, the interrupt status
registers need to be read. Otherwise the source of the interrupt is unknown,
which leads to the "nobody cared, disabling IRQ.." error after some time.

With the current logic (comparing with the old input values) the interrupts stay
unhandled because with a rapidly asserting and deasserting interrupt line, it
looks like the state did not change in the first place.

My idea for fixing this would be to treat the PCAL9555A interrupts differently:
By default, enabling the input latch for all inputs and clearing the hw
interrupt mask. Then in the interrupt handler, instead of comparing the input
values, read the status registers and after that read the corresponding input
registers. Then the interrupt line deasserts and we should no longer have
spurious interrupts.

If someone wants to use the PCAL9555A in the same way as a PCA9555, he can just
use the pca9555 dt id.

What do you think?

Btw: I marked the previous patchset as superseded in patchwork and I will send
a new version after having tested it thoroughly with PWM outputs connected to
the inputs, changing the input states with 1kHz or more.

Cheers,
Clemens
