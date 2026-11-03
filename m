Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793745875;
	b=KJrqqdhoSI+k58OzsIrmu8kz1VU2KEAh+56fsCpcWhD45Ay4dvF6kSGMrgia/lt0wl5z
	 8qy4ZyC/58dhH+AuK+WN8fwShdROymHpIg8p02NtrQXfByT+Re9eH8fotzFGevU+Qab3z
	 cAw2v1RMFMBixlM/I8p/MXTUzHfLaVsbkOXmfUzAkxyWO9xLhoI+dBO39X5oO4WoWkjCo
	 D9Ft5IxcLnFQxm2yTkfbmFs42mk/CPIaZgyCtVr9Jx7k3nctqVMceZEliwr366ghmhoUy
	 AUMVoZKfeYfg2iOW13k2ZTBEC+D9dIktJuA6UhmW04TCxaNNI893cXyj1AAPamnkyGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793745875;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=IYRceEq4zymtuUBFa2addJs8iPYSeOk0DtxlRCNPrSE=;
	b=s4kl2MHIW1H5n+9D78pFAX1tha4bHZgU9Ptq5XlKmdaC6TpOyvhjPeLtKTKIvipaBSvz
	 U+N58GSOVaYI8MsQKNCvXshtsAHrxgd2zNYkl+ivhg3ytz0VKuexgtKT50KjjjG89y1n4
	 MwJz2Eev5yBA1CH1rwYDc+EoowgyITYEGvw9av0eckkzx/gA3EUl1lq5iNZexwAcL5kTS
	 K/MtA0SIVzVOwh8xrKdfzYEOB23efTuh6ctxV3X7j6PgbgCtcS2eOj5YWGs06p/D1B0F6
	 DPk6LzGSPTY2UyeQWS06vOfYQhp34wWSN2iSDNdQJk4ZwxKcVmoynqz+qBO1D+fSZAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cQiTlj4P;
	arc=none smtp.remote-ip=74.125.82.46
Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FDB2606A32C
	for <linux-gpio@vger.kernel.org>; Tue,  3 Nov 2026 22:44:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FDB2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cQiTlj4P
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-1a2af4c8d00so326531c88.0
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2026 14:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793745874; x=1794350674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IYRceEq4zymtuUBFa2addJs8iPYSeOk0DtxlRCNPrSE=;
        b=cQiTlj4PUDTrLblnoS21huaGRbPJIjTNLiLTzZQjpVolaFsbcg2nU7tXKwEZJ5sXqr
         xjApO4Na0mwy3fc4JBMzx8pWuGlDBU8hTBJUQryoUqoSGIZFcQW5spo0F9jUm5IJ7cF2
         ZsMc5byH8WUDBc2s2l2pW9ilm+DwX/jkHw7h9vHsHelLlMdfI0zByCrbtJy5DPO4aP4d
         7vOM44br6moCuQPCcQsZaQ3fx5QcgaSB0wdPj4VVspll7ykwyZBjmVtbn7g50RogVrpk
         jN51SnJ8iw8H0q99XQn/Hhd9X/0LR0AutxCMv0YBuRAGRUy9vVUMCt2F7uC6188Rk28v
         JyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793745874; x=1794350674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IYRceEq4zymtuUBFa2addJs8iPYSeOk0DtxlRCNPrSE=;
        b=1NQezHXPN2smTcQo+CdBvtdJURBZis/9hnnnoYjPxJiPfxRlClXSUgIyiZbpReWt2f
         7t7Juym0VBYc60XTuSLMHvVdIt9vyCdXHcD4TSHrKXTwx2SRq6fs4Iw72AhSaym5FbTd
         8J5nnfQjpuBC0svbuz49/Zw5UqIVyNawiEhyZCkVec7oOoEOQ4FsjqQ+DZIufsP+ByrS
         F0DEmmqtDIyeTnoP9o5VTQCJjaAdK1yCznlb67M0vzeV529c6J9NGyS9+E2WpMZAXU7/
         Xsnzfs3mOFz1+nKBE69EUNflW9nWX52bxMgGM3v+309MCniqDWdMvPua6JFOSUJTLPNe
         3zVA==
X-Forwarded-Encrypted: i=1; AKwUvBwIvJZYUQvzhd1LKFVZVRxueCOzE6BZTJZ8B3ZOyv6AldAlNPEVX/bzYh55NyZizWAWDx/I2G+JLIZO@vger.kernel.org
X-Gm-Message-State: APuU4Z9FB3KKVqC0LRx59gx87KihDPFQ7fsuIvhp83ZlbNig6NvJlvnC
	xOAA73/7D5BUW04Ww2CvssKvPibo7f+iyBSlTcLXKhRpu5dBcjoDJ90l
X-Gm-Gg: AYBFou2CQplt3K5fNSkDDXpP/42cwVhb1234ArRqP4ADjbBw46E0af6s9s8qaQwzuKs
	FuHLkfRuY4ZX3/tQzx1j3pFqTi5u/p/QIgcVgNFt5wnIt/gcgEhrluu6o10ok8o3HLWDImhNZeq
	tv4wcjH+YHdYI/OkIoDt9wlIdtRVMMRSJ2UeX9x7hAWH7JRnj48Gycnm4CrZ/an5/JsfWd3jlBw
	FSWUd9YHmDwMLsBuZ9iyry5TWZmW8IoW3XeQxl6RG2DHU7CNJIvzUnZNLCUofFkdKzObToi3SnL
	bYteX/ehfwPggd+pfg+kiexZ1CpTrGjgZGKq+MjjaKou0fGue4SLx/wfRvz4CltqsEc40uAG6rK
	tigufnM5dfK8DqZ+ryA0LnwDnasNVYeBmWlIRWIGacZOMr3lv/iCqjVZAChgtjhx0cFHDA93ar4
	BIhnAb41uxjYCDxaxp04b19CvH1/RW8axYJID07GDxDj7JIyqY2i18UtpjnD7/uOZSdyUvgcpgD
	5xxqzjvtbqNb8Uv6SbvT+bVdQHwWkP3J0L6Iqpg24r7lQleqbTe/bHFG11PBArCeDBmzW87q1rK
	JlviKzhfvnht38fL64SQwaHjvvGKMGNgxvGlzH/RgYriBQcaBl4Idylaisd72dtNqLUTLRIcbJq
	lJtTqH6bSLzkteNLK37/ZhgsqmchNCeZlXvS3jPwftppeI/sWqAFEfRXPyv8+P6Bp7brMmNfgfz
	Y=
X-Received: by 2002:a05:7022:1e13:b0:149:1feb:6d9d with SMTP id a92af1059eb24-1ac5ac4df09mr17890128c88.19.1793745873408;
        Tue, 03 Nov 2026 14:44:33 -0800 (PST)
Received: from localhost.localdomain ([58.224.60.243])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c2de58sm1719205c88.12.2026.11.03.14.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:44:32 -0800 (PST)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: brgl@kernel.org
Cc: linusw@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpiolib: reset lookup flags for each hogged line
Date: Wed,  4 Nov 2026 07:43:39 +0900
Message-ID: <20261103224339.1180-1-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.42.0.windows.2
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

gpiochip_add_hog() initializes lflags once before iterating over the GPIO
specifiers. In the non-OF path, an active-low line sets GPIO_ACTIVE_LOW,
but a later active-high line does not clear it. A single firmware hog
with mixed polarities therefore configures later active-high lines as
active-low, including inverting their initial output value.

Initialize the lookup flags for each line before translating its flags.
The OF helper already overwrites the flags for each specifier; the
non-OF path must also start with a fresh value.

Add a KUnit case using one software-node hog with four alternating line
polarities. Check both the descriptor polarity and raw output level for
a logical high using the existing software GPIO provider. On UML, the
eight existing cases pass before the fix while the new case fails;
all nine cases pass after the fix with the same configuration.

Clang W=1 and private Sparse C=2 builds of both changed files complete
without diagnostics. No physical GPIO hardware was tested.

Codex assisted with the source analysis, fix, regression test and commit
message.

Fixes: 802c51a83e9a ("gpiolib: fix hogs with multiple lines")
Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
Target: brgl/linux gpio/for-current at 9e4b35c95fede87bad36f68b7ff1eae94ea6b910.
Tool use: Codex assisted a bounded review of public kernel code, the
minimal fix, test and description. The task requested a reproducible
general functional bug fix, not a fuzzing or security campaign.
Testing: actual before/after UML KUnit and Clang/private Sparse builds.
Physical GPIO hardware was not tested.

 drivers/gpio/gpiolib-kunit.c | 88 ++++++++++++++++++++++++++++++++++++
 drivers/gpio/gpiolib.c       |  3 +-
 2 files changed, 90 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
index f005854e7f..01205acf62 100644
--- a/drivers/gpio/gpiolib-kunit.c
+++ b/drivers/gpio/gpiolib-kunit.c
@@ -862,11 +862,99 @@ static struct kunit_suite gpio_swnode_hog_test_suite = {
 	.init = gpio_swnode_register_drivers,
 };
 
+/* A single non-OF hog may describe lines with different polarities. */
+static const struct software_node gpio_mixed_hog_provider_swnode = {
+	.name = "gpio-mixed-hog-provider",
+};
+
+static const u32 gpio_mixed_hog_gpios[] = {
+	0, GPIO_ACTIVE_LOW,
+	1, GPIO_ACTIVE_HIGH,
+	2, GPIO_ACTIVE_LOW,
+	3, GPIO_ACTIVE_HIGH,
+};
+
+static const struct property_entry gpio_mixed_hog_properties[] = {
+	PROPERTY_ENTRY_U32_ARRAY("gpios", gpio_mixed_hog_gpios),
+	PROPERTY_ENTRY_BOOL("output-high"),
+	PROPERTY_ENTRY_BOOL("gpio-hog"),
+	{ }
+};
+
+static const struct software_node gpio_mixed_hog_swnode =
+	SOFTWARE_NODE("mixed-hog", gpio_mixed_hog_properties,
+		      &gpio_mixed_hog_provider_swnode);
+
+static const struct software_node *const gpio_mixed_hog_swnodes[] = {
+	&gpio_mixed_hog_provider_swnode,
+	&gpio_mixed_hog_swnode,
+	NULL
+};
+
+static void gpio_hog_mixed_polarities(struct kunit *test)
+{
+	struct platform_device_info pdevinfo = {
+		.name = GPIO_TEST_PROVIDER,
+		.id = PLATFORM_DEVID_NONE,
+		.fwnode = software_node_fwnode(&gpio_mixed_hog_provider_swnode),
+	};
+	struct platform_device *pdev;
+	struct gpio_device *gdev;
+	struct gpio_desc *desc;
+	bool active_low;
+	int ret;
+
+	pdev = kunit_platform_device_register_full(test, &pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
+
+	wait_for_device_probe();
+
+	gdev = gpio_device_find_by_label(GPIO_CONSUMER_NAME);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, gdev);
+
+	ret = kunit_add_action_or_reset(test, gpio_device_put_wrapper, gdev);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	for (unsigned int i = 0; i < GPIO_TEST_PROVIDER_NGPIO; i++) {
+		desc = gpio_device_get_desc(gdev, i);
+		KUNIT_ASSERT_NOT_ERR_OR_NULL(test, desc);
+
+		active_low = gpio_mixed_hog_gpios[i * 2 + 1] == GPIO_ACTIVE_LOW;
+		KUNIT_EXPECT_EQ(test, gpiod_is_active_low(desc), active_low);
+		/* A logical high must drive the inverse level on active-low lines. */
+		KUNIT_EXPECT_EQ(test, gpiod_get_raw_value_cansleep(desc), !active_low);
+	}
+}
+
+static int gpio_mixed_hog_suite_init(struct kunit_suite *suite)
+{
+	return software_node_register_node_group(gpio_mixed_hog_swnodes);
+}
+
+static void gpio_mixed_hog_suite_exit(struct kunit_suite *suite)
+{
+	software_node_unregister_node_group(gpio_mixed_hog_swnodes);
+}
+
+static struct kunit_case gpio_mixed_hog_tests[] = {
+	KUNIT_CASE(gpio_hog_mixed_polarities),
+	{ }
+};
+
+static struct kunit_suite gpio_mixed_hog_test_suite = {
+	.name = "gpio-mixed-hog-polarity",
+	.test_cases = gpio_mixed_hog_tests,
+	.suite_init = gpio_mixed_hog_suite_init,
+	.suite_exit = gpio_mixed_hog_suite_exit,
+	.init = gpio_swnode_register_drivers,
+};
+
 kunit_test_suites(
 	&gpio_swnode_lookup_test_suite,
 	&gpio_swnode_probe_order_test_suite,
 	&gpio_unbind_with_consumers_test_suite,
 	&gpio_swnode_hog_test_suite,
+	&gpio_mixed_hog_test_suite,
 );
 
 MODULE_DESCRIPTION("Test module for the GPIO subsystem");
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index fbdeda2f27..db613770dc 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -975,7 +975,6 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
 	 */
 	u32 cells = 2;
 
-	lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
 	dflags = GPIOD_ASIS;
 	name = NULL;
 
@@ -1014,6 +1013,8 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
 	fwnode_property_read_string(fwnode, "line-name", &name);
 
 	for (unsigned int i = 0; i < num_hogs; i++) {
+		lflags = GPIO_LOOKUP_FLAGS_DEFAULT;
+
 		if (is_of_node(fwnode)) {
 			/*
 			 * OF-nodes need some additional special handling for

base-commit: 9e4b35c95fede87bad36f68b7ff1eae94ea6b910
