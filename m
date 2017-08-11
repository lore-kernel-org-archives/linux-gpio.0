From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: Disable GPIO pin interrupts in suspend
Date: Fri, 11 Aug 2017 11:52:35 +0300
Message-ID: <20170811085235.GT2369@lahna.fi.intel.com>
References: <1502439824-18733-1-git-send-email-rushikesh.s.kadam@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:13530 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751416AbdHKI7L (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 11 Aug 2017 04:59:11 -0400
Content-Disposition: inline
In-Reply-To: <1502439824-18733-1-git-send-email-rushikesh.s.kadam@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Rushikesh S Kadam <rushikesh.s.kadam@intel.com>
Cc: heikki.krogerus@linux.intel.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, tglx@linutronix.de, rajneesh.bhardwaj@intel.com, andy@infradead.org, rjw@rjwysocki.net

On Fri, Aug 11, 2017 at 01:53:44PM +0530, Rushikesh S Kadam wrote:
> The fix prevents unintended wakes from second level GPIO pin interrupts.
> 
> On some Intel Kabylake platforms, it is observed that GPIO pin interrupts
> can wake the platform from suspend-to-idle, even though the IRQ is not
> configured as IRQF_NO_SUSPEND or enable_irq_wake().
> 
> This can cause undesired wakes on Mobile devices such as Laptops and
> Chromebook devices. For example a headset jack insertion is not a desired
> wake source on Chromebook devices.
> 
> The pinctrl-intel (GPIO controller) driver implements a "Shared IRQ" model.
> All GPIO pin interrupts are OR'ed and mapped to a first level IRQ14 (or
> IRQ15). The driver registers an irq_chip struct and maps an irq_domain for
> the GPIO pin interrupts. The IRQ14 handler demuxes and calls the second
> level IRQ for the respective pin.
> 
> In the suspend entry flow, at suspend_noirq stage, the kernel disables IRQs
> that are not marked for wake. The pinctrl-intel driver does not implement a
> irq_disable()  callback (to take advantage of lazy disabling). The
> pinctrl-intel GPIO interrupts are not disabled in hardware during suspend
> entry, and thus are able to wake the SoC out of suspend-to-idle.
> 
> This patch sets the IRQCHIP_MASK_ON_SUSPEND flag for the GPIO irq_chip, to
> disable the second level interrupts at suspend_noirq stage via the irq_mask
> callbacks. The irq_mask callback disables the IRQs in hardware by
> programming the corresponding GPIO pad registers. Only IRQs that are not
> marked for wake are disabled.

This is really good changelog!

> Signed-off-by: Rushikesh S Kadam <rushikesh.s.kadam@intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
