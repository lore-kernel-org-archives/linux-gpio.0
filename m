Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166E13D1718;
	Mon, 27 Apr 2026 13:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777298393; cv=none; b=ZZKOcQrhX4lainu27MN4mbhjlcprxU+5+ym70r09zEKOv+Kvvg8zKykjWSZPx3Kk25MT5jYE/sDlc9Tq3uac/FOSBTxAaWkjOvlZPKjjWKvkn/mQPTaagmspjUODho0itCQS+5iaMIaVzqWeK3V6bqameTfHyy+xm3OFo8chDn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777298393; c=relaxed/simple;
	bh=pi7ABDBl8gDgkbqRebEEglw8wiz3iI98IgsW5p9Mphk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G0eaxrJom4Kg4Ds+KYzVrBkSyBuQqOdMu4YWmPbzaPC1nBWiS33EMVf6oVhFPwVwGCNIU0GFAb43Q+PdiM6L3Z1ZMny8lXm7pDqZ1iFlrRyziLzzzRwOhMmkGCFRWfq9yFI1VQnOHiV+Hx1WB5qMbw9nQbLG8HvcWh9l/TmGtow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Oe0g0+R7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Oe0g0+R7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36F9DC2BCB9;
	Mon, 27 Apr 2026 13:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777298392;
	bh=pi7ABDBl8gDgkbqRebEEglw8wiz3iI98IgsW5p9Mphk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Oe0g0+R7UODZhbNROLkQUVhVbBAGr/0Uid3Wb0CS4kp2EzoOFqAEyR7Aq/c8E9whv
	 U/8Ew7FoQBLW5MaK58EVwJ8FXyHm6BiDx8PZ5+RsYOFa2DWV7BEFupEAi7W5lScWLM
	 Hn9EsorGlTEKRMGM8wuz7soA30Y5o0N+nAItPNggV/VPUbTHhKsNEffsQ7pYU+0Hh6
	 tJ5PrC92MTdC4uyPgfeO36k5h8yI7xAikcQLXqDWmpEUTbVsbObAHW32J7QSj90qf2
	 vLiG2h+tzyK/WGxQYuxqXSIK4MrB7dThJrJWJAV9MUnVol/M9gmFhvNRRCh6aSTMlk
	 e9JLBd+kDgYSw==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Benson Leung <bleung@chromium.org>,
	tzungbi@kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	driver-core@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <shuah@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Johan Hovold <johan@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Dan Williams <dan.j.williams@intel.com>
Subject: [PATCH v9 6/9] gpio: Leverage revocable for accessing struct gpio_chip
Date: Mon, 27 Apr 2026 21:58:38 +0800
Message-ID: <20260427135841.96266-7-tzungbi@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260427135841.96266-1-tzungbi@kernel.org>
References: <20260427135841.96266-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Struct gpio_device now provides a revocable provider to the underlying
struct gpio_chip.  Leverage revocable for accessing the struct
gpio_chip.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v9:
- New to the series.
- Rename "chip_rp" -> "chip_rev".

v4 - v8:
- Doesn't exist.

v3: https://lore.kernel.org/all/20260213092958.864411-11-tzungbi@kernel.org
- Change revocable API usages accordingly.

v2: https://lore.kernel.org/all/20260203061059.975605-11-tzungbi@kernel.org
- Separate from v1(a) for excluding gpio_chip_guard and combine v1(b).

v1(a):
- https://lore.kernel.org/all/20260116081036.352286-23-tzungbi@kernel.org
v1(b):
- https://lore.kernel.org/all/20260116081036.352286-19-tzungbi@kernel.org

---
 drivers/gpio/gpiolib.c | 60 +++++++++++++-----------------------------
 1 file changed, 18 insertions(+), 42 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 2cac1e15e1e5..798fd5f52745 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -335,7 +335,10 @@ EXPORT_SYMBOL(gpio_device_get_label);
  */
 struct gpio_chip *gpio_device_get_chip(struct gpio_device *gdev)
 {
-	return rcu_dereference_check(gdev->chip, 1);
+	struct gpio_chip *gc;
+
+	revocable_try_access_with(&gdev->chip_rev, gc);
+	return gc;
 }
 EXPORT_SYMBOL_GPL(gpio_device_get_chip);
 
@@ -561,9 +564,7 @@ static struct gpio_desc *gpio_name_to_desc(const char * const name)
 
 	list_for_each_entry_srcu(gdev, &gpio_devices, list,
 				 srcu_read_lock_held(&gpio_devices_srcu)) {
-		guard(srcu)(&gdev->srcu);
-
-		gc = srcu_dereference(gdev->chip, &gdev->srcu);
+		revocable_try_access_with(&gdev->chip_rev, gc);
 		if (!gc)
 			continue;
 
@@ -1050,9 +1051,7 @@ static void gpiochip_setup_devs(void)
 
 	list_for_each_entry_srcu(gdev, &gpio_devices, list,
 				 srcu_read_lock_held(&gpio_devices_srcu)) {
-		guard(srcu)(&gdev->srcu);
-
-		gc = srcu_dereference(gdev->chip, &gdev->srcu);
+		revocable_try_access_with(&gdev->chip_rev, gc);
 		if (!gc) {
 			dev_err(&gdev->dev, "Underlying GPIO chip is gone\n");
 			continue;
@@ -1455,11 +1454,11 @@ struct gpio_device *gpio_device_find(const void *data,
 		if (!device_is_registered(&gdev->dev))
 			continue;
 
-		guard(srcu)(&gdev->srcu);
-
-		gc = srcu_dereference(gdev->chip, &gdev->srcu);
+		revocable_try_access_with(&gdev->chip_rev, gc);
+		if (!gc)
+			continue;
 
-		if (gc && match(gc, data))
+		if (match(gc, data))
 			return gpio_device_get(gdev);
 	}
 
@@ -3402,18 +3401,10 @@ static int gpio_chip_get_value(struct gpio_chip *gc, const struct gpio_desc *des
 
 static int gpiod_get_raw_value_commit(const struct gpio_desc *desc)
 {
-	struct gpio_device *gdev;
 	struct gpio_chip *gc;
 	int value;
 
-	/* FIXME Unable to use gpio_chip_guard due to const desc. */
-	gdev = desc->gdev;
-
-	guard(srcu)(&gdev->srcu);
-
-	gc = srcu_dereference(gdev->chip, &gdev->srcu);
-	if (!gc)
-		return -ENODEV;
+	revocable_try_access_or_return(&desc->gdev->chip_rev, gc);
 
 	value = gpio_chip_get_value(gc, desc);
 	value = value < 0 ? value : !!value;
@@ -3452,9 +3443,10 @@ static int gpio_chip_get_multiple(struct gpio_chip *gc,
 /* The 'other' chip must be protected with its GPIO device's SRCU. */
 static bool gpio_device_chip_cmp(struct gpio_device *gdev, struct gpio_chip *gc)
 {
-	guard(srcu)(&gdev->srcu);
+	struct gpio_chip *chip;
 
-	return gc == srcu_dereference(gdev->chip, &gdev->srcu);
+	revocable_try_access_with(&gdev->chip_rev, chip);
+	return chip ? chip == gc : false;
 }
 
 int gpiod_get_array_value_complex(bool raw, bool can_sleep,
@@ -3477,11 +3469,7 @@ int gpiod_get_array_value_complex(bool raw, bool can_sleep,
 		if (!can_sleep)
 			WARN_ON(array_info->gdev->can_sleep);
 
-		guard(srcu)(&array_info->gdev->srcu);
-		gc = srcu_dereference(array_info->gdev->chip,
-				      &array_info->gdev->srcu);
-		if (!gc)
-			return -ENODEV;
+		revocable_try_access_or_return(&array_info->gdev->chip_rev, gc);
 
 		ret = gpio_chip_get_multiple(gc, array_info->get_mask,
 					     value_bitmap);
@@ -3818,11 +3806,7 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 				return -EPERM;
 		}
 
-		guard(srcu)(&array_info->gdev->srcu);
-		gc = srcu_dereference(array_info->gdev->chip,
-				      &array_info->gdev->srcu);
-		if (!gc)
-			return -ENODEV;
+		revocable_try_access_or_return(&array_info->gdev->chip_rev, gc);
 
 		if (!raw && !bitmap_empty(array_info->invert_mask, array_size))
 			bitmap_xor(value_bitmap, value_bitmap,
@@ -4117,7 +4101,6 @@ EXPORT_SYMBOL_GPL(gpiod_is_shared);
  */
 int gpiod_to_irq(const struct gpio_desc *desc)
 {
-	struct gpio_device *gdev;
 	struct gpio_chip *gc;
 	int offset;
 	int ret;
@@ -4126,12 +4109,7 @@ int gpiod_to_irq(const struct gpio_desc *desc)
 	if (ret <= 0)
 		return -EINVAL;
 
-	gdev = desc->gdev;
-	/* FIXME Cannot use gpio_chip_guard due to const desc. */
-	guard(srcu)(&gdev->srcu);
-	gc = srcu_dereference(gdev->chip, &gdev->srcu);
-	if (!gc)
-		return -ENODEV;
+	revocable_try_access_or_return(&desc->gdev->chip_rev, gc);
 
 	offset = gpiod_hwgpio(desc);
 	if (gc->to_irq) {
@@ -5470,9 +5448,7 @@ static int gpiolib_seq_show(struct seq_file *s, void *v)
 	if (priv->newline)
 		seq_putc(s, '\n');
 
-	guard(srcu)(&gdev->srcu);
-
-	gc = srcu_dereference(gdev->chip, &gdev->srcu);
+	revocable_try_access_with(&gdev->chip_rev, gc);
 	if (!gc) {
 		seq_printf(s, "%s: (dangling chip)\n", dev_name(&gdev->dev));
 		return 0;
-- 
2.51.0

