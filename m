From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2 0/3] pcf857x: Add OF support
Date: Tue, 20 Aug 2013 01:04:51 +0200
Message-ID: <1376953494-9684-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
List-Id: linux-gpio@vger.kernel.org

Hello,

Here's a small series of patches that add OF support to the pcf857x driver.
The first two patches prepare the driver for the third one that introduces DT
bindings and parses the device tree node.

Changes since v1:

- Add GPIO properties to the pcf8575 DT node in the bindings documentation

Laurent Pinchart (3):
  gpio: pcf857x: Sort headers alphabetically
  gpio: pcf857x: Remove pdata argument to pcf857x_irq_domain_init()
  gpio: pcf857x: Add OF support

 .../devicetree/bindings/gpio/gpio-pcf857x.txt      | 71 ++++++++++++++++++++++
 drivers/gpio/gpio-pcf857x.c                        | 70 ++++++++++++++++-----
 2 files changed, 125 insertions(+), 16 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/gpio-pcf857x.txt

-- 
Regards,

Laurent Pinchart
