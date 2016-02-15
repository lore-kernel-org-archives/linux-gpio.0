From: Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH 0/4] clean up irq_to_gpio and asm/gpio.h
Date: Mon, 15 Feb 2016 16:46:27 +0100
Message-ID: <1455551208-2825510-1-git-send-email-arnd@arndb.de>
References: <20160202194831.10827.63244.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.126.133]:63659 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750881AbcBOPrZ (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 15 Feb 2016 10:47:25 -0500
In-Reply-To: <20160202194831.10827.63244.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, Russell King <rmk+kernel@arm.linux.org.uk>, Bjorn Helgaas <bhelgaas@google.com>, Alexandre Courbot <gnurou@gmail.com>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

I noticed that arch/arm/include/asm/gpio.h can almost be removed,
after we have already removed the file for most other architectures
now.

When I removed it, I ran into problems with irq_to_gpio(), which
we had already killed off in ARM, but it survived (barely) in the
global headers. this kills it off some more as well.

I'd suggest merging all four patches through the GPIO tree.

	Arnd

