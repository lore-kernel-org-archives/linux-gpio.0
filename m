From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: [PATCH v3 0/7] gpio: mockup: improve the user-space testing interface
Date: Tue, 12 Feb 2019 14:15:53 +0100
Message-ID: <20190212131600.18960-1-brgl@bgdev.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <marc.zyngier@arm.com>, =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Bartosz Golaszewski <bgolaszewski@baylibre.com>
List-Id: linux-gpio@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Hi Marc,

this is a trimmed down version of the previous series. All irq_sim patches
from the previous implementation were dropped. The only change in irq_sim now
is addition of the irq_sim_get_type() helper. We store the irq type in the
irq_set_type() callback and allow users to retrieve it with the new function.

The entire logic handling the line state now lives directly in the only user
that needs it - the GPIO testing module. Since the GPIO user API only supports
edge interrupts, level types are not supported. This functionality is only
needed for user-space tests. The testing module tracks the line state and makes
sure to avoid impossible situations (like firing a rising edge interrupt if
the line is being driven low).

Other gpio-mockup patches are unchanged - the only change in patch 7 is the
line state tracking.

v1 -> v2:
- instead of providing the irq_sim_get_type() helper, move the irq type
  logic into the simulator and provide a helper that allows users to specify
  the type of the fired interrupt

v2 -> v3:
- switch back to having irq_sim_type() and put the line state logic into the
  GPIO testing module

Bartosz Golaszewski (7):
  irq/irq_sim: provide irq_sim_get_type()
  gpio: mockup: add locking
  gpio: mockup: implement get_multiple()
  gpio: mockup: don't create the debugfs link named after the label
  gpio: mockup: change the type of 'offset' to unsigned int
  gpio: mockup: change the signature of unlocked get/set helpers
  gpio: mockup: rework debugfs interface

 drivers/gpio/gpio-mockup.c | 188 +++++++++++++++++++++++++++++++------
 include/linux/irq_sim.h    |   2 +
 kernel/irq/irq_sim.c       |  23 +++++
 3 files changed, 186 insertions(+), 27 deletions(-)

-- 
2.20.1
