Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9362932ABCA;
	Fri,  8 May 2026 10:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778237732; cv=none; b=D/6xFtkq9vj3lUo/aY4N5BmK8oIY2NfE7dOBCG6+Nth4idGeOLiE7le1zcX6WK5ZrtsBf2Nfcv2NZc4t7j7mwxagfLA8VvT2/Ba3+RCyocXSpFJ1/Y8IaZ+96GZkGmvulCk0nd61Zw/PCSYZ7cCPQ1y0eZZZJDXESSJ8AO65khM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778237732; c=relaxed/simple;
	bh=FHk+uD2OdcZc+L/NkfqKJ7/JmGmIeRX0VaOttO0Q4cw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MJ6Yc119/3hhJ6kCzO+OyG3DocM5DDY4SNpFTxcczaxV05jgL6Ln3boW/s52FiH2qQhVLf+7/iNlOhdwikLXZPdUFhFWSksbUQC/y5zxSkt4dbfAwbi5gpO/nvjng9ZuFnv2m/wygxKtY7KTXpWWtx8dFfLw6T5Rtdrz3j7E5S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iBeBOMHD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iBeBOMHD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 043D5C2BCF5;
	Fri,  8 May 2026 10:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778237732;
	bh=FHk+uD2OdcZc+L/NkfqKJ7/JmGmIeRX0VaOttO0Q4cw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iBeBOMHDOXGbylbk9Wc+KQEn10O0qrTVGUWbS5ExD2HNHu/W1zEssPOzj4jAu3CP1
	 2SZ7Qdvc19dkrrDlm6CtAPdM5F+m01FSZ/XEhddBMUb51EGxIcksVgyOuTT14QuobX
	 acTZkXmtQJcBHKk/v0j/rdXKm4c13pQXeARrd3qvzp+R0t5fBFi/ZsctVZ1lQZbd9V
	 EO2KRFG1juBYoYX20JW1LPiMN/ITJSDiEs+Vz+9+ERf/FnxKnk3C2u46gCpuXDP6St
	 VtRkQHJb+HwnoZEzNAD/JzF58wgTzkQV50TfdX//a19HzUXh8eWJM2qKZiAms3Rh5r
	 u0rwRenr3B2OQ==
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
	"Paul E . McKenney" <paulmck@kernel.org>
Subject: [PATCH v10 3/9] gpio: Add revocable provider handle for struct gpio_chip
Date: Fri,  8 May 2026 18:54:42 +0800
Message-ID: <20260508105448.31799-4-tzungbi@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260508105448.31799-1-tzungbi@kernel.org>
References: <20260508105448.31799-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The underlying chip can be removed asynchronously.  `gdev->srcu` is used
to ensure the synchronization before accessing `gdev->chip`.

Revocable encapsulates the details.  Add revocable provider handle for
the corresponding struct gpio_chip in struct gpio_device so that it can
start to hide the synchronization details.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v10:
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
 drivers/gpio/gpiolib.c | 13 +++++++++++--
 drivers/gpio/gpiolib.h |  3 +++
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 1e6dce430dca..9046fd923af0 100644
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
@@ -874,6 +875,7 @@ static void gpiodev_release(struct device *dev)
 	synchronize_srcu(&gdev->desc_srcu);
 	cleanup_srcu_struct(&gdev->desc_srcu);
 
+	revocable_put(&gdev->chip_rev);
 	ida_free(&gpio_ida, gdev->id);
 	kfree_const(gdev->label);
 	kfree(gdev->descs);
@@ -1210,6 +1212,10 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	else
 		gdev->owner = THIS_MODULE;
 
+	ret = revocable_init(&gdev->chip_rev, gc);
+	if (ret)
+		goto err_put_device;
+
 	scoped_guard(mutex, &gpio_devices_lock) {
 		/*
 		 * TODO: this allocates a Linux GPIO number base in the global
@@ -1224,7 +1230,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 			if (base < 0) {
 				ret = base;
 				base = 0;
-				goto err_put_device;
+				goto err_revoke_chip_rev;
 			}
 
 			/*
@@ -1244,7 +1250,7 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 		ret = gpiodev_add_to_list_unlocked(gdev);
 		if (ret) {
 			gpiochip_err(gc, "GPIO integer space overlap, cannot add chip\n");
-			goto err_put_device;
+			goto err_revoke_chip_rev;
 		}
 	}
 
@@ -1343,6 +1349,8 @@ int gpiochip_add_data_with_key(struct gpio_chip *gc, void *data,
 	scoped_guard(mutex, &gpio_devices_lock)
 		list_del_rcu(&gdev->list);
 	synchronize_srcu(&gpio_devices_srcu);
+err_revoke_chip_rev:
+	revocable_revoke(&gdev->chip_rev);
 err_put_device:
 	gpio_device_put(gdev);
 	goto err_print_message;
@@ -1389,6 +1397,7 @@ void gpiochip_remove(struct gpio_chip *gc)
 	/* Numb the device, cancelling all outstanding operations */
 	rcu_assign_pointer(gdev->chip, NULL);
 	synchronize_srcu(&gdev->srcu);
+	revocable_revoke(&gdev->chip_rev);
 	gpio_device_teardown_shared(gdev);
 	gpiochip_irqchip_remove(gc);
 	acpi_gpiochip_remove(gc);
diff --git a/drivers/gpio/gpiolib.h b/drivers/gpio/gpiolib.h
index dc4cb61a9318..4e2e98f61f5a 100644
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
@@ -55,6 +56,7 @@ struct fwnode_handle;
  * @device_notifier: used to notify character device wait queues about the GPIO
  *                   device being unregistered
  * @srcu: protects the pointer to the underlying GPIO chip
+ * @chip_rev: revocable provider handle for the corresponding struct gpio_chip.
  * @pin_ranges: range of pins served by the GPIO driver
  *
  * This state container holds most of the runtime variable data
@@ -82,6 +84,7 @@ struct gpio_device {
 	struct workqueue_struct	*line_state_wq;
 	struct blocking_notifier_head device_notifier;
 	struct srcu_struct	srcu;
+	struct revocable	chip_rev;
 
 #ifdef CONFIG_PINCTRL
 	/*
-- 
2.51.0

