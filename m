Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447297;
	b=G54RlgqQomHAdLVQEiD3TpATdNJPceJAmxtPUT7/e5zOSdfuQmpSNsEEUmTtYFF7Zww5
	 BJnsMbNPkF9cgdLNdhBGjH2bHSWP3l/zx/2iPqwFYvqY9JuwEYWSXMGATddgdtJu73Iyy
	 AckGRDxXf9m4cskmg1i1AK5uutze2F6Gz9I48JFAN4m2HAd2gFFb+pOs46v6/yMJUkQiu
	 sWuaDwY934ZG7qno4FvGd1R9vxLAYEeDR59jnS48NpT+TXVg7eDZszMdjVR/ziavXYdGi
	 vR+ozglbqKhcO0LrpB3W8EPTu5GY0syGrNwKbphDNGnlreqRgAgPnWhUjf6XYEB1amg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447297;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=19wtD7ctexcupGN1rAHyajgeUpgLFt6VgBl9fWgXjN8=;
	b=tDK0uF53sOOBvquOzfkkf08WY5vos7M+eSTXe4pDPST5ZnezGcAmd4+RXoLTpEgoNDGU
	 /T30BpIO15EEIk3BMTrNPSR9HfFEEwJZUMGFv4u6bcQ85JU1Y3ntUrbYghU1raL3jDalS
	 P5kG5NHr196BDySbYBCxR6aTZ8dqJhOcQetKZAx60AFsNO+zETGoBDKd4Qq7peqkF9JPF
	 cckaiJgeMCALwy1mdN8aYkzXyFeEvBXROn5iuL41x2NkuYIoHXX7yN5BBuzQjH5DmW4pM
	 44Em5bMgcMZT5n/RdlwJiDXScvFulfPo8D4Gii4cBgHZKJAW3nPdW5A2b/8GEGebZMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MaZi7CmT;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36AC7606A338
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36AC7606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=MaZi7CmT
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-4ac109a8a12so1961373f8f.3
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 07:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447294; x=1796052094; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=19wtD7ctexcupGN1rAHyajgeUpgLFt6VgBl9fWgXjN8=;
        b=MaZi7CmTAvz5jvCoW/2LqujGaVlkK/ho53r4KJmPkYOBQvqOWQR793J4rzW+E6GpfU
         SoPesaayq8f8Hj0W/aUOilS8O83Ui9hZ72F4VNAP3slPOmkroXFB92GR8u/icdi0iWnZ
         i7sDT/CI9pEyn8EakiDCImc0jYixycjVt7VOT3OoXMcquWQaCDgXy6QAGE8DxqMLCnV1
         JO22HGL4yDIFB1r5Rf8YhueROhChV7yaKapldMWLdFmL0nQ6OhLn+BPmHCQRvA0og3LW
         5lsjxTpFYUp3dV4p05blvT12WrQ7DfOTOW4QfMwq9ZOE0w4VGfr8cgwaOdWpKBJMmqHZ
         Eo7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447294; x=1796052094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=19wtD7ctexcupGN1rAHyajgeUpgLFt6VgBl9fWgXjN8=;
        b=YfCK+WVIGQDic/kh9tXZbIhsJjrVY3aVGzMz7qD2VuKw0g1iXUIHfXH+ihc48J7p2U
         Nc2D+nn++9lgO4NlNiH0psA3eIbhxzPWLeH0ps+00sGZLINUgS9hCZEM5G9bs4mzYSHG
         KKEbsc1niFSQmP1gAElgnNloIwAzNdI8GS4XL9c+kwbHCi9H9wV6hHu95YKfsVgnqhuP
         m9ycc46Jxkj/aC7R4zvqZ6SI4n71kwV7NT995bg5R5BKDMfkbXuMLNkgfE7pYYeQVip1
         Pf0vYKbFmpJ9zll1CEGkgyTehuhSejakIRFzRnY8b8KMgHm3xR6vnZ+BaJJEFGQYDDHn
         d4aA==
X-Forwarded-Encrypted: i=1; AL+hErGsWRbFI5RFSTe/qlJp5qq98tFxadSO5mpwofyVu0gvNk3zozQCfbRY+EW7DeZbKbW8cZtF08/tyZih@vger.kernel.org
X-Gm-Message-State: APuU4Z9qE/q0I7kMsFtkm4YJxTC+RNrJ9ViThIHtHZ7pdkxdan7rKNCV
	zk5diK3Zrd47zNaJV1jbPhVl41hg2O7wVBfpxqapsT2iCtojsjgrYubaFc35aCRJERo=
X-Gm-Gg: AZFdTZegebBivYMcmox6aA1O0Jo4kdNTviqGc1eUSSXOwMJ8GhlciC/P6TUd7iPsHwk
	z3n6EF6R+JUBU39wff8/B0pRQJQ2Idzn0FbVFaSS5fPe1fKN3HZQAXoybvnUl8k1LLsbHfrK6FA
	mULxpcJC4KIe94j/eiPUK3GBbkz8gkudQ4T5ONsojDDJy03whM4FZmy2wSRnYYEw87LHysz9Muz
	veHRHNLlos4cPFLK4mSE4GcnkKbslE2Zzami31elrBdhEfqVYummukxbJlR1ImQseUmxGcIexhG
	DtDLJFLaFVCIlqraCrbdeV5LMTPS1V6D+SQ2ao6oXPU2KMp1mOCcY40FxVfAagA/Z4NiQ1c3ZRc
	nvfN+OweaRdW+0KQc54dsPppd5tN0yMkyzd6MZ7+PjpSI3BKu4Sj3W7wuPvbPjDtDJHfpG8j55y
	4yCGaGs7Uf7mykP9MoOe9ebukEbLvPNriI2d+DNf4ifaNoPuApJ+hr6ihhJnTQfDhF1IVHp3XBx
	019YzHxr4GYDUS/wwyabMZ6xxFvyAbTIwgj4+Yca3Sh8FWJnxy5gv0mYZ5+aUJIAcSRoFGIUGaU
	nWCVgQjRY62nEp4vUUQmBDmDJDk23oqASaDB+DoDydBnDFLb700=
X-Received: by 2002:a05:600c:5303:b0:4ba:495c:2f5d with SMTP id 5b1f17b1804b1-4bb8880767amr217009255e9.9.1795447294554;
        Mon, 23 Nov 2026 07:21:34 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb895f7bc1sm133041265e9.3.2026.11.23.07.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:34 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 23 Nov 2026 16:21:26 +0100
Subject: [PATCH v3 04/10] firmware: arm_scmi: report the pin-only and GPIO
 flags of functions
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-4-d61f039be008@baylibre.com>
References: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
In-Reply-To: <20261123-clegoffic-pinctrl-scmi-gpio-v3-0-d61f039be008@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev

PINCTRL_ATTRIBUTES flags a function as pin-only when its associations are
pins, but the flag was dropped and callers took them for groups. Keep the
pin-only and GPIO flags of functions, and add a function_flags_get
operation to read them.

Fixes: 2145af01b9cb ("firmware: arm_scmi: Add basic support for SCMI v3.2 pincontrol protocol")
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/firmware/arm_scmi/pinctrl.c | 42 ++++++++++++++++++++++++++++++++-----
 include/linux/scmi_protocol.h       |  6 +++++-
 2 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index b071d31b5c33..1bc4bca4c48f 100644
--- a/drivers/firmware/arm_scmi/pinctrl.c
+++ b/drivers/firmware/arm_scmi/pinctrl.c
@@ -27,6 +27,8 @@
 #define GET_FUNCTIONS_NR(x)	le32_get_bits((x), GENMASK(15, 0))
 
 #define EXT_NAME_FLAG(x)	le32_get_bits((x), BIT(31))
+#define GPIO_FUNC(x)		le32_get_bits((x), BIT(17))
+#define PIN_ONLY_FUNC(x)	le32_get_bits((x), BIT(16))
 #define NUM_ELEMS(x)		le32_get_bits((x), GENMASK(15, 0))
 
 #define REMAINING(x)		le32_get_bits((x), GENMASK(31, 16))
@@ -107,6 +109,8 @@ struct scmi_group_info {
 struct scmi_function_info {
 	char name[SCMI_MAX_STR_SIZE];
 	bool present;
+	bool pin_only;
+	bool gpio;
 	u32 *groups;
 	u32 nr_groups;
 };
@@ -188,8 +192,8 @@ static int scmi_pinctrl_validate_id(const struct scmi_protocol_handle *ph,
 
 static int scmi_pinctrl_attributes(const struct scmi_protocol_handle *ph,
 				   enum scmi_pinctrl_selector_type type,
-				   u32 selector, char *name,
-				   u32 *n_elems)
+				   u32 selector, char *name, u32 *n_elems,
+				   bool *pin_only, bool *gpio)
 {
 	int ret;
 	struct scmi_xfer *t;
@@ -219,6 +223,12 @@ static int scmi_pinctrl_attributes(const struct scmi_protocol_handle *ph,
 		if (n_elems)
 			*n_elems = NUM_ELEMS(rx->attributes);
 
+		if (pin_only)
+			*pin_only = PIN_ONLY_FUNC(rx->attributes);
+
+		if (gpio)
+			*gpio = GPIO_FUNC(rx->attributes);
+
 		strscpy(name, rx->name, SCMI_SHORT_NAME_MAX_SIZE);
 
 		ext_name_flag = !!EXT_NAME_FLAG(rx->attributes);
@@ -614,7 +624,7 @@ static int scmi_pinctrl_get_group_info(const struct scmi_protocol_handle *ph,
 		return 0;
 
 	ret = scmi_pinctrl_attributes(ph, GROUP_TYPE, selector, group->name,
-				      &group->nr_pins);
+				      &group->nr_pins, NULL, NULL);
 	if (ret)
 		return ret;
 
@@ -691,7 +701,8 @@ static int scmi_pinctrl_get_function_info(const struct scmi_protocol_handle *ph,
 		return 0;
 
 	ret = scmi_pinctrl_attributes(ph, FUNCTION_TYPE, selector, func->name,
-				      &func->nr_groups);
+				      &func->nr_groups, &func->pin_only,
+				      &func->gpio);
 	if (ret)
 		return ret;
 
@@ -753,6 +764,26 @@ scmi_pinctrl_function_groups_get(const struct scmi_protocol_handle *ph,
 	return 0;
 }
 
+static int
+scmi_pinctrl_function_flags_get(const struct scmi_protocol_handle *ph,
+				u32 selector, bool *pin_only, bool *gpio)
+{
+	struct scmi_pinctrl_info *pi = ph->get_priv(ph);
+	int ret;
+
+	if (!pin_only || !gpio)
+		return -EINVAL;
+
+	ret = scmi_pinctrl_get_function_info(ph, selector);
+	if (ret)
+		return ret;
+
+	*pin_only = pi->functions[selector].pin_only;
+	*gpio = pi->functions[selector].gpio;
+
+	return 0;
+}
+
 static int scmi_pinctrl_mux_set(const struct scmi_protocol_handle *ph,
 				u32 selector, u32 group)
 {
@@ -773,7 +804,7 @@ static int scmi_pinctrl_get_pin_info(const struct scmi_protocol_handle *ph,
 	if (pin->present)
 		return 0;
 
-	ret = scmi_pinctrl_attributes(ph, PIN_TYPE, selector, pin->name, NULL);
+	ret = scmi_pinctrl_attributes(ph, PIN_TYPE, selector, pin->name, NULL, NULL, NULL);
 	if (ret)
 		return ret;
 
@@ -821,6 +852,7 @@ static const struct scmi_pinctrl_proto_ops pinctrl_proto_ops = {
 	.name_get = scmi_pinctrl_name_get,
 	.group_pins_get = scmi_pinctrl_group_pins_get,
 	.function_groups_get = scmi_pinctrl_function_groups_get,
+	.function_flags_get = scmi_pinctrl_function_flags_get,
 	.mux_set = scmi_pinctrl_mux_set,
 	.settings_get_one = scmi_pinctrl_settings_get_one,
 	.settings_get_all = scmi_pinctrl_settings_get_all,
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 3f7cc35eb861..072190e89064 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -785,7 +785,9 @@ enum scmi_pinctrl_conf_type {
  * @name_get: returns name by index of given type
  * @group_pins_get: returns the set of pins, assigned to the specified group
  * @function_groups_get: returns the set of groups, assigned to the specified
- *	function
+ *	function, or the set of pins for a pin-only function
+ * @function_flags_get: tells whether the specified function is pin-only and
+ *	whether it is a GPIO function
  * @mux_set: set muxing function for groups of pins
  * @settings_get_one: returns one configuration parameter for pin or group
  *	specified by config_type
@@ -806,6 +808,8 @@ struct scmi_pinctrl_proto_ops {
 	int (*function_groups_get)(const struct scmi_protocol_handle *ph,
 				   u32 selector, unsigned int *nr_groups,
 				   const unsigned int **groups);
+	int (*function_flags_get)(const struct scmi_protocol_handle *ph,
+				  u32 selector, bool *pin_only, bool *gpio);
 	int (*mux_set)(const struct scmi_protocol_handle *ph, u32 selector,
 		       u32 group);
 	int (*settings_get_one)(const struct scmi_protocol_handle *ph,

-- 
2.56.1

