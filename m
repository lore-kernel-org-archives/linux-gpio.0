Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407E13D091F;
	Mon, 27 Apr 2026 13:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777298387; cv=none; b=OAIeE5DtBfbnvpod0+cZbgy7dxJCcQAOdMtBQEHRv7NnebyxfM3jBvby/hbDVKCquXklODJqfpJYHaNdWRzbR5y+ezo9sVENhauBNFwjKBx0wCz5GCwCYEEAqpVFKQlfmNmFDJXEZUdXTmK9XCyijULW0A2yu3HZ1nJNfx7cWgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777298387; c=relaxed/simple;
	bh=OM3WPfhr6XveZRZOOniv3jQCbT/6cAnqplsNoeix1Kc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LnidhlXzTywcyrsM2QevU7FFNspmeIZ0aPAvd/fmW6+Tc+tOIQliwH/f119+iamrBcodW7fJ6qdoPPo2wNikqkGnaWhe77V8x9us16tf9H0Z9NxMLquwW6H69RZguNsAIqZkga76DkPbxGfZk6zNOivdQGweFGvyqjJqGJakR10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bn0I3Udy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bn0I3Udy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B68CC2BCB4;
	Mon, 27 Apr 2026 13:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777298384;
	bh=OM3WPfhr6XveZRZOOniv3jQCbT/6cAnqplsNoeix1Kc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bn0I3UdyTLl44mMRSaHgxTxJ6OYnTdO+b9+JyL66viYh5OBjv9cL+uCKu6B3fjseh
	 5O8ZtvNc94Z/kP+5HIWGF8vZkRQLEyRSc/HD8dTzP0m3rJqUwj4b4mNupSxdhLT02m
	 U9rob/enAEkNgrul0LjHL4sGlkOla+Mjn7vtJUk99ohCdepxLnaSVuu2l7eyacMOth
	 nwmYgydtMur/FSUg2xQDNBf2FOZWceXMS1CA4qEYC7h3MKLxGOZ8hQGLiFG0csmT3C
	 cmMsbe/sEOfe2AcXf6dvBfJlXtF16mg2AEz6FwQm3NXYd4cFTWZ3sjOeTXjJCPPERd
	 O8p5gT6t/8FfQ==
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
Subject: [PATCH v9 4/9] gpio: cdev: Leverage revocable for accessing struct gpio_chip
Date: Mon, 27 Apr 2026 21:58:36 +0800
Message-ID: <20260427135841.96266-5-tzungbi@kernel.org>
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

v3: https://lore.kernel.org/all/20260213092958.864411-9-tzungbi@kernel.org
- Change revocable API usages accordingly.

v2: https://lore.kernel.org/all/20260203061059.975605-9-tzungbi@kernel.org
- Change usages accordingly after applying
  https://lore.kernel.org/all/20260129143733.45618-4-tzungbi@kernel.org.
  - Preserve a local storage for `struct revocable`.
- Combine multiple patches (see "v1:").
- Fix a race condition reported in
  https://lore.kernel.org/all/CAMRc=McDaipt85OHm0MksLkuf6E79dY1uNSqqbcJnoQTUs81Pw@mail.gmail.com/
  and analyzed in
  https://lore.kernel.org/all/aXEEUWwkxHZzCnaI@tzungbi-laptop/.
  In v1, the blocking_notifier_chain_unregister() will be skipped if the
  chip has been removed, leading an UAF in gpiolib_cdev_unregister().
  In v2, it won't skip blocking_notifier_chain_unregister().

v1:
- https://lore.kernel.org/all/20260116081036.352286-14-tzungbi@kernel.org
- https://lore.kernel.org/all/20260116081036.352286-15-tzungbi@kernel.org
- https://lore.kernel.org/all/20260116081036.352286-16-tzungbi@kernel.org
- https://lore.kernel.org/all/20260116081036.352286-17-tzungbi@kernel.org
- https://lore.kernel.org/all/20260116081036.352286-18-tzungbi@kernel.org

---
 drivers/gpio/gpiolib-cdev.c | 68 ++++++++++++++-----------------------
 1 file changed, 26 insertions(+), 42 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index f36b7c06996d..d8a7ccb406a5 100644
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
+	revocable_try_access_or_return(&lh->gdev->chip_rev, gc);
 
 	switch (cmd) {
 	case GPIOHANDLE_GET_LINE_VALUES_IOCTL:
@@ -1432,11 +1431,9 @@ static long linereq_ioctl(struct file *file, unsigned int cmd,
 {
 	struct linereq *lr = file->private_data;
 	void __user *ip = (void __user *)arg;
+	struct gpio_chip *gc;
 
-	guard(srcu)(&lr->gdev->srcu);
-
-	if (!rcu_access_pointer(lr->gdev->chip))
-		return -ENODEV;
+	revocable_try_access_or_return(&lr->gdev->chip_rev, gc);
 
 	switch (cmd) {
 	case GPIO_V2_LINE_GET_VALUES_IOCTL:
@@ -1463,10 +1460,10 @@ static __poll_t linereq_poll(struct file *file,
 {
 	struct linereq *lr = file->private_data;
 	__poll_t events = 0;
+	struct gpio_chip *gc;
 
-	guard(srcu)(&lr->gdev->srcu);
-
-	if (!rcu_access_pointer(lr->gdev->chip))
+	revocable_try_access_with(&lr->gdev->chip_rev, gc);
+	if (!gc)
 		return EPOLLHUP | EPOLLERR;
 
 	poll_wait(file, &lr->wait, wait);
@@ -1485,11 +1482,9 @@ static ssize_t linereq_read(struct file *file, char __user *buf,
 	struct gpio_v2_line_event le;
 	ssize_t bytes_read = 0;
 	int ret;
+	struct gpio_chip *gc;
 
-	guard(srcu)(&lr->gdev->srcu);
-
-	if (!rcu_access_pointer(lr->gdev->chip))
-		return -ENODEV;
+	revocable_try_access_or_return(&lr->gdev->chip_rev, gc);
 
 	if (count < sizeof(le))
 		return -EINVAL;
@@ -1759,10 +1754,10 @@ static __poll_t lineevent_poll(struct file *file,
 {
 	struct lineevent_state *le = file->private_data;
 	__poll_t events = 0;
+	struct gpio_chip *gc;
 
-	guard(srcu)(&le->gdev->srcu);
-
-	if (!rcu_access_pointer(le->gdev->chip))
+	revocable_try_access_with(&le->gdev->chip_rev, gc);
+	if (!gc)
 		return EPOLLHUP | EPOLLERR;
 
 	poll_wait(file, &le->wait, wait);
@@ -1797,11 +1792,9 @@ static ssize_t lineevent_read(struct file *file, char __user *buf,
 	ssize_t bytes_read = 0;
 	ssize_t ge_size;
 	int ret;
+	struct gpio_chip *gc;
 
-	guard(srcu)(&le->gdev->srcu);
-
-	if (!rcu_access_pointer(le->gdev->chip))
-		return -ENODEV;
+	revocable_try_access_or_return(&le->gdev->chip_rev, gc);
 
 	/*
 	 * When compatible system call is being used the struct gpioevent_data,
@@ -1879,11 +1872,9 @@ static long lineevent_ioctl(struct file *file, unsigned int cmd,
 	struct lineevent_state *le = file->private_data;
 	void __user *ip = (void __user *)arg;
 	struct gpiohandle_data ghd;
+	struct gpio_chip *gc;
 
-	guard(srcu)(&le->gdev->srcu);
-
-	if (!rcu_access_pointer(le->gdev->chip))
-		return -ENODEV;
+	revocable_try_access_or_return(&le->gdev->chip_rev, gc);
 
 	/*
 	 * We can get the value for an event line but not set it,
@@ -2385,12 +2376,10 @@ static long gpio_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	struct gpio_chardev_data *cdev = file->private_data;
 	struct gpio_device *gdev = cdev->gdev;
 	void __user *ip = (void __user *)arg;
-
-	guard(srcu)(&gdev->srcu);
+	struct gpio_chip *gc;
 
 	/* We fail any subsequent ioctl():s when the chip is gone */
-	if (!rcu_access_pointer(gdev->chip))
-		return -ENODEV;
+	revocable_try_access_or_return(&gdev->chip_rev, gc);
 
 	/* Fill in the struct and pass to userspace */
 	switch (cmd) {
@@ -2448,12 +2437,9 @@ static void lineinfo_changed_func(struct work_struct *work)
 		 * Pin functions are in general much more static and while it's
 		 * not 100% bullet-proof, it's good enough for most cases.
 		 */
-		scoped_guard(srcu, &ctx->gdev->srcu) {
-			gc = srcu_dereference(ctx->gdev->chip, &ctx->gdev->srcu);
-			if (gc &&
-			    !pinctrl_gpio_can_use_line(gc, ctx->chg.info.offset))
+		revocable_try_access_or_skip_scoped(&ctx->gdev->chip_rev, gc)
+			if (!pinctrl_gpio_can_use_line(gc, ctx->chg.info.offset))
 				ctx->chg.info.flags |= GPIO_V2_LINE_FLAG_USED;
-		}
 	}
 
 	ret = kfifo_in_spinlocked(&ctx->cdev->events, &ctx->chg, 1,
@@ -2534,10 +2520,10 @@ static __poll_t lineinfo_watch_poll(struct file *file,
 {
 	struct gpio_chardev_data *cdev = file->private_data;
 	__poll_t events = 0;
+	struct gpio_chip *gc;
 
-	guard(srcu)(&cdev->gdev->srcu);
-
-	if (!rcu_access_pointer(cdev->gdev->chip))
+	revocable_try_access_with(&cdev->gdev->chip_rev, gc);
+	if (!gc)
 		return EPOLLHUP | EPOLLERR;
 
 	poll_wait(file, &cdev->wait, pollt);
@@ -2557,11 +2543,9 @@ static ssize_t lineinfo_watch_read(struct file *file, char __user *buf,
 	ssize_t bytes_read = 0;
 	int ret;
 	size_t event_size;
+	struct gpio_chip *gc;
 
-	guard(srcu)(&cdev->gdev->srcu);
-
-	if (!rcu_access_pointer(cdev->gdev->chip))
-		return -ENODEV;
+	revocable_try_access_or_return(&cdev->gdev->chip_rev, gc);
 
 #ifndef CONFIG_GPIO_CDEV_V1
 	event_size = sizeof(struct gpio_v2_line_info_changed);
-- 
2.51.0

