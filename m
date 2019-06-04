From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: [PATCH v2 12/22] docs: gpio: driver.rst: fix a bad tag
Date: Tue,  4 Jun 2019 11:17:46 -0300
Message-ID: <ee8f4f56658247a0ab0d9e2c16a9afafefe38da0.1559656538.git.mchehab+samsung@kernel.org>
References: <cover.1559656538.git.mchehab+samsung@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <cover.1559656538.git.mchehab+samsung@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>, Mauro Carvalho Chehab <mchehab@infradead.org>, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <bgolaszewski@baylibre.com>, linux-gpio@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org

With ReST, [foo]_ means a reference to foo, causing this warning:

    Documentation/driver-api/gpio/driver.rst:419: WARNING: Unknown target name: "devm".

Fix it by using a literal for the name.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/driver-api/gpio/driver.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/gpio/driver.rst b/Documentation/driver-api/gpio/driver.rst
index 58036c2d84d2..4af9aae724f0 100644
--- a/Documentation/driver-api/gpio/driver.rst
+++ b/Documentation/driver-api/gpio/driver.rst
@@ -418,7 +418,7 @@ symbol:
 
 If there is a need to exclude certain GPIO lines from the IRQ domain handled by
 these helpers, we can set .irq.need_valid_mask of the gpiochip before
-[devm_]gpiochip_add_data() is called. This allocates an .irq.valid_mask with as
+``[devm_]gpiochip_add_data()`` is called. This allocates an .irq.valid_mask with as
 many bits set as there are GPIO lines in the chip, each bit representing line
 0..n-1. Drivers can exclude GPIO lines by clearing bits from this mask. The mask
 must be filled in before gpiochip_irqchip_add() or gpiochip_irqchip_add_nested()
-- 
2.21.0
