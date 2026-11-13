Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567962;
	b=CcLwJBwxVq1qVnpEUUfu6lwMuTNJgeR4NRbULD3XXMDGchDymf2PFiZWO593hqJi/coe
	 laF9p4yy7wfA6KZqL0jo+iNY1PPia0SHWK2WfmcAcnqB5zoaJhQ7Q+LIJADMUCnIn0orm
	 V8ejMQh2eXhzO0DnSO2WweUDA5B7jMVR44A3Dk3jh44WU+rifu3iQl5UpW44hp+92OmUx
	 A866wwmSWlvzqOvkcEYbwa7oDI/JayvTudkzkufQ8600wTSPXUjsTs8sh4f4gxBqLi9k0
	 G6/YBD8Sy5aqVqEegM7GfA8wuL/fASkkBD21k5tnKtYngRSJyYA1z2IeFZJA2iHAH0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567962;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=DAyYccB2SWSa5VOhu+aKyrT2qwAelCLNdrL/lPHwb7k=;
	b=UIi9DBcUyB/9/L0GZuvZpC2EcYjYp74b6SyrAS7Wget9/QP4fNsVupjzExkunDDsdJRn
	 N9kdjtfsGYYz4VDZURn/EXN8P0UR5cOoYeKeOzcn3EUUyUBdqgm5eD5zxR+0NNhu0lpS8
	 drFwPXqcRYR54URYK1kc55M4b2Nr0VIsu7ciICRnlEBxw0rjE4B9JvuSqhRIPZzPcupvd
	 xrnHiyxVPk361P5M3B919ikg1lZe+AKKrdHXTSxB7xJCHx1uGtqma24puTO3hOBJbkdk0
	 TuLYVwzfRqzXVDWPpTgohMasP5AhKapZq5kaF2++BpEALra5rh1n6w7iAtsIW89IUjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Q0stmUr8;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD47606A8BF
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 11:06:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4CD47606A8BF
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Q0stmUr8
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-492fcbfaa87so382033f8f.3
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 03:06:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567961; x=1795172761; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DAyYccB2SWSa5VOhu+aKyrT2qwAelCLNdrL/lPHwb7k=;
        b=Q0stmUr8PTKJuq5N6R/dpqs3w1uJTNwjXaiy5/BcEIu+sR+HfsvNTbuyRo/2EHzqta
         2ec4y9eonNqLWjNScrUF3ERWWbomljVl2fttnevRBHqFgS4Ex5NwdRr5EkGb8QpJUBAe
         T9nZNf1N940LB6Pu2oApIkx1ICugTaYYuwPdlPd7yKYa/f8mbC9FuwwmimHQu6T5D/sa
         TvTaTJ5FifJIzFcWb3OsA9B+Q+Pz7iZYXvMCmJOmSx7KepQmmH0OVb06OBfgmIK8hw2O
         7ZZOS6k6OaJBQ16bzZ0DCNlylFgQ/gyzEkDxulSZAGSfKI/2IN/KMXhM0zUkejQdr0yB
         eAnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567961; x=1795172761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DAyYccB2SWSa5VOhu+aKyrT2qwAelCLNdrL/lPHwb7k=;
        b=OL+YeXo2QcdBs+m6B16T43RFm86Dq1vfQoiXpgHL8AXgMLsRqGy0ihmEa4Et0S2xt3
         R/HcwGKG0Yr9BkUC1JhF2LcSwCoRjvo4+FZBViutlKg8CLO3jgiXDMtHUR8gMQgSIpjD
         0efEIUyxjW9i5eAVekxqwJteKhrRYHatOgQQXXg47HXRWm8OzJ4l1x4iICzVsAEOO8bb
         vtZz9QYes+uL8m0slSQEo9+TkVCHP7OAAI5is4JIjDdMJtUO9qbxNXK+pL8Lgk0i+uDx
         L8NkE9BDDcHOaGel2K4nCK9necgeBQqGEAR61oRms1JDxSp+AzrEnj2tkPikj44IP7mu
         GuwQ==
X-Forwarded-Encrypted: i=1; AL+hErEGterF+12T8T9Pq2nE5ONWBPCEKR9eTwtEhuSTe9M8GN02GW7JhYTNiTv/T/KGyNQH1mqV2daiVrIk@vger.kernel.org
X-Gm-Message-State: APuU4Z/IeFE/HxqlqsE7wqrQMa0p36fRXUZ4Ofk7vyzZ+tYDvzaD0kIx
	GCAlIbhYmHhBtcRW7KrdSygOmVmqxAZBF+/L/khTtl/u9Apbo9Tz/tGf4QlAGFsv6cA=
X-Gm-Gg: AYBFou2qjNfnCE7jtrYUfoagHCcGMoxNHSNF27waK4QvGc/XcqBAEvcC5TAqhrVZ+fQ
	/XlNJPX+C6EnAn6X+qDpC1rIxem0We+m7yIEJLe0/LcKRMJjD1ODyGIKnelw6KMreU0815xZRco
	gfn0Rz2dWPVwTboZ3uY9t7S8jw1fxpG0sUr8juD9WxuvYHJPA0DWjCYmXVois8bCtLG+gcMMwXm
	6+KxQcXGwdqSLscTioGF5kgBwrCl2qp3uEM60ajQBR/1Fn7Hd0VcrmoAQDTFdaZ+gM/Bp87jpTZ
	W+6wN5eDWIAwebcV3q9aDn2B9s1pzJo9HrlC/oO5FVwaoqPEH3hXCtYTMQAVjJ3E7SDLui6p1rn
	cG28nc929zCrZvxe2H1dxRkWryWP7J8lTYlS8EHQ14FxLIQ4lQ08vNGsUvw84OWpsBG1P+ldew3
	lU8GdwEDHjp1cqULtb88nCrjSD6sue8FWTVV3K+4IHpZ7A7rZiXWYoAxHc2G+mrxP3QFsezeA1Q
	XgGB28DyTIQmm4Rm8HRGdncjIrzVsrl1VWXLua7QQFJK/GICQu5XBT89SUbkrbRX2e97Kk+8Irx
	5XTLv0wvhHoV/mRUcJDJZL7ERzsJVNi8R3wn0yLwEkAAf+TWjwg=
X-Received: by 2002:a05:6000:2909:b0:48e:66d0:664c with SMTP id ffacd0b85a97d-49c7316486bmr5048910f8f.15.1794567960637;
        Fri, 13 Nov 2026 03:06:00 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5d22394esm4813292f8f.3.2026.11.13.03.05.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:06:00 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 13 Nov 2026 12:05:27 +0100
Subject: [PATCH v2 01/11] pinctrl: scmi: send the drive strength in
 microamperes
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
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-1-faccb4685d88@baylibre.com>
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

SCMI gives the drive strength in microamperes, but
PIN_CONFIG_DRIVE_STRENGTH is in milliamperes and was sent unchanged.
Convert it on set and on get. It is the only unit that differs: the
debounce is in microseconds and the pull resistances in ohms on both
sides, and every other value is a flag or implementation defined.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 43d5f3d54a8a..af33ddd4056b 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -14,6 +14,7 @@
 #include <linux/scmi_protocol.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/units.h>
 
 #include <linux/pinctrl/machine.h>
 #include <linux/pinctrl/pinconf.h>
@@ -155,6 +156,14 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	return 0;
 }
 
+static u32 pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param, u32 value)
+{
+	if (param == PIN_CONFIG_DRIVE_STRENGTH)
+		return value / MILLI;
+
+	return value;
+}
+
 static int pinctrl_scmi_map_pinconf_type_get(enum pin_config_param param,
 					     enum scmi_pinctrl_conf_type *type)
 {
@@ -167,13 +176,17 @@ static int pinctrl_scmi_map_pinconf_type_get(enum pin_config_param param,
 }
 
 static int pinctrl_scmi_map_pinconf_type_set(enum pin_config_param param,
-					     enum scmi_pinctrl_conf_type *type)
+					     enum scmi_pinctrl_conf_type *type,
+					     u32 *arg)
 {
 	if (param == PIN_CONFIG_LEVEL) {
 		*type = SCMI_PIN_OUTPUT_VALUE;
 		return 0;
 	}
 
+	if (param == PIN_CONFIG_DRIVE_STRENGTH)
+		*arg *= MILLI;
+
 	return pinctrl_scmi_map_pinconf_type(param, type);
 }
 
@@ -203,6 +216,7 @@ static int pinctrl_scmi_pinconf_get(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
+	config_value = pinctrl_scmi_map_pinconf_arg_get(config_type, config_value);
 	*config = pinconf_to_config_packed(config_type, config_value);
 
 	return 0;
@@ -267,12 +281,13 @@ static int pinctrl_scmi_pinconf_set(struct pinctrl_dev *pctldev,
 		param = pinconf_to_config_param(configs[i]);
 		if (param == PIN_CONFIG_PERSIST_STATE)
 			continue;
-		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[cnt]);
+		p_config_value[cnt] = pinconf_to_config_argument(configs[i]);
+		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[cnt],
+							&p_config_value[cnt]);
 		if (ret) {
 			dev_err(pmx->dev, "Error map pinconf_type %d\n", ret);
 			goto free_config;
 		}
-		p_config_value[cnt] = pinconf_to_config_argument(configs[i]);
 		cnt++;
 	}
 
@@ -310,13 +325,13 @@ static int pinctrl_scmi_pinconf_group_set(struct pinctrl_dev *pctldev,
 
 	for (i = 0; i < num_configs; i++) {
 		param = pinconf_to_config_param(configs[i]);
-		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[i]);
+		p_config_value[i] = pinconf_to_config_argument(configs[i]);
+		ret = pinctrl_scmi_map_pinconf_type_set(param, &p_config_type[i],
+							&p_config_value[i]);
 		if (ret) {
 			dev_err(pmx->dev, "Error map pinconf_type %d\n", ret);
 			goto free_config;
 		}
-
-		p_config_value[i] = pinconf_to_config_argument(configs[i]);
 	}
 
 	ret = pinctrl_ops->settings_conf(pmx->ph, group, GROUP_TYPE,
@@ -359,6 +374,7 @@ static int pinctrl_scmi_pinconf_group_get(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
+	config_value = pinctrl_scmi_map_pinconf_arg_get(config_type, config_value);
 	*config = pinconf_to_config_packed(config_type, config_value);
 
 	return 0;

-- 
2.56.1

