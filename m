Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FD9455626;
	Sat, 12 Sep 2026 12:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789216562; cv=none; b=Rw8JK9EBB1Pg/nEvO0IpLkYwVpwUkhBeFHNQzyGgvLAx+Qfgb6OMrIFjBNI2dadvmTXL5dueWv2O2kXjBOd0qj5DaZwWNNiGy6Wpzano06G/uriN2D76Llm9v5OOBymVT3BDbSi/20Cwi/FSIwknCiYkPCHvdgJpAw40zFfzv+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789216562; c=relaxed/simple;
	bh=a9bj8tQTBonpjU/GSxTZ7WIGr9gLPzAwcGy9tWNGHfw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OzcpEiDWodpcPZ1/BymNhVQGWy4GVclfTGWyV40ccVEcQtpYSswCQrT7S9XsIBDJal+/F46ehM2gKCCoM3kivOylTPF5l9NqPpRfZPsyBjEqnzBRUU0JA6PsfQwlCc09KJ7EJp/k8wkDYVqQqfjL13W6SAAYg3YM4BMEbwU5zBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VfhWljzP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VfhWljzP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AE351F000FF;
	Sat, 12 Sep 2026 12:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789216559;
	bh=jPKNEAPMJoHlJFkMNwegUt/TzT2XI3H2YIZiU6jjObs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VfhWljzPka+DHnxIde6pDEFnwd+EkkpV8G9+bMKSoEaYEVbAnPP/Xn/jjXVsTf6Sx
	 ZeQ6vlPpo974opQlZYCOO0JyZPVFsvCp2iMK3AHbF3w6ZS4XoKTjM3v480egiC+aTd
	 aI/5Zd02ktL0c2CAL73anJ+RPrqfxDNFVIS9zzMNFVPMmk4WsPWRPkFhtNQ0RDWKhs
	 +IVEpwWKs5MbNgdWzAvpcxI7lzH9SjaOhmwWse7gg8Esdjs1gG75jkxp1tIAGkd3fS
	 Af6v2x6WUcAMxPiNW41dGcW9E4/48aoM+fGjzR3WwfxRMoHMvojSygTPfu/vQndxKE
	 WH2hYkKNrSeXA==
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	tzungbi@kernel.org
Subject: [PATCH v13 2/3] revocable: Add KUnit test cases
Date: Sat, 12 Sep 2026 20:35:28 +0800
Message-ID: <20260912123529.7951-3-tzungbi@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260912123529.7951-1-tzungbi@kernel.org>
References: <20260912123529.7951-1-tzungbi@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add KUnit test cases for the revocable API.

The test cases cover the following scenarios:

- Basic: Verifies that a consumer can successfully access the resource.
- Revocation: Verifies that after the provider revokes the resource,
  the consumer correctly receives a NULL pointer on a subsequent access.
- Try Access Macro: Same as "Revocation" but uses the macro level
  helpers.
- Concurrent Access: Verifies multiple threads can access the resource.

Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
---
Bartosz: I dropped your R-b tag as I made relatively large changes in v13.
---
Test:
$ ./tools/testing/kunit/kunit.py run \
        --kconfig_add CONFIG_REVOCABLE_KUNIT_TEST=y \
        revocable_test

$ ./tools/testing/kunit/kunit.py run \
        --kconfig_add CONFIG_REVOCABLE_KUNIT_TEST=y \
        --kconfig_add CONFIG_PROVE_LOCKING=y \
        --kconfig_add CONFIG_DEBUG_KERNEL=y \
        --kconfig_add CONFIG_DEBUG_INFO=y \
        --kconfig_add CONFIG_DEBUG_INFO_DWARF5=y \
        --kconfig_add CONFIG_KASAN=y \
        --kconfig_add CONFIG_DETECT_HUNG_TASK=y \
        --kconfig_add CONFIG_DEFAULT_HUNG_TASK_TIMEOUT="10" \
        --arch=x86_64 \
        --make_options="C=1 W=1" \
        revocable_test
---
v13:
- Explicitly indicate "dynamic" vs. "embedded" in test case names.
- Embedded allocation
  - Add tests and separate "stack" vs. "heap".
  - Add tests on macros and concurrent access.

v12: https://lore.kernel.org/all/20260908134223.13638-3-tzungbi@kernel.org
- Rebase onto next-20260907.
- Fix path in MAINTAINERS: "drivers/base/revocable_test.c" ->
  "drivers/base/test/revocable-test.c".

v11: https://lore.kernel.org/all/20260513091043.6766-3-tzungbi@kernel.org
- Move the test to drivers/base/test/.
- Add R-b tag.

v10: https://lore.kernel.org/all/20260508105448.31799-3-tzungbi@kernel.org
- Merge revocable_test_try_access_macro*() cases.
- Change revocable API usages accordingly.

v9: https://lore.kernel.org/all/20260427135841.96266-3-tzungbi@kernel.org
- Add test cases for embedded resource provider.

v8: https://lore.kernel.org/all/20260213092307.858908-3-tzungbi@kernel.org
- Squash:
  - c259cd7ea3c9 revocable: fix missing module license and description
  - a243f7fb11fe revocable: Add KUnit test for provider lifetime races
  - 988357628c2c revocable: Add KUnit test for concurrent access
- Change accordingly due to its dependency "revocable: Revocable resource
  management" changes.

v7: https://lore.kernel.org/all/20260116080235.350305-3-tzungbi@kernel.org
- "2025" -> "2026" in copyright.
- Rename the test name "macro" -> "try_access_macro".

v6: https://lore.kernel.org/all/20251106152330.11733-3-tzungbi@kernel.org
- Rename REVOCABLE_TRY_ACCESS_WITH() -> REVOCABLE_TRY_ACCESS_SCOPED().
- Add tests for new REVOCABLE_TRY_ACCESS_WITH().

v5: https://lore.kernel.org/all/20251016054204.1523139-3-tzungbi@kernel.org
- No changes.

v4: https://lore.kernel.org/all/20250923075302.591026-3-tzungbi@kernel.org
- REVOCABLE() -> REVOCABLE_TRY_ACCESS_WITH().
- revocable_release() -> revocable_withdraw_access().

v3: https://lore.kernel.org/all/20250912081718.3827390-3-tzungbi@kernel.org
- No changes.

v2: https://lore.kernel.org/all/20250820081645.847919-3-tzungbi@kernel.org
- New in the series.
---
 MAINTAINERS                        |   1 +
 drivers/base/test/Kconfig          |   5 +
 drivers/base/test/Makefile         |   4 +
 drivers/base/test/revocable-test.c | 576 +++++++++++++++++++++++++++++
 4 files changed, 586 insertions(+)
 create mode 100644 drivers/base/test/revocable-test.c

diff --git a/MAINTAINERS b/MAINTAINERS
index b458bd5a2106..cb941db61acc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23607,6 +23607,7 @@ S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git
 F:	Documentation/driver-api/driver-model/revocable.rst
 F:	drivers/base/revocable.c
+F:	drivers/base/test/revocable-test.c
 F:	include/linux/revocable.h
 
 RFKILL
diff --git a/drivers/base/test/Kconfig b/drivers/base/test/Kconfig
index 1ecf0791241a..80353db68a4f 100644
--- a/drivers/base/test/Kconfig
+++ b/drivers/base/test/Kconfig
@@ -23,3 +23,8 @@ config DRIVER_SWNODE_KUNIT_TEST
 	tristate "KUnit Tests for software node fw_devlink links" if !KUNIT_ALL_TESTS
 	depends on KUNIT
 	default KUNIT_ALL_TESTS
+
+config REVOCABLE_KUNIT_TEST
+	tristate "KUnit tests for revocable" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	default KUNIT_ALL_TESTS
diff --git a/drivers/base/test/Makefile b/drivers/base/test/Makefile
index 9ced7bbd569f..ddb061e12c0f 100644
--- a/drivers/base/test/Makefile
+++ b/drivers/base/test/Makefile
@@ -8,3 +8,7 @@ obj-$(CONFIG_DRIVER_PE_KUNIT_TEST) += property-entry-test.o
 CFLAGS_property-entry-test.o += $(DISABLE_STRUCTLEAK_PLUGIN)
 
 obj-$(CONFIG_DRIVER_SWNODE_KUNIT_TEST) += swnode-devlink-test.o
+
+obj-$(CONFIG_REVOCABLE_KUNIT_TEST) += revocable-test.o
+
+
diff --git a/drivers/base/test/revocable-test.c b/drivers/base/test/revocable-test.c
new file mode 100644
index 000000000000..9fbe8f108bfb
--- /dev/null
+++ b/drivers/base/test/revocable-test.c
@@ -0,0 +1,576 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright 2026 Google LLC
+ *
+ * KUnit tests for the revocable API.
+ *
+ * The test cases cover the following scenarios:
+ *
+ * - Basic: Verifies that a consumer can successfully access the resource.
+ *
+ * - Revocation: Verifies that after the provider revokes the resource,
+ *   the consumer correctly receives a NULL pointer on a subsequent access.
+ *
+ * - Try Access Macro: Same as "Revocation" but uses the macro level
+ *   helpers.
+ *
+ * - Concurrent Access: Verifies multiple threads can access the resource.
+ */
+
+#include <kunit/test.h>
+
+#include <linux/completion.h>
+#include <linux/delay.h>
+#include <linux/kthread.h>
+#include <linux/refcount.h>
+#include <linux/revocable.h>
+
+static int get_refcount(struct revocable *rev)
+{
+	return refcount_read(&rev->kref.refcount);
+}
+
+static void revocable_embedded_test_basic_stack(struct kunit *test)
+{
+	struct revocable rev;
+	struct revocable_handle rh;
+	void *real_res = (void *)0x12345678, *res;
+
+	revocable_init(&rev, real_res);
+	KUNIT_EXPECT_FALSE(test, rev.dynamic);
+
+	revocable_handle_init(&rev, &rh);
+
+	res = revocable_try_access(&rh);
+	KUNIT_EXPECT_PTR_EQ(test, res, real_res);
+	revocable_withdraw_access(&rh);
+
+	revocable_handle_deinit(&rh);
+	revocable_revoke(&rev);
+	revocable_deinit(&rev);
+}
+
+static void revocable_embedded_test_basic_heap(struct kunit *test)
+{
+	struct revocable *rev;
+	struct revocable_handle rh;
+	void *real_res = (void *)0x12345678, *res;
+
+	rev = kunit_kzalloc(test, sizeof(*rev), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, rev);
+
+	revocable_init(rev, real_res);
+	KUNIT_EXPECT_FALSE(test, rev->dynamic);
+
+	revocable_handle_init(rev, &rh);
+
+	res = revocable_try_access(&rh);
+	KUNIT_EXPECT_PTR_EQ(test, res, real_res);
+	revocable_withdraw_access(&rh);
+
+	revocable_handle_deinit(&rh);
+	revocable_revoke(rev);
+	revocable_deinit(rev);
+}
+
+static void revocable_dynamic_test_basic(struct kunit *test)
+{
+	struct revocable *rev;
+	struct revocable_handle rh;
+	void *real_res = (void *)0x12345678, *res;
+
+	rev = revocable_alloc(real_res);
+	KUNIT_ASSERT_NOT_NULL(test, rev);
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 2);
+	KUNIT_EXPECT_TRUE(test, rev->dynamic);
+
+	revocable_handle_init(rev, &rh);
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 3);
+
+	res = revocable_try_access(&rh);
+	KUNIT_EXPECT_PTR_EQ(test, res, real_res);
+	revocable_withdraw_access(&rh);
+
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 3);
+	revocable_handle_deinit(&rh);
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 2);
+	revocable_revoke(rev);
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 1);
+	revocable_put(rev);
+}
+
+static void revocable_embedded_test_revocation_stack(struct kunit *test)
+{
+	struct revocable rev;
+	struct revocable_handle rh;
+	void *real_res = (void *)0x12345678, *res;
+
+	revocable_init(&rev, real_res);
+	KUNIT_EXPECT_FALSE(test, rev.dynamic);
+
+	revocable_handle_init(&rev, &rh);
+
+	res = revocable_try_access(&rh);
+	KUNIT_EXPECT_PTR_EQ(test, res, real_res);
+	revocable_withdraw_access(&rh);
+
+	revocable_revoke(&rev);
+
+	res = revocable_try_access(&rh);
+	KUNIT_EXPECT_PTR_EQ(test, res, NULL);
+	revocable_withdraw_access(&rh);
+
+	revocable_handle_deinit(&rh);
+	revocable_deinit(&rev);
+}
+
+static void revocable_embedded_test_revocation_heap(struct kunit *test)
+{
+	struct revocable *rev;
+	struct revocable_handle rh;
+	void *real_res = (void *)0x12345678, *res;
+
+	rev = kunit_kzalloc(test, sizeof(*rev), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, rev);
+
+	revocable_init(rev, real_res);
+	KUNIT_EXPECT_FALSE(test, rev->dynamic);
+
+	revocable_handle_init(rev, &rh);
+
+	res = revocable_try_access(&rh);
+	KUNIT_EXPECT_PTR_EQ(test, res, real_res);
+	revocable_withdraw_access(&rh);
+
+	revocable_revoke(rev);
+
+	res = revocable_try_access(&rh);
+	KUNIT_EXPECT_PTR_EQ(test, res, NULL);
+	revocable_withdraw_access(&rh);
+
+	revocable_handle_deinit(&rh);
+	revocable_deinit(rev);
+}
+
+static void revocable_dynamic_test_revocation(struct kunit *test)
+{
+	struct revocable *rev;
+	struct revocable_handle rh;
+	void *real_res = (void *)0x12345678, *res;
+
+	rev = revocable_alloc(real_res);
+	KUNIT_ASSERT_NOT_NULL(test, rev);
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 2);
+	KUNIT_EXPECT_TRUE(test, rev->dynamic);
+
+	revocable_handle_init(rev, &rh);
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 3);
+
+	res = revocable_try_access(&rh);
+	KUNIT_EXPECT_PTR_EQ(test, res, real_res);
+	revocable_withdraw_access(&rh);
+
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 3);
+	revocable_revoke(rev);
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 2);
+
+	res = revocable_try_access(&rh);
+	KUNIT_EXPECT_PTR_EQ(test, res, NULL);
+	revocable_withdraw_access(&rh);
+
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 2);
+	revocable_handle_deinit(&rh);
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 1);
+	revocable_put(rev);
+}
+
+static int call_revocable_try_access_or_return_err(struct revocable *rev)
+{
+	void *res;
+
+	revocable_try_access_or_return_err(rev, res, -ENXIO);
+	return 0;
+}
+
+static int call_revocable_try_access_or_return(struct revocable *rev)
+{
+	void *res;
+
+	revocable_try_access_or_return(rev, res);
+	return 0;
+}
+
+static void call_revocable_try_access_or_return_void(struct kunit *test,
+						     struct revocable *rev)
+{
+	void *res;
+
+	revocable_try_access_or_return_void(rev, res);
+	KUNIT_FAIL(test, "unreachable");
+}
+
+static int call_revocable_try_access_or_return_err_scoped(struct revocable *rev)
+{
+	void *res;
+
+	revocable_try_access_or_return_err_scoped(rev, res, -ENXIO) {}
+	return 0;
+}
+
+static int call_revocable_try_access_or_return_scoped(struct revocable *rev)
+{
+	void *res;
+
+	revocable_try_access_or_return_scoped(rev, res) {}
+	return 0;
+}
+
+static void call_revocable_try_access_or_return_void_scoped(struct kunit *test,
+							    struct revocable *rev)
+{
+	void *res;
+
+	revocable_try_access_or_return_void_scoped(rev, res) {}
+	KUNIT_FAIL(test, "unreachable");
+}
+
+static void revocable_embedded_test_try_access_macro(struct kunit *test)
+{
+	struct revocable rev_on_stack, *rev = &rev_on_stack;
+	void *real_res = (void *)0x12345678, *res;
+	int ret;
+	bool accessed;
+
+	ret = revocable_init(rev, real_res);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_EXPECT_FALSE(test, rev->dynamic);
+
+	{
+		revocable_try_access_with(rev, res);
+		KUNIT_EXPECT_PTR_EQ(test, res, real_res);
+	}
+
+	accessed = false;
+	revocable_try_access_with_scoped(rev, res) {
+		KUNIT_EXPECT_PTR_EQ(test, res, real_res);
+		accessed = true;
+	}
+	KUNIT_EXPECT_TRUE(test, accessed);
+
+	revocable_revoke(rev);
+
+	{
+		revocable_try_access_with(rev, res);
+		KUNIT_EXPECT_PTR_EQ(test, res, NULL);
+	}
+
+	accessed = false;
+	revocable_try_access_with_scoped(rev, res) {
+		KUNIT_EXPECT_PTR_EQ(test, res, NULL);
+		accessed = true;
+	}
+	KUNIT_EXPECT_TRUE(test, accessed);
+
+	ret = call_revocable_try_access_or_return_err(rev);
+	KUNIT_EXPECT_EQ(test, ret, -ENXIO);
+
+	ret = call_revocable_try_access_or_return(rev);
+	KUNIT_EXPECT_EQ(test, ret, -ENODEV);
+
+	call_revocable_try_access_or_return_void(test, rev);
+
+	ret = call_revocable_try_access_or_return_err_scoped(rev);
+	KUNIT_EXPECT_EQ(test, ret, -ENXIO);
+
+	ret = call_revocable_try_access_or_return_scoped(rev);
+	KUNIT_EXPECT_EQ(test, ret, -ENODEV);
+
+	call_revocable_try_access_or_return_void_scoped(test, rev);
+
+	accessed = false;
+	revocable_try_access_or_skip_scoped(rev, res)
+		accessed = true;
+	KUNIT_EXPECT_FALSE(test, accessed);
+
+	revocable_deinit(rev);
+}
+
+static void revocable_dynamic_test_try_access_macro(struct kunit *test)
+{
+	struct revocable *rev;
+	void *real_res = (void *)0x12345678, *res;
+	int ret;
+	bool accessed;
+
+	rev = revocable_alloc(real_res);
+	KUNIT_ASSERT_NOT_NULL(test, rev);
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 2);
+	KUNIT_EXPECT_TRUE(test, rev->dynamic);
+
+	{
+		revocable_try_access_with(rev, res);
+		KUNIT_EXPECT_PTR_EQ(test, res, real_res);
+		KUNIT_EXPECT_EQ(test, get_refcount(rev), 3);
+	}
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 2);
+
+	accessed = false;
+	revocable_try_access_with_scoped(rev, res) {
+		KUNIT_EXPECT_PTR_EQ(test, res, real_res);
+		KUNIT_EXPECT_EQ(test, get_refcount(rev), 3);
+		accessed = true;
+	}
+	KUNIT_EXPECT_TRUE(test, accessed);
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 2);
+
+	revocable_revoke(rev);
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 1);
+
+	{
+		revocable_try_access_with(rev, res);
+		KUNIT_EXPECT_PTR_EQ(test, res, NULL);
+		KUNIT_EXPECT_EQ(test, get_refcount(rev), 2);
+	}
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 1);
+
+	accessed = false;
+	revocable_try_access_with_scoped(rev, res) {
+		KUNIT_EXPECT_PTR_EQ(test, res, NULL);
+		KUNIT_EXPECT_EQ(test, get_refcount(rev), 2);
+		accessed = true;
+	}
+	KUNIT_EXPECT_TRUE(test, accessed);
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 1);
+
+	ret = call_revocable_try_access_or_return_err(rev);
+	KUNIT_EXPECT_EQ(test, ret, -ENXIO);
+
+	ret = call_revocable_try_access_or_return(rev);
+	KUNIT_EXPECT_EQ(test, ret, -ENODEV);
+
+	call_revocable_try_access_or_return_void(test, rev);
+
+	ret = call_revocable_try_access_or_return_err_scoped(rev);
+	KUNIT_EXPECT_EQ(test, ret, -ENXIO);
+
+	ret = call_revocable_try_access_or_return_scoped(rev);
+	KUNIT_EXPECT_EQ(test, ret, -ENODEV);
+
+	call_revocable_try_access_or_return_void_scoped(test, rev);
+
+	accessed = false;
+	revocable_try_access_or_skip_scoped(rev, res)
+		accessed = true;
+	KUNIT_EXPECT_FALSE(test, accessed);
+
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 1);
+	revocable_put(rev);
+}
+
+struct test_concurrent_access_context {
+	struct completion started, enter;
+	struct task_struct *thread;
+
+	union {
+		/* Used by test provider. */
+		struct revocable *rev;
+
+		/* Used by test consumer. */
+		struct {
+			struct completion exit;
+			struct revocable_handle rh;
+			struct kunit *test;
+			void *expected_res;
+		};
+	};
+};
+
+static int test_concurrent_access_provider(void *data)
+{
+	struct test_concurrent_access_context *ctx = data;
+
+	complete(&ctx->started);
+
+	wait_for_completion(&ctx->enter);
+	revocable_revoke(ctx->rev);
+
+	return 0;
+}
+
+static int test_concurrent_access_consumer(void *data)
+{
+	struct test_concurrent_access_context *ctx = data;
+	void *res;
+
+	complete(&ctx->started);
+
+	wait_for_completion(&ctx->enter);
+	res = revocable_try_access(&ctx->rh);
+	KUNIT_EXPECT_PTR_EQ(ctx->test, res, ctx->expected_res);
+
+	wait_for_completion(&ctx->exit);
+	revocable_withdraw_access(&ctx->rh);
+
+	return 0;
+}
+
+static void revocable_embedded_test_concurrent_access(struct kunit *test)
+{
+	struct revocable rev_on_stack, *rev = &rev_on_stack;
+	void *real_res = (void *)0x12345678;
+	struct test_concurrent_access_context *ctx;
+	int ret, i;
+
+	ret = revocable_init(rev, real_res);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_EXPECT_FALSE(test, rev->dynamic);
+
+	ctx = kunit_kmalloc_array(test, 3, sizeof(*ctx), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, ctx);
+
+	for (i = 0; i < 3; ++i) {
+		ctx[i].test = test;
+		init_completion(&ctx[i].started);
+		init_completion(&ctx[i].enter);
+
+		if (i == 0) {
+			ctx[i].rev = rev;
+			ctx[i].thread = kthread_run(
+				test_concurrent_access_provider, ctx + i,
+				"revocable_%d", i);
+		} else {
+			init_completion(&ctx[i].exit);
+			revocable_handle_init(rev, &ctx[i].rh);
+
+			ctx[i].thread = kthread_run(
+				test_concurrent_access_consumer, ctx + i,
+				"revocable_handle_%d", i);
+		}
+		KUNIT_ASSERT_FALSE(test, IS_ERR(ctx[i].thread));
+
+		wait_for_completion(&ctx[i].started);
+	}
+
+	ctx[1].expected_res = real_res;
+	/* consumer1 enters read-side critical section. */
+	complete(&ctx[1].enter);
+	msleep(100);
+
+	/* provider0 revokes the resource. */
+	complete(&ctx[0].enter);
+	msleep(100);
+	/* provider0 can't exit.  It's waiting for the grace period. */
+
+	ctx[2].expected_res = NULL;
+	/* consumer2 enters read-side critical section. */
+	complete(&ctx[2].enter);
+	msleep(100);
+
+	/* consumer{1,2} exit read-side critical section. */
+	for (i = 1; i < 3; ++i) {
+		complete(&ctx[i].exit);
+		kthread_stop(ctx[i].thread);
+		revocable_handle_deinit(&ctx[i].rh);
+	}
+
+	kthread_stop(ctx[0].thread);
+	/* provider0 exits as all readers exit their critical section. */
+
+	revocable_deinit(rev);
+}
+
+static void revocable_dynamic_test_concurrent_access(struct kunit *test)
+{
+	struct revocable *rev;
+	void *real_res = (void *)0x12345678;
+	struct test_concurrent_access_context *ctx;
+	int i;
+
+	rev = revocable_alloc(real_res);
+	KUNIT_ASSERT_NOT_NULL(test, rev);
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 2);
+	KUNIT_EXPECT_TRUE(test, rev->dynamic);
+
+	ctx = kunit_kmalloc_array(test, 3, sizeof(*ctx), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, ctx);
+
+	for (i = 0; i < 3; ++i) {
+		ctx[i].test = test;
+		init_completion(&ctx[i].started);
+		init_completion(&ctx[i].enter);
+
+		if (i == 0) {
+			/* Transfer the ownership of provider reference too. */
+			ctx[i].rev = rev;
+			ctx[i].thread = kthread_run(
+				test_concurrent_access_provider, ctx + i,
+				"revocable_%d", i);
+		} else {
+			init_completion(&ctx[i].exit);
+			revocable_handle_init(rev, &ctx[i].rh);
+			KUNIT_EXPECT_EQ(test, get_refcount(rev), 2 + i);
+
+			ctx[i].thread = kthread_run(
+				test_concurrent_access_consumer, ctx + i,
+				"revocable_handle_%d", i);
+		}
+		KUNIT_ASSERT_FALSE(test, IS_ERR(ctx[i].thread));
+
+		wait_for_completion(&ctx[i].started);
+	}
+
+	ctx[1].expected_res = real_res;
+	/* consumer1 enters read-side critical section. */
+	complete(&ctx[1].enter);
+	msleep(100);
+
+	/* provider0 revokes the resource. */
+	complete(&ctx[0].enter);
+	msleep(100);
+	/* provider0 can't exit.  It's waiting for the grace period. */
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 4);
+
+	ctx[2].expected_res = NULL;
+	/* consumer2 enters read-side critical section. */
+	complete(&ctx[2].enter);
+	msleep(100);
+
+	/* consumer{1,2} exit read-side critical section. */
+	for (i = 1; i < 3; ++i) {
+		complete(&ctx[i].exit);
+		kthread_stop(ctx[i].thread);
+		revocable_handle_deinit(&ctx[i].rh);
+	}
+
+	kthread_stop(ctx[0].thread);
+	/* provider0 exits as all readers exit their critical section. */
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 1);
+
+	/* Drop the caller reference. */
+	revocable_put(rev);
+}
+
+static struct kunit_case revocable_test_cases[] = {
+	KUNIT_CASE(revocable_embedded_test_basic_stack),
+	KUNIT_CASE(revocable_embedded_test_basic_heap),
+	KUNIT_CASE(revocable_dynamic_test_basic),
+	KUNIT_CASE(revocable_embedded_test_revocation_stack),
+	KUNIT_CASE(revocable_embedded_test_revocation_heap),
+	KUNIT_CASE(revocable_dynamic_test_revocation),
+	KUNIT_CASE(revocable_embedded_test_try_access_macro),
+	KUNIT_CASE(revocable_dynamic_test_try_access_macro),
+	KUNIT_CASE(revocable_embedded_test_concurrent_access),
+	KUNIT_CASE(revocable_dynamic_test_concurrent_access),
+	{}
+};
+
+static struct kunit_suite revocable_test_suite = {
+	.name = "revocable_test",
+	.test_cases = revocable_test_cases,
+};
+
+kunit_test_suite(revocable_test_suite);
+
+MODULE_LICENSE("GPL");
+MODULE_AUTHOR("Tzung-Bi Shih <tzungbi@kernel.org>");
+MODULE_DESCRIPTION("KUnit tests for the revocable API");
-- 
2.53.0

