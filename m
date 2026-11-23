Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795447293;
	b=m+/I6EQ7gvQQu+45mrxMGFiCHR2DJ6HqayrrYZLSMuvzEpl1igUjZYznMPcdrLmXZllR
	 LghSJAghJvibrfM/zK45usJZM8S5g2+FD7rDUfd3iNiyHia+o/oBNNe5/op7A8CdtFA5m
	 cB5weIe3854tLqz8F08uS+hKHNok4HL46Dx6dPW2IGQI31slmXXEsok4gXFG+U6qKfHq8
	 FlvacuuuGfR4nXNRIOyMLoKsYSfvuf5Cf5uIv8o6B2YKr2Lxifp2TWIRygszE4EGu6Qck
	 H0ouG2ELVC+2SWhb63oehJLS4GcvuY8u17s4IL+zh+5bCgpJMCzgLSaWaDidUZUoD9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795447293;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=Tzu+AkAZn6+BM4Gh9gxc/QFjQzzUORAibHelZ267KOs=;
	b=SGpocF9C15R4zbURsIpyEmuzvVaqgxmUYZCt43Aa7+WeoM3KnILs0YZvOQngtNS5Bs6H
	 seR63ueYAvxVGBhBnse0Th4HArVHB8rn0DGxAKhbCfI9A5DkxweTgRG+XuMlXqhj8qb8I
	 vsPAvkH8NklrbkJa9XZKNJNIXq6oxE+XSe6cDduGxiQiDPjbIP9jNnXHcxrHrhqpAqEd5
	 AoWd1okFr/z2YuS58ZerbKzNpRAjMAhq3NfwzPDcmJ9wqbjAdnrUvdME27Z2wKXKElU2v
	 ljgRadBW540nYsq/ilZ3f8M1wuNPM4j5XtDNPmLXT9O46eshprGdYscH99S64PnQNQA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bXTdx4tv;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949F2606A680
	for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 15:21:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 949F2606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bXTdx4tv
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so2732202f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 23 Nov 2026 07:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795447291; x=1796052091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tzu+AkAZn6+BM4Gh9gxc/QFjQzzUORAibHelZ267KOs=;
        b=bXTdx4tvohK72GoHLOxkkGD9DwiHrUpMfwXxr/zqn18JqrESbQYap3hX09WzNeStmU
         JptDL0LdtxhIqEtBvTPVB6ft0jN8rUkuntlrlLhD4zOManTWxiPN9Pt34PZrLi1PEV8u
         iZGwFQZHDmw38obBBCl/x8wcpGfbbuZmrKhrdLJB02vUEHqzlvmaqkLtXxNUE/lunBWF
         uBxsyuL8hklIWu89Mtbmcfla90gaWbwDpzk1pCnFSw4Drf6TxsSYLTTFMGf+2/D92I3K
         IV8xxAkvxwXqTPsVEQ/FI01qQqHRxHPxpG9JO+sZhHswPy48JAxMSZYnsYi3Qwf5t53/
         +Z5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795447291; x=1796052091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tzu+AkAZn6+BM4Gh9gxc/QFjQzzUORAibHelZ267KOs=;
        b=m4BSu4akDJySPv48iy6+LyE1hvtbqfpGoFyyAp88LrmlD12e20nNMANL/FTDkhQkZd
         R7b+uAXs/Io9RgcTA14DvX4ykLechMus1o/4osOJMAv73BTbhQZrcIEqwaFqPaO+bGdP
         J865l7QfTcaqN7CmcGPcOJmhcuZ1L55JSsb5APepVz/fHtx7izUTUW5DsT1jRaiwpIHl
         NENt7uE/O55FnUABZvcQBep/KPILERes/ZDzUOLHzjqIf/ePmkSvO9JH6nEc8Dwao1pC
         MDpDvhNMfI3HGay4wnU14mGWk/LMyjL8fJYejRiud2KWsPWMMfB1Kr7UBCyFrVEL1N5w
         MaxA==
X-Forwarded-Encrypted: i=1; AL+hErFY48rwzTUjfkVB/Cwh8HM/+l85yYKSprYe1j2oDhzOwgJ4UEmBPpzP3xCFU2lKQf7glC+CuRjA/ky1@vger.kernel.org
X-Gm-Message-State: APuU4Z8JkbEH6VITmodAm2JUiwCD1iiPyc4/70s1zW5pAJ6b2d6Um7Yv
	U+uUiPZYabxjHDnazsuOt3iIKpEHgh2UqCrptsxpoZeASrnI7jYqrcAFo41vJGW8Bxg=
X-Gm-Gg: AZFdTZdfqORTnQYTOJ5S6h7LSxvh8lDY3aJ1lPKdlBiK5qwcDOOIlXnc9aJC1kbQqLv
	4+3l+Ber6I8JO5ejKeAkDAVkYVyKS2FyBbSoMCKumrf3tAYzud/5KCHoYjz0Qjwyg/AJDk4jwgj
	+z/UE5ViNYRJrP/l7pT1lAv0TC2RDrlftU1jzmM9gQ5HQVuAIjQnDn4YGq6+4SbC9ty5lgbGvsn
	bRH5OzYxw1f68cbOXD0JkWObspBQ9R1yQ97pm+cLQa5+Io91IDvF/VH/OCrqH5UOY+DR79syO6F
	k9wisr67Qo0v2MrjZPK6Fm/DycCQimqhB1N+7ywcwUttUnrB5MNFDsTJNSrcbfYA2M+8mJeoOdM
	5reXxeswr4+9fJSz4xNe4mav2fHdMZb6ZVSOuXGwB8WtjBYREaw2gTHhcI4IuCinofWmW1AQJ4K
	R3/sws1zwkS+84zQdcZ9lTJgoHHQATwmNlGxUJAMVlWv/ppr5b4RyNSB3K8aKlKHzzRMtOQ2RFJ
	tiTGFPrR9/ZQqG+/iLAjVWkYmnXUAIf56wqg4zFphty8RUyNRrfYQYZGrpMEINOEAn9CjJL9Rkk
	iaPIu9xNf4m+QElX7dP5SYmARESif1TxEuV+gBfCTLtA5ze0ZTM=
X-Received: by 2002:a05:6000:4b15:b0:48d:df08:307c with SMTP id ffacd0b85a97d-4abb8ac0d92mr20347784f8f.44.1795447290982;
        Mon, 23 Nov 2026 07:21:30 -0800 (PST)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d60sm23236628f8f.3.2026.11.23.07.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:21:30 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Mon, 23 Nov 2026 16:21:23 +0100
Subject: [PATCH v3 01/10] pinctrl: scmi: report an off setting as not set
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
Message-Id: <20261123-clegoffic-pinctrl-scmi-gpio-v3-1-d61f039be008@baylibre.com>
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
 drivers/pinctrl/pinctrl-scmi.c | 43 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 982c79bc77cc..b088a24e4ec0 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -153,13 +153,36 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	return 0;
 }
 
-static u32 pinctrl_scmi_map_pinconf_arg_get(enum pin_config_param param,
-					    u32 value)
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
@@ -232,7 +255,10 @@ static int pinctrl_scmi_pinconf_get(struct pinctrl_dev *pctldev,
 	if (ret)
 		return ret;
 
-	config_value = pinctrl_scmi_map_pinconf_arg_get(config_type, config_value);
+	ret = pinctrl_scmi_map_pinconf_arg_get(config_type, &config_value);
+	if (ret)
+		return ret;
+
 	*config = pinconf_to_config_packed(config_type, config_value);
 
 	return 0;
@@ -390,7 +416,10 @@ static int pinctrl_scmi_pinconf_group_get(struct pinctrl_dev *pctldev,
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

