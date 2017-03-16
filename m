From: Ralph Sennhauser <ralph.sennhauser@gmail.com>
Subject: [PATCH 2/6] gpio: mvebu: start multiline block comments with blank line
Date: Thu, 16 Mar 2017 07:33:57 +0100
Message-ID: <20170316063402.8667-3-ralph.sennhauser@gmail.com>
References: <20170316063402.8667-1-ralph.sennhauser@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20170316063402.8667-1-ralph.sennhauser@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Ralph Sennhauser <ralph.sennhauser@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, open list <linux-kernel@vger.kernel.org>
List-Id: linux-gpio@vger.kernel.org

While this isn't an issue according to checkpatch two styles are used.
Add a blank line to the block comments missing a blank line at the start
so multiline block comments look the same across the file.

Signed-off-by: Ralph Sennhauser <ralph.sennhauser@gmail.com>
---
 drivers/gpio/gpio-mvebu.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index a2351f3..80b1d52 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -788,7 +788,8 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 		goto err_domain;
 	}
 
-	/* NOTE: The common accessors cannot be used because of the percpu
+	/*
+	 * NOTE: The common accessors cannot be used because of the percpu
 	 * access to the mask registers
 	 */
 	gc = irq_get_domain_generic_chip(mvchip->domain, 0);
@@ -809,7 +810,8 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 	ct->handler = handle_edge_irq;
 	ct->chip.name = mvchip->chip.label;
 
-	/* Setup the interrupt handlers. Each chip can have up to 4
+	/*
+	 * Setup the interrupt handlers. Each chip can have up to 4
 	 * interrupt handlers, with each handler dealing with 8 GPIO
 	 * pins.
 	 */
-- 
2.10.2
