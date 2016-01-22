From: Peter Hung <hpeter@gmail.com>
Subject: [PATCH V2 0/1] gpio-f7188x: Add F81866 GPIO supports
Date: Fri, 22 Jan 2016 15:23:32 +0800
Message-ID: <1453447413-25290-1-git-send-email-hpeter+linux_kernel@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f66.google.com ([209.85.220.66]:33082 "EHLO
	mail-pa0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751645AbcAVHXi (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 22 Jan 2016 02:23:38 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, gnurou@gmail.com
Cc: simon.guinot@sequanux.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, peter_hong@fintek.com.tw, Peter Hung <hpeter+linux_kernel@gmail.com>

Fintek F81866 is a SuperIO. It contains HWMON/GPIO/Serial Ports.
and it has totally 72(9x8 sets) gpio pins.

Here is the PDF spec:
http://www.alldatasheet.com/datasheet-pdf/pdf/459085/FINTEK/F81866AD-I.html

The control method is the same with F7188x, but we should care the address
of GPIO8x.

GPIO address is below:
    GPIO0x based: 0xf0
    GPIO1x based: 0xe0
    GPIO2x based: 0xd0
    GPIO3x based: 0xc0
    GPIO4x based: 0xb0
    GPIO5x based: 0xa0
    GPIO6x based: 0x90
    GPIO7x based: 0x80
    GPIO8x based: 0x88 <-- not 0x70.

Change Log:
V2:
    1. V1 contains 2 patches, first is add F81866 and second is a filter
       to find enabled GPIO. But Simon say some mainboard maybe configure
       the SuperIO with wrong setting. So the V2 patch only implements
       F81866 GPIO control method the same with F7188x.

Peter Hung (1):
  gpio-f7188x: Add F81866 GPIO supports

 drivers/gpio/Kconfig       |  4 ++--
 drivers/gpio/gpio-f7188x.c | 27 ++++++++++++++++++++++++---
 2 files changed, 26 insertions(+), 5 deletions(-)

-- 
Change Log:
V2
    
1.9.1

