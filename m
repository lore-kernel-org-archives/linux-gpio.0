From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH v2 0/3] gpio: davinci: Add support for TI K3 AM6 platform
Date: Wed, 5 Jun 2019 13:32:56 +0530
Message-ID: <20190605080259.2462-1-j-keerthy@ti.com>
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

Changes in v2:

  * Introduced a separate compatible for am654. 

Documentation patch link: https://patchwork.kernel.org/patch/10976445/

Keerthy (3):
  gpio: davinci: Fix the compiler warning with ARM64 config enabled
  gpio: davinci: Add new compatible for K3 AM654 SoCs
  gpio: Davinci: Add K3 dependencies

 drivers/gpio/Kconfig        | 2 +-
 drivers/gpio/gpio-davinci.c | 7 ++++---
 2 files changed, 5 insertions(+), 4 deletions(-)

-- 
2.17.1
