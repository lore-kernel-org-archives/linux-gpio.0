Received: from mx.adeep.su (mx.adeep.su [185.250.0.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27C93D8103;
	Thu, 25 Jun 2026 11:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.250.0.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782388699; cv=none; b=bTX90f8IsHyARvPT4qWgHCrovLPqVtcYSC0pKrm73dDTfNNC6Bh4/8sb2xvqqlDhvYYya/3rEhoDlW0UDizSs4/qHxcKvXkQQd6vE8Npgpc0DpQYcWYkwTR3QUnpOAi91ctQTDCc60dwNbUGwjuvzasmBsu+ufZzq4sQ950c/J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782388699; c=relaxed/simple;
	bh=E8pCG+VbiZaRAaI+h/fjhFWX83SEhOfsPdAtdcXbCmY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hqtFNiFpa43MmwY7Qg59QAzxWgKijKykBxdAQUy4aMw/C3KTQ/OiW7ptrCXm22nu8pELzyLttN9uF/jG3tTvBmo/jTt61b9oo/vbepyQ6Y4O2y5h51sdmJWMh+7q4XffFHLp1nsmsDkUPJFKyGlpZNN3dBlAS3JYuDQ/O+Um7E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=baodeep.com; spf=pass smtp.mailfrom=baodeep.com; dkim=fail (2048-bit key) header.d=baodeep.com header.i=@baodeep.com header.b=j9dWvG6S reason="signature verification failed"; arc=none smtp.client-ip=185.250.0.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=baodeep.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baodeep.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=baodeep.com header.i=@baodeep.com header.b="j9dWvG6S"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 42850170038;
	Thu, 25 Jun 2026 14:58:03 +0300 (MSK)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=baodeep.com; s=dkim;
	t=1782388691; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=e7PNE+UxTFYgf9gWHJL9BEvKfqYpWfkkIQ5AvLPEEws=;
	b=j9dWvG6SrK5dCrhezBIKphvTi6KZ0ZFidbVZ4M7eDLoCEhbaERJ6UnKvDzD+SotGMg3uVX
	vJZfcgALxVqMX9EO3bSLmAFhx8rhF4IoX6vSm5jn656GJDmyNgCw0qb+KYmlwQKD2i+cQR
	hR2eTDWJaNACHln7gd7IqPM2Bph5bzM0gV/IvjK3HdsjA/Vuh4FysNJE9eFJUfs7R9beng
	10glLfleuttnuHyCneOaZxhHk63b3v07zOlZMHziDjwrycHe9vxYwUJPBav4jaMg27pgiP
	3CBCXU+l98D1zQ/6cmo2Ltg5KnjRJMedPYL2Orw0+i5wZlitSIKNHoid6pkNVg==
From: Viacheslav Bocharov <v@baodeep.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] gpio: shared-proxy: always serialize with a sleeping mutex
Date: Thu, 25 Jun 2026 14:57:17 +0300
Message-ID: <20260625115718.1678991-2-v@baodeep.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260625115718.1678991-1-v@baodeep.com>
References: <20260625115718.1678991-1-v@baodeep.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The shared GPIO descriptor used either a mutex or a spinlock, chosen at
runtime from the underlying chip's can_sleep:

	shared_desc->can_sleep = gpiod_cansleep(shared_desc->desc);
	... if (can_sleep) mutex_lock(); else spin_lock_irqsave();

can_sleep describes only the value path (->get/->set). Under the same
lock, however, the proxy may call gpiod_set_config() and
gpiod_direction_*(), which can reach pinctrl paths that take a mutex
(e.g. gpiod_set_config() -> gpiochip_generic_config() ->
pinctrl_gpio_set_config()), independent of can_sleep. On a controller
with non-sleeping MMIO value ops the descriptor lock was a spinlock, so
the sleeping pinctrl call ran from atomic context. Reproduced on an
Amlogic A113X board with the workaround from commit 28f240683871
("pinctrl: meson: mark the GPIO controller as sleeping") reverted; the
original Khadas VIM3 report hit the same path:

	BUG: sleeping function called from invalid context
	  __mutex_lock
	  pinctrl_get_device_gpio_range
	  pinctrl_gpio_set_config
	  gpiochip_generic_config
	  gpiod_set_config
	  gpio_shared_proxy_set_config   <- voting spinlock held
	  ...
	  mmc_pwrseq_simple_probe

The spinlock existed to take the value vote from atomic context, but the
vote and the (possibly sleeping) control operations share the same state
and lock, so this scheme cannot serialize config under a mutex and still
offer atomic value access. Always serialize the shared descriptor with a
mutex instead and mark the proxy a sleeping gpiochip, driving the
underlying GPIO through the cansleep value accessors: those are valid
for both sleeping and non-sleeping chips, so value access keeps working
on fast controllers, at the cost of no longer being atomic.

This is observable: consumers gating on gpiod_cansleep() take their
sleeping branch on a proxied GPIO (mmc-pwrseq-emmc skips its
emergency-restart reset handler; its normal reset is unaffected), and
consumers that reject sleeping GPIOs (pwm-gpio, ps2-gpio, ...) would
fail to probe. Such atomic users do not share a pin through the proxy,
whose purpose is voting on shared reset/enable lines. The same narrowing
already applies on Amlogic since that workaround, and rockchip
addressed the identical splat per-driver in commit 7ca497be0016 ("gpio:
rockchip: Stop calling pinctrl for set_direction"); fixing the proxy
addresses the locking error once, for every controller.

The lock type was added by commit a060b8c511ab ("gpiolib: implement
low-level, shared GPIO support"); the sleeping call under it arrived with
the proxy driver.

Fixes: e992d54c6f97 ("gpio: shared-proxy: implement the shared GPIO proxy driver")
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Closes: https://lore.kernel.org/all/00107523-7737-4b92-a785-14ce4e93b8cb@samsung.com/
Signed-off-by: Viacheslav Bocharov <v@baodeep.com>
---
v1 -> v2: open-code the descriptor mutex; drop the gpio_shared_desc_lock
          guard and the gpio_shared_lockdep_assert() helper, use
          guard(mutex) and lockdep_assert_held() directly; move the
          mutex rationale from the header to the can_sleep assignment in
          probe.

v1: https://lore.kernel.org/linux-gpio/20260610153329.937833-2-v@baodeep.com/

 drivers/gpio/gpio-shared-proxy.c | 66 +++++++++++++-------------------
 drivers/gpio/gpiolib-shared.c    |  9 +----
 drivers/gpio/gpiolib-shared.h    | 28 +-------------
 3 files changed, 29 insertions(+), 74 deletions(-)

diff --git a/drivers/gpio/gpio-shared-proxy.c b/drivers/gpio/gpio-shared-proxy.c
index 6941e4be6cf1..0cd52015b731 100644
--- a/drivers/gpio/gpio-shared-proxy.c
+++ b/drivers/gpio/gpio-shared-proxy.c
@@ -9,8 +9,10 @@
 #include <linux/err.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
+#include <linux/lockdep.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/mutex.h>
 #include <linux/string_choices.h>
 #include <linux/types.h>
 
@@ -32,7 +34,7 @@ gpio_shared_proxy_set_unlocked(struct gpio_shared_proxy_data *proxy,
 	struct gpio_desc *desc = shared_desc->desc;
 	int ret = 0;
 
-	gpio_shared_lockdep_assert(shared_desc);
+	lockdep_assert_held(&shared_desc->mutex);
 
 	if (value) {
 	       /* User wants to set value to high. */
@@ -89,7 +91,7 @@ static int gpio_shared_proxy_request(struct gpio_chip *gc, unsigned int offset)
 	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
 	struct gpio_shared_desc *shared_desc = proxy->shared_desc;
 
-	guard(gpio_shared_desc_lock)(shared_desc);
+	guard(mutex)(&shared_desc->mutex);
 
 	proxy->shared_desc->usecnt++;
 
@@ -105,11 +107,11 @@ static void gpio_shared_proxy_free(struct gpio_chip *gc, unsigned int offset)
 	struct gpio_shared_desc *shared_desc = proxy->shared_desc;
 	int ret;
 
-	guard(gpio_shared_desc_lock)(shared_desc);
+	guard(mutex)(&shared_desc->mutex);
 
 	if (proxy->voted_high) {
 		ret = gpio_shared_proxy_set_unlocked(proxy,
-			shared_desc->can_sleep ? gpiod_set_value_cansleep : gpiod_set_value, 0);
+			gpiod_set_value_cansleep, 0);
 		if (ret)
 			dev_err(proxy->dev,
 				"Failed to unset the shared GPIO value on release: %d\n", ret);
@@ -129,7 +131,7 @@ static int gpio_shared_proxy_set_config(struct gpio_chip *gc,
 	struct gpio_desc *desc = shared_desc->desc;
 	int ret;
 
-	guard(gpio_shared_desc_lock)(shared_desc);
+	guard(mutex)(&shared_desc->mutex);
 
 	if (shared_desc->usecnt > 1) {
 		if (shared_desc->cfg != cfg) {
@@ -157,7 +159,7 @@ static int gpio_shared_proxy_direction_input(struct gpio_chip *gc,
 	struct gpio_desc *desc = shared_desc->desc;
 	int dir;
 
-	guard(gpio_shared_desc_lock)(shared_desc);
+	guard(mutex)(&shared_desc->mutex);
 
 	if (shared_desc->usecnt == 1) {
 		dev_dbg(proxy->dev,
@@ -187,7 +189,7 @@ static int gpio_shared_proxy_direction_output(struct gpio_chip *gc,
 	struct gpio_desc *desc = shared_desc->desc;
 	int ret, dir;
 
-	guard(gpio_shared_desc_lock)(shared_desc);
+	guard(mutex)(&shared_desc->mutex);
 
 	if (shared_desc->usecnt == 1) {
 		dev_dbg(proxy->dev,
@@ -222,13 +224,6 @@ static int gpio_shared_proxy_direction_output(struct gpio_chip *gc,
 	return gpio_shared_proxy_set_unlocked(proxy, gpiod_direction_output, value);
 }
 
-static int gpio_shared_proxy_get(struct gpio_chip *gc, unsigned int offset)
-{
-	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
-
-	return gpiod_get_value(proxy->shared_desc->desc);
-}
-
 static int gpio_shared_proxy_get_cansleep(struct gpio_chip *gc,
 					  unsigned int offset)
 {
@@ -237,29 +232,15 @@ static int gpio_shared_proxy_get_cansleep(struct gpio_chip *gc,
 	return gpiod_get_value_cansleep(proxy->shared_desc->desc);
 }
 
-static int gpio_shared_proxy_do_set(struct gpio_shared_proxy_data *proxy,
-				    int (*set_func)(struct gpio_desc *desc, int value),
-				    int value)
-{
-	guard(gpio_shared_desc_lock)(proxy->shared_desc);
-
-	return gpio_shared_proxy_set_unlocked(proxy, set_func, value);
-}
-
-static int gpio_shared_proxy_set(struct gpio_chip *gc, unsigned int offset,
-				 int value)
-{
-	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
-
-	return gpio_shared_proxy_do_set(proxy, gpiod_set_value, value);
-}
-
 static int gpio_shared_proxy_set_cansleep(struct gpio_chip *gc,
 					  unsigned int offset, int value)
 {
 	struct gpio_shared_proxy_data *proxy = gpiochip_get_data(gc);
 
-	return gpio_shared_proxy_do_set(proxy, gpiod_set_value_cansleep, value);
+	guard(mutex)(&proxy->shared_desc->mutex);
+
+	return gpio_shared_proxy_set_unlocked(proxy, gpiod_set_value_cansleep,
+					      value);
 }
 
 static int gpio_shared_proxy_get_direction(struct gpio_chip *gc,
@@ -302,20 +283,25 @@ static int gpio_shared_proxy_probe(struct auxiliary_device *adev,
 	gc->label = dev_name(dev);
 	gc->parent = dev;
 	gc->owner = THIS_MODULE;
-	gc->can_sleep = shared_desc->can_sleep;
+	/*
+	 * Under the descriptor mutex the proxy may call
+	 * gpiod_set_config()/gpiod_direction_*(), which can reach pinctrl
+	 * paths that take a mutex (e.g. gpiod_set_config() ->
+	 * gpiochip_generic_config() -> pinctrl_gpio_set_config()), independent
+	 * of the underlying chip's can_sleep. So the descriptor lock must be a
+	 * mutex and the proxy gpiochip is therefore always sleeping; drive the
+	 * underlying GPIO through the cansleep value accessors, which are valid
+	 * for both sleeping and non-sleeping chips.
+	 */
+	gc->can_sleep = true;
 
 	gc->request = gpio_shared_proxy_request;
 	gc->free = gpio_shared_proxy_free;
 	gc->set_config = gpio_shared_proxy_set_config;
 	gc->direction_input = gpio_shared_proxy_direction_input;
 	gc->direction_output = gpio_shared_proxy_direction_output;
-	if (gc->can_sleep) {
-		gc->set = gpio_shared_proxy_set_cansleep;
-		gc->get = gpio_shared_proxy_get_cansleep;
-	} else {
-		gc->set = gpio_shared_proxy_set;
-		gc->get = gpio_shared_proxy_get;
-	}
+	gc->set = gpio_shared_proxy_set_cansleep;
+	gc->get = gpio_shared_proxy_get_cansleep;
 	gc->get_direction = gpio_shared_proxy_get_direction;
 	gc->to_irq = gpio_shared_proxy_to_irq;
 
diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index de72776fb154..495bd3d0ddf0 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -627,8 +627,7 @@ static void gpio_shared_release(struct kref *kref)
 
 	shared_desc = entry->shared_desc;
 	gpio_device_put(shared_desc->desc->gdev);
-	if (shared_desc->can_sleep)
-		mutex_destroy(&shared_desc->mutex);
+	mutex_destroy(&shared_desc->mutex);
 	kfree(shared_desc);
 	entry->shared_desc = NULL;
 }
@@ -659,11 +658,7 @@ gpiod_shared_desc_create(struct gpio_shared_entry *entry)
 	}
 
 	shared_desc->desc = &gdev->descs[entry->offset];
-	shared_desc->can_sleep = gpiod_cansleep(shared_desc->desc);
-	if (shared_desc->can_sleep)
-		mutex_init(&shared_desc->mutex);
-	else
-		spin_lock_init(&shared_desc->spinlock);
+	mutex_init(&shared_desc->mutex);
 
 	return shared_desc;
 }
diff --git a/drivers/gpio/gpiolib-shared.h b/drivers/gpio/gpiolib-shared.h
index 15e72a8dcdb1..bbdc0ab7b647 100644
--- a/drivers/gpio/gpiolib-shared.h
+++ b/drivers/gpio/gpiolib-shared.h
@@ -3,10 +3,7 @@
 #ifndef __LINUX_GPIO_SHARED_H
 #define __LINUX_GPIO_SHARED_H
 
-#include <linux/cleanup.h>
-#include <linux/lockdep.h>
 #include <linux/mutex.h>
-#include <linux/spinlock.h>
 
 struct gpio_device;
 struct gpio_desc;
@@ -42,35 +39,12 @@ static inline int gpio_shared_add_proxy_lookup(struct device *consumer,
 
 struct gpio_shared_desc {
 	struct gpio_desc *desc;
-	bool can_sleep;
 	unsigned long cfg;
 	unsigned int usecnt;
 	unsigned int highcnt;
-	union {
-		struct mutex mutex;
-		spinlock_t spinlock;
-	};
+	struct mutex mutex; /* serializes all proxy operations on this descriptor */
 };
 
 struct gpio_shared_desc *devm_gpiod_shared_get(struct device *dev);
 
-DEFINE_LOCK_GUARD_1(gpio_shared_desc_lock, struct gpio_shared_desc,
-	if (_T->lock->can_sleep)
-		mutex_lock(&_T->lock->mutex);
-	else
-		spin_lock_irqsave(&_T->lock->spinlock, _T->flags),
-	if (_T->lock->can_sleep)
-		mutex_unlock(&_T->lock->mutex);
-	else
-		spin_unlock_irqrestore(&_T->lock->spinlock, _T->flags),
-	unsigned long flags)
-
-static inline void gpio_shared_lockdep_assert(struct gpio_shared_desc *shared_desc)
-{
-	if (shared_desc->can_sleep)
-		lockdep_assert_held(&shared_desc->mutex);
-	else
-		lockdep_assert_held(&shared_desc->spinlock);
-}
-
 #endif /* __LINUX_GPIO_SHARED_H */
-- 
2.54.0

