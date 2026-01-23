Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A509377576
	for <linux-gpio@vger.kernel.org>; Fri, 23 Jan 2026 09:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769161886; cv=none; b=oemvvL3VK1T+xQDsh3ZFFYiXn0tYD1gDadMuzbDRx8hZkjf3FWgnjessU8SKbCMD/++m1IWJV5VFXY25oJhVOkWut4EbdD8KOC3BzvAuq3OavfWL6bKt7qHSmww5B+xiGEDJSt19b8a6DyG/R7KUoXn2ZGBzTrftqidcIdzy9Js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769161886; c=relaxed/simple;
	bh=xG/SyNTXHnpNJ029Lls7rMWGTCQh0Ladw7IHu9fsCyo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Aoyl6yVbuox5JwBTNuNVqkLhWdFjJlWmaEgA/d46jCWdRCXVtVABKhI3t0e4YpT1YILoSCF/i0/8roD43k2OseLXOK0RBIs6iJR0j9kPJkgKZWsmi1Jf7P6dHV4Tosf8FLKcok1jDjIrAml3nh7i1DR+bOGgjoQAjGAOcsqPn4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1vjDoq-0000nr-II; Fri, 23 Jan 2026 10:51:08 +0100
From: Michael Tretter <m.tretter@pengutronix.de>
Date: Fri, 23 Jan 2026 10:51:05 +0100
Subject: [PATCH 1/2] gpiolib: introduce devm_fwnode_gpiod_get_optional()
 wrapper
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260123-gpio-devm_fwnode_gpiod_get_optional-v1-1-fb49905452a6@pengutronix.de>
References: <20260123-gpio-devm_fwnode_gpiod_get_optional-v1-0-fb49905452a6@pengutronix.de>
In-Reply-To: <20260123-gpio-devm_fwnode_gpiod_get_optional-v1-0-fb49905452a6@pengutronix.de>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, kernel@pengutronix.de, 
 Michael Tretter <m.tretter@pengutronix.de>, 
 Stefan Kerkmann <s.kerkmann@pengutronix.de>
X-Mailer: b4 0.14.3
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::54
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-gpio@vger.kernel.org

From: Stefan Kerkmann <s.kerkmann@pengutronix.de>

The helper makes it easier to handle optional GPIOs and simplifies the
error handling code.

Signed-off-by: Stefan Kerkmann <s.kerkmann@pengutronix.de>
Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 include/linux/gpio/consumer.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index cafeb7a40ad1..9328b67e26c0 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -607,6 +607,23 @@ struct gpio_desc *devm_fwnode_gpiod_get(struct device *dev,
 					   flags, label);
 }
 
+static inline
+struct gpio_desc *devm_fwnode_gpiod_get_optional(struct device *dev,
+						 struct fwnode_handle *fwnode,
+						 const char *con_id,
+						 enum gpiod_flags flags,
+						 const char *label)
+{
+	struct gpio_desc *desc;
+
+	desc = devm_fwnode_gpiod_get_index(dev, fwnode, con_id, 0,
+					   flags, label);
+	if (IS_ERR(desc) && PTR_ERR(desc) == -ENOENT)
+		return NULL;
+
+	return desc;
+}
+
 struct acpi_gpio_params {
 	unsigned int crs_entry_index;
 	unsigned short line_index;

-- 
2.47.3

