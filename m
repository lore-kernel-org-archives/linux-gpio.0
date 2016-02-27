From: Marek Vasut <marex@denx.de>
Subject: gpio-altera OF binding discrepancy
Date: Sat, 27 Feb 2016 03:10:36 +0100
Message-ID: <56D1059C.6090701@denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-out.m-online.net ([212.18.0.10]:58921 "EHLO
	mail-out.m-online.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755218AbcB0CKi (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 26 Feb 2016 21:10:38 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Tien Hock Loh <thloh@altera.com>, Linus Walleij <linus.walleij@linaro.org>

Hi!

I've just checked linux-4.4 and linux-next and discovered the following
issue.

The Documentation/devicetree/bindings/gpio/gpio-altera.txt lists OF
property altr,interrupt-trigger , which is not used anywhere in the
kernel tree.

The drivers/gpio/gpio-altera.c on the other hand checks for a mandatory
OF property altr,interrupt-type and assigns it into variable
altera_gc->interrupt_trigger . Note that if this property is not in the
DT, the driver will fail to probe.

Clearly, there is a typo between altr,interrupt-trigger and
altr,interrupt-type . Since the driver fails to probe if altr,...-type
property is not present, there must be users of this variant in the
wild. I believe the Documentation/devicetree is a part of DT ABI, so the
bindings there should not be randomly changed.

In this case, I would propose to change the Documentation though, since
any users who try to use altr,...-trigger will have probe failures and
fix their DT anyway.

Does this make sense ? If so, I will submit a patch .

Thanks!

-- 
Best regards,
Marek Vasut
