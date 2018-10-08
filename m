From: Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH 0/4] gpio chip cascade fixes
Date: Mon,  8 Oct 2018 09:32:12 -0700
Message-ID: <20181008163216.97436-1-swboyd@chromium.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Evan Green <evgreen@chromium.org>, Thierry Reding <treding@nvidia.com>, Grygorii Strashko <grygorii.strashko@ti.com>
List-Id: linux-gpio@vger.kernel.org

Originally this was a single patch but then I noticed some
other things that didn't seem quite right so I added on a few
more patches after that. The first patch is the important one
because it fixes a bug where a stack pointer is assigned to
the gpio_irq_chip structure and used later on when that stack
is gone.

Cc: Evan Green <evgreen@chromium.org>
Cc: Thierry Reding <treding@nvidia.com>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>

Stephen Boyd (4):
  gpio: Assign gpio_irq_chip::parents to non-stack pointer
  gpio: Drop parent irq assignment during cascade setup
  gpio: Remove unused 'irqchip' argument to
    gpiochip_set_cascaded_irqchip()
  gpio: Clarify kerneldoc on gpiochip_set_chained_irqchip()

 drivers/gpio/gpiolib.c      | 24 +++++-------------------
 include/linux/gpio/driver.h |  5 +++++
 2 files changed, 10 insertions(+), 19 deletions(-)

-- 
Sent by a computer through tubes
