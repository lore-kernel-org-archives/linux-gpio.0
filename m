Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567974;
	b=rnCzllh5eiWDfeijWP6xLnnN6e3xmUmQQHyzVdtGIviEi8cuG/ICQbbh2DaebZ6PdGAz
	 mIHMFohhXghlkZTLsyQMACFJHeVW5EVaYLI9Wdx8aJzYswjd+Y2wDKB7VmN1KnkiJR2+K
	 0mesACWgr+D6Yhkt+3Dg7HYgpmPyjlZOE22QLeMlDGFVXhvaDZ55VvmF9mCLxzZtaQgpb
	 4fQVQD28NYLjnlgaud6kOWwxlRNwnBxhP0GYLK0vWEwC44Bc2/vtAocAeZj4pzET/aIty
	 6Olt1HHFOL9krzSWblbhAxsgWT8e/d4JBqI5ouF2Q1eM9egGOHdiVwgEFr1EhVI53Mg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Gn2Nm77Jt/mbSmGIu+er14oinC1kKjEZRXiA8rzPuHo=;
	b=uyuCfRbeUf8+P5Vz7FhSzsjzB7lDm3TyvCMZqPsY/aQCFyHiSFFu3yP6imnuOCO6/JMr
	 4HnxdU8/i/ewIkG9q97zBXeKDC4wcnnY4qaDvNFmXfJ3HyyT5E81QUvhLKuMAOePO81ty
	 VA9FGAFMjOijHuA4wSkiRZHUhNa+h4+HC7t5SrHTKKCWBEy+qNwuhm3OzGiYibAw3087t
	 0yErnzT7zGg1DkGfXj5XuX9E+SnkKTDzsDs+jYpeSv1cAx3lSpUz1x39S1BWP1DagOS/Z
	 pEOkJ9c0hn+K0fcxzXqQ9Xtmg9I3ElLuC2x2jXzRwhPNKje/GhoBXBFnAoaLi6pmTRw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HMFFfnCN;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5AE606DFFC
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 11:06:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB5AE606DFFC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=HMFFfnCN
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso7580565e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 03:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567972; x=1795172772; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gn2Nm77Jt/mbSmGIu+er14oinC1kKjEZRXiA8rzPuHo=;
        b=HMFFfnCNG/iqlwECnoDWuz4cJGQBYA21EsuyENuOfZwmBVDLgbpPavV74cJ6gaqwwl
         0QCs8p9M4uy7DZesH6axJv9kxD3x5S+tIhNScCTHnJi4aUbA/lhJcFXhethGt690L/A2
         mYyNjJy7hldtzb6xYT8dVQC4AeQ/3tYEBdMR8OxETGptwZcXFdDqKA00XPCJjfUiM1r5
         bfg0c4mQghIMNmpn4AcIKRKG3CBXOG5cGwVmwCyY5ZSa8w90S4m1CLtrlMydkxQpEleY
         gy7v9OK5A0LYAlxt0AR3UsrstD3HQKpisXJhl2Gg9EpHAcyaybLcYimkcFMamgVV6hEd
         h9ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567972; x=1795172772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gn2Nm77Jt/mbSmGIu+er14oinC1kKjEZRXiA8rzPuHo=;
        b=HY/vX8xL9E/z/qAl1AMn1CSgD8HSHbiY3TqIDtdef/if67KpYRMjXWaNS4eRn8jWyP
         KjX3Qmvn8bxBPvyP/MkHoEBD18pPyQIwM/SM0yvQpnkVoYmW6vGGjibxSPydK2HBDejv
         yetgKdoMvBALrc2yoJrgGDNDzY16SEIY7CjJTJCw3fY2tDEd1/hC81E3aTgCiDdz3kf6
         7ill/yEigvIAtp9noO+6PtyfB+FbTT7thQKpl6HtTzZNd8baPLiWKa3D6e11BQab0y0Q
         fxZx6t1XnZKVqcZd2hzq7sgSm34/MBRq6HYpGGWwyKj8uOFpU7OFRIw0Wb/dPGIxcjMc
         WfQg==
X-Forwarded-Encrypted: i=1; AL+hErFmj5wKtZm0JoRYA9RqvDYwjUer5jUJHJWNC+sfosdmyRTZsa/t5o1t4ka7Btu6xqiua9/HNu9mLz7K@vger.kernel.org
X-Gm-Message-State: APuU4Z+U798m72AMEd0q0ealy7JheSCVuprRaJr4BL+3ZurNfXxRT64W
	Z6CYNg9P/e8R9XDiarRgA2E/ZTuhz/3GepYTJtmWNqJHMTyuoSiPZERm34MjXlDuas0qCcOthLd
	CoueK
X-Gm-Gg: AYBFou3R6SlO3ipXy1YTzmcCVLqpvxTZS5V4QzZgsWadasLRQQ981BD0qlMNdTncsuD
	IHZxHq+DxUuQsZ/OQ1DT64LhEa+I+S0KLXfrvCN7b9vcRny3X/hcpMP+EvMcGcpInsjvY7gAW7U
	xPuTJgBOUdFevQWySRhU3FlmE9KUbI0CR0QZGsr6Vw+ywrq7WOBMH8AZfKrHiiXRV53vpioVAOG
	63WWmns76O84+FZ42/T8vuUd7uwNXejdPDMuiU0Es6wQltFDtfLDiLuSBmRr5dk8GGZER6hD2fF
	YOcC0GDIbPUbVZMT1Bf84zZDfSSAq3XhtHJV89T+OmJFiKXGrQdjo9pXnKA/e5Me61ZV68MsQ4k
	5LdLSH5DywkLhb8i3k5D28RmaJT4m1fsmqpJ7ErTTVD39mGDE59w9T+FxnWpX/l7wQppiVKFUfP
	gHJYONeZGodEc0mx6x3zOBouzx/DO3KrRKA/YXSMNFpFU/SCmhWyg8Jd+FkKh6BAD+UtDajZQoz
	IDExafNoXFaS5QExVsDPgJA7FXfZTRKud69O+08SiNZs2Blcls0h+2hQzgxj8KVoeHNwa8X5oPg
	ZH80TubFzTXNyhGiwnkt5KFMaDeICZ2BXQGEOa582t/mmdjo8Dk=
X-Received: by 2002:a05:600c:45d4:b0:4a0:23f:8b0d with SMTP id 5b1f17b1804b1-4bb559f6f31mr46618725e9.2.1794567972226;
        Fri, 13 Nov 2026 03:06:12 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2adf53sm144097485e9.15.2026.11.13.03.06.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:06:11 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 13 Nov 2026 12:05:36 +0100
Subject: [PATCH v2 10/11] firmware: arm_scmi: add an operation to set the
 function of a single pin
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
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-10-faccb4685d88@baylibre.com>
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

Add pin_mux_set, which selects a function on a single pin. mux_set only
works on groups.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/firmware/arm/scmi/pinctrl.c | 6 ++++++
 include/linux/scmi_protocol.h       | 2 ++
 2 files changed, 8 insertions(+)

diff --git a/drivers/firmware/arm/scmi/pinctrl.c b/drivers/firmware/arm/scmi/pinctrl.c
index 1bc4bca4c48f..4e3968fbc5ec 100644
--- a/drivers/firmware/arm/scmi/pinctrl.c
+++ b/drivers/firmware/arm/scmi/pinctrl.c
@@ -790,6 +790,11 @@ static int scmi_pinctrl_mux_set(const struct scmi_protocol_handle *ph,
 	return scmi_pinctrl_function_select(ph, group, GROUP_TYPE, selector);
 }
 
+static int scmi_pinctrl_pin_mux_set(const struct scmi_protocol_handle *ph, u32 selector, u32 pin)
+{
+	return scmi_pinctrl_function_select(ph, pin, PIN_TYPE, selector);
+}
+
 static int scmi_pinctrl_get_pin_info(const struct scmi_protocol_handle *ph,
 				     u32 selector)
 {
@@ -854,6 +859,7 @@ static const struct scmi_pinctrl_proto_ops pinctrl_proto_ops = {
 	.function_groups_get = scmi_pinctrl_function_groups_get,
 	.function_flags_get = scmi_pinctrl_function_flags_get,
 	.mux_set = scmi_pinctrl_mux_set,
+	.pin_mux_set = scmi_pinctrl_pin_mux_set,
 	.settings_get_one = scmi_pinctrl_settings_get_one,
 	.settings_get_all = scmi_pinctrl_settings_get_all,
 	.settings_conf = scmi_pinctrl_settings_conf,
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 072190e89064..5cea4ee14a3e 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -789,6 +789,7 @@ enum scmi_pinctrl_conf_type {
  * @function_flags_get: tells whether the specified function is pin-only and
  *	whether it is a GPIO function
  * @mux_set: set muxing function for groups of pins
+ * @pin_mux_set: set muxing function for a single pin
  * @settings_get_one: returns one configuration parameter for pin or group
  *	specified by config_type
  * @settings_get_all: returns all configuration parameters for pin or group
@@ -812,6 +813,7 @@ struct scmi_pinctrl_proto_ops {
 				  u32 selector, bool *pin_only, bool *gpio);
 	int (*mux_set)(const struct scmi_protocol_handle *ph, u32 selector,
 		       u32 group);
+	int (*pin_mux_set)(const struct scmi_protocol_handle *ph, u32 selector, u32 pin);
 	int (*settings_get_one)(const struct scmi_protocol_handle *ph,
 				u32 selector,
 				enum scmi_pinctrl_selector_type type,

-- 
2.56.1

