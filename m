Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567968;
	b=hTa7SXVDN1Xz19WSUVEZ0Ishkc6pCMQa6/sy42q5oKdHSeVg0EpK833lzzymeAkHoex/
	 arIm3Ku9Qv3xGOdJjer3JxE2TDN4pgdokV6wHpSh7TROFoMEAinJ3AQ3ZohN4KLMCPdhU
	 aqGGnLpze6kN3uyg8uopJIDQsaaUKpVQ5QtEbSc5V4Q1RiIDNWY6riI0BkDcWIAEf+inJ
	 Sg8sMx4nS2OLXJxAVWGmAiE2xDXPD5ctOPNXAb3wK97OPfNQh7gBscoJq+asdGMJS7ZlF
	 k8+Yv73GPBpRDyASdwgeV5gtCuo6z8kx+RJlgqeeltBVAcUp0Bd8S3U1hYZI+j2u4dw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567968;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=ns8u8KqefbjpaycM2G469cz8A+R7v2hBmGNBrgNpOEE=;
	b=rGNyHXLOXWu+9AO6hf7jVydjViakZ/lBY8N/PJyBlNIEJT/+qcmm6RPjwWZSg/bodpob
	 6getJT2WQc+Ic6UCoMHnF8UNJSYUlTT/TqCVAOWefH8oRW5es9/eUdOkyWKJy9W4pKHMr
	 2tqdcDUJ2pc7bHYuhgS8BjwFAFTE70amRNZkvS+sztuKA7fzW90F8QlZoMoPOVadMav9l
	 vb28n2V4rN9ILsZHtRmZsNVMLyVni3wiXsFeJ5+Xt9LiDYrKDsV5qtrfV2ecDe2GVUseM
	 cJBJXtCgCdDr9Ps/95PKBQb1uwnkHPZf6++GzNchtm/EwGhcjLFqVvSLnZ10gCuZzvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="UeEnmoq/";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FA2A60A6F4E
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 11:06:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FA2A60A6F4E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=UeEnmoq/
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a210470b49so6145645e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 03:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567967; x=1795172767; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ns8u8KqefbjpaycM2G469cz8A+R7v2hBmGNBrgNpOEE=;
        b=UeEnmoq/sa4BrodvtOZ9H8Zo7wXV/+cHp66qthswFeBVx4fJAkbzzNaF/0svkiY3js
         EQd5sa5d0FiSE1UXjhMP+lw4KxaKo/MXa+9RVOqAoDrEJzlNbXt4HTLDrrLrhkz59ZNz
         ZygLaKY8R2TP7LSL9o4jUN//ifPwU13cUPa6Jz8i9yLGCbln1MUhaEHxhMPbg39fBgon
         Lzdl4U2sI36FnW4sMkpKs43O/zRxfGV6QDhyUQyEBIT1rhMsAMJBivzsijGimjWMfz/o
         N47y3zEzio6xgj/+PQ9m+xKHdOfXKv1m3une1lxAhdAf7o3kNMVhGtNhYlLWYAIEGz9k
         LwuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567967; x=1795172767;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ns8u8KqefbjpaycM2G469cz8A+R7v2hBmGNBrgNpOEE=;
        b=QD6RDX+/MDgzmW5ppfWgFEn+XhAZS2Bn09TQDnBYVpjpQvcxsYZ6YZdJPrAXe3G5T0
         gkMaHHtjw+LAANeAV3beq3DTy2cGihypwRAl+K7vcrsMRBptrLjQqIclLJ310o33eXuG
         CJihbNOQufN44ZbaxtiNO3mj0tajq5X9C8ScnjUUiLPMXh9sl31Twu/v1EvSunVHL22a
         p4a29lgtwr3rcYJYfjmwBFfTiXpslC1ZwdRGjhNN2ykVe8ah3bCTsQmNIc5+UTHNQEWF
         AurECQ0YstKF2RTbhViOhblxRyLWWoRL4yLZArYSnNEtEGZqd7dyfliKkaEsNhZ0ok8/
         CJPg==
X-Forwarded-Encrypted: i=1; AL+hErFcCfRw+G4zt//jpM/RTAmQVeKY3Y3nBqJ3JXAik96qntVuvcSB6NycL/wvMCCT3tbcFt+4oDEzeaox@vger.kernel.org
X-Gm-Message-State: APuU4Z+xkUYRg0OJLG7FUaKPC7X0W28ehB6hiDEL1418oDvJ7sJPAetE
	vMUj7/xZP2UcC6O+4VMOuAU3FRDDN0kMDO7uNrF6sZJTGtGZdKDRnGoHaawUZb9sdbA=
X-Gm-Gg: AYBFou3uNoGH5bE5rmKGopeV8wisOme+SbmbxKtsGtstUN1Lv5kMwXI4sf9O+Po8Bwv
	nUMFpdl5mMLzHA9IYvwf9lirW+82J5YnvX6sF0TaYFggPa3NMeg9+ucnhtQ8W4bpFXoMvPC6RkT
	xZe+P+RIrqWw49EmA4gqE7sJfvi/NpvERAB9Z5pcxtFet7/PpJWBXteg8ohRNOrvS3lUGRN14/O
	Ul5h28QbgdDD8edDJlsw4i5AiLe9VV4s9/whcIYlqK8T9laLOEH6AL5ZQVbTuosmAFXGM07OzZx
	kW0V6F2j0ttTAYE4aIOhrXICJDPeXE7KQlmH4geEveRTJHRo3QsP8RzIH5N4Q4NWcX4EElZtWIk
	EG/xzLFASjWkehdWgQj0hPnjHqOdkDSxe0B4J1tF+SRvI5ZuARyWiiRkhTlVPYcnG1FOdXikNOA
	yu8s7/2OVhbTu/mdKjEFWk8bt9AaHpBh9dRYe+tbUyjvQy/zwf8i1Z8R9ocaEJYxw/wbBNbqAu3
	8z/luvvDFfCPLqNbpjZ4+159MMD/mZiVafPcSxNsi8EdIXXhfdOof7NngXbHqbR5LiTUb5ZE6kU
	c23ejvWBC3Rnx+PWZeuybQgzUpCbB3g7k8EwuWv7XMz2Rjqje8hwx5tcNnmcSH6bc1wb8r/z
X-Received: by 2002:a05:600c:1c17:b0:4ba:4395:56c9 with SMTP id 5b1f17b1804b1-4bb55abc204mr50450745e9.26.1794567966971;
        Fri, 13 Nov 2026 03:06:06 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55af2901sm51822975e9.13.2026.11.13.03.06.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:06:06 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 13 Nov 2026 12:05:32 +0100
Subject: [PATCH v2 06/11] firmware: arm_scmi: report the pin-only and GPIO
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
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-6-faccb4685d88@baylibre.com>
References: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
In-Reply-To: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

Keep the pin-only and GPIO flags that PINCTRL_ATTRIBUTES returns for a
function, and add a function_flags_get operation to read them.

Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/firmware/arm/scmi/pinctrl.c | 42 ++++++++++++++++++++++++++++++++-----
 include/linux/scmi_protocol.h       |  6 +++++-
 2 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/arm/scmi/pinctrl.c b/drivers/firmware/arm/scmi/pinctrl.c
index b071d31b5c33..1bc4bca4c48f 100644
--- a/drivers/firmware/arm/scmi/pinctrl.c
+++ b/drivers/firmware/arm/scmi/pinctrl.c
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

