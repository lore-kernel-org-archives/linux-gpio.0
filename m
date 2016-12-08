From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] gpio: rcar: (re)add Runtime PM support
Date: Thu,  8 Dec 2016 18:32:26 +0100
Message-ID: <20161208173228.16835-1-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from smtp-4.sys.kth.se ([130.237.48.193]:36141 "EHLO
        smtp-4.sys.kth.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750838AbcLHRdU (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Dec 2016 12:33:20 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Geert Uytterhoeven <geert@linux-m68k.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Cc: Jon Hunter <jonathanh@nvidia.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>

Hi all,

This series (re)adds Runtime PM support which was reverted by:

commit 42c25013ca95ce79 ('Revert "gpio: rcar: Add Runtime PM handling for interrupts"')
commit ce0e2c60e69e5f87 ('Revert "gpio: rcar: Fine-grained Runtime PM support"')

The reason it was reverted was that 'Runtime PM handling for interrupts'
could triggering a BUG() in linux/drivers/base/power/runtime.c 'BUG: 
sleeping function called from invalid context', see [1]. Since then Jon 
Hunter have solved this in a generic way in:

commit be45beb2df6909d4 ("genirq: Add runtime power management support for IRQ chips")

Patch 1/2 make use of Jons work to make sure proper PM handling when an 
GPIO is requested as an interrupt and patch 2/2 is just a resurrection 
of Geerts original patch with small fixups to catch up with changes to 
the driver.

I have tested the series on Koelsch and Salvator-X H3 and can in in 
sysfs observe that only GPIO blocks which are used are powered on.  
Requesting a GPIO from a powered down block will power it on and 
releasing it will power it off.

To test that patch 1/2 works as expected I have done tests on Salvator-X 
where the EtherAVB will not work with patch 2/2 applied, which moves 
pm_runtime_get_sync() from probe time to gpio_rcar_request(). Whit that 
move the GPIO block used by EtherAVB will not be powered on unless done 
so when the interrupt is requested, which we add support for in 1/2.

I'm not sure on how to best resurrect a patch which have been reverted, 
I dropped all Signed-off-by lines except Geerts as he is the author and 
added my own Signed-off-by since I'm resending it. Hope this is OK, if 
not please let me know.

1. https://www.spinics.net/lists/linux-renesas-soc/msg02710.html

Geert Uytterhoeven (1):
  gpio: rcar: Fine-grained Runtime PM support

Niklas Söderlund (1):
  gpio: rcar: set IRQ chip parent_device

 drivers/gpio/gpio-rcar.c | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

-- 
2.10.2

