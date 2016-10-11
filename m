From: Leo Li <pku.leo@gmail.com>
Subject: pca953x interrupt missing
Date: Tue, 11 Oct 2016 17:54:57 -0500
Message-ID: <CADRPPNQ3J3xT6zTTztRBuM0TRN54V=WB4bCwmSavKvTo_gC-oQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:36462 "EHLO
        mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752789AbcJKWzr (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 11 Oct 2016 18:55:47 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Marc Zyngier <maz@misterjones.org>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>
Cc: linux-gpio@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>, Marc Zyngier <marc.zyngier@arm.com>

Hi Marc,

You added the edge interrupt support to the pca953x driver with commit
(89ea8bbe9c). But recently I'm getting interrupt missing problem when
using the pca9555 as an interrupt controller.  After some research of
the PCA9555 data sheet, it seems to me that the hardware is not
capable of catching all edge changes without missing interrupt except
for the PCAL9555a variant with the latching support.  Quoted from the
pca9555 data sheet:

"The open-drain interrupt output is activated when one of the port
pins changes state and
the pin is configured as an input. The interrupt is deactivated when
the input returns to its
previous state or the Input Port register is read."

There is no latch register to record which pin has just changed.  So
if one of the input pin changes two times quickly before the read of
the Input Port register which is even more likely to happen as the
interrupt handling is delayed to work queue, we can not figure out
which pin has just changed by reading the Input Port register and
invoke the correct interrupt service routine.  However, I think it
would be possible to support level-sensitive interrupt input, as we
can get the current level through the Input Port register and figure
out which interrupt service routine to invoke.

I think we should remove the support for edge based interrupts for the
chips without the latching capability and add level based interrupt
support.  I'd like to have your thought on this.

Regards,
Leo
