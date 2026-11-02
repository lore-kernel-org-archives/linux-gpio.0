Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636275;
	b=yYQ/TNjuEZTZfULcxrUwWVin68FXdPU9PMHpHJmSOeG6up+QJv6GXWIXuPwiG8pTHD5m
	 wL1y8yrubpWy6xljffUMmdSAx/E+2GxYyjDTNiQ5oliTjTQyiu/7DyeF2FKf7zwOgNueh
	 GSYKnZUn1tIa+qioJeMEbOIjAKbwfxQ0ZssPQNbYR/7d1s1to9SCHXb1q6gagHzTQcWvd
	 8T6DS7BaU9+Q0T+JOh9Gc+5/IwR3qEHT9kpqjfnGZl3nqwbuAxHknz0VKTgHCS903wy4r
	 /AHjpBqF7T+LE6ioKNsB4hAxOhqTYTpr3Szw1ieGwE10kzN+rdHitfXHhE6vKKcFAbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636275;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=WcrMKpeQbjz2q+PLfkx7dquwDN5CHd4NXr50P2+lerg=;
	b=uSIr80VbW19vawMsyeBUI2iN+Q9euKdVIro/HoVAraFqj/T/nl3ZgKpWMDaTOZllHAV1
	 JU7U4fZjO2tIHh6gkwEeB+4ILe9OBvq2Yv3xlVu/VMxoqsyLVyAQtkeO4Rd/nRsHQ39Vz
	 A36rWkuC+T/z3F7bW6cV/6eEB9NpPJz+eQ8ivGqU0pOh4sOlsPdL4JnJlO9wzGY6Mo0W/
	 wM7e6C8FRt1VCfbSvHB+B3XZoXYIjZ2R6M4MJQ12XPZ2nnEDNZ+zH73+Q1MFgaNdmD3Ih
	 TYkQGNpVslRHuUH0kKr9iYUcLHrL1pfKGk9B16jCJdY9V8omyXwfIIawlVNXa7f+fJg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fqNLCqG+;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11548606AB88;
	Mon,  2 Nov 2026 16:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fqNLCqG+
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D53021F00A17;
	Mon,  2 Nov 2026 16:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793636274;
	bh=WcrMKpeQbjz2q+PLfkx7dquwDN5CHd4NXr50P2+lerg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fqNLCqG+33SlwYqRZad1B6EXREyCR8F0L5dfSRqPmfNwzkQabTNbgk5SmwlINGM6Z
	 IzY0lm7E6NmargiSvFG4LsYT5lkEAyAN/z5eTpxUCYgyzfV6ziCH9uFwJm/6HI1Dl6
	 0LLi0OqnoVuuVsmp9kdf9F6kkgG6Fq7LDAZMSRK5O0pqj+atCSjJqYJvedVGichho2
	 iRcToyFyPRQ2O49UdQpm0WS3hKI2OVQmPyUxf1Bt8L+LYCutddx8QoGFKvOnpR8kAW
	 YicHh59kiayU8FDlE2wT6hFc7g2wNl6sLAdi7kDNBNuOXh8os7gblnO9MM2lHEaSmv
	 Y+HLbsh9nNLxw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	tzungbi@kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v15 3/4] gpio: Leverage revocable for accessing struct gpio_chip
Date: Tue,  3 Nov 2026 00:17:08 +0800
Message-ID: <20261102161710.24076-4-tzungbi@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261102161710.24076-1-tzungbi@kernel.org>
References: <20261102161710.24076-1-tzungbi@kernel.org>
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

The underlying chip can be removed asynchronously.  `gdev->srcu` is used
to ensure the synchronization before accessing `gdev->chip`.

Revocable encapsulates the details.  Leverage revocable for accessing
the struct gpio_chip and remove the `gdev->srcu`.

Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
Test:

Prepare gpiod-test.
(https://libgpiod.readthedocs.io/en/master/building.html#building)
$ cd libgpiod-2.3.1
$ mkdir build && cd build
$ meson setup .. -Dtools=enabled
$ ninja

Prepare kernel.
$ cat >test_config <<EOF
CONFIG_IKCONFIG=y
CONFIG_IKCONFIG_PROC=y
CONFIG_KASAN=y
CONFIG_GPIOLIB=y
CONFIG_GPIO_SYSFS=y
CONFIG_GPIO_SIM=y
CONFIG_EXPERT=y
CONFIG_PROVE_LOCKING=y
CONFIG_PANIC_ON_OOPS=y
CONFIG_DEBUG_KERNEL=y
CONFIG_LOCKDEP=y
EOF
$ export KBUILD_OUTPUT=build
$ vng -k -f test_config && vng -b

Run gpiod-test.
$ vng
$ ./libgpiod-2.3.1/build/tests/gpiod-test
$ time ./libgpiod-2.3.1/build/tests/gpiod-test >/dev/null 2>&1
---
v15:
- Rename "chip_rev" -> "gc_revocable" in struct gpio_device.
- Destroy gc_revocable before desc_srcu in gpiodev_release() to match
  the reverse initialization order.
- Rebase onto v7.4-rc1.
  - Fix conflicts with c28846ca1ac6 ("gpiolib: fix memory leak in
    gpiod_set_array_value_complex() on error paths") and 8381e1f15e27
    ("gpiolib: Free chip resources when allocating the label fails").

v14: https://lore.kernel.org/all/20261011121246.162759-4-tzungbi@kernel.org
- Add Tested-by tag.
- Rebase onto next-20261009.
  - Fix conflicts with 1feb5d39b05a ("gpio: cdev: fix kernel stack leak
    to user-space in error path").
- Change revocable API usages accordingly:
  - revocable_deinit() -> revocable_destroy().

v13: https://lore.kernel.org/all/20260912123529.7951-4-tzungbi@kernel.org
- Call revocable_deinit() instead of revocable_put() as it uses embedded
  allocation.

v12: https://lore.kernel.org/all/20260908134223.13638-4-tzungbi@kernel.org
- Rebase onto next-20260907.
- Fix conflicts mainly with aa7e8b7ef031 ("gpio: core: fix
  const-correctness of gpio_chip_guard").
- Fix error unwinding in gpiochip_add_data_with_key() by initializing
  chip_rev before device_initialize() and ensuring both references are
  dropped on error.

v11: https://lore.kernel.org/all/20260513091043.6766-4-tzungbi@kernel.org
- Add Tested-by tag.
- Squash
  - https://lore.kernel.org/all/20260508105448.31799-5-tzungbi@kernel.org
  - https://lore.kernel.org/all/20260508105448.31799-6-tzungbi@kernel.org
  - https://lore.kernel.org/all/20260508105448.31799-7-tzungbi@kernel.org
  - https://lore.kernel.org/all/20260508105448.31799-8-tzungbi@kernel.org

v10: https://lore.kernel.org/all/20260508105448.31799-4-tzungbi@kernel.org
- Change revocable API usages accordingly.

v9: https://lore.kernel.org/all/20260427135841.96266-4-tzungbi@kernel.org
- New to the series.
- Use static allocated resource provider.
- Rename "chip_rp" -> "chip_rev".

v4 - v8:
- Doesn't exist.

v3: https://lore.kernel.org/all/20260213092958.864411-8-tzungbi@kernel.org
- Change revocable API usages accordingly.

v2: https://lore.kernel.org/all/20260203061059.975605-8-tzungbi@kernel.org
- Change usages accordingly after applying
  https://lore.kernel.org/all/20260129143733.45618-2-tzungbi@kernel.org.
  - Add __rcu for `chip_rp`.
  - Pass pointer of pointer to revocable_provider_revoke().
- Rebase accordingly after applying
  https://lore.kernel.org/all/20260203060210.972243-1-tzungbi@kernel.org.

v1: https://lore.kernel.org/all/20260116081036.352286-13-tzungbi@kernel.org
---
 drivers/gpio/gpiolib-cdev.c  |  77 ++++------
 drivers/gpio/gpiolib-sysfs.c |  32 ++---
 drivers/gpio/gpiolib.c       | 262 +++++++++++++++--------------------
 drivers/gpio/gpiolib.h       |  28 +---
 4 files changed, 156 insertions(+), 243 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 3f1f8c9acfc3..a71f1a3c0f07 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -22,6 +22,7 @@
 #include <linux/overflow.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/poll.h>
+#include <linux/revocable.h>
 #include <linux/seq_file.h>
 #include <linux/spinlock.h>
 #include <linux/string.h>
@@ -210,11 +211,9 @@ static long linehandle_ioctl(struct file *file, unsigned int cmd,
 	DECLARE_BITMAP(vals, GPIOHANDLES_MAX);
 	unsigned int i;
 	int ret;
+	struct gpio_chip *gc;
 
-	guard(srcu)(&lh->gdev->srcu);
-
-	if (!rcu_access_pointer(lh->gdev->chip))
-		return -ENODEV;
+	revocable_try_access_or_return(&lh->gdev->gc_revocable, gc);
 
 	switch (cmd) {
 	case GPIOHANDLE_GET_LINE_VALUES_IOCTL:
@@ -1442,11 +1441,9 @@ static long linereq_ioctl(struct file *file, unsigned int cmd,
 {
 	struct linereq *lr = file->private_data;
 	void __user *ip = (void __user *)arg;
+	struct gpio_chip *gc;
 
-	guard(srcu)(&lr->gdev->srcu);
-
-	if (!rcu_access_pointer(lr->gdev->chip))
-		return -ENODEV;
+	revocable_try_access_or_return(&lr->gdev->gc_revocable, gc);
 
 	switch (cmd) {
 	case GPIO_V2_LINE_GET_VALUES_IOCTL:
@@ -1473,10 +1470,10 @@ static __poll_t linereq_poll(struct file *file,
 {
 	struct linereq *lr = file->private_data;
 	__poll_t events = 0;
+	struct gpio_chip *gc;
 
-	guard(srcu)(&lr->gdev->srcu);
-
-	if (!rcu_access_pointer(lr->gdev->chip))
+	revocable_try_access_with(&lr->gdev->gc_revocable, gc);
+	if (!gc)
 		return EPOLLHUP | EPOLLERR;
 
 	poll_wait(file, &lr->wait, wait);
@@ -1495,11 +1492,9 @@ static ssize_t linereq_read(struct file *file, char __user *buf,
 	struct gpio_v2_line_event le;
 	ssize_t bytes_read = 0;
 	int ret;
+	struct gpio_chip *gc;
 
-	guard(srcu)(&lr->gdev->srcu);
-
-	if (!rcu_access_pointer(lr->gdev->chip))
-		return -ENODEV;
+	revocable_try_access_or_return(&lr->gdev->gc_revocable, gc);
 
 	if (count < sizeof(le))
 		return -EINVAL;
@@ -1769,10 +1764,10 @@ static __poll_t lineevent_poll(struct file *file,
 {
 	struct lineevent_state *le = file->private_data;
 	__poll_t events = 0;
+	struct gpio_chip *gc;
 
-	guard(srcu)(&le->gdev->srcu);
-
-	if (!rcu_access_pointer(le->gdev->chip))
+	revocable_try_access_with(&le->gdev->gc_revocable, gc);
+	if (!gc)
 		return EPOLLHUP | EPOLLERR;
 
 	poll_wait(file, &le->wait, wait);
@@ -1807,11 +1802,9 @@ static ssize_t lineevent_read(struct file *file, char __user *buf,
 	ssize_t bytes_read = 0;
 	ssize_t ge_size;
 	int ret;
+	struct gpio_chip *gc;
 
-	guard(srcu)(&le->gdev->srcu);
-
-	if (!rcu_access_pointer(le->gdev->chip))
-		return -ENODEV;
+	revocable_try_access_or_return(&le->gdev->gc_revocable, gc);
 
 	/*
 	 * When compatible system call is being used the struct gpioevent_data,
@@ -1889,11 +1882,9 @@ static long lineevent_ioctl(struct file *file, unsigned int cmd,
 	struct lineevent_state *le = file->private_data;
 	void __user *ip = (void __user *)arg;
 	struct gpiohandle_data ghd;
+	struct gpio_chip *gc;
 
-	guard(srcu)(&le->gdev->srcu);
-
-	if (!rcu_access_pointer(le->gdev->chip))
-		return -ENODEV;
+	revocable_try_access_or_return(&le->gdev->gc_revocable, gc);
 
 	/*
 	 * We can get the value for an event line but not set it,
@@ -2175,12 +2166,11 @@ static int gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	u32 debounce_period_us;
 	unsigned long dflags;
 	const char *label;
+	struct gpio_chip *gc;
 
 	memset(info, 0, sizeof(*info));
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(&desc->gdev->gc_revocable, gc);
 
 	info->offset = gpiod_hwgpio(desc);
 
@@ -2212,10 +2202,10 @@ static int gpio_desc_to_lineinfo(struct gpio_desc *desc,
 	    test_bit(GPIOD_FLAG_IS_HOGGED, &dflags) ||
 	    test_bit(GPIOD_FLAG_EXPORT, &dflags) ||
 	    test_bit(GPIOD_FLAG_SYSFS, &dflags) ||
-	    !gpiochip_line_is_valid(guard.gc, info->offset)) {
+	    !gpiochip_line_is_valid(gc, info->offset)) {
 		info->flags |= GPIO_V2_LINE_FLAG_USED;
 	} else if (!atomic) {
-		if (!pinctrl_gpio_can_use_line(guard.gc, info->offset))
+		if (!pinctrl_gpio_can_use_line(gc, info->offset))
 			info->flags |= GPIO_V2_LINE_FLAG_USED;
 	}
 
@@ -2406,12 +2396,10 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	struct gpio_chardev_data *cdev = file->private_data;
 	struct gpio_device *gdev = cdev->gdev;
 	void __user *ip = (void __user *)arg;
-
-	guard(srcu)(&gdev->srcu);
+	struct gpio_chip *gc;
 
 	/* We fail any subsequent ioctl():s when the chip is gone */
-	if (!rcu_access_pointer(gdev->chip))
-		return -ENODEV;
+	revocable_try_access_or_return(&gdev->gc_revocable, gc);
 
 	/* Fill in the struct and pass to userspace */
 	switch (cmd) {
@@ -2469,12 +2457,9 @@ static void lineinfo_changed_func(struct work_struct *work)
 		 * Pin functions are in general much more static and while it's
 		 * not 100% bullet-proof, it's good enough for most cases.
 		 */
-		scoped_guard(srcu, &ctx->gdev->srcu) {
-			gc = srcu_dereference(ctx->gdev->chip, &ctx->gdev->srcu);
-			if (gc &&
-			    !pinctrl_gpio_can_use_line(gc, ctx->chg.info.offset))
+		revocable_try_access_or_skip_scoped(&ctx->gdev->gc_revocable, gc)
+			if (!pinctrl_gpio_can_use_line(gc, ctx->chg.info.offset))
 				ctx->chg.info.flags |= GPIO_V2_LINE_FLAG_USED;
-		}
 	}
 
 	ret = kfifo_in_spinlocked(&ctx->cdev->events, &ctx->chg, 1,
@@ -2562,10 +2547,10 @@ static __poll_t lineinfo_watch_poll(struct file *file,
 {
 	struct gpio_chardev_data *cdev = file->private_data;
 	__poll_t events = 0;
+	struct gpio_chip *gc;
 
-	guard(srcu)(&cdev->gdev->srcu);
-
-	if (!rcu_access_pointer(cdev->gdev->chip))
+	revocable_try_access_with(&cdev->gdev->gc_revocable, gc);
+	if (!gc)
 		return EPOLLHUP | EPOLLERR;
 
 	poll_wait(file, &cdev->wait, pollt);
@@ -2585,11 +2570,9 @@ static ssize_t lineinfo_watch_read(struct file *file, char __user *buf,
 	ssize_t bytes_read = 0;
 	int ret;
 	size_t event_size;
+	struct gpio_chip *gc;
 
-	guard(srcu)(&cdev->gdev->srcu);
-
-	if (!rcu_access_pointer(cdev->gdev->chip))
-		return -ENODEV;
+	revocable_try_access_or_return(&cdev->gdev->gc_revocable, gc);
 
 #ifndef CONFIG_GPIO_CDEV_V1
 	event_size = sizeof(struct gpio_v2_line_info_changed);
diff --git a/drivers/gpio/gpiolib-sysfs.c b/drivers/gpio/gpiolib-sysfs.c
index fc06b0c2881b..71bb13539610 100644
--- a/drivers/gpio/gpiolib-sysfs.c
+++ b/drivers/gpio/gpiolib-sysfs.c
@@ -10,9 +10,9 @@
 #include <linux/list.h>
 #include <linux/mutex.h>
 #include <linux/printk.h>
+#include <linux/revocable.h>
 #include <linux/slab.h>
 #include <linux/string.h>
-#include <linux/srcu.h>
 #include <linux/sysfs.h>
 #include <linux/types.h>
 
@@ -215,10 +215,9 @@ static int gpio_sysfs_request_irq(struct gpiod_data *data, unsigned char flags)
 	struct gpio_desc *desc = data->desc;
 	unsigned long irq_flags;
 	int ret;
+	struct gpio_chip *gc;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(&desc->gdev->gc_revocable, gc);
 
 	data->irq = gpiod_to_irq(desc);
 	if (data->irq < 0)
@@ -244,7 +243,7 @@ static int gpio_sysfs_request_irq(struct gpiod_data *data, unsigned char flags)
 	 * Remove this redundant call (along with the corresponding unlock)
 	 * when those drivers have been fixed.
 	 */
-	ret = gpiochip_lock_as_irq(guard.gc, gpiod_hwgpio(desc));
+	ret = gpiochip_lock_as_irq(gc, gpiod_hwgpio(desc));
 	if (ret < 0)
 		goto err_clr_bits;
 
@@ -258,7 +257,7 @@ static int gpio_sysfs_request_irq(struct gpiod_data *data, unsigned char flags)
 	return 0;
 
 err_unlock:
-	gpiochip_unlock_as_irq(guard.gc, gpiod_hwgpio(desc));
+	gpiochip_unlock_as_irq(gc, gpiod_hwgpio(desc));
 err_clr_bits:
 	clear_bit(GPIOD_FLAG_EDGE_RISING, &desc->flags);
 	clear_bit(GPIOD_FLAG_EDGE_FALLING, &desc->flags);
@@ -273,14 +272,13 @@ static int gpio_sysfs_request_irq(struct gpiod_data *data, unsigned char flags)
 static void gpio_sysfs_free_irq(struct gpiod_data *data)
 {
 	struct gpio_desc *desc = data->desc;
+	struct gpio_chip *gc;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return;
+	revocable_try_access_or_return_void(&desc->gdev->gc_revocable, gc);
 
 	data->irq_flags = 0;
 	free_irq(data->irq, data);
-	gpiochip_unlock_as_irq(guard.gc, gpiod_hwgpio(desc));
+	gpiochip_unlock_as_irq(gc, gpiod_hwgpio(desc));
 	clear_bit(GPIOD_FLAG_EDGE_RISING, &desc->flags);
 	clear_bit(GPIOD_FLAG_EDGE_FALLING, &desc->flags);
 }
@@ -473,13 +471,12 @@ static DEVICE_ATTR_RO(ngpio);
 static int export_gpio_desc(struct gpio_desc *desc)
 {
 	int offset, ret;
+	struct gpio_chip *gc;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(&desc->gdev->gc_revocable, gc);
 
 	offset = gpiod_hwgpio(desc);
-	if (!gpiochip_line_is_valid(guard.gc, offset)) {
+	if (!gpiochip_line_is_valid(gc, offset)) {
 		pr_debug_ratelimited("%s: GPIO %d masked\n", __func__,
 				     gpiod_hwgpio(desc));
 		return -EINVAL;
@@ -732,6 +729,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 	struct gpio_device *gdev;
 	struct attribute **attrs;
 	int status;
+	struct gpio_chip *gc;
 
 	/* can't export until sysfs is available ... */
 	if (!class_is_registered(&gpio_class)) {
@@ -744,9 +742,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 		return -EINVAL;
 	}
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(&desc->gdev->gc_revocable, gc);
 
 	if (test_and_set_bit(GPIOD_FLAG_EXPORT, &desc->flags))
 		return -EPERM;
@@ -769,7 +765,7 @@ int gpiod_export(struct gpio_desc *desc, bool direction_may_change)
 
 	desc_data->desc = desc;
 	mutex_init(&desc_data->mutex);
-	if (guard.gc->direction_input && guard.gc->direction_output)
+	if (gc->direction_input && gc->direction_output)
 		desc_data->direction_can_change = direction_may_change;
 	else
 		desc_data->direction_can_change = false;
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index fbdeda2f2787..1660b77385db 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -23,6 +23,7 @@
 #include <linux/nospec.h>
 #include <linux/of.h>
 #include <linux/pinctrl/consumer.h>
+#include <linux/revocable.h>
 #include <linux/seq_file.h>
 #include <linux/slab.h>
 #include <linux/srcu.h>
@@ -336,7 +337,10 @@ EXPORT_SYMBOL(gpio_device_get_label);
  */
 struct gpio_chip *gpio_device_get_chip(struct gpio_device *gdev)
 {
-	return rcu_dereference_check(gdev->chip, 1);
+	struct gpio_chip *gc;
+
+	revocable_try_access_with(&gdev->gc_revocable, gc);
+	return gc;
 }
 EXPORT_SYMBOL_GPL(gpio_device_get_chip);
 
@@ -426,8 +430,6 @@ static int gpiochip_get_direction(struct gpio_chip *gc, unsigned int offset)
 {
 	int ret;
 
-	lockdep_assert_held(&gc->gpiodev->srcu);
-
 	if (WARN_ON(!gc->get_direction))
 		return -EOPNOTSUPP;
 
@@ -455,14 +457,13 @@ int gpiod_get_direction(struct gpio_desc *desc)
 	unsigned long flags;
 	unsigned int offset;
 	int ret;
+	struct gpio_chip *gc;
 
 	ret = validate_desc(desc, __func__);
 	if (ret <= 0)
 		return -EINVAL;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(&desc->gdev->gc_revocable, gc);
 
 	offset = gpiod_hwgpio(desc);
 	flags = READ_ONCE(desc->flags);
@@ -475,7 +476,7 @@ int gpiod_get_direction(struct gpio_desc *desc)
 	    test_bit(GPIOD_FLAG_IS_OUT, &flags))
 		return 0;
 
-	ret = gpiochip_get_direction(guard.gc, offset);
+	ret = gpiochip_get_direction(gc, offset);
 	if (ret < 0)
 		return ret;
 
@@ -585,9 +586,7 @@ static struct gpio_desc *gpio_name_to_desc(const char * const name)
 
 	list_for_each_entry_srcu(gdev, &gpio_devices, list,
 				 srcu_read_lock_held(&gpio_devices_srcu)) {
-		guard(srcu)(&gdev->srcu);
-
-		gc = srcu_dereference(gdev->chip, &gdev->srcu);
+		revocable_try_access_with(&gdev->gc_revocable, gc);
 		if (!gc)
 			continue;
 
@@ -894,6 +893,8 @@ static void gpiodev_release(struct device *dev)
 {
 	struct gpio_device *gdev = to_gpio_device(dev);
 
+	revocable_destroy(&gdev->gc_revocable);
+
 	/* Call pending kfree()s for descriptor labels. */
 	synchronize_srcu(&gdev->desc_srcu);
 	cleanup_srcu_struct(&gdev->desc_srcu);
@@ -901,7 +902,6 @@ static void gpiodev_release(struct device *dev)
 	ida_free(&gpio_ida, gdev->id);
 	kfree_const(gdev->label);
 	kfree(gdev->descs);
-	cleanup_srcu_struct(&gdev->srcu);
 	kfree(gdev);
 }
 
@@ -1091,9 +1091,7 @@ static void gpiochip_setup_devs(void)
 
 	list_for_each_entry_srcu(gdev, &gpio_devices, list,
 				 srcu_read_lock_held(&gpio_devices_srcu)) {
-		guard(srcu)(&gdev->srcu);
-
-		gc = srcu_dereference(gdev->chip, &gdev->srcu);
+		revocable_try_access_with(&gdev->gc_revocable, gc);
 		if (!gc) {
 			dev_err(&gdev->dev, "Underlying GPIO chip is gone\n");
 			continue;
@@ -1196,18 +1194,17 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 		goto err_free_gdev;
 	gdev->id = ret;
 
-	ret = init_srcu_struct(&gdev->srcu);
+	ret = init_srcu_struct(&gdev->desc_srcu);
 	if (ret)
 		goto err_free_ida;
-	rcu_assign_pointer(gdev->chip, gc);
 
-	ret = init_srcu_struct(&gdev->desc_srcu);
+	ret = revocable_init(&gdev->gc_revocable, gc);
 	if (ret)
-		goto err_cleanup_gdev_srcu;
+		goto err_cleanup_desc_srcu;
 
 	ret = dev_set_name(&gdev->dev, GPIOCHIP_NAME "%d", gdev->id);
 	if (ret)
-		goto err_cleanup_desc_srcu;
+		goto err_destroy_gc_revocable;
 
 	device_initialize(&gdev->dev);
 	/*
@@ -1389,10 +1386,10 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	gpio_device_put(gdev);
 	goto err_print_message;
 
+err_destroy_gc_revocable:
+	revocable_destroy(&gdev->gc_revocable);
 err_cleanup_desc_srcu:
 	cleanup_srcu_struct(&gdev->desc_srcu);
-err_cleanup_gdev_srcu:
-	cleanup_srcu_struct(&gdev->srcu);
 err_free_ida:
 	ida_free(&gpio_ida, gdev->id);
 err_free_gdev:
@@ -1429,8 +1426,7 @@ void gpiochip_remove(struct gpio_chip *gc)
 	synchronize_srcu(&gpio_devices_srcu);
 
 	/* Numb the device, cancelling all outstanding operations */
-	rcu_assign_pointer(gdev->chip, NULL);
-	synchronize_srcu(&gdev->srcu);
+	revocable_revoke(&gdev->gc_revocable);
 	gpio_device_teardown_shared(gdev);
 	gpiochip_irqchip_remove(gc);
 	acpi_gpiochip_remove(gc);
@@ -1491,11 +1487,11 @@ struct gpio_device *gpio_device_find(const void *data,
 		if (!device_is_registered(&gdev->dev))
 			continue;
 
-		guard(srcu)(&gdev->srcu);
-
-		gc = srcu_dereference(gdev->chip, &gdev->srcu);
+		revocable_try_access_with(&gdev->gc_revocable, gc);
+		if (!gc)
+			continue;
 
-		if (gc && match(gc, data))
+		if (match(gc, data))
 			return gpio_device_get(gdev);
 	}
 
@@ -2617,16 +2613,15 @@ int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 {
 	unsigned int offset;
 	int ret;
+	struct gpio_chip *gc;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(&desc->gdev->gc_revocable, gc);
 
 	if (test_and_set_bit(GPIOD_FLAG_REQUESTED, &desc->flags))
 		return -EBUSY;
 
 	offset = gpiod_hwgpio(desc);
-	if (!gpiochip_line_is_valid(guard.gc, offset)) {
+	if (!gpiochip_line_is_valid(gc, offset)) {
 		ret = -EINVAL;
 		goto out_clear_bit;
 	}
@@ -2635,15 +2630,15 @@ int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 	 * before IRQs are enabled, for non-sleeping (SOC) GPIOs.
 	 */
 
-	if (guard.gc->request) {
-		ret = guard.gc->request(guard.gc, offset);
+	if (gc->request) {
+		ret = gc->request(gc, offset);
 		if (ret > 0)
 			ret = -EBADE;
 		if (ret)
 			goto out_clear_bit;
 	}
 
-	if (guard.gc->get_direction)
+	if (gc->get_direction)
 		gpiod_get_direction(desc);
 
 	ret = desc_set_label(desc, label ? : "?");
@@ -2653,8 +2648,8 @@ int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 	return 0;
 
 out_free_gpio:
-	if (guard.gc->free)
-		guard.gc->free(guard.gc, offset);
+	if (gc->free)
+		gc->free(gc, offset);
 out_clear_bit:
 	clear_bit(GPIOD_FLAG_REQUESTED, &desc->flags);
 	return ret;
@@ -2683,16 +2678,17 @@ int gpiod_request(struct gpio_desc *desc, const char *label)
 void gpiod_free_commit(struct gpio_desc *desc)
 {
 	unsigned long flags;
+	struct gpio_chip *gc;
 
 	might_sleep();
 
-	CLASS(gpio_chip_guard, guard)(desc);
+	revocable_try_access_or_return_void(&desc->gdev->gc_revocable, gc);
 
 	flags = READ_ONCE(desc->flags);
 
-	if (guard.gc && test_bit(GPIOD_FLAG_REQUESTED, &flags)) {
-		if (guard.gc->free)
-			guard.gc->free(guard.gc, gpiod_hwgpio(desc));
+	if (test_bit(GPIOD_FLAG_REQUESTED, &flags)) {
+		if (gc->free)
+			gc->free(gc, gpiod_hwgpio(desc));
 
 		clear_bit(GPIOD_FLAG_ACTIVE_LOW, &flags);
 		clear_bit(GPIOD_FLAG_REQUESTED, &flags);
@@ -2851,15 +2847,14 @@ EXPORT_SYMBOL_GPL(gpiochip_free_own_desc);
 int gpio_do_set_config(struct gpio_desc *desc, unsigned long config)
 {
 	int ret;
+	struct gpio_chip *gc;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(&desc->gdev->gc_revocable, gc);
 
-	if (!guard.gc->set_config)
+	if (!gc->set_config)
 		return -ENOTSUPP;
 
-	ret = guard.gc->set_config(guard.gc, gpiod_hwgpio(desc), config);
+	ret = gc->set_config(gc, gpiod_hwgpio(desc), config);
 	if (ret > 0)
 		ret = -EBADE;
 
@@ -2972,8 +2967,6 @@ static int gpiochip_direction_input(struct gpio_chip *gc, unsigned int offset)
 {
 	int ret;
 
-	lockdep_assert_held(&gc->gpiodev->srcu);
-
 	if (WARN_ON(!gc->direction_input))
 		return -EOPNOTSUPP;
 
@@ -2989,8 +2982,6 @@ static int gpiochip_direction_output(struct gpio_chip *gc, unsigned int offset,
 {
 	int ret;
 
-	lockdep_assert_held(&gc->gpiodev->srcu);
-
 	if (WARN_ON(!gc->direction_output))
 		return -EOPNOTSUPP;
 
@@ -3028,17 +3019,16 @@ EXPORT_SYMBOL_GPL(gpiod_direction_input);
 int gpiod_direction_input_nonotify(struct gpio_desc *desc)
 {
 	int ret = 0, dir;
+	struct gpio_chip *gc;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(&desc->gdev->gc_revocable, gc);
 
 	/*
 	 * It is legal to have no .get() and .direction_input() specified if
 	 * the chip is output-only, but you can't specify .direction_input()
 	 * and not support the .get() operation, that doesn't make sense.
 	 */
-	if (!guard.gc->get && guard.gc->direction_input) {
+	if (!gc->get && gc->direction_input) {
 		gpiod_warn(desc,
 			   "%s: missing get() but have direction_input()\n",
 			   __func__);
@@ -3051,11 +3041,10 @@ int gpiod_direction_input_nonotify(struct gpio_desc *desc)
 	 * direction (if .get_direction() is supported) else we silently
 	 * assume we are in input mode after this.
 	 */
-	if (guard.gc->direction_input) {
-		ret = gpiochip_direction_input(guard.gc,
-					       gpiod_hwgpio(desc));
-	} else if (guard.gc->get_direction) {
-		dir = gpiochip_get_direction(guard.gc, gpiod_hwgpio(desc));
+	if (gc->direction_input) {
+		ret = gpiochip_direction_input(gc, gpiod_hwgpio(desc));
+	} else if (gc->get_direction) {
+		dir = gpiochip_get_direction(gc, gpiod_hwgpio(desc));
 		if (dir < 0)
 			return dir;
 
@@ -3080,8 +3069,6 @@ static int gpiochip_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	int ret;
 
-	lockdep_assert_held(&gc->gpiodev->srcu);
-
 	if (WARN_ON(unlikely(!gc->set)))
 		return -EOPNOTSUPP;
 
@@ -3095,31 +3082,28 @@ static int gpiochip_set(struct gpio_chip *gc, unsigned int offset, int value)
 static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
 {
 	int val = !!value, ret = 0, dir;
+	struct gpio_chip *gc;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(&desc->gdev->gc_revocable, gc);
 
 	/*
 	 * It's OK not to specify .direction_output() if the gpiochip is
 	 * output-only, but if there is then not even a .set() operation it
 	 * is pretty tricky to drive the output line.
 	 */
-	if (!guard.gc->set && !guard.gc->direction_output) {
+	if (!gc->set && !gc->direction_output) {
 		gpiod_warn(desc,
 			   "%s: missing set() and direction_output() operations\n",
 			   __func__);
 		return -EIO;
 	}
 
-	if (guard.gc->direction_output) {
-		ret = gpiochip_direction_output(guard.gc,
-						gpiod_hwgpio(desc), val);
+	if (gc->direction_output) {
+		ret = gpiochip_direction_output(gc, gpiod_hwgpio(desc), val);
 	} else {
 		/* Check that we are in output mode if we can */
-		if (guard.gc->get_direction) {
-			dir = gpiochip_get_direction(guard.gc,
-						     gpiod_hwgpio(desc));
+		if (gc->get_direction) {
+			dir = gpiochip_get_direction(gc, gpiod_hwgpio(desc));
 			if (dir < 0)
 				return dir;
 
@@ -3134,7 +3118,7 @@ static int gpiod_direction_output_raw_commit(struct gpio_desc *desc, int value)
 		 * If we can't actively set the direction, we are some
 		 * output-only chip, so just drive the output as desired.
 		 */
-		ret = gpiochip_set(guard.gc, gpiod_hwgpio(desc), val);
+		ret = gpiochip_set(gc, gpiod_hwgpio(desc), val);
 		if (ret)
 			return ret;
 	}
@@ -3272,20 +3256,18 @@ int gpiod_direction_output_nonotify(struct gpio_desc *desc, int value)
 int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags)
 {
 	int ret;
+	struct gpio_chip *gc;
 
 	VALIDATE_DESC(desc);
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(&desc->gdev->gc_revocable, gc);
 
-	if (!guard.gc->en_hw_timestamp) {
+	if (!gc->en_hw_timestamp) {
 		gpiod_warn(desc, "%s: hw ts not supported\n", __func__);
 		return -ENOTSUPP;
 	}
 
-	ret = guard.gc->en_hw_timestamp(guard.gc,
-					gpiod_hwgpio(desc), flags);
+	ret = gc->en_hw_timestamp(gc, gpiod_hwgpio(desc), flags);
 	if (ret)
 		gpiod_warn(desc, "%s: hw ts request failed\n", __func__);
 
@@ -3305,20 +3287,18 @@ EXPORT_SYMBOL_GPL(gpiod_enable_hw_timestamp_ns);
 int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags)
 {
 	int ret;
+	struct gpio_chip *gc;
 
 	VALIDATE_DESC(desc);
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(&desc->gdev->gc_revocable, gc);
 
-	if (!guard.gc->dis_hw_timestamp) {
+	if (!gc->dis_hw_timestamp) {
 		gpiod_warn(desc, "%s: hw ts not supported\n", __func__);
 		return -ENOTSUPP;
 	}
 
-	ret = guard.gc->dis_hw_timestamp(guard.gc, gpiod_hwgpio(desc),
-					 flags);
+	ret = gc->dis_hw_timestamp(gc, gpiod_hwgpio(desc), flags);
 	if (ret)
 		gpiod_warn(desc, "%s: hw ts release failed\n", __func__);
 
@@ -3436,8 +3416,6 @@ static int gpiochip_get(struct gpio_chip *gc, unsigned int offset)
 {
 	int ret;
 
-	lockdep_assert_held(&gc->gpiodev->srcu);
-
 	/* Make sure this is called after checking for gc->get(). */
 	ret = gc->get(gc, offset);
 	if (ret > 1) {
@@ -3479,13 +3457,12 @@ static int gpio_chip_get_value(struct gpio_chip *gc, const struct gpio_desc *des
 
 static int gpiod_get_raw_value_commit(const struct gpio_desc *desc)
 {
+	struct gpio_chip *gc;
 	int value;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(&desc->gdev->gc_revocable, gc);
 
-	value = gpio_chip_get_value(guard.gc, desc);
+	value = gpio_chip_get_value(gc, desc);
 	value = value < 0 ? value : !!value;
 	trace_gpio_value(desc_to_gpio(desc), 1, value);
 	return value;
@@ -3494,8 +3471,6 @@ static int gpiod_get_raw_value_commit(const struct gpio_desc *desc)
 static int gpio_chip_get_multiple(struct gpio_chip *gc,
 				  unsigned long *mask, unsigned long *bits)
 {
-	lockdep_assert_held(&gc->gpiodev->srcu);
-
 	if (gc->get_multiple) {
 		int ret;
 
@@ -3522,9 +3497,10 @@ static int gpio_chip_get_multiple(struct gpio_chip *gc,
 /* The 'other' chip must be protected with its GPIO device's SRCU. */
 static bool gpio_device_chip_cmp(struct gpio_device *gdev, struct gpio_chip *gc)
 {
-	guard(srcu)(&gdev->srcu);
+	struct gpio_chip *chip;
 
-	return gc == srcu_dereference(gdev->chip, &gdev->srcu);
+	revocable_try_access_with(&gdev->gc_revocable, chip);
+	return chip ? chip == gc : false;
 }
 
 int gpiod_get_array_value_complex(bool raw, bool can_sleep,
@@ -3547,11 +3523,7 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 		if (!can_sleep)
 			WARN_ON(array_info->gdev->can_sleep);
 
-		guard(srcu)(&array_info->gdev->srcu);
-		gc = srcu_dereference(array_info->gdev->chip,
-				      &array_info->gdev->srcu);
-		if (!gc)
-			return -ENODEV;
+		revocable_try_access_or_return(&array_info->gdev->gc_revocable, gc);
 
 		ret = gpio_chip_get_multiple(gc, array_info->get_mask,
 					     value_bitmap);
@@ -3575,31 +3547,29 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 		unsigned long *mask, *bits;
 		int first, j;
 
-		CLASS(gpio_chip_guard, guard)(desc_array[i]);
-		if (!guard.gc)
-			return -ENODEV;
+		revocable_try_access_or_return(&desc_array[i]->gdev->gc_revocable, gc);
 
-		if (likely(guard.gc->ngpio <= FASTPATH_NGPIO)) {
+		if (likely(gc->ngpio <= FASTPATH_NGPIO)) {
 			mask = fastpath_mask;
 			bits = fastpath_bits;
 		} else {
 			gfp_t flags = can_sleep ? GFP_KERNEL : GFP_ATOMIC;
 
-			mask = bitmap_alloc(guard.gc->ngpio, flags);
+			mask = bitmap_alloc(gc->ngpio, flags);
 			if (!mask)
 				return -ENOMEM;
 
-			bits = bitmap_alloc(guard.gc->ngpio, flags);
+			bits = bitmap_alloc(gc->ngpio, flags);
 			if (!bits) {
 				bitmap_free(mask);
 				return -ENOMEM;
 			}
 		}
 
-		bitmap_zero(mask, guard.gc->ngpio);
+		bitmap_zero(mask, gc->ngpio);
 
 		if (!can_sleep)
-			WARN_ON(guard.gc->can_sleep);
+			WARN_ON(gc->can_sleep);
 
 		/* collect all inputs belonging to the same chip */
 		first = i;
@@ -3614,9 +3584,9 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 				i = find_next_zero_bit(array_info->get_mask,
 						       array_size, i);
 		} while ((i < array_size) &&
-			 gpio_device_chip_cmp(desc_array[i]->gdev, guard.gc));
+			 gpio_device_chip_cmp(desc_array[i]->gdev, gc));
 
-		ret = gpio_chip_get_multiple(guard.gc, mask, bits);
+		ret = gpio_chip_get_multiple(gc, mask, bits);
 		if (ret) {
 			if (mask != fastpath_mask)
 				bitmap_free(mask);
@@ -3765,15 +3735,14 @@ EXPORT_SYMBOL_GPL(gpiod_get_array_value);
 static int gpio_set_open_drain_value_commit(struct gpio_desc *desc, bool value)
 {
 	int ret = 0, offset = gpiod_hwgpio(desc);
+	struct gpio_chip *gc;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(&desc->gdev->gc_revocable, gc);
 
 	if (value) {
-		ret = gpiochip_direction_input(guard.gc, offset);
+		ret = gpiochip_direction_input(gc, offset);
 	} else {
-		ret = gpiochip_direction_output(guard.gc, offset, 0);
+		ret = gpiochip_direction_output(gc, offset, 0);
 		if (!ret)
 			set_bit(GPIOD_FLAG_IS_OUT, &desc->flags);
 	}
@@ -3794,17 +3763,16 @@ static int gpio_set_open_drain_value_commit(struct gpio_desc *desc, bool value)
 static int gpio_set_open_source_value_commit(struct gpio_desc *desc, bool value)
 {
 	int ret = 0, offset = gpiod_hwgpio(desc);
+	struct gpio_chip *gc;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(&desc->gdev->gc_revocable, gc);
 
 	if (value) {
-		ret = gpiochip_direction_output(guard.gc, offset, 1);
+		ret = gpiochip_direction_output(gc, offset, 1);
 		if (!ret)
 			set_bit(GPIOD_FLAG_IS_OUT, &desc->flags);
 	} else {
-		ret = gpiochip_direction_input(guard.gc, offset);
+		ret = gpiochip_direction_input(gc, offset);
 	}
 	trace_gpio_direction(desc_to_gpio(desc), !value, ret);
 	if (ret < 0)
@@ -3817,15 +3785,15 @@ static int gpio_set_open_source_value_commit(struct gpio_desc *desc, bool value)
 
 static int gpiod_set_raw_value_commit(struct gpio_desc *desc, bool value)
 {
+	struct gpio_chip *gc;
+
 	if (unlikely(!test_bit(GPIOD_FLAG_IS_OUT, &desc->flags)))
 		return -EPERM;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(&desc->gdev->gc_revocable, gc);
 
 	trace_gpio_value(desc_to_gpio(desc), 0, value);
-	return gpiochip_set(guard.gc, gpiod_hwgpio(desc), value);
+	return gpiochip_set(gc, gpiod_hwgpio(desc), value);
 }
 
 /*
@@ -3846,8 +3814,6 @@ static int gpiochip_set_multiple(struct gpio_chip *gc,
 	unsigned int i;
 	int ret = 0;
 
-	lockdep_assert_held(&gc->gpiodev->srcu);
-
 	if (gc->set_multiple) {
 		ret = gc->set_multiple(gc, mask, bits);
 		if (ret > 0)
@@ -3892,11 +3858,7 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 				return -EPERM;
 		}
 
-		guard(srcu)(&array_info->gdev->srcu);
-		gc = srcu_dereference(array_info->gdev->chip,
-				      &array_info->gdev->srcu);
-		if (!gc)
-			return -ENODEV;
+		revocable_try_access_or_return(&array_info->gdev->gc_revocable, gc);
 
 		if (!raw && !bitmap_empty(array_info->invert_mask, array_size))
 			bitmap_xor(value_bitmap, value_bitmap,
@@ -3920,31 +3882,30 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 		unsigned long *mask, *bits;
 		int count = 0;
 
-		CLASS(gpio_chip_guard, guard)(desc_array[i]);
-		if (!guard.gc)
-			return -ENODEV;
+		revocable_try_access_or_return(&desc_array[i]->gdev->gc_revocable,
+					       gc);
 
-		if (likely(guard.gc->ngpio <= FASTPATH_NGPIO)) {
+		if (likely(gc->ngpio <= FASTPATH_NGPIO)) {
 			mask = fastpath_mask;
 			bits = fastpath_bits;
 		} else {
 			gfp_t flags = can_sleep ? GFP_KERNEL : GFP_ATOMIC;
 
-			mask = bitmap_alloc(guard.gc->ngpio, flags);
+			mask = bitmap_alloc(gc->ngpio, flags);
 			if (!mask)
 				return -ENOMEM;
 
-			bits = bitmap_alloc(guard.gc->ngpio, flags);
+			bits = bitmap_alloc(gc->ngpio, flags);
 			if (!bits) {
 				bitmap_free(mask);
 				return -ENOMEM;
 			}
 		}
 
-		bitmap_zero(mask, guard.gc->ngpio);
+		bitmap_zero(mask, gc->ngpio);
 
 		if (!can_sleep)
-			WARN_ON(guard.gc->can_sleep);
+			WARN_ON(gc->can_sleep);
 
 		do {
 			struct gpio_desc *desc = desc_array[i];
@@ -3989,10 +3950,10 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 				i = find_next_zero_bit(array_info->set_mask,
 						       array_size, i);
 		} while ((i < array_size) &&
-			 gpio_device_chip_cmp(desc_array[i]->gdev, guard.gc));
+			 gpio_device_chip_cmp(desc_array[i]->gdev, gc));
 		/* push collected bits to outputs */
 		if (count != 0)
-			ret = gpiochip_set_multiple(guard.gc, mask, bits);
+			ret = gpiochip_set_multiple(gc, mask, bits);
 
 cleanup_bitmap:
 		if (mask != fastpath_mask)
@@ -4199,6 +4160,7 @@ EXPORT_SYMBOL_GPL(gpiod_is_shared);
  */
 int gpiod_to_irq(const struct gpio_desc *desc)
 {
+	struct gpio_chip *gc;
 	int offset;
 	int ret;
 
@@ -4206,13 +4168,11 @@ int gpiod_to_irq(const struct gpio_desc *desc)
 	if (ret <= 0)
 		return -EINVAL;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(&desc->gdev->gc_revocable, gc);
 
 	offset = gpiod_hwgpio(desc);
-	if (guard.gc->to_irq) {
-		ret = guard.gc->to_irq(guard.gc, offset);
+	if (gc->to_irq) {
+		ret = gc->to_irq(gc, offset);
 		if (ret)
 			return ret;
 
@@ -4220,7 +4180,7 @@ int gpiod_to_irq(const struct gpio_desc *desc)
 		return -ENXIO;
 	}
 #ifdef CONFIG_GPIOLIB_IRQCHIP
-	if (guard.gc->irq.chip) {
+	if (gc->irq.chip) {
 		/*
 		 * Avoid race condition with other code, which tries to lookup
 		 * an IRQ before the irqchip has been properly registered,
@@ -5168,18 +5128,16 @@ int gpiod_hog(struct gpio_desc *desc, const char *name,
 	struct gpio_desc *local_desc;
 	int hwnum;
 	int ret;
+	struct gpio_chip *gc;
 
-	CLASS(gpio_chip_guard, guard)(desc);
-	if (!guard.gc)
-		return -ENODEV;
+	revocable_try_access_or_return(&desc->gdev->gc_revocable, gc);
 
 	if (test_and_set_bit(GPIOD_FLAG_IS_HOGGED, &desc->flags))
 		return 0;
 
 	hwnum = gpiod_hwgpio(desc);
 
-	local_desc = gpiochip_request_own_desc(guard.gc, hwnum, name,
-					       lflags, dflags);
+	local_desc = gpiochip_request_own_desc(gc, hwnum, name, lflags, dflags);
 	if (IS_ERR(local_desc)) {
 		clear_bit(GPIOD_FLAG_IS_HOGGED, &desc->flags);
 		ret = PTR_ERR(local_desc);
@@ -5550,9 +5508,7 @@ static int gpiolib_seq_show(struct seq_file *s, void *v)
 	if (priv->newline)
 		seq_putc(s, '\n');
 
-	guard(srcu)(&gdev->srcu);
-
-	gc = srcu_dereference(gdev->chip, &gdev->srcu);
+	revocable_try_access_with(&gdev->gc_revocable, gc);
 	if (!gc) {
 		seq_printf(s, "%s: (dangling chip)\n", dev_name(&gdev->dev));
 		return 0;
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index 650a702741df..ecefb9df8a37 100644
--- a/drivers/gpio/gpiolib.h
+++ b/drivers/gpio/gpiolib.h
@@ -16,6 +16,7 @@
 #include <linux/gpio/driver.h>
 #include <linux/module.h>
 #include <linux/notifier.h>
+#include <linux/revocable.h>
 #include <linux/spinlock.h>
 #include <linux/string.h>
 #include <linux/srcu.h>
@@ -31,7 +32,6 @@ struct fwnode_handle;
  * @chrdev: character device for the GPIO device
  * @id: numerical ID number for the GPIO chip
  * @owner: helps prevent removal of modules exporting active GPIOs
- * @chip: pointer to the corresponding gpiochip, holding static
  * data for this device
  * @descs: array of ngpio descriptors.
  * @valid_mask: If not %NULL, holds bitmask of GPIOs which are valid to be
@@ -54,7 +54,7 @@ struct fwnode_handle;
  *                 process context
  * @device_notifier: used to notify character device wait queues about the GPIO
  *                   device being unregistered
- * @srcu: protects the pointer to the underlying GPIO chip
+ * @gc_revocable: revocable provider handle for the corresponding struct gpio_chip.
  * @pin_ranges: range of pins served by the GPIO driver
  *
  * This state container holds most of the runtime variable data
@@ -67,7 +67,6 @@ struct gpio_device {
 	struct cdev		chrdev;
 	int			id;
 	struct module		*owner;
-	struct gpio_chip __rcu	*chip;
 	struct gpio_desc	*descs;
 	unsigned long		*valid_mask;
 	struct srcu_struct	desc_srcu;
@@ -81,7 +80,7 @@ struct gpio_device {
 	rwlock_t		line_state_lock;
 	struct workqueue_struct	*line_state_wq;
 	struct blocking_notifier_head device_notifier;
-	struct srcu_struct	srcu;
+	struct revocable	gc_revocable;
 
 #ifdef CONFIG_PINCTRL
 	/*
@@ -225,27 +224,6 @@ struct gpio_desc {
 
 #define gpiod_not_found(desc)		(IS_ERR(desc) && PTR_ERR(desc) == -ENOENT)
 
-struct gpio_chip_guard {
-	struct gpio_device *gdev;
-	struct gpio_chip *gc;
-	int idx;
-};
-
-DEFINE_CLASS(gpio_chip_guard,
-	     struct gpio_chip_guard,
-	     srcu_read_unlock(&_T.gdev->srcu, _T.idx),
-	     ({
-		struct gpio_chip_guard _guard;
-
-		_guard.gdev = desc->gdev;
-		_guard.idx = srcu_read_lock(&_guard.gdev->srcu);
-		_guard.gc = srcu_dereference(_guard.gdev->chip,
-					     &_guard.gdev->srcu);
-
-		_guard;
-	     }),
-	     const struct gpio_desc *desc)
-
 int gpiod_request(struct gpio_desc *desc, const char *label);
 int gpiod_request_commit(struct gpio_desc *desc, const char *label);
 void gpiod_free(struct gpio_desc *desc);
-- 
2.53.0

