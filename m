Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.19.166.231
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792607865;
	b=eYEMyrfbfPbETBmu6pk8u+KqQ503s8juYM3Dbq8B65PfLbbmNOncQhY8iky+KPb5Q45I
	 i3ziKo8JR2NEQo9ZHmx4SEwzbcJ81Mxs4/UxkBVsjQB+H5iKcs7Y4ppcM9vX0z496GAhs
	 teIuaH0hWkdXOwc0fRzMv+CrOJIOqCzBCF5vkWihukawcu52JFJ5O+7bAFaTUcKkJ/Mi6
	 Oe+P+VqXrVBVdUHZGulcwvA/viSKpuy4f8akJLTcTMs+GR5G3AA0RrEowyRp4oVqRaIXq
	 /b4pTr7w2ePFDkX/Aq9U2cufh2FE6oAi6PYBMj84U16wlh3Rw/9921+Cxpc9le3xCqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792607865;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Ts/JzIkkGhElVCe5I3lwqSP7s8MMajHvt8JdHwP8t7c=;
	b=JwyMZ6xkp/zCc+hdjPHf7Bfc+GXlNE+Dvv8dTOqWqTDM26SneS1hOSeD6vrzQvT3YJp6
	 o/fGpNxQN8gFJwiBMCNofnSGqwm1vCNX765jjfVJjhLOS4iOxfLt0bKvgc5e7dItfRVPi
	 iu4mx3eXmGFkWj5sx75L8jRBuwg+j8yRKkAaiAywgSvlw+7M/4E6+kfScZtqjq88YxM6P
	 dNVz0fh9NlKzS5jValaMfU5vDzDnB24AnLB51NZ4YGHoX3yN7Gc6VEvMHMziZovFOywA2
	 2rkP7AxXwPnsrFBfP9dl2b+C0+dMcUr3PV3qeCd13FdLbRNQyKHWQDr6hOHfxajsWtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=dkimrelay header.b=YuT7UvyZ;
	arc=none smtp.remote-ip=192.19.166.231
Received: from relay.smtp-ext.broadcom.com (lpdvsmtp11.broadcom.com [192.19.166.231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD83C606A31A;
	Wed, 21 Oct 2026 18:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD83C606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=dkimrelay header.b=YuT7UvyZ
Received: from mail-lvn-it-01.broadcom.com (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 0E33CC0000F0;
	Wed, 21 Oct 2026 11:37:44 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 0E33CC0000F0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1792607864;
	bh=gxE29atQqWRrcM8S0ab10Q9L+j74A67DwJdun4gbvMY=;
	h=From:To:Cc:Subject:Date:From;
	b=YuT7UvyZcMZSkScm1KlxS5cdXcZdypqo7qplBgeMc7y9fP0m21zKQfLDeKETv8sHm
	 XGH/QSvEKeVcHXlElm3l1H4R+ffsXNZN8+LJWcJkZG3HlPVm3pY/uG1DeozPxjynfr
	 /bdTDuiHwz5h2o87ISUiYQ/kKrEuO1qovzmJUuDw=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail-lvn-it-01.broadcom.com (Postfix) with ESMTPSA id E4C25A83;
	Wed, 21 Oct 2026 11:37:43 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Linus Walleij <linusw@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yrdreddy@broadcom.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-gpio@vger.kernel.org (open list:PIN CONTROL SUBSYSTEM)
Subject: [PATCH] pinctrl: nsp: support both-edge GPIO interrupts
Date: Wed, 21 Oct 2026 11:37:16 -0700
Message-ID: <20261021183716.718318-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SFP core requests rising and falling edge interrupts for module
presence, loss of signal and transmit fault GPIOs. GPIO-A only has one
edge polarity bit per pin, so the driver rejects IRQ_TYPE_EDGE_BOTH and
makes the SFP core fall back to polling.

Emulate both-edge detection by arming the edge opposite to the current
input level, then rearm it after acknowledging each interrupt and before
unmasking. Resample the input while programming the polarity so an edge
during that sequence leaves the controller armed for the new level.

Fixes: 8bfcbbbcabe0 ("pinctrl: nsp: add gpio-a driver support for Broadcom NSP SoC")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/pinctrl/bcm/pinctrl-nsp-gpio.c | 35 +++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
index 83fcc80d5967..cc990361b7b8 100644
--- a/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
+++ b/drivers/pinctrl/bcm/pinctrl-nsp-gpio.c
@@ -64,6 +64,7 @@ struct nsp_gpio {
 	struct pinctrl_dev *pctl;
 	struct pinctrl_desc pctldesc;
 	raw_spinlock_t lock;
+	unsigned long both_edges;
 };
 
 enum base_type {
@@ -122,6 +123,18 @@ static inline bool nsp_get_bit(struct nsp_gpio *chip, enum base_type address,
 		return !!(readl(chip->base + reg) & BIT(gpio));
 }
 
+static void nsp_gpio_irq_rearm_both(struct nsp_gpio *chip, unsigned int gpio)
+{
+	bool level, new_level;
+
+	do {
+		level = nsp_get_bit(chip, REG, NSP_GPIO_DATA_IN, gpio);
+		/* A high input needs the falling edge and vice versa. */
+		nsp_set_bit(chip, REG, NSP_GPIO_EVENT_INT_POLARITY, gpio, level);
+		new_level = nsp_get_bit(chip, REG, NSP_GPIO_DATA_IN, gpio);
+	} while (level != new_level);
+}
+
 static irqreturn_t nsp_gpio_irq_handler(int irq, void *data)
 {
 	struct gpio_chip *gc = (struct gpio_chip *)data;
@@ -157,10 +170,18 @@ static void nsp_gpio_irq_ack(struct irq_data *d)
 	unsigned gpio = d->hwirq;
 	u32 val = BIT(gpio);
 	u32 trigger_type;
+	unsigned long flags;
 
 	trigger_type = irq_get_trigger_type(d->irq);
-	if (trigger_type & IRQ_TYPE_EDGE_BOTH)
+	if (trigger_type & IRQ_TYPE_EDGE_BOTH) {
 		writel(val, chip->base + NSP_GPIO_EVENT);
+
+		if (test_bit(gpio, &chip->both_edges)) {
+			raw_spin_lock_irqsave(&chip->lock, flags);
+			nsp_gpio_irq_rearm_both(chip, gpio);
+			raw_spin_unlock_irqrestore(&chip->lock, flags);
+		}
+	}
 }
 
 /*
@@ -203,6 +224,8 @@ static void nsp_gpio_irq_unmask(struct irq_data *d)
 
 	gpiochip_enable_irq(gc, irqd_to_hwirq(d));
 	raw_spin_lock_irqsave(&chip->lock, flags);
+	if (test_bit(d->hwirq, &chip->both_edges))
+		nsp_gpio_irq_rearm_both(chip, d->hwirq);
 	nsp_gpio_irq_set_mask(d, true);
 	raw_spin_unlock_irqrestore(&chip->lock, flags);
 }
@@ -229,6 +252,14 @@ static int nsp_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 		falling = true;
 		break;
 
+	case IRQ_TYPE_EDGE_BOTH:
+		/* The controller has a single edge polarity bit. Emulate both
+		 * edges by initially arming the edge opposite to the input and
+		 * switching polarity after every interrupt.
+		 */
+		falling = nsp_get_bit(chip, REG, NSP_GPIO_DATA_IN, gpio);
+		break;
+
 	case IRQ_TYPE_LEVEL_HIGH:
 		level_low = false;
 		break;
@@ -243,6 +274,8 @@ static int nsp_gpio_irq_set_type(struct irq_data *d, unsigned int type)
 		raw_spin_unlock_irqrestore(&chip->lock, flags);
 		return -EINVAL;
 	}
+	__assign_bit(gpio, &chip->both_edges,
+		     (type & IRQ_TYPE_SENSE_MASK) == IRQ_TYPE_EDGE_BOTH);
 
 	nsp_set_bit(chip, REG, NSP_GPIO_EVENT_INT_POLARITY, gpio, falling);
 	nsp_set_bit(chip, REG, NSP_GPIO_INT_POLARITY, gpio, level_low);
-- 
2.53.0

