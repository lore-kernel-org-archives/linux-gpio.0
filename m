From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/4] gpio: remove broken irq_to_gpio() interface
Date: Tue, 16 Feb 2016 16:45:28 +0100
Message-ID: <2646870.5L1En4yxph@wuerfel>
References: <20160202194831.10827.63244.stgit@bhelgaas-glaptop2.roam.corp.google.com> <1455551208-2825510-2-git-send-email-arnd@arndb.de> <CACRpkdaQN9_qoTn4_riZGvi4BKRLEVkRRL4CWzKj8e_di7Q2Xg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:50161 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755294AbcBPPqG (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Feb 2016 10:46:06 -0500
In-Reply-To: <CACRpkdaQN9_qoTn4_riZGvi4BKRLEVkRRL4CWzKj8e_di7Q2Xg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Bjorn Helgaas <bhelgaas@google.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>, Linux MIPS <linux-mips@linux-mips.org>

On Tuesday 16 February 2016 16:42:18 Linus Walleij wrote:
> On Mon, Feb 15, 2016 at 4:46 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> 
> > gpiolib has removed the irq_to_gpio() API several years ago,
> > but the global header still provided a non-working stub.
> >
> > Apparently one new user has shown up in arch/mips, so this patch
> > moves the broken definition to where it is used, ensuring that
> > we get new users but not changing the current behavior on jz4740.
> >
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> Patch applied.
> 
> I expect the driver maintainer to deal with the resulting
> deprecation fallout.
> 

I've just sent v2 of the series, with a separate patch for MIPS
that now conflicts with this one. Can you pick up the new patch
instead?

	Arnd
