Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793793711;
	b=cpVrFKkfatehouZYpl01jBzfm7H31ZRpA8vUYpw8oo+EpM+AXWu2s1Sq9qj5Wh33To5I
	 cXmGu9maT1sCq/4rYbepbSX9QEanSNVhepKTGVI2KYEPOteku/kE4m+Ri7LkkqSvOuY9O
	 D41ARB4b1ZcTntDqr0hWqCwSwEl0bBqVHsAZcbUFgpANt+WogC3uuF99xyS2Oz/62X8Hl
	 TZgSpj2qvQ+CvHp9WY3jGDnR2Gghzf9UNaqJqQUqVpiG20uDKD3rO8Pff2+CgYdmYI4CY
	 Rt5BJ5uT97W3xQ8IUS1xbDru4l514gmEyeZlZb9vUyioEUd0pjQiJ7KcuiYqDBekVug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793793711;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=DLnBS3asSoJkTZbmbelm2y19mDKYNH4MfMGa0K6Aq2Q=;
	b=cUHj9bIPnWy8Ej5DSTx+T/Fx2U85F3DtnjmAmWya+5x5zV7AjUFBRQUQcU1xoJgyMdRo
	 x1k+6befNgsK/mRQZ46RErleGlGpeFX6KCximpZ4VC6vZxWWqsoCWxfIbicNjh/tgFbCj
	 8cbZfvM8Gjh2zhDaqHNwvDSISU8+4sSRNP76WSuAXTkerOUOKu6fUDsWyFIW/jFsLNPsi
	 L+FYeFhH6A5EoHuZjg5E9hHwd4nfNU0AIx/DoFKRYWeoAk7JpE7Ten4nE/OoaZXZveNDD
	 uYFM//pakQQfyFtMshmoZSSW0J5YbGjvI7W4jpZwjQoh3hdsiCEW2t6ErcJhAfYv6kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dNzb9qxh;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5FD9606A332
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 12:01:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5FD9606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dNzb9qxh
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-89f28c3ac7bso229637b3a.0
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 04:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793793710; x=1794398510; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DLnBS3asSoJkTZbmbelm2y19mDKYNH4MfMGa0K6Aq2Q=;
        b=dNzb9qxhI5NeTUc9qb/FdfarDIe0G5CEJ/bU+9pqt6dL2sS4GsN4LnAJNUX/AdeQkR
         wzTjg26aFyWEfQLJCaT4BwAQm9rVwZd8Sj4EGGRbiYNMz03uaTodvMMcaOROM8rbp+Vj
         oew6tPPfhn7+mJSNKk8n1kTbREm/9wWSO6+/pZ/WNMu6aFS8CE7zFJpcaUOF58ztvUik
         Bv5Ti0n7tIW9ySPBj3n4pYfn/2qb7Ybq3O2xAcU8PO6FI8EyYqDungOl/rpp+gUYjDhV
         yF8fSDJhMotsTunfLSk4R8jd6h3w1v1+oCkC59Qk8IZc8i3optPxrHNn/jh8Dco8I+32
         Adug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793793710; x=1794398510;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DLnBS3asSoJkTZbmbelm2y19mDKYNH4MfMGa0K6Aq2Q=;
        b=HnWt920Pky0+9rbDESDHEYU6ABjIwxWNY/BC6yDI52GsujUihU6hyzUeF/BRYVYVzn
         m440g0QmhmfXadzhaTwsPlfdnJfZkRQjnOlnLRqJxr2JwgjU4Nu9DOtqP1sGjYePNOB6
         BFFezCAUDP5Vhg0P7Cy/XFZBLlG3m+WhD0ES7kQpyp6icJWCjSFDQlAv1YrpP9T6Nzo+
         MV/HCts/Sk79k6gPL2BhPuR3vaxxRkd1LguJWNUDOBekB6E2EqnDgexKVmxj97HyrurT
         VxP0rCNyuH+8sGt8T0gi3jRx4ks+IYYxIQYUvmnOTV81sqE+yQbUdRiYcKdmic4uFN/3
         P0TA==
X-Forwarded-Encrypted: i=1; AKwUvBy9OyorYOV3/lQMhKUMjDNuQLK/g7fJ4DhvoZIiKJhkMPBHxW33n7RcFri/c4VepHCZKSslaM4oIGtb@vger.kernel.org
X-Gm-Message-State: APuU4Z9eXvdpGqodxo68uK+z/gnaanY8EZFuxspj7di9x+1xCWh2J22J
	Pyl4SuIzvJP4Oxeyi/o6oWPFxv3inYivgH0IeBJ9mZ6GRXZevM2TnSiSlTb0VhOpP+s=
X-Gm-Gg: AYBFou0AtHeNtcp4PhSZyK4xP0mOPJRG9iEluaHb/lSd89uPJ59+J4H8pz143+qAEf3
	u8Vu9wgyRutizpqTR3AE6VLRCAacxf4fSWnXXJ0b8oQv6/GpCadNui1D/1SM29m87F0HqDHZtmM
	P1D2DbglC3AFxyGPALpyJR+2JBCwIx7JyY9SdF48hbtLLjimPef5O5J+6wXtK4EOygdIN819lCK
	sc8s8Lb+KkQqJKtmVMRNPJYpzAAjaX5Gj810XJX4Wg8xBzHSdPA2v98xCEsGH4FGAqEVRg7W9zu
	tKZ7O6UWq/Pj+mpxxsNeIG1zKyhWAY3xo0MojcPefdr4zoZ+5Di+76pLSSELYipK/sBHm5rS2fS
	jlwrX4KgV22btirhJhYt7yrCt6mwU68Yp1JNS1k+w5hSZBNPpKQJ3lTEuI0iriMTMI5qi4WMlAZ
	IFJl1UreL7O8kIXHUYmWgBLDq/e67EGFs0MfhTDEwfnJ0On3/e/xedT/r4znYOfUuuTEtMnjypN
	RcXtqsHiK396iZGufv/on+hdhaUMS8xS/ucDN0Sho0LuaSUJX9QRc4RI1SLGcRopcZ+hPDYoUs6
	8Pc21UeIJM9tTpSdgFhDa/H5dIrm6TYdsv9d7WUM1tX0QTat/v0TNBFOMebkW2QO9H8sveMv0As
	J/pHRLDWed9Hur+SMJbwyNM1H5zRX0kAed/uMmnnR1D5j0NCrC+UhyKBcMi7SEH0M5CuJWGkwF3
	c=
X-Received: by 2002:a05:6a00:1c85:b0:899:74d0:8a72 with SMTP id d2e1a72fcca58-8a9c0b796d7mr12306362b3a.59.1793793709863;
        Wed, 04 Nov 2026 04:01:49 -0800 (PST)
Received: from localhost.localdomain ([58.224.60.243])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09af918f2sm787813b3a.23.2026.11.04.04.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 04:01:49 -0800 (PST)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: brgl@kernel.org
Cc: linusw@kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: kunit: test mixed-polarity multi-line hogs
Date: Wed,  4 Nov 2026 21:00:55 +0900
Message-ID: <20261104120055.256-1-kimjinseob88@gmail.com>
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

A single software-node GPIO hog can describe several lines with different
polarities. Add a case with alternating active-low and active-high lines
to verify that lookup flags do not carry over between GPIO specifiers.
Check both descriptor polarity and the raw output level for a logical
output-high value.

Register the additional provider and hog nodes in the existing hog node
group and add the case to gpio_swnode_hog_tests. Reuse the existing suite
lifecycle and test-managed GPIO device reference cleanup.

Codex assisted with the regression test and commit message.

Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
Test split from the combined v1 patch, for v7.5:
- Add the case to the existing gpio-swnode-hog suite and node group.
- Drop the duplicate suite lifecycle and keep managed reference cleanup.
- Adapt to gpio/for-next's provider label and existing test helpers.

Target: brgl/linux gpio/for-next at d66b6b86d5a6278ca930112c634d03725beb7d9a.
Dependency: apply the fix-only v2, "gpiolib: reset lookup flags for each
hogged line", before this test. Without that prerequisite the new test
is expected to fail. The test itself changes no GPIO implementation.
The maintainer requested this test for v7.5, separately from the fix.

Testing on this target: actual UML/KUnit, before 10 pass / 1 fail;
after 11 pass / 0 fail, with the same config and test source.
GCC W=1 and Clang W=1/private Sparse C=2 builds completed.
The mixed-polarity case also passes alone and within the hog suite.
No physical GPIO or runtime OF hardware validation was performed.

Previous version: https://lore.kernel.org/linux-gpio/20261103224339.1180-1-kimjinseob88@gmail.com/
Review: https://lore.kernel.org/linux-gpio/qboynvhfmvltsuopwotpf3sqdwho3qobxmw5qldooedjqodfgy@x4l6hscj5unx/

 drivers/gpio/gpiolib-kunit.c | 61 ++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
index 11849aa56..38554280e 100644
--- a/drivers/gpio/gpiolib-kunit.c
+++ b/drivers/gpio/gpiolib-kunit.c
@@ -713,11 +713,36 @@ static const struct software_node gpio_hog_input_swnode =
 	SOFTWARE_NODE("hog-input", gpio_hog_input_properties,
 		      &gpio_test_provider_swnode);
 
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
 static const struct software_node *const gpio_hog_swnodes[] = {
 	&gpio_test_provider_swnode,
 	&gpio_hog_output_high_swnode,
 	&gpio_hog_output_low_swnode,
 	&gpio_hog_input_swnode,
+	&gpio_mixed_hog_provider_swnode,
+	&gpio_mixed_hog_swnode,
 	NULL
 };
 
@@ -809,6 +834,41 @@ static void gpio_hog_input(struct kunit *test)
 	gpio_hog_assert(test, GPIO_HOG_INPUT_OFFSET, GPIO_LINE_DIRECTION_IN);
 }
 
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
+	gdev = gpio_device_find_by_label(GPIO_TEST_PROVIDER);
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
 static int gpio_hog_suite_init(struct kunit_suite *suite)
 {
 	return software_node_register_node_group(gpio_hog_swnodes);
@@ -823,6 +883,7 @@ static struct kunit_case gpio_swnode_hog_tests[] = {
 	KUNIT_CASE(gpio_hog_output_high),
 	KUNIT_CASE(gpio_hog_output_low),
 	KUNIT_CASE(gpio_hog_input),
+	KUNIT_CASE(gpio_hog_mixed_polarities),
 	{ }
 };
 

base-commit: d66b6b86d5a6278ca930112c634d03725beb7d9a
prerequisite-patch-id: 3aa172b6fbd4d7ead61ff22c62c2be020339b988
