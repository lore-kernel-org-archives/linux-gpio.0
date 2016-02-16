From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v2 0/5] gpio: clean up irq_to_gpio and ARCH_NR_GPIOS
Date: Tue, 16 Feb 2016 16:37:59 +0100
Message-ID: <1455637086-2794174-1-git-send-email-arnd@arndb.de>
References: <20160202194831.10827.63244.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.13]:54092 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932371AbcBPPik (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Feb 2016 10:38:40 -0500
In-Reply-To: <20160202194831.10827.63244.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Russell King <rmk+kernel@arm.linux.org.uk>, Bjorn Helgaas <bhelgaas@google.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Ralf Baechle <ralf@linux-mips.org>, linux-mips@linux-mips.org

I noticed that arch/arm/include/asm/gpio.h can almost be removed,
after we have already removed the file for most other architectures
now.

When I removed it, I ran into problems with irq_to_gpio(), which
we had already killed off in ARM, but it survived (barely) in the
global headers and accidentally gained an invalid user

This kills it off some more.

The first patch should go as a bugfix into the MIPS tree, the
other ones should only get merged later, but I think that's fine
if they get submitted for 4.6. I left them as a series of five
patches to clarify the build-time dependency. Merging patch
2 before 1 turns the MIPS runtime error into a compiletime
error.

changes in v2:

* the MIPS change should now correctly fix the bug, thanks
  to Lars-Peter.

* I left out the ARM specific change for now, and just adapted
  the generic file so we don't need that any more.

*  Fixed the bug that Russell pointed out

	Arnd

