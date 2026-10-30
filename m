Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375919;
	b=KvG9du3ukvhjuuz80mT/giTb1rHCxA9IKbtecd+mSH7GhYNneRrynSzl1/5ZllsVn5E/
	 ZHYdxYJ5KkYZFe6esHAXa1ZTPoBmHtGrx1zj4wsphk3i3XvlHCLWYPtwIEIIwMrT9X+kP
	 9KU8qniUK1yWP5GeRASRBnjWT4IY8Ne/M9fJwOGBK81enxRU7puVzsj4OISh8K2wriAhv
	 sGycjWfbwa5cUCWhXVQkpBGWfTWKGTwsdVgdiUiF5RgaDWelDqqAAA6ftpKCSmjYauxRA
	 sznZI6wzq3aQeHu9QmyEwrJNir3b/QRgAeX7JxBqwgmiDYkTB3M0eG1SlcrDLRGa6lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375919;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=G0RjRTX/jH5mtYZPXYcgJHL1PDTWZ4mnU4uted4PjiE=;
	b=NVRrpBZ730hZU4ATBvOuqtZmzvD2vSKI14CCQQeWWRIMMst6iGb1YwcABiq/nEuTARue
	 I9U9GJY9teyHmhF40ONKzAG5Hnf06k8RgYSbxsH7/yxcClgNIWW8g0h+T5820SZdnWqXr
	 WTQO6EhYo+wThxmGInhL7b9EssCyzoXsOiLM/wwFqbSEpC/en/u5L2/c9Zu5Ls+mSsSFh
	 aNY49kt4bWnFgNsVEkUa3+83CsgFQyLwc8SBF5/V2TYx2BS+JhPJfHEmSwiQ3Wm/e6VBq
	 hbFEsukVDfeChBY6bjC9x0ZoJ8A+ytNjEYgS9dUKcwMixC9vjCHaNqlA97SHSBXZjRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fbab5HK8;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674ED606A320
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 15:58:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 674ED606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=fbab5HK8
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49d05d51553so5370875e9.2
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 08:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375917; x=1793980717; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G0RjRTX/jH5mtYZPXYcgJHL1PDTWZ4mnU4uted4PjiE=;
        b=fbab5HK8y8wX1h6u51NvAWZytPsVMx/9Bp/G3NduLpiZtq22JP0dpsORhTBkWRBU1y
         fludwphpfzYzAo+EdGTm0Y8SixpuXyuGTQzCdyiO434bvBE0JeDgNoMUFlByuP8vyhh9
         g71q2T8jaQzpVnk7qpTPBa1lAkreue8/5kS19SSr9UlooAOF9fBK2V6SvGJHU+ekVv/b
         /DyWXQM8qoqcmizlD/wshtPqVOJGXkX9+qucfJJKB3Vjt7YIXwzw5HXk+IFvuTB5iPM0
         9CaDxpIyCXKeGFjLhX7pkOOVTvbT4Tnm35XNdQOsmiKJBn3vCgmiAQfTRn4PgRgMyra4
         PbGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375917; x=1793980717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G0RjRTX/jH5mtYZPXYcgJHL1PDTWZ4mnU4uted4PjiE=;
        b=dLd+WvuQqVsYPPzU2S3dNPmYHGbHq5Ls7gIMFZ/0to7XENj4aVEGesyaaGvE6buRRU
         EtmSah9HdYfEbhEX/wosYSGOnDpajb8+wy+b0Q0MqHXLTA1RfVahdTkpu6xE/mRIUk2j
         z1xa6lpVTeImgd/4ZajYmxRpYAscDrDPf3IOinbt/0CZadymmqwoVpPwYBtCSzb7AuV4
         zrVwVObElxZof+WZs7NymIRaDH77HQhraQZ/Vg27SQgif6hwgRdfeaYpnSFAVmqGdP2O
         5Gdd5kGhbgK+BiDlJVZjeQMV8lTsee0720FSWD/aNK+lvlzb7vtjdoNBH0MKjbqvmpoF
         3Xjw==
X-Forwarded-Encrypted: i=1; AKwUvBz2rDPhlxqmQWiu2CfmRKiGNrLZpLQ8wtcE6pi3qEGu1AvrL9x1DoIc94aWTYTM7Eio9wTbhzw1CPXM@vger.kernel.org
X-Gm-Message-State: AFq9FYK6SxX23hpU3RfXfHiPUryA+qaqc65b86CMWg/v8GlgisXBPoD0
	ZctoXxXYuVzn9zG/o0b7MITqzrcHIa6LPdGMHcRts8LA9/164F0uEMl2PK/szngXRFk=
X-Gm-Gg: AYBFou0EyVrwLSLm1bdL8IupT4eK1wMbsYOjcDt2XA5eJVhGCtziqmQlXrYfHlAQvc9
	ePTYwdOwJsRIqM3HnG7o47wQp+9JTFvTp+HKdLYScOygn/t9LiaQ3/NCdhcXXoFGakMvBJXzCnU
	nGILo3IiE/9UtkaPrBW0BumleWwYL0DfDnXMWtEKB+0iXEZedIkalhS3TpBTWilWiWuFCk3mx7Q
	3EpgMVx0yE6A++zqwqIN9RbulOzc8E4J8HjNjP2qUFIDn1WxY1B5fArWrqCxijcZlyPvzFUqW7J
	/Htnxn+VEA6o8C/sL7yNE0/+xQg4DaC+zjz+9RO55Mwy2WaZ0fC3mTg2HpVws2Pym1etDl8BWgk
	5G6fS8oPexPuCRT3DzIGIX0BplAJbaSOqRNpag05+xlLdx5xQqSqKe2y5xdfY9DjoJiX6Ib+SCO
	aJMdc0Y367ltrsfnoHE9eMnEyOXoUmX5vznHJAcdqqgx+EGwrlOudmjMeAtPQLWpGTcMXr5u6ca
	bkphtlRJNY+C/RaDPx+R5VfCOuMlUmBROHL/Pr6DWY5BFi7pLOdgrjR/Nj07dXDk0rW0azBV2km
	0t8fX3WdKGIiHFa/G1vasEztZtmFA5EHp0yFtC6mlryeQGt2Jfk=
X-Received: by 2002:a05:600c:811a:b0:4a1:d10c:7170 with SMTP id 5b1f17b1804b1-4ac1889d884mr57318135e9.31.1793375916707;
        Fri, 30 Oct 2026 08:58:36 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf5b286a0sm57000225e9.4.2026.10.30.08.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:36 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:32 +0100
Subject: [PATCH 01/11] pinctrl: scmi: send the drive strength in
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
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-1-52d92843ad97@baylibre.com>
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

SCMI gives the drive strength in microamperes, but
PIN_CONFIG_DRIVE_STRENGTH is in milliamperes and was sent unchanged.
Convert it on set and on get. It is the only unit that differs: the
debounce is in microseconds and the pull resistances in ohms on both
sides, and every other value is a flag or implementation defined.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 29 +++++++++++++++++++++++------
 1 file changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index c93d61dfa282..6bc94c68e89a 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -14,6 +14,7 @@
 #include <linux/scmi_protocol.h>
 #include <linux/slab.h>
 #include <linux/types.h>
+#include <linux/units.h>
 
 #include <linux/pinctrl/machine.h>
 #include <linux/pinctrl/pinconf.h>
@@ -155,6 +156,15 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	return 0;
 }
 
+static u32 pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param,
+					    u32 value)
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
@@ -167,13 +177,17 @@ static int pinctrl_scmi_map_pinconf_type_get(enum pin_config_param param,
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
 
@@ -203,6 +217,7 @@ static int pinctrl_scmi_pinconf_get(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
+	config_value = pinctrl_scmi_map_pinconf_arg_get(config_type, config_value);
 	*config = pinconf_to_config_packed(config_type, config_value);
 
 	return 0;
@@ -267,12 +282,13 @@ static int pinctrl_scmi_pinconf_set(struct pinctrl_dev *pctldev,
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
 
@@ -310,13 +326,13 @@ static int pinctrl_scmi_pinconf_group_set(struct pinctrl_dev *pctldev,
 
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
@@ -359,6 +375,7 @@ static int pinctrl_scmi_pinconf_group_get(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
+	config_value = pinctrl_scmi_map_pinconf_arg_get(config_type, config_value);
 	*config = pinconf_to_config_packed(config_type, config_value);
 
 	return 0;

-- 
2.56.0

