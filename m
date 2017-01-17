From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH V3 0/5] gpio: davinci: Redesign driver to accommodate ngpios in one gpio chip
Date: Tue, 17 Jan 2017 21:49:10 +0530
Message-ID: <1484669955-5349-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com, grygorii.strashko@ti.com, j-keerthy@ti.com, t-kristo@ti.com
List-Id: linux-gpio@vger.kernel.org

The Davinci GPIO driver is implemented to work with one monolithic
Davinci GPIO platform device which may have up to Y(144) gpios.
The Davinci GPIO driver instantiates number of GPIO chips with
max 32 gpio pins per each during initialization and one IRQ domain.
So, the current GPIO's  opjects structure is:

<platform device> Davinci GPIO controller
 |- <gpio0_chip0> ------|
 ...                    |--- irq_domain (hwirq [0..143])
 |- <gpio0_chipN> ------|

Current driver creates one chip for every 32 GPIOs in a controller.
This was a limitation earlier now there is no need for that. Hence
redesigning the driver to create one gpio chip for all the ngpio
in the controller.

|- <gpio0_chip0> ------|--- irq_domain (hwirq [0..143]).

The previous discussion on this can be found here:
https://www.spinics.net/lists/linux-omap/msg132869.html

The series is posted on top of: 

https://lkml.org/lkml/2017/1/4/94

Changes in v2:

  * Optimized the re-design patch.
  * Added couple of code clean ups after the re-design.
  * Included v2 of https://patchwork.ozlabs.org/patch/710855/ 

Changes in v3:

  * Removed one of the clean up patches. As the macros were needed.

Keerthy (5):
  gpio: davinci: Remove gpio2regs function to accommodate multi
    instances
  gpio: davinci: Remove unwanted blank line
  gpio: davinci: Redesign driver to accommodate ngpios in one gpio chip
  gpio: davinci: Add support for multiple GPIO controllers
  gpio: davinci: Remove custom .xlate
  gpio: davinci: Remove redundant macros

 drivers/gpio/gpio-davinci.c                | 174 +++++++++++++----------------
 include/linux/platform_data/gpio-davinci.h |  20 ++--
 2 files changed, 90 insertions(+), 104 deletions(-)

-- 
1.9.1
