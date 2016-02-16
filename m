From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH 1/4] gpio: remove broken irq_to_gpio() interface
Date: Tue, 16 Feb 2016 16:53:43 +0100
Message-ID: <CACRpkdYDqU7bbZguifQ2cos0r0ywgofzx4XvsmkQ8d73W9183A@mail.gmail.com>
References: <20160202194831.10827.63244.stgit@bhelgaas-glaptop2.roam.corp.google.com>
	<1455551208-2825510-2-git-send-email-arnd@arndb.de>
	<CACRpkdaQN9_qoTn4_riZGvi4BKRLEVkRRL4CWzKj8e_di7Q2Xg@mail.gmail.com>
	<2646870.5L1En4yxph@wuerfel>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f182.google.com ([209.85.214.182]:33436 "EHLO
	mail-ob0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932282AbcBPPxr (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 16 Feb 2016 10:53:47 -0500
Received: by mail-ob0-f182.google.com with SMTP id jq7so80285100obb.0
        for <linux-gpio@vger.kernel.org>; Tue, 16 Feb 2016 07:53:46 -0800 (PST)
In-Reply-To: <2646870.5L1En4yxph@wuerfel>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Arnd Bergmann <arnd@arndb.de>
Cc: Alexandre Courbot <gnurou@gmail.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Russell King <rmk+kernel@arm.linux.org.uk>, Bjorn Helgaas <bhelgaas@google.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ralf Baechle <ralf@linux-mips.org>, Paul Burton <paul.burton@imgtec.com>, Linux MIPS <linux-mips@linux-mips.org>

On Tue, Feb 16, 2016 at 4:45 PM, Arnd Bergmann <arnd@arndb.de> wrote:

> I've just sent v2 of the series, with a separate patch for MIPS
> that now conflicts with this one. Can you pick up the new patch
> instead?

OK I'll back out and apply the v2 versions.

Yours,
Linus Walleij
