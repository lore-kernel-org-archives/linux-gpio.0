From: Keerthy <j-keerthy@ti.com>
Subject: [PATCH 0/3] gpio: davinci: Redesign driver to accommodate ngpios in one gpio chip
Date: Wed, 11 Jan 2017 10:30:38 +0530
Message-ID: <1484110841-2391-1-git-send-email-j-keerthy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from lelnx194.ext.ti.com ([198.47.27.80]:44564 "EHLO
        lelnx194.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750708AbdAKFCO (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Jan 2017 00:02:14 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org, t-kristo@ti.com
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com, grygorii.strashko@ti.com, j-keerthy@ti.com

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

The series is posted on top of coouple of clean up patches:

https://lkml.org/lkml/2017/1/4/94
https://patchwork.ozlabs.org/patch/710855/

Keerthy (3):
  gpio: davinci: Remove unwanted blank line
  gpio: davinci: Redesign driver to accomodate ngpio in one gpio chip
  gpio: davinci: Add support for multiple GPIO controllers

 drivers/gpio/gpio-davinci.c                | 129 +++++++++++++++++------------
 include/linux/platform_data/gpio-davinci.h |  13 ++-
 2 files changed, 86 insertions(+), 56 deletions(-)

-- 
1.9.1

