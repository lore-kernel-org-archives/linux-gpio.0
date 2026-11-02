Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636278;
	b=qq+KbB8nv/Kg85/+HzNtsdodOU1Ai7X8lBbQutRehpfzTwEtl5WV8J40FpsWS/poa28Y
	 mKTJoVMTf65WiRoNhRHUI3jor1iRd7Ov4ogDpPeNCz4RTgHHvKPGAYva4MF86rHgy6tTw
	 lbNVvsvQI7C+lz2wE/JKYZDqAzdNsJYJj6fzloEcsL35mUYTZg/2GRyUP8WHsWtY4VXlu
	 EPHaBE5WQsrZeQ8vdvlzOnnVwUbXK5XavD3aShBiDR4mdXEITqi5skjanl/2kJTHhAFj5
	 66tU6OVbiuBHKh6VTl+E86Crda/Y8NyXEBNqZ2MkonaI48NUG14jjIbSxRy7wbW4+PQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636278;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=tSlhZlCS6U6DSS1pN1LYEAHztvmXI+pBSdiw2T3/jww=;
	b=nTmEM94ZmvnSRNFiFUZVZn3ld1aE0+P/vnB0jjYrSa4xZwirZWpv6OmHe1Hqci34NVTr
	 ykkx50MDwAqodHmXV4E3Gq/ioJdCDl1MLHzeKKIHZo1o6aAwJr380EoYFty/XGlkMgYSe
	 42No0gbDWfpePEt6f7SEF7c38K6oqcUlyvuDu0PvMgJjwQy5pdRNhtY/kJZRSeTWcrY/f
	 q158GjMHTxr2c3SBIIEmpK5HaGpF1VMeHu9khY8ovgBgbosG3qgFsp5FXbqwMibCt0MMj
	 y7ZeMs0udsuIKY7wJvMNCW6hp3x8nkqxNb/3NjT0ycD4K7Pm7R0tdvZZTGNpjNMFXhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CQULjrXj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C729A6099952;
	Mon,  2 Nov 2026 16:17:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CQULjrXj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 070271F00A16;
	Mon,  2 Nov 2026 16:17:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793636277;
	bh=tSlhZlCS6U6DSS1pN1LYEAHztvmXI+pBSdiw2T3/jww=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CQULjrXjrjsOWi0iaCtq/TdLS6jX+M6bZUeB0z1jv8FrMpPnWiSnknJi9t24FCWl2
	 ZTpS/c5oksveMDee5Otug5ADTMdsWPbfOvTNVv251kvmG259hBRTfAt2/Yt8MkCIdX
	 0EyrmcWbDgGILQnX++ZyjkoQJd+Orlg7A3uZSb9O0rZy/rjMJYkdrKhaPz31hZpHHX
	 j5sc2ySkUSWOFS0PfA/KZK+5iI7qzU+EQN0N5hw+ruT54+S1tF3CnIe2bZA10tYjRm
	 fFqd7sbbH9z57tqEA7tVHhUlGbmJB3bcjEKIf0AiVJRl7eKhmvKry91vTyxAtAkiZC
	 c/mtzxzoCSifQ==
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
Subject: [PATCH v15 4/4] reset: Leverage revocable for accessing struct reset_controller_dev
Date: Tue,  3 Nov 2026 00:17:09 +0800
Message-ID: <20261102161710.24076-5-tzungbi@kernel.org>
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

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
Applied after https://lore.kernel.org/all/20261102155840.20376-1-tzungbi@kernel.org
---
Test:
$ ./tools/testing/kunit/kunit.py run \
        --kconfig_add CONFIG_RESET_CONTROLLER=y \
        --kconfig_add CONFIG_RESET_KUNIT_TEST=y \
        reset_test

$ ./tools/testing/kunit/kunit.py run \
        --kconfig_add CONFIG_RESET_CONTROLLER=y \
        --kconfig_add CONFIG_RESET_KUNIT_TEST=y \
        --kconfig_add CONFIG_PROVE_LOCKING=y \
        --kconfig_add CONFIG_DEBUG_KERNEL=y \
        --kconfig_add CONFIG_KASAN=y \
        --arch=x86_64 \
        --raw_output=all \
        reset_test
---
v15:
- Rename:
  - "rev" -> "revocable" in struct reset_controller_dev.
  - "rev" -> "rcdev_revocable" in struct reset_control.

v14: https://lore.kernel.org/all/20261011121246.162759-6-tzungbi@kernel.org
- New to the series.
---
 drivers/reset/core.c             | 125 ++++++++++---------------------
 include/linux/reset-controller.h |   3 +
 2 files changed, 42 insertions(+), 86 deletions(-)

diff --git a/drivers/reset/core.c b/drivers/reset/core.c
index a36a4d6ff445..c699e7550cf5 100644
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
+ * @rcdev_revocable: revocable handle for accessing the reset controller device
  * @list: list entry for the rcdev's reset controller list
  * @id: ID of the reset controller in the reset
  *      controller device
@@ -54,8 +52,7 @@ static DEFINE_IDA(reset_gpio_ida);
  * @lock: serializes the internals of reset_control_acquire()
  */
 struct reset_control {
-	struct reset_controller_dev __rcu *rcdev;
-	struct srcu_struct srcu;
+	struct revocable *rcdev_revocable;
 	struct list_head list;
 	unsigned int id;
 	struct kref refcnt;
@@ -141,6 +138,10 @@ int reset_controller_register(struct reset_controller_dev *rcdev)
 			return -EINVAL;
 	}
 
+	rcdev->revocable = revocable_alloc(rcdev);
+	if (!rcdev->revocable)
+		return -ENOMEM;
+
 	if (rcdev->of_xlate)
 		rcdev->fwnode_reset_n_cells = rcdev->of_reset_n_cells;
 
@@ -160,14 +161,20 @@ int reset_controller_register(struct reset_controller_dev *rcdev)
 }
 EXPORT_SYMBOL_GPL(reset_controller_register);
 
-static void reset_control_put_internal(struct reset_control *rstc);
-
 static void reset_controller_remove(struct reset_controller_dev *rcdev,
 				    struct reset_control *rstc)
 {
 	lockdep_assert_held(&rcdev->lock);
 
-	list_del(&rstc->list);
+	/*
+	 * reset_control_put_internal() may observe a non-NULL rcdev before
+	 * revocable_revoke() runs, and then wait on rcdev->lock while
+	 * reset_controller_unregister() already detaches rstc.
+	 */
+	if (list_empty(&rstc->list))
+		return;
+	list_del_init(&rstc->list);
+
 	module_put(rcdev->owner);
 	put_device(rcdev->dev);
 }
@@ -179,38 +186,22 @@ static void reset_controller_remove(struct reset_controller_dev *rcdev,
 void reset_controller_unregister(struct reset_controller_dev *rcdev)
 {
 	struct reset_control *rstc, *pos;
-	LIST_HEAD(reset_control_head);
 
 	scoped_guard(mutex, &reset_list_mutex)
 		list_del(&rcdev->list);
 
 	scoped_guard(mutex, &rcdev->lock) {
-		/*
-		 * Numb but don't free the remaining reset control handles that are
-		 * still held by consumers.
-		 *
-		 * Hold a temporary reference on rstc before clearing rstc->rcdev:
-		 * once rstc->rcdev is NULL, a concurrent reset_control_put_internal()
-		 * will not acquire rcdev->lock and could otherwise free rstc.
-		 */
-		list_for_each_entry_safe(rstc, pos, &rcdev->reset_control_head, list) {
-			kref_get(&rstc->refcnt);
-			rcu_assign_pointer(rstc->rcdev, NULL);
+		list_for_each_entry_safe(rstc, pos, &rcdev->reset_control_head, list)
 			reset_controller_remove(rcdev, rstc);
-			list_add(&rstc->list, &reset_control_head);
-		}
 	}
 
 	/*
-	 * Run synchronize_srcu() outside rcdev->lock to avoid a circular
+	 * Run revocable_revoke() outside rcdev->lock to avoid a circular
 	 * locking dependency with paths that acquire rcdev->lock inside
-	 * the rstc->srcu read-side critical section.
+	 * the revocable read-side critical section.
 	 */
-	list_for_each_entry_safe(rstc, pos, &reset_control_head, list) {
-		list_del(&rstc->list);
-		synchronize_srcu(&rstc->srcu);
-		reset_control_put_internal(rstc);
-	}
+	revocable_revoke(rcdev->revocable);
+	revocable_put(rcdev->revocable);
 
 	mutex_destroy(&rcdev->lock);
 }
@@ -401,11 +392,7 @@ int reset_control_reset(struct reset_control *rstc)
 	if (reset_control_is_array(rstc))
 		return reset_control_array_reset(rstc_to_array(rstc));
 
-	guard(srcu)(&rstc->srcu);
-
-	rcdev = srcu_dereference(rstc->rcdev, &rstc->srcu);
-	if (!rcdev)
-		return -ENODEV;
+	revocable_try_access_or_return(rstc->rcdev_revocable, rcdev);
 
 	if (!rcdev->ops->reset)
 		return -ENOTSUPP;
@@ -522,11 +509,7 @@ int reset_control_assert(struct reset_control *rstc)
 	if (reset_control_is_array(rstc))
 		return reset_control_array_assert(rstc_to_array(rstc));
 
-	guard(srcu)(&rstc->srcu);
-
-	rcdev = srcu_dereference(rstc->rcdev, &rstc->srcu);
-	if (!rcdev)
-		return -ENODEV;
+	revocable_try_access_or_return(rstc->rcdev_revocable, rcdev);
 
 	if (rstc->shared) {
 		if (WARN_ON(atomic_read(&rstc->triggered_count) != 0))
@@ -618,11 +601,7 @@ int reset_control_deassert(struct reset_control *rstc)
 	if (reset_control_is_array(rstc))
 		return reset_control_array_deassert(rstc_to_array(rstc));
 
-	guard(srcu)(&rstc->srcu);
-
-	rcdev = srcu_dereference(rstc->rcdev, &rstc->srcu);
-	if (!rcdev)
-		return -ENODEV;
+	revocable_try_access_or_return(rstc->rcdev_revocable, rcdev);
 
 	if (rstc->shared) {
 		if (WARN_ON(atomic_read(&rstc->triggered_count) != 0))
@@ -698,11 +677,7 @@ int reset_control_status(struct reset_control *rstc)
 	if (WARN_ON(IS_ERR(rstc)) || reset_control_is_array(rstc))
 		return -EINVAL;
 
-	guard(srcu)(&rstc->srcu);
-
-	rcdev = srcu_dereference(rstc->rcdev, &rstc->srcu);
-	if (!rcdev)
-		return -ENODEV;
+	revocable_try_access_or_return(rstc->rcdev_revocable, rcdev);
 
 	if (rcdev->ops->status)
 		return rcdev->ops->status(rcdev, rstc->id);
@@ -750,11 +725,7 @@ int reset_control_acquire(struct reset_control *rstc)
 	if (rstc->acquired)
 		return 0;
 
-	guard(srcu)(&rstc->srcu);
-
-	rcdev = srcu_dereference(rstc->rcdev, &rstc->srcu);
-	if (!rcdev)
-		return -ENODEV;
+	revocable_try_access_or_return(rstc->rcdev_revocable, rcdev);
 
 	scoped_guard(mutex, &rcdev->lock) {
 		list_for_each_entry(rc, &rcdev->reset_control_head, list) {
@@ -850,7 +821,6 @@ __reset_control_get_internal(struct reset_controller_dev *rcdev,
 	bool shared = flags & RESET_CONTROL_FLAGS_BIT_SHARED;
 	bool acquired = flags & RESET_CONTROL_FLAGS_BIT_ACQUIRED;
 	struct reset_control *rstc;
-	int ret;
 
 	lockdep_assert_held(&rcdev->lock);
 
@@ -881,19 +851,13 @@ __reset_control_get_internal(struct reset_controller_dev *rcdev,
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
+	revocable_get(rcdev->revocable);
+	rstc->rcdev_revocable = rcdev->revocable;
 	list_add(&rstc->list, &rcdev->reset_control_head);
 	rstc->id = index;
 	kref_init(&rstc->refcnt);
@@ -909,17 +873,9 @@ static void __reset_control_release(struct kref *kref)
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
+	revocable_put(rstc->rcdev_revocable);
 }
 
 static void reset_control_put_internal(struct reset_control *rstc)
@@ -930,22 +886,19 @@ static void reset_control_put_internal(struct reset_control *rstc)
 	if (IS_ERR_OR_NULL(rstc))
 		return;
 
-	scoped_guard(srcu, &rstc->srcu) {
-		rcdev = srcu_dereference(rstc->rcdev, &rstc->srcu);
-		if (rcdev) {
-			guard(mutex)(&rcdev->lock);
-			ret = kref_put(&rstc->refcnt, __reset_control_release);
-		} else {
-			/* Already detached from rcdev. */
-			ret = kref_put(&rstc->refcnt, __reset_control_release);
-		}
+	revocable_try_access_with(rstc->rcdev_revocable, rcdev);
+	if (rcdev) {
+		guard(mutex)(&rcdev->lock);
+		ret = kref_put(&rstc->refcnt, __reset_control_release);
+		if (ret)
+			reset_controller_remove(rcdev, rstc);
+	} else {
+		/* Already detached from rcdev. */
+		ret = kref_put(&rstc->refcnt, __reset_control_release);
 	}
 
-	if (ret) {
-		synchronize_srcu(&rstc->srcu);
-		cleanup_srcu_struct(&rstc->srcu);
+	if (ret)
 		kfree(rstc);
-	}
 }
 
 static void reset_gpio_aux_device_release(struct device *dev)
diff --git a/include/linux/reset-controller.h b/include/linux/reset-controller.h
index 52a5a4e81f18..a5547a742cde 100644
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
+ * @revocable: revocable provider handle for itself
  */
 struct reset_controller_dev {
 	const struct reset_control_ops *ops;
@@ -65,6 +67,7 @@ struct reset_controller_dev {
 			    const struct fwnode_reference_args *reset_spec);
 	unsigned int nr_resets;
 	struct mutex lock;
+	struct revocable *revocable;
 };
 
 #if IS_ENABLED(CONFIG_RESET_CONTROLLER)
-- 
2.53.0

