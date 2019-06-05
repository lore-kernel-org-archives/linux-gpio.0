From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH 0/2] gpio: davinci: Add support for TI K3 AM6 platform
Date: Wed, 5 Jun 2019 11:25:17 +0530
Message-ID: <20190605055519.24079-1-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org, bgolaszewski@baylibre.com
Cc: lokeshvutla@ti.com, linux-gpio@vger.kernel.org, t-kristo@ti.com, j-keerthy@ti.com, linux-kernel@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

K3 AM6 platform has 2 instances of gpio banks on main domain
and 1 instance on wakeup domin. All are capable of generating
banked interrupts.

Keerthy (2):
  gpio: davinci: Fix the compiler warning with ARM64 config enabled
  gpio: Davinci: Add K3 Specific dependencies

 drivers/gpio/Kconfig        | 2 +-
 drivers/gpio/gpio-davinci.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.17.1
