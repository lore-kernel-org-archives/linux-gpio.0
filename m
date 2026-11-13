Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567966;
	b=1TVn9fEN7QrqekTeZzbjQIQdLIyrTann4xrn0jigcpt888JS1++NdgfkQhXd0ja/coFn
	 krMl1eYEDIzcX9apQozfD1JT67e3bhP2JuiujuKb9WH1nZ6nRzA1XUWOYY1+gmhZueofp
	 qKFjRDUwGqjw2pOqt38y8z4dZOJFTFGOWoLHjt3N+HAWB8H2UtxPSRTg8r0c2atFk3qCN
	 8HOE49fFBYuepW+phWY7LxAXp7ASMBXAJvRzM8DGZ0axPr8PxTjOriAu77KHaDwBoeeMj
	 cXGt1BVdKRdI783SrlGAFln9yobEBf4OLjxIJJDhwGKj+7ywtLXzlVrsSP44RYaxK3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567966;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=eOLY3dlbAwNdoJXtv7cVJ37SerT+IG/dv7/ALlwvJrA=;
	b=YyMmda036TaAd6z0g6AE/ww1KkwfMBTriqyghup0QjdMgWbGiVGyhXx+8zoqylnO+tM5
	 w9qlHyb91pg2UsqAAkNLUp1GK4f3IuEEn+AWk9VM+PbAwWvyvRzVK22ZLjdIRLqBxU5Cf
	 egx7lUGf1/e8ufwXT6pr/XAitCArc252oWeQHEXP7aEoDHk/xsHWrURU2w7l0QRlrIiqI
	 2XVvlratl43vh5hRYnMlrINvSw/MgtFzqfyeexCqysHRfHkJ4/DAq2hy9zeE2zInQKyXC
	 zWu3wzyzwr+z071eCCE365e+0WdllaEDD1iDDnPRa1P3iW86MppDK6qtfSobiqcoQPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Dax6wfLM;
	arc=none smtp.remote-ip=209.85.221.46
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F1860A5BD0
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 11:06:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46F1860A5BD0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Dax6wfLM
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-491aaed7565so313952f8f.2
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 03:06:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567964; x=1795172764; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eOLY3dlbAwNdoJXtv7cVJ37SerT+IG/dv7/ALlwvJrA=;
        b=Dax6wfLM43BtWlBdA6TmhsSZHQD43usQ1eUz09r4SYV6X3cTpfuKNpnJowxd2Nnc6x
         V8Vl+p/fK6O6Ja2lE4QPI3zSJ9Z2P8scxjQJVGGBz5QMivQRbmgkoU4fOXAgZ9y4IFNT
         VlqRr+XSHoTIKClYnW0Hd8qVnABWREGfUg/WQry2O4Sqts8w2o1R5i/O5Gp4SlH1xdGb
         6/dLbwYHjzImuQxRH30LhVOSdtgDv9mzb4+J87mGoMrqQ8jRDtnuP22rnViecaYCXO9w
         yynsN0S9BsSgM1cuU/lrCjKVT1TUvCYl4pbQTgtm5cH+Jmr0mKwpi2nfq9qKbb0mObJ4
         t0wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567964; x=1795172764;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eOLY3dlbAwNdoJXtv7cVJ37SerT+IG/dv7/ALlwvJrA=;
        b=1vNZqcRFVxHUNQpGuq646y4DDy9LHXuJd+CD1oe9rF4YWmUOYX+TtR6Im2uzVnypWp
         bShFdnwNN6cppl5Qkrs6LcZnhLbYvLzvsB6vMPHZTKnUKEjzGyWdV+DNsxYGykAuOpSo
         pFzuEXD5/z3XIB4lBYvsJhiA5WcJANeYX/EyDbFHpFAsYcAigC1stLDcKbeWGiA8Nr5s
         fIyf8viyaEr/A4JcT8tIKvdk67Cz1Py240v9QHEewpiwd7fcS7xx032mLO1Eu0PXPo3B
         U35D0SCy0h88jIQVhQdcfR7RTa+pMbKuoNRLH2f4i7o1WvCQpMgZ6L71yyPv+0ky8BL1
         4dzg==
X-Forwarded-Encrypted: i=1; AL+hErF+YcT9oILN+ZOgbAnp0Dx2znZquZU5On5eZPw1rJLfKBhbYGHPDRykLWLIpggqynmvrK20S3ctiaAP@vger.kernel.org
X-Gm-Message-State: APuU4Z/zVHdXpiNIvxBWaBTUDEWed98KZU2MjqprUSsu1pHfbwX4eN/S
	PbBJ7caCFrFYEvkjocu/RMLO2PfyNh0yMuiAedAdOxBG+uCA8u6T8TIHAqXJJ345uP4=
X-Gm-Gg: AYBFou3sSE1GeuDcNliG64vwjk7hwIUXpkazKowqN8tHd/kpT+6gQi/0hndeOKzC6vT
	aLkcUHVG/Nx6myy8LEBl/aCUIKQdAGvYciLXV7Vv/JkpTcrMyEOk34vazbMZBBhy/vnb7cpRiCT
	m0CiDWnMVxROgcEZpZX1GNThiRTf0YGwiB3X34umpcST90oKFJ9xcbqGI6l+oui0eCePmcFKdEm
	NNkjZ3Tomkn0gxP8kf8pHf8WqtEdsBt+ufLqMJDGdvtiVBBq9TH6p6LzDu13Aayq5lrCkIFx6Mz
	Wd73MoTIWSDbv4N3vzPzWiCQD328GrjJqCzN9lGYJ486qSuz/i686MWOKeed4/shCYlQibe4ZSj
	RAPoNsYWn8h9FQCgyqeox7Fkz5l5yA9AenIU63UClfmho7eUBkmHFxXfKlTf3PVXPXioc0Vq8gm
	JUvAg46q4mqNRN6+1SenIF31FTBaVdQg+3RlPjdkNlPlcBsAGFP2797rDxHg++nC0CNFlVB2SLW
	v5eX/enr1N05ZCSIlEAq8jGHNzTDUUE4XaTiOuGFkq/XrQr48UhfcDfKOhQpfqCUbwXpl/YswI0
	QK8Bv08Tr2rC4U0Suh3H/aZ0c6uayx4fhmh0
X-Received: by 2002:a05:6000:2c03:b0:48d:f4ea:49c9 with SMTP id ffacd0b85a97d-49c73ecf935mr5406877f8f.54.1794567964456;
        Fri, 13 Nov 2026 03:06:04 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f1c0e0dsm4600274f8f.15.2026.11.13.03.06.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:06:04 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 13 Nov 2026 12:05:30 +0100
Subject: [PATCH v2 04/11] pinctrl: scmi: report an off setting as not set
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
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-4-faccb4685d88@baylibre.com>
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

A get of a setting that is on or off, the flags and the pulls, returned
0 as a value, so every one of them showed as set on every pin. Return
-EINVAL when the platform answers 0, which is how pinconf reports a
setting that is not active.
The input, output and schmitt enables keep their value: 0 means disabled
for them, and the pinctrl based GPIO driver reads the output enable to
tell the direction of a line.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 42 ++++++++++++++++++++++++++++++++++++------
 1 file changed, 36 insertions(+), 6 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 221dd8d30009..b088a24e4ec0 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -153,12 +153,36 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	return 0;
 }
 
-static u32 pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param, u32 value)
+static bool pinctrl_scmi_pinconf_inactive_flag(enum pin_config_param param, u32 value)
 {
-	if (param == PIN_CONFIG_DRIVE_STRENGTH)
-		return value / MILLI;
+	if (value)
+		return false;
 
-	return value;
+	switch (param) {
+	case PIN_CONFIG_BIAS_BUS_HOLD:
+	case PIN_CONFIG_BIAS_DISABLE:
+	case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
+	case PIN_CONFIG_BIAS_PULL_DOWN:
+	case PIN_CONFIG_BIAS_PULL_PIN_DEFAULT:
+	case PIN_CONFIG_BIAS_PULL_UP:
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+	case PIN_CONFIG_DRIVE_OPEN_SOURCE:
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+		return true;
+	default:
+		return false;
+	}
+}
+
+static int pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param, u32 *value)
+{
+	if (pinctrl_scmi_pinconf_inactive_flag(param, *value))
+		return -EINVAL;
+
+	if (param == PIN_CONFIG_DRIVE_STRENGTH)
+		*value /= MILLI;
+
+	return 0;
 }
 
 static int pinctrl_scmi_map_pinconf_type_get(enum pin_config_param param,
@@ -231,7 +255,10 @@ static int pinctrl_scmi_pinconf_get(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
-	config_value = pinctrl_scmi_map_pinconf_arg_get(config_type, config_value);
+	ret = pinctrl_scmi_map_pinconf_arg_get(config_type, &config_value);
+	if (ret)
+		return ret;
+
 	*config = pinconf_to_config_packed(config_type, config_value);
 
 	return 0;
@@ -389,7 +416,10 @@ static int pinctrl_scmi_pinconf_group_get(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
-	config_value = pinctrl_scmi_map_pinconf_arg_get(config_type, config_value);
+	ret = pinctrl_scmi_map_pinconf_arg_get(config_type, &config_value);
+	if (ret)
+		return ret;
+
 	*config = pinconf_to_config_packed(config_type, config_value);
 
 	return 0;

-- 
2.56.1

