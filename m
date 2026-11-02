Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793636272;
	b=kjnkFlnAuQpAlCRUKQ+lgGbjNAylRuWQn9W1qqm46zBuMOL2oZ+e4PGszM3QDETS/M/W
	 s2soiR9ZfpZc+1ck0oHPt8O3ehjRDH+7KKdpGmNd7YUbXLcp3PLfgpGX7muLGSaHllWDS
	 WUwLH///hIdRFT6e1bcKYosdGSXgpcqAk/JXrWkPzthCeHZCjgE0jkI24xEh0kDhR9dWZ
	 J5m3lJZlihaWAHYNZcHf1P8mp6mC82548SQqRY4DnNZSPBn1l53NuP06+SFqfD6B+wCV8
	 sXYNgL4FhlL/58B/o4HGyyRltCURVfuHeLbcPqWOz8l0EryWfUlI7Ae0Zla8ptP4CHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793636272;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=5ZG0aSxZtvp5HOLn4tluFrSC0UwwVprOmRcg6hA6TV8=;
	b=mZaUgSzArMZdgJoptAIgWjO9c28WV+ym++DbPf1QZ9xhujB5JQTx0oQMDJwEIOxWG48i
	 q+HrZrsNoOFCaQhlhxL9qkxgojYiQABTe4Cqei0SISdb/DP20ubDotIVwf5YvXuvTo6kv
	 MTGqb34dCPQJEx+rSsUOsqR2V4UWZCPnKjhfZjBwM/lXmp42tOMEWB2NOYjWz2u0wI308
	 R4532hoQU5hx655YBdOCSwFeZVUJfiFSWR1i+Cpx6Q3AFWFl5KFnZ0jjm/C1+g5qoNHRy
	 KV0SaN+yzH8KxWjWdNWuV9z6hPIMohkd1oa8ABplSj0BfIpqrcwTypCVsQ2y7eJTf7w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CyZVfmlA;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9AC609620F;
	Mon,  2 Nov 2026 16:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CyZVfmlA
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5A431F00A16;
	Mon,  2 Nov 2026 16:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793636271;
	bh=5ZG0aSxZtvp5HOLn4tluFrSC0UwwVprOmRcg6hA6TV8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=CyZVfmlAmKL1QKOzunpK8/aVLCZXONsn825+MmVrMur140un8JrARd+vAoRjW2XNg
	 HMYf0IvrfUXHdJzdCZ4A8D4HvxPdDUU3o2Hk4xi9WGM3ph/XLqnQPXo7VI4DfsQxkP
	 6Kr4wB8HNYj+0ZOJSWl89sX4VQLA7VxoTHi/WE2batjTlbOEQwLhyH55wGhdTaYVAx
	 VEYwE7Ic3d8cHWhlU+D77n2HXjgly9lMz3V3tPw2rWk8pr9ADORDvk4kb/8S1hQzlm
	 uzdwHSZZ2Ifka3EwwJaKUl7pRgPjt2ZREMW3TuqAhrntp3zWPBYqUBOrYMW1ARmRRx
	 Pjbv0wmkmJHNw==
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
Subject: [PATCH v15 2/4] revocable: Add KUnit test cases
Date: Tue,  3 Nov 2026 00:17:07 +0800
Message-ID: <20261102161710.24076-3-tzungbi@kernel.org>
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

Add KUnit test cases for the revocable API.

The test cases cover the following scenarios:

- Basic: Verifies that a consumer can successfully access the resource.
- Revocation: Verifies that after the provider revokes the resource,
  the consumer correctly receives a NULL pointer on a subsequent access.
- Try Access Macro: Same as "Revocation" but uses the macro level
  helpers.
- Concurrent Access: Verifies multiple threads can access the resource.

Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
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
v15:
- Clean up kthreads and revocable handles on error paths in concurrent
  access tests.

v14: https://lore.kernel.org/all/20261011121246.162759-3-tzungbi@kernel.org
- Add Tested-by tag.
- Change revocable API usages accordingly:
  - revocable_deinit() -> revocable_destroy().
  - revocable_handle_deinit() -> revocable_handle_destroy().
  - Adjust expected refcounts as revocable_alloc() holds 1 initial
    reference and revocable_revoke() no longer drops a reference.
- Refactor embedded test cases and concurrent access setup to reduce
  code duplication.
- Replace msleep() with completion/polling in concurrent access tests.
- Hold task_struct references with get_task_struct() and stop threads
  with kthread_stop_put() to prevent Use-After-Free.

v13: https://lore.kernel.org/all/20260912123529.7951-3-tzungbi@kernel.org
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
 drivers/base/test/Makefile         |   2 +
 drivers/base/test/revocable-test.c | 598 +++++++++++++++++++++++++++++
 4 files changed, 606 insertions(+)
 create mode 100644 drivers/base/test/revocable-test.c

diff --git a/MAINTAINERS b/MAINTAINERS
index a69407a9fefa..ba15f942ee07 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23990,6 +23990,7 @@ S:	Maintained
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
index 9ced7bbd569f..cb74d3fff1ae 100644
--- a/drivers/base/test/Makefile
+++ b/drivers/base/test/Makefile
@@ -8,3 +8,5 @@ obj-$(CONFIG_DRIVER_PE_KUNIT_TEST) += property-entry-test.o
 CFLAGS_property-entry-test.o += $(DISABLE_STRUCTLEAK_PLUGIN)
 
 obj-$(CONFIG_DRIVER_SWNODE_KUNIT_TEST) += swnode-devlink-test.o
+
+obj-$(CONFIG_REVOCABLE_KUNIT_TEST) += revocable-test.o
diff --git a/drivers/base/test/revocable-test.c b/drivers/base/test/revocable-test.c
new file mode 100644
index 000000000000..e317f9ffdfd8
--- /dev/null
+++ b/drivers/base/test/revocable-test.c
@@ -0,0 +1,598 @@
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
+#include <linux/iopoll.h>
+#include <linux/kthread.h>
+#include <linux/refcount.h>
+#include <linux/revocable.h>
+#include <linux/sched/task.h>
+
+static int get_refcount(struct revocable *rev)
+{
+	return refcount_read(&rev->kref.refcount);
+}
+
+static void _revocable_embedded_test_basic(struct kunit *test,
+					   struct revocable *rev)
+{
+	struct revocable_handle rh;
+	void *real_res = (void *)0x12345678, *res;
+	int ret;
+
+	ret = revocable_init(rev, real_res);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_EXPECT_FALSE(test, rev->dynamic);
+
+	revocable_handle_init(rev, &rh);
+
+	res = revocable_try_access(&rh);
+	KUNIT_EXPECT_PTR_EQ(test, res, real_res);
+	revocable_withdraw_access(&rh);
+
+	revocable_handle_destroy(&rh);
+	revocable_revoke(rev);
+	revocable_destroy(rev);
+}
+
+static void revocable_embedded_test_basic_stack(struct kunit *test)
+{
+	struct revocable rev;
+
+	_revocable_embedded_test_basic(test, &rev);
+}
+
+static void revocable_embedded_test_basic_heap(struct kunit *test)
+{
+	struct revocable *rev;
+
+	rev = kunit_kzalloc(test, sizeof(*rev), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, rev);
+
+	_revocable_embedded_test_basic(test, rev);
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
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 1);
+	KUNIT_EXPECT_TRUE(test, rev->dynamic);
+
+	revocable_handle_init(rev, &rh);
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 2);
+
+	res = revocable_try_access(&rh);
+	KUNIT_EXPECT_PTR_EQ(test, res, real_res);
+	revocable_withdraw_access(&rh);
+
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 2);
+	revocable_handle_destroy(&rh);
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 1);
+	revocable_revoke(rev);
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 1);
+	revocable_put(rev);
+}
+
+static void _revocable_embedded_test_revocation(struct kunit *test,
+						struct revocable *rev)
+{
+	struct revocable_handle rh;
+	void *real_res = (void *)0x12345678, *res;
+	int ret;
+
+	ret = revocable_init(rev, real_res);
+	KUNIT_ASSERT_EQ(test, ret, 0);
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
+	revocable_handle_destroy(&rh);
+	revocable_destroy(rev);
+}
+
+static void revocable_embedded_test_revocation_stack(struct kunit *test)
+{
+	struct revocable rev;
+
+	_revocable_embedded_test_revocation(test, &rev);
+}
+
+static void revocable_embedded_test_revocation_heap(struct kunit *test)
+{
+	struct revocable *rev;
+
+	rev = kunit_kzalloc(test, sizeof(*rev), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_NULL(test, rev);
+
+	_revocable_embedded_test_revocation(test, rev);
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
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 1);
+	KUNIT_EXPECT_TRUE(test, rev->dynamic);
+
+	revocable_handle_init(rev, &rh);
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 2);
+
+	res = revocable_try_access(&rh);
+	KUNIT_EXPECT_PTR_EQ(test, res, real_res);
+	revocable_withdraw_access(&rh);
+
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 2);
+	revocable_revoke(rev);
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 2);
+
+	res = revocable_try_access(&rh);
+	KUNIT_EXPECT_PTR_EQ(test, res, NULL);
+	revocable_withdraw_access(&rh);
+
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 2);
+	revocable_handle_destroy(&rh);
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
+	revocable_destroy(rev);
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
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 1);
+	KUNIT_EXPECT_TRUE(test, rev->dynamic);
+
+	{
+		revocable_try_access_with(rev, res);
+		KUNIT_EXPECT_PTR_EQ(test, res, real_res);
+		KUNIT_EXPECT_EQ(test, get_refcount(rev), 2);
+	}
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 1);
+
+	accessed = false;
+	revocable_try_access_with_scoped(rev, res) {
+		KUNIT_EXPECT_PTR_EQ(test, res, real_res);
+		KUNIT_EXPECT_EQ(test, get_refcount(rev), 2);
+		accessed = true;
+	}
+	KUNIT_EXPECT_TRUE(test, accessed);
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 1);
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
+			struct kunit *test;
+			struct completion entered, exit;
+			struct revocable_handle rh;
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
+	if (wait_for_completion_interruptible(&ctx->enter))
+		return 0;
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
+	if (wait_for_completion_interruptible(&ctx->enter))
+		return 0;
+	res = revocable_try_access(&ctx->rh);
+	KUNIT_EXPECT_PTR_EQ(ctx->test, res, ctx->expected_res);
+
+	complete(&ctx->entered);
+
+	wait_for_completion_interruptible(&ctx->exit);
+	revocable_withdraw_access(&ctx->rh);
+
+	return 0;
+}
+
+static struct test_concurrent_access_context *
+revocable_test_concurrent_access_prepare(struct kunit *test,
+					 struct revocable *rev, bool dynamic)
+{
+	struct test_concurrent_access_context *ctx;
+	int i, ret;
+
+	ctx = kunit_kmalloc_array(test, 3, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx) {
+		if (dynamic)
+			revocable_put(rev);
+		else
+			revocable_destroy(rev);
+		KUNIT_ASSERT_NOT_NULL(test, ctx);
+	}
+
+	for (i = 0; i < 3; ++i) {
+		init_completion(&ctx[i].started);
+		init_completion(&ctx[i].enter);
+
+		if (i == 0) {
+			ctx[i].rev = rev;
+			ctx[i].thread = kthread_run(
+				test_concurrent_access_provider, ctx + i,
+				"provider%d", i);
+		} else {
+			ctx[i].test = test;
+			init_completion(&ctx[i].entered);
+			init_completion(&ctx[i].exit);
+			revocable_handle_init(rev, &ctx[i].rh);
+			if (dynamic)
+				KUNIT_EXPECT_EQ(test, get_refcount(rev), 1 + i);
+
+			ctx[i].thread = kthread_run(
+				test_concurrent_access_consumer, ctx + i,
+				"consumer%d", i);
+		}
+		if (IS_ERR(ctx[i].thread)) {
+			ret = PTR_ERR(ctx[i].thread);
+			if (i > 0)
+				revocable_handle_destroy(&ctx[i].rh);
+			while (i--) {
+				kthread_stop_put(ctx[i].thread);
+				if (i > 0)
+					revocable_handle_destroy(&ctx[i].rh);
+			}
+			if (dynamic)
+				revocable_put(rev);
+			else
+				revocable_destroy(rev);
+			KUNIT_ASSERT_EQ(test, ret, 0);
+		}
+		get_task_struct(ctx[i].thread);
+
+		wait_for_completion(&ctx[i].started);
+	}
+
+	return ctx;
+}
+
+static void revocable_embedded_test_concurrent_access(struct kunit *test)
+{
+	struct revocable rev_on_stack, *rev = &rev_on_stack;
+	void *real_res = (void *)0x12345678, *res;
+	struct test_concurrent_access_context *ctx;
+	int ret, i;
+
+	ret = revocable_init(rev, real_res);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	KUNIT_EXPECT_FALSE(test, rev->dynamic);
+
+	ctx = revocable_test_concurrent_access_prepare(test, rev, false);
+
+	ctx[1].expected_res = real_res;
+	/* consumer1 enters read-side critical section. */
+	complete(&ctx[1].enter);
+	wait_for_completion(&ctx[1].entered);
+
+	/* provider0 revokes the resource. */
+	complete(&ctx[0].enter);
+	ret = read_poll_timeout(rcu_access_pointer, res, !res, 1000, 100000,
+				false, rev->res);
+	if (ret) {
+		for (i = 2; i >= 0; --i) {
+			kthread_stop_put(ctx[i].thread);
+			if (i > 0)
+				revocable_handle_destroy(&ctx[i].rh);
+		}
+		revocable_destroy(rev);
+		KUNIT_ASSERT_EQ(test, ret, 0);
+	}
+	/* provider0 can't exit.  It's waiting for the grace period. */
+
+	ctx[2].expected_res = NULL;
+	/* consumer2 enters read-side critical section. */
+	complete(&ctx[2].enter);
+	wait_for_completion(&ctx[2].entered);
+
+	/* consumer{1,2} exit read-side critical section. */
+	for (i = 1; i < 3; ++i) {
+		complete(&ctx[i].exit);
+		kthread_stop_put(ctx[i].thread);
+		revocable_handle_destroy(&ctx[i].rh);
+	}
+
+	/* provider0 exits as all readers exit their critical section. */
+	kthread_stop_put(ctx[0].thread);
+
+	revocable_destroy(rev);
+}
+
+static void revocable_dynamic_test_concurrent_access(struct kunit *test)
+{
+	struct revocable *rev;
+	void *real_res = (void *)0x12345678, *res;
+	struct test_concurrent_access_context *ctx;
+	int ret, i;
+
+	rev = revocable_alloc(real_res);
+	KUNIT_ASSERT_NOT_NULL(test, rev);
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 1);
+	KUNIT_EXPECT_TRUE(test, rev->dynamic);
+
+	ctx = revocable_test_concurrent_access_prepare(test, rev, true);
+
+	ctx[1].expected_res = real_res;
+	/* consumer1 enters read-side critical section. */
+	complete(&ctx[1].enter);
+	wait_for_completion(&ctx[1].entered);
+
+	/* provider0 revokes the resource. */
+	complete(&ctx[0].enter);
+	ret = read_poll_timeout(rcu_access_pointer, res, !res, 1000, 100000,
+				false, rev->res);
+	if (ret) {
+		for (i = 2; i >= 0; --i) {
+			kthread_stop_put(ctx[i].thread);
+			if (i > 0)
+				revocable_handle_destroy(&ctx[i].rh);
+		}
+		revocable_put(rev);
+		KUNIT_ASSERT_EQ(test, ret, 0);
+	}
+	/* provider0 can't exit.  It's waiting for the grace period. */
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 3);
+
+	ctx[2].expected_res = NULL;
+	/* consumer2 enters read-side critical section. */
+	complete(&ctx[2].enter);
+	wait_for_completion(&ctx[2].entered);
+
+	/* consumer{1,2} exit read-side critical section. */
+	for (i = 1; i < 3; ++i) {
+		complete(&ctx[i].exit);
+		kthread_stop_put(ctx[i].thread);
+		revocable_handle_destroy(&ctx[i].rh);
+	}
+
+	/* provider0 exits as all readers exit their critical section. */
+	kthread_stop_put(ctx[0].thread);
+	KUNIT_EXPECT_EQ(test, get_refcount(rev), 1);
+
+	/* Drop the provider reference. */
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

