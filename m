Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FE83F1AAD;
	Sun, 11 Oct 2026 12:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791720874; cv=none; b=r+7WptttwogX26vIrqP3ON3ZRYsGiE5p4u9PXLJTHYz8IopBdS976v8Cmh8A13dlw+9eoWbih8S8QnJpRgBiSaX/xUWlCXmcpOWKgJOg6AiPJCz6s57dTdf4hSY3hUZU5qso8pL6sUUr5ezKHATTLRZGz+xyZUmIFBquJesMMbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791720874; c=relaxed/simple;
	bh=/lQHVLEPno0id4+YZ63M4VTFsvW0kfT6IsrE5m8E4rM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V8MR5gNEwRbDALBftYXXMArtnpPJ4ieCXvzqInThpQieYbBjzSYxtiROOngoty+cgcsKp7vkYD96BXz67wgWAdGQOyqvX5J28mHP+UohIxIv7dK0dMDIRNqgHKTSct4zJprjjzE7/qUzWEtnocdRDdaWerAe8OKWNo7CyXhTGRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UzlXD8lz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UzlXD8lz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C04E01F0089E;
	Sun, 11 Oct 2026 12:14:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791720867;
	bh=yzVi9i8q3m1d4DCORBtFuKOY8/KCrp6T899MdS/Ehvg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=UzlXD8lzGBgq7UEKRmxhwYLpwi6taJVzRipfcuXzIwGMGp6bVAARF9MrSqtKD8piS
	 KtkDwt6UBYox6/Pyt1vrWhCIqqON2CFkmBHPKzPzINTbKOQJGjCUgh3WajLD2m6BGT
	 s/RAFQJFL4pIDHSdvthjEC/3GAGMqoU7zq7sbkeL8lrlIF+6GP+3RVKRL2KtqHRtyN
	 w5vpKNxYd8jG/LAyDFCrqxSxS0wZ2m3B4pI8Uo85kOGApEKBeFe3BYlX8/HfRHzB+Z
	 snbNnPlRWyFTa6usAKDyVTvNVeuK125nLIil4/zfdKkabS7cqYIXAAovyMXILsypgT
	 Kn617Qtj2o2Aw==
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
	tzungbi@kernel.org
Subject: [PATCH v14 5/5] reset: Leverage revocable for accessing struct reset_controller_dev
Date: Sun, 11 Oct 2026 20:12:45 +0800
Message-ID: <20261011121246.162759-6-tzungbi@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261011121246.162759-1-tzungbi@kernel.org>
References: <20261011121246.162759-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 78ebbff6d1a0 ("reset: handle removing supplier before consumers")
protected the `rcdev` pointer in `struct reset_control` with SRCU so
that the reset core can handle suppliers unbinding while consumers still
hold reset control handles.

Because `struct reset_control` handles can outlive `rcdev`, each of the
N handles had to embed its own `srcu_struct` and call synchronize_srcu()
on release, and reset_controller_unregister() had to call
synchronize_srcu() N times in a loop.

Leverage dynamic revocable to allocate a single reference-counted
`struct revocable` for `rcdev` shared across all N `struct reset_control`
handles (1-to-N).  This reduces N `srcu_struct` instances per controller
to 1, drops synchronize_srcu() from reset_control_put_internal(), and
replaces the N synchronize_srcu() calls on unregistration with a single
revocable_revoke().

In addition, calling revocable_revoke() outside `rcdev->lock` avoids an
ABBA lock inversion between `rcdev->lock` and SRCU, as
reset_control_acquire() and reset_control_put_internal() acquire
`rcdev->lock` inside the SRCU read-side critical section.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
v14:
- New to the series.
---
 drivers/reset/core.c             | 93 ++++++++------------------------
 include/linux/reset-controller.h |  3 ++
 2 files changed, 26 insertions(+), 70 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index 38e189d04d09..788a235c3965 100644
--- a/drivers/reset/core.c
+++ b/drivers/reset/core.c
@@ -24,8 +24,8 @@
 #include <linux/property.h>
 #include <linux/reset.h>
 #include <linux/reset-controller.h>
+#include <linux/revocable.h>
 #include <linux/slab.h>
-#include <linux/srcu.h>
 
 static DEFINE_MUTEX(reset_list_mutex);
 static LIST_HEAD(reset_controller_list);
@@ -37,9 +37,7 @@ static DEFINE_IDA(reset_gpio_ida);
 
 /**
  * struct reset_control - a reset control
- * @rcdev: a pointer to the reset controller device
- *         this reset control belongs to
- * @srcu: protects the rcdev pointer from removal during consumer access
+ * @rev: revocable handle for accessing the reset controller device
  * @list: list entry for the rcdev's reset controller list
  * @id: ID of the reset controller in the reset
  *      controller device
@@ -54,8 +52,7 @@ static DEFINE_IDA(reset_gpio_ida);
  * @lock: serializes the internals of reset_control_acquire()
  */
 struct reset_control {
-	struct reset_controller_dev __rcu *rcdev;
-	struct srcu_struct srcu;
+	struct revocable *rev;
 	struct list_head list;
 	unsigned int id;
 	struct kref refcnt;
@@ -141,6 +138,10 @@ int reset_controller_register(struct reset_controller_dev *rcdev)
 			return -EINVAL;
 	}
 
+	rcdev->rev = revocable_alloc(rcdev);
+	if (!rcdev->rev)
+		return -ENOMEM;
+
 	if (rcdev->of_xlate)
 		rcdev->fwnode_reset_n_cells = rcdev->of_reset_n_cells;
 
@@ -181,18 +182,14 @@ void reset_controller_unregister(struct reset_controller_dev *rcdev)
 	scoped_guard(mutex, &reset_list_mutex)
 		list_del(&rcdev->list);
 
+	revocable_revoke(rcdev->rev);
+
 	scoped_guard(mutex, &rcdev->lock) {
-		/*
-		 * Numb but don't free the remaining reset control handles that are
-		 * still held by consumers.
-		 */
-		list_for_each_entry_safe(rstc, pos, &rcdev->reset_control_head, list) {
-			rcu_assign_pointer(rstc->rcdev, NULL);
-			synchronize_srcu(&rstc->srcu);
+		list_for_each_entry_safe(rstc, pos, &rcdev->reset_control_head, list)
 			reset_controller_remove(rcdev, rstc);
-		}
 	}
 
+	revocable_put(rcdev->rev);
 	mutex_destroy(&rcdev->lock);
 }
 EXPORT_SYMBOL_GPL(reset_controller_unregister);
@@ -382,11 +379,7 @@ int reset_control_reset(struct reset_control *rstc)
 	if (reset_control_is_array(rstc))
 		return reset_control_array_reset(rstc_to_array(rstc));
 
-	guard(srcu)(&rstc->srcu);
-
-	rcdev = srcu_dereference(rstc->rcdev, &rstc->srcu);
-	if (!rcdev)
-		return -ENODEV;
+	revocable_try_access_or_return(rstc->rev, rcdev);
 
 	if (!rcdev->ops->reset)
 		return -ENOTSUPP;
@@ -503,11 +496,7 @@ int reset_control_assert(struct reset_control *rstc)
 	if (reset_control_is_array(rstc))
 		return reset_control_array_assert(rstc_to_array(rstc));
 
-	guard(srcu)(&rstc->srcu);
-
-	rcdev = srcu_dereference(rstc->rcdev, &rstc->srcu);
-	if (!rcdev)
-		return -ENODEV;
+	revocable_try_access_or_return(rstc->rev, rcdev);
 
 	if (rstc->shared) {
 		if (WARN_ON(atomic_read(&rstc->triggered_count) != 0))
@@ -599,11 +588,7 @@ int reset_control_deassert(struct reset_control *rstc)
 	if (reset_control_is_array(rstc))
 		return reset_control_array_deassert(rstc_to_array(rstc));
 
-	guard(srcu)(&rstc->srcu);
-
-	rcdev = srcu_dereference(rstc->rcdev, &rstc->srcu);
-	if (!rcdev)
-		return -ENODEV;
+	revocable_try_access_or_return(rstc->rev, rcdev);
 
 	if (rstc->shared) {
 		if (WARN_ON(atomic_read(&rstc->triggered_count) != 0))
@@ -679,11 +664,7 @@ int reset_control_status(struct reset_control *rstc)
 	if (WARN_ON(IS_ERR(rstc)) || reset_control_is_array(rstc))
 		return -EINVAL;
 
-	guard(srcu)(&rstc->srcu);
-
-	rcdev = srcu_dereference(rstc->rcdev, &rstc->srcu);
-	if (!rcdev)
-		return -ENODEV;
+	revocable_try_access_or_return(rstc->rev, rcdev);
 
 	if (rcdev->ops->status)
 		return rcdev->ops->status(rcdev, rstc->id);
@@ -731,11 +712,7 @@ int reset_control_acquire(struct reset_control *rstc)
 	if (rstc->acquired)
 		return 0;
 
-	guard(srcu)(&rstc->srcu);
-
-	rcdev = srcu_dereference(rstc->rcdev, &rstc->srcu);
-	if (!rcdev)
-		return -ENODEV;
+	revocable_try_access_or_return(rstc->rev, rcdev);
 
 	scoped_guard(mutex, &rcdev->lock) {
 		list_for_each_entry(rc, &rcdev->reset_control_head, list) {
@@ -831,7 +808,6 @@ __reset_control_get_internal(struct reset_controller_dev *rcdev,
 	bool shared = flags & RESET_CONTROL_FLAGS_BIT_SHARED;
 	bool acquired = flags & RESET_CONTROL_FLAGS_BIT_ACQUIRED;
 	struct reset_control *rstc;
-	int ret;
 
 	lockdep_assert_held(&rcdev->lock);
 
@@ -862,19 +838,13 @@ __reset_control_get_internal(struct reset_controller_dev *rcdev,
 	if (!rstc)
 		return ERR_PTR(-ENOMEM);
 
-	ret = init_srcu_struct(&rstc->srcu);
-	if (ret) {
-		kfree(rstc);
-		return ERR_PTR(ret);
-	}
-
 	if (!try_module_get(rcdev->owner)) {
-		cleanup_srcu_struct(&rstc->srcu);
 		kfree(rstc);
 		return ERR_PTR(-ENODEV);
 	}
 
-	rcu_assign_pointer(rstc->rcdev, rcdev);
+	revocable_get(rcdev->rev);
+	rstc->rev = rcdev->rev;
 	list_add(&rstc->list, &rcdev->reset_control_head);
 	rstc->id = index;
 	kref_init(&rstc->refcnt);
@@ -890,40 +860,23 @@ static void __reset_control_release(struct kref *kref)
 {
 	struct reset_control *rstc = container_of(kref, struct reset_control,
 						  refcnt);
-	struct reset_controller_dev *rcdev;
-
-	lockdep_assert_held(&rstc->srcu);
-
-	rcdev = rcu_replace_pointer(rstc->rcdev, NULL, true);
-	if (rcdev) {
-		lockdep_assert_held(&rcdev->lock);
-		reset_controller_remove(rcdev, rstc);
-	}
 
 	mutex_destroy(&rstc->lock);
+	revocable_put(rstc->rev);
 }
 
 static void reset_control_put_internal(struct reset_control *rstc)
 {
 	struct reset_controller_dev *rcdev;
-	int ret = 0;
 
 	if (IS_ERR_OR_NULL(rstc))
 		return;
 
-	scoped_guard(srcu, &rstc->srcu) {
-		rcdev = srcu_dereference(rstc->rcdev, &rstc->srcu);
-		if (!rcdev)
-			/* Already released. */
-			return;
-
-		guard(mutex)(&rcdev->lock);
-		ret = kref_put(&rstc->refcnt, __reset_control_release);
-	}
+	revocable_try_access_or_return_void(rstc->rev, rcdev);
 
-	if (ret) {
-		synchronize_srcu(&rstc->srcu);
-		cleanup_srcu_struct(&rstc->srcu);
+	guard(mutex)(&rcdev->lock);
+	if (kref_put(&rstc->refcnt, __reset_control_release)) {
+		reset_controller_remove(rcdev, rstc);
 		kfree(rstc);
 	}
 }
diff --git a/include/linux/reset-controller.h b/include/linux/reset-controller.h
index 52a5a4e81f18..9abf5c59fd9a 100644
--- a/include/linux/reset-controller.h
+++ b/include/linux/reset-controller.h
@@ -28,6 +28,7 @@ struct reset_control_ops {
 struct module;
 struct device_node;
 struct of_phandle_args;
+struct revocable;
 
 /**
  * struct reset_controller_dev - reset controller entity that might
@@ -48,6 +49,7 @@ struct of_phandle_args;
  *                :c:func:`fwnode_reset_simple_xlate`
  * @nr_resets: number of reset controls in this reset controller device
  * @lock: protects the reset control list from concurrent access
+ * @rev: revocable provider handle for itself
  */
 struct reset_controller_dev {
 	const struct reset_control_ops *ops;
@@ -65,6 +67,7 @@ struct reset_controller_dev {
 			    const struct fwnode_reference_args *reset_spec);
 	unsigned int nr_resets;
 	struct mutex lock;
+	struct revocable *rev;
 };
 
 #if IS_ENABLED(CONFIG_RESET_CONTROLLER)
-- 
2.53.0

