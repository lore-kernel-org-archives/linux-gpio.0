Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795707472;
	b=2wVYS8ltvvLuJ6ZlagZBoow5K5wSdOi2NGplxpvxFE2h+FvYpRj6XGIpHl0LUE+9BOD/
	 WmsTzU3waDLMCtSGiX5U3cotupPANG2tWvCegaYjx8gNYHL6VgrQMwMosIK+yZ9GpX2af
	 9ctnRLytWJrgzneCNOlzpZyql7AYFBn5CI5HMFIDvkh6h0FOkuKbgvKMT0CkkKPYu7e3p
	 OkCZRHgj5N6/To6bXXtvQCFG7PekscDRYYQ4yec7vUN0aK07XBEp3Lh1hIHDtPHpkQ2lA
	 F144/EVkAWBp37JsZFr4iwBzFd4ERd7dGXnf5IlQouq41QQb7dOjuJtDlqK70zD/0Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795707472;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=kZlvwI4x8yCnZqFpku5V+ZaseRvPPryREaI5fIWHQCY=;
	b=zl8IlJ9o2hj806B25Z/3EtkhS0LeurFGA6UM5VR/uNFEtNksXV2mLkwXXu41+IL8di5Y
	 wOJWfNyhMb5zLNjOj6yS4SmyAdy39+rmtuPtXWWq0fRnFbkyoYGQpSGABCUr5Lk7OXiXr
	 JsrVpjsST2srN+c0iqo1LJ8XMqZHUMWdtOr6yI9WTXaogUYHBNO4n9H5oaDZkM4hF4qV5
	 KWZHceeGrjDhhQg5GI2MD/9XWXYWHbtMMXKPXZ/IARvJP9ZK/KBhhD63e6HgEH/n+ymUC
	 BprG5eluMJWYZPrnRNvTQoOIY3WulW1eGmCnS/8tdQXPe453eB1h6hAqBaejZuRahrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QaU0LxHi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BEE2606A326
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 15:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QaU0LxHi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E03531F000C4;
	Thu, 26 Nov 2026 15:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795707471;
	bh=kZlvwI4x8yCnZqFpku5V+ZaseRvPPryREaI5fIWHQCY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QaU0LxHiYew0XPGyb+A+1K/q4Eef1WD4XEIiAgJcri0cDXLq/EKdYmCWB21vxa0O3
	 OP//tIYtviizoGDW+eR4h1DpxP2s0S/FcM7h1/PMCf7AqahKZZcprTGNdFA9kPTK1P
	 Qzix0vue4kl4Xo6ppkAnYXf3mYKiwNJu3FlLLWzIDpWsDIsuZe84PkF+A8sPYQfAQH
	 LFfB5nCSPKDoCBqjHx0CEagIelyGWfm6INfKHARyYG6UKqAZl6yzPr3CK7qFZ/yzUa
	 rjvnEqcSjxJ5rMY06p8grfBJDlidG/v7hM4v2WheFludcT72wwmXa4HkMvSlQ/nrJY
	 dmSwUHEDQmbiA==
From: Michael Walle <mwalle@kernel.org>
To: William Breathitt Gray <wbg@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Petar Stepanovic <pstepanovic@axiado.com>,
	SriNavmani A <srinavmani@axiado.com>,
	Prasad Bolisetty <pbolisetty@axiado.com>,
	Tzu-Hao Wei <twei@axiado.com>,
	Karthikeyan Mitran <kmitran@axiado.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Michael Walle <mwalle@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Long Zhao <longzhao@ambarella.com>,
	Joseph Telaak <joseph@telaak.dev>
Cc: linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFT PATCH 12/13] gpio: i8255: create the regmap-irq chip from the gpio-regmap callback
Date: Thu, 26 Nov 2026 16:35:23 +0100
Message-ID: <20261126153600.299724-13-mwalle@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261126153600.299724-1-mwalle@kernel.org>
References: <20261126153600.299724-1-mwalle@kernel.org>
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

Use the new gpio_regmap_add_irq_chip() helper to create the regmap-irq
domain.

Signed-off-by: Michael Walle <mwalle@kernel.org>
---
 drivers/gpio/gpio-104-dio-48e.c | 31 +++++++++++++++++++++++--------
 drivers/gpio/gpio-i8255.c       |  3 ++-
 drivers/gpio/gpio-i8255.h       |  8 ++++++--
 3 files changed, 31 insertions(+), 11 deletions(-)

diff --git a/drivers/gpio/gpio-104-dio-48e.c b/drivers/gpio/gpio-104-dio-48e.c
index 7ddf578ba530..0efaa654274d 100644
--- a/drivers/gpio/gpio-104-dio-48e.c
+++ b/drivers/gpio/gpio-104-dio-48e.c
@@ -9,6 +9,7 @@
 #include <linux/bits.h>
 #include <linux/device.h>
 #include <linux/err.h>
+#include <linux/gpio/regmap.h>
 #include <linux/i8254.h>
 #include <linux/ioport.h>
 #include <linux/irq.h>
@@ -113,6 +114,8 @@ static const struct regmap_irq dio48e_regmap_irqs[] = {
  * @regs:	virtual mapping for device registers
  * @flags:	IRQ flags saved during locking
  * @irq_mask:	Current IRQ mask state on the device
+ * @chip:	regmap_irq_chip for the device
+ * @irq:	Parent IRQ
  */
 struct dio48e_gpio {
 	raw_spinlock_t lock;
@@ -120,6 +123,8 @@ struct dio48e_gpio {
 	void __iomem *regs;
 	unsigned long flags;
 	unsigned int irq_mask;
+	struct regmap_irq_chip *chip;
+	unsigned int irq;
 };
 
 static void dio48e_regmap_lock(void *lock_arg) __acquires(&dio48egpio->lock)
@@ -163,7 +168,7 @@ static int dio48e_handle_mask_sync(const int index,
 				   const unsigned int mask_buf,
 				   void *const irq_drv_data)
 {
-	struct dio48e_gpio *const dio48egpio = irq_drv_data;
+	struct dio48e_gpio *const dio48egpio = gpio_regmap_get_drvdata(irq_drv_data);
 	const unsigned int prev_mask = dio48egpio->irq_mask;
 	int err;
 	unsigned int val;
@@ -218,6 +223,19 @@ static int dio48e_irq_init_hw(struct regmap *const map)
 	return regmap_read(map, DIO48E_DISABLE_INTERRUPT, &val);
 }
 
+static struct irq_domain *dio48e_create_irq_domain(struct gpio_regmap *gpio)
+{
+	struct dio48e_gpio *const dio48egpio = gpio_regmap_get_drvdata(gpio);
+	struct irq_domain *domain;
+
+	domain = gpio_regmap_add_irq_chip(gpio, dio48egpio->irq, 0, dio48egpio->chip);
+	if (IS_ERR(domain))
+		return dev_err_cast_probe(regmap_get_device(dio48egpio->map), domain,
+					  "IRQ registration failed\n");
+
+	return domain;
+}
+
 static int dio48e_probe(struct device *dev, unsigned int id)
 {
 	const char *const name = dev_name(dev);
@@ -230,7 +248,6 @@ static int dio48e_probe(struct device *dev, unsigned int id)
 	int err;
 	struct regmap_irq_chip *chip;
 	struct dio48e_gpio *dio48egpio;
-	struct regmap_irq_chip_data *chip_data;
 
 	if (!devm_request_region(dev, base[id], DIO48E_EXTENT, name)) {
 		dev_err(dev, "Unable to lock port addresses (0x%X-0x%X)\n",
@@ -302,17 +319,14 @@ static int dio48e_probe(struct device *dev, unsigned int id)
 	chip->irqs = dio48e_regmap_irqs;
 	chip->num_irqs = ARRAY_SIZE(dio48e_regmap_irqs);
 	chip->handle_mask_sync = dio48e_handle_mask_sync;
-	chip->irq_drv_data = dio48egpio;
+	dio48egpio->chip = chip;
+	dio48egpio->irq = irq[id];
 
 	/* Initialize to prevent spurious interrupts before we're ready */
 	err = dio48e_irq_init_hw(map);
 	if (err)
 		return err;
 
-	err = devm_regmap_add_irq_chip(dev, map, irq[id], 0, 0, chip, &chip_data);
-	if (err)
-		return dev_err_probe(dev, err, "IRQ registration failed\n");
-
 	pit_config.parent = dev;
 
 	err = devm_i8254_regmap_register(dev, &pit_config);
@@ -323,7 +337,8 @@ static int dio48e_probe(struct device *dev, unsigned int id)
 	config.map = map;
 	config.num_ppi = DIO48E_NUM_PPI;
 	config.names = dio48e_names;
-	config.domain = regmap_irq_get_domain(chip_data);
+	config.drvdata = dio48egpio;
+	config.create_irq_domain = dio48e_create_irq_domain;
 
 	return devm_i8255_regmap_register(dev, &config);
 }
diff --git a/drivers/gpio/gpio-i8255.c b/drivers/gpio/gpio-i8255.c
index 541a348447cd..8ac46bb2c235 100644
--- a/drivers/gpio/gpio-i8255.c
+++ b/drivers/gpio/gpio-i8255.c
@@ -129,7 +129,8 @@ int devm_i8255_regmap_register(struct device *const dev,
 	gpio_config.reg_set_base = GPIO_REGMAP_ADDR(I8255_REG_DAT_BASE);
 	gpio_config.reg_dir_in_base = GPIO_REGMAP_ADDR(I8255_REG_DIR_IN_BASE);
 	gpio_config.ngpio_per_reg = I8255_NGPIO_PER_REG;
-	gpio_config.irq_domain = config->domain;
+	gpio_config.drvdata = config->drvdata;
+	gpio_config.create_irq_domain = config->create_irq_domain;
 	gpio_config.reg_mask_xlate = i8255_reg_mask_xlate;
 
 	return PTR_ERR_OR_ZERO(devm_gpio_regmap_register(dev, &gpio_config));
diff --git a/drivers/gpio/gpio-i8255.h b/drivers/gpio/gpio-i8255.h
index 9dcf639b94df..fa90044c9cd5 100644
--- a/drivers/gpio/gpio-i8255.h
+++ b/drivers/gpio/gpio-i8255.h
@@ -4,6 +4,7 @@
 #define _I8255_H_
 
 struct device;
+struct gpio_regmap;
 struct irq_domain;
 struct regmap;
 
@@ -15,7 +16,9 @@ struct regmap;
  * @map:	regmap for the i8255
  * @num_ppi:	number of i8255 Programmable Peripheral Interface
  * @names:	(optional) array of names for gpios
- * @domain:	(optional) IRQ domain if the controller is interrupt-capable
+ * @drvdata:	(optional) driver data, see gpio_regmap_get_drvdata()
+ * @create_irq_domain:	(optional) create the IRQ domain if the controller is
+ *			interrupt-capable, see struct gpio_regmap_config
  *
  * Note: The regmap is expected to have cache enabled and i8255 control
  * registers not marked as volatile.
@@ -25,7 +28,8 @@ struct i8255_regmap_config {
 	struct regmap *map;
 	int num_ppi;
 	const char *const *names;
-	struct irq_domain *domain;
+	void *drvdata;
+	struct irq_domain *(*create_irq_domain)(struct gpio_regmap *gpio);
 };
 
 int devm_i8255_regmap_register(struct device *dev,
-- 
2.47.3

