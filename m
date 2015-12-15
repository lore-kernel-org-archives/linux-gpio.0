From: Christophe Ricard <christophe.ricard@gmail.com>
Subject: [PATCH v7 3/3] ACPI / spi: attach gpio irq from acpi description to spi device
Date: Tue, 15 Dec 2015 08:11:33 +0100
Message-ID: <1450163493-4938-4-git-send-email-christophe-h.ricard@st.com>
References: <1450163493-4938-1-git-send-email-christophe-h.ricard@st.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:35027 "EHLO
	mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932078AbbLOHLp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 15 Dec 2015 02:11:45 -0500
In-Reply-To: <1450163493-4938-1-git-send-email-christophe-h.ricard@st.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: rjw@rjwysocki.net, lenb@kernel.org, linus.walleij@linaro.org, gnurou@gmail.com, andriy.shevchenko@linux.intel.com, mika.westerberg@linux.intel.com, broonie@kernel.org
Cc: linux-spi@vger.kernel.org, linux-gpio@vger.kernel.org, linux-acpi@vger.kernel.org, Christophe Ricard <christophe-h.ricard@st.com>

spi->irq was ignoring GpioInt property setting it to -1.
acpi_dev_gpio_irq_get returns and configure the slave irq according to
the acpi slave node description.
It is now inline with devicetree behavior.

Signed-off-by: Christophe Ricard <christophe-h.ricard@st.com>
---
 drivers/spi/spi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 2b0a8ec..6e5d1f7 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -1583,6 +1583,8 @@ static int acpi_spi_add_resource(struct acpi_resource *ares, void *data)
 
 		if (acpi_dev_resource_interrupt(ares, 0, &r))
 			spi->irq = r.start;
+		else
+			spi->irq = acpi_dev_gpio_irq_get(ACPI_COMPANION(&spi->dev), 0);
 	}
 
 	/* Always tell the ACPI core to skip this resource */
-- 
2.1.4

