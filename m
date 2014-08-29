From: Soren Brinkmann <soren.brinkmann@xilinx.com>
Subject: [PATCH 0/3] gpio: zynq: Fix suspend/wake
Date: Fri, 29 Aug 2014 10:58:44 -0700
Message-ID: <1409335127-26712-1-git-send-email-soren.brinkmann@xilinx.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:44772 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751944AbaH2R7B (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 29 Aug 2014 13:59:01 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexandre Courbot <gnurou@gmail.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: =?UTF-8?q?S=C3=B6ren=20Brinkmann?= <soren.brinkmann@xilinx.com>, Michal Simek <michal.simek@xilinx.com>, Harini Katakam <harinik@xilinx.com>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, Ezra Savard <ezras@xilinx.com>

Hi Linus,

after our discussion during the push of the gpio-zynq driver, we took a
closer look at the LED and gpio_keys drivers.

=46or LEDs and other simple use-cases where you need to control an outp=
ut,
that driver is great and a patch to get the LEDs on our boards added to
DT is pending.

=46or the keys, and especially wake, things didn't look that good. Test=
ing
revealed a couple of flaws in the driver's wake-related implementation
which should be fixed with this series.

I'm still not fully convinced that the gpio_keys are the best
replacement for the sysfs interface when it comes to inputs. For that
reason and to have a way to do some quick wake testing, I'd like to
propose adding the ability to control wake through the sysfs interface
(patch 3).

The series is based on Linus T's current tip + the Zynq-related patches
from gpio/for-next + Lars' pending patch 'gpio: zynq: Take bank
offset into account when reporting a IRQ'.
A branch with all those patches can be found here:
https://github.com/sorenb-xlnx/linux-xlnx/commits/gpio

	Thanks,
	S=C3=B6ren

Ezra Savard (2):
  gpio: zynq: Mask non-wakeup GPIO interrupts on suspend
  gpio: zynq: Fixed broken wakeup implementation

Soren Brinkmann (1):
  gpio: lib-sysfs: Add 'wakeup' attribute

 drivers/gpio/gpio-zynq.c     | 38 +++++++++++++---------
 drivers/gpio/gpiolib-sysfs.c | 75 ++++++++++++++++++++++++++++++++++++=
++++----
 2 files changed, 92 insertions(+), 21 deletions(-)

--=20
2.1.0.1.g27b9230

--
To unsubscribe from this list: send the line "unsubscribe linux-gpio" i=
n
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
