From: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: [PATCH v3 10/20] docs: gpio: driver.rst: fix a bad tag
Date: Fri,  7 Jun 2019 15:54:26 -0300
Message-ID: <123b42e77f9c1beadfcf7d93cfe1d5e3319049c4.1559933665.git.mchehab+samsung@kernel.org>
References: <ff457774d46d96e8fe56b45409aba39d87a8672a.1559933665.git.mchehab+samsung@kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ff457774d46d96e8fe56b45409aba39d87a8672a.1559933665.git.mchehab+samsung@kernel.org>
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
index 1ce7fcd0f989..25e2ddeb4f31 100644
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
