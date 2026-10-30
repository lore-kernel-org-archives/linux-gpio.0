Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375927;
	b=XbhOl3RGAq00usn95vUTjddCw37bsw/YY5sxnOIy+SwKYla1wY8fVXPdl7hH/mhGw5zN
	 HJ+226IVdwDE+ZSEGpTdXWSGb4p+k3+610E81xA2w1EB/TiWXmAiqYs6tE70oSJEUm69h
	 3SayUCMdibdQOwiYmyv+TRSQ7V+A6SEZeQdVf/NBBML3s5IterfOSNqW7amZriWa2hQ2p
	 pEUu7bYay3/wdueD7m0keHhyeM09EFBgYz11dsU15W+Vulnc6ACLGjo1svv9VTRzhKoqP
	 yruCKgngU6B8iIGtTcNiwKPbGI03XGGDNuXNbzdcplZ+Hug7TRIQaowGsMIccYBKkKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=+6SsPHwJUHdg8UtSBRexcGvngpP8qAWNWX4nbxKwphY=;
	b=NdiSyCBjlwgSPpeBoVSIQF6yLjalsZ3HK6VqMhwkIIlJGFa26mAa2HFR4UHlg6FgJsqR
	 uHX2avx2pvsDy6kd+IsLM/fWloL7CKP/HuQ0kWA9+iFVwYOoKgBL27ptSX53Q0G62TPY7
	 c0zOmnHdbVkLMQcYKbXvbnU1u/4KAG9Dx3kky9jUMWTwjH7/C4RsKpm10zwhPkANsZl1x
	 GOx0QG0UBCt7ChPlHNtmYKUmRgprLaVJMqwQSZJI9I1BUzy4tj/O5ZpOdOoiy85nb6On0
	 ipyxgmig4i0X02ezlc1CX3EHQ71eELI7XxB7dt3DmA1/gGIQz4JliLPlvI7FGoWIRwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kKSE37IY;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76206606A32D
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 15:58:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76206606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=kKSE37IY
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48df4f540ebso450985f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 08:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375921; x=1793980721; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+6SsPHwJUHdg8UtSBRexcGvngpP8qAWNWX4nbxKwphY=;
        b=kKSE37IY4tR0VHY9EXEL8p84om2UYfBxHGJSEgN8DR/uQau75xg2dp1KzF+mSl7ERt
         NwCi3T727jsel2UXhw1UZs0r8tYlk4W9W7BfSGmy9EBecq1zmR6PeS3Spi2VTiN4PK1F
         mnZdZA4pEdbik/EoRwFtraCBmbkoDl6tvawq9aiqvYXzggQzPfHqdCDGjTcF76Pzv6ZO
         DNgusd8cxEZCIhasF7b32DFW3TnRptqBf/DFJILDi+CcXho1FHPWjpUL+mF8t16BS5E/
         sh0+XCtQrDQPrUESWfGvalla/3lVm1QRkFM4H5R5IISjw5kcYe8cLSnUa4iXSirhrpks
         HDXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375921; x=1793980721;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+6SsPHwJUHdg8UtSBRexcGvngpP8qAWNWX4nbxKwphY=;
        b=LZyA1F3zrsra7K5LNxAsKKFmFdkbi7ZcWd44fKEciktHo8nbEhKPH7X0YKGiqCEaEM
         U/ZWmtSmNlsvifL1LWOlcEKANFTmzpOWk+MRuoDivl+xVnt9zkE0v5GV6zZ4mame6Ack
         9pzK3Fbx4tKC4zjR0BIJ75PO7KtNcSO0Q7PNkcVl8Kb7BoqI5mluk18JQu9gVAweNfGq
         k0QdPu+HZy1mcDkMFglTVztKehlfTtDc4A8ZRZVtKfWjmO0KmP1SKXYMEi8ngMkUExu9
         A5vhiPtz4fg78cg6YYT2DbEMxYgvy/uWaF2XXQrlLcbM5K//Iyk6zsdcVR8nXYzca7zd
         3B0A==
X-Forwarded-Encrypted: i=1; AKwUvBwh1jvwSLxdIBHVo04O0BoJoVa6LxC4HJVpCTdSB64ZwyB6tXF9XRoCLqIO19TIZyjFIciXlKWgNNIn@vger.kernel.org
X-Gm-Message-State: AFq9FYIHoXIyBXQSih7crqg9FWe8q1DpbSGzGUa/HNu6zo+eoyKdHaj0
	9a0JFiu4ZSHHgPremDFiMWO7Ltw7qJiFmTq8vbWwd8wQV1G1eQbNxwZ+x1cdN6VY1eE=
X-Gm-Gg: AYBFou1n+gYGATqWEDz+hjmeEBbEjkCj1ASrG/GEgvYgcGWZfAX2/wZ5j9oK9riPCYS
	JXO1fyriXYiH4ujqD3iNf08gHI3lI9Vn0Z0zQ6o1j29v/OY1o2lr8OPP4DzuwCSfpNyv987rXuc
	eaYNBn64cHkjdjvohR7mT2+50s8QcLOHlW7h2YkoRj/wYcybQLucoJvSO/IvXm7HPqlx1QiLDQY
	fGFglATceFkGvS4RYU6zpL0QhoB78o/BWvDClaw85N4o2ZP89ShJe2sgLBQX7/T/GDXBcNZWZZ9
	gw0qFhW5WXBL0e8of7Dzbjlo4HoMmwkzZBOqzXnB+VYq7o0UJtH+Oo3s26SkdfaZn88RpzJn/xP
	nyXnE5RveGjYCRFbnBDR2YjyrQTJkAho8gZRUsMWj2Sm48NafM5x08VDMm3QG6Y8GvFBVr+DZrs
	7DRATS2YU9SD2zi2Pud1Cg9GhedHmlaRV05A3AegQFwJ5euJ7hW/2OB2/Eztrxg4bqydnIF9Yk3
	alFUt7Z6QyF/vWbvRtL7ePT+BOXv8ctBbbTPD9w43Bb/5nxJhpsl4NcRW76T8SRaTp7KJVySyFR
	kx/OjJ6rPWptaNmqPH++l/Cs7bzAF8hdyBEMQV8+dc/BQ5wIjh4=
X-Received: by 2002:a05:6000:2211:b0:48e:62a9:1a65 with SMTP id ffacd0b85a97d-48e6e5161admr5584728f8f.49.1793375920865;
        Fri, 30 Oct 2026 08:58:40 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b725b8sm3966174f8f.20.2026.10.30.08.58.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:40 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:37 +0100
Subject: [PATCH 06/11] firmware: arm_scmi: report the pin-only and GPIO
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
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-6-52d92843ad97@baylibre.com>
References: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
In-Reply-To: <20261030-clegoffic-pinctrl-scmi-gpio-v1-0-52d92843ad97@baylibre.com>
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
 drivers/firmware/arm_scmi/pinctrl.c | 43 ++++++++++++++++++++++++++++++++-----
 include/linux/scmi_protocol.h       |  6 +++++-
 2 files changed, 43 insertions(+), 6 deletions(-)

diff --git a/drivers/firmware/arm_scmi/pinctrl.c b/drivers/firmware/arm_scmi/pinctrl.c
index 69645ce73d9d..ba602242754c 100644
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
@@ -623,7 +633,7 @@ static int scmi_pinctrl_get_group_info(const struct scmi_protocol_handle *ph,
 		return 0;
 
 	ret = scmi_pinctrl_attributes(ph, GROUP_TYPE, selector, group->name,
-				      &group->nr_pins);
+				      &group->nr_pins, NULL, NULL);
 	if (ret)
 		return ret;
 
@@ -702,7 +712,8 @@ static int scmi_pinctrl_get_function_info(const struct scmi_protocol_handle *ph,
 		return 0;
 
 	ret = scmi_pinctrl_attributes(ph, FUNCTION_TYPE, selector, func->name,
-				      &func->nr_groups);
+				      &func->nr_groups, &func->pin_only,
+				      &func->gpio);
 	if (ret)
 		return ret;
 
@@ -765,6 +776,26 @@ scmi_pinctrl_function_groups_get(const struct scmi_protocol_handle *ph,
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
@@ -785,7 +816,8 @@ static int scmi_pinctrl_get_pin_info(const struct scmi_protocol_handle *ph,
 	if (pin->present)
 		return 0;
 
-	ret = scmi_pinctrl_attributes(ph, PIN_TYPE, selector, pin->name, NULL);
+	ret = scmi_pinctrl_attributes(ph, PIN_TYPE, selector, pin->name, NULL,
+				      NULL, NULL);
 	if (ret)
 		return ret;
 
@@ -833,6 +865,7 @@ static const struct scmi_pinctrl_proto_ops pinctrl_proto_ops = {
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
2.56.0

