Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567965;
	b=YK3rIHpXbaqF+cmtC3uW8DSbm7CLX/Iqs4DCtVSvcVaFlvxCT+W8RlUZxa7Od6knYhFa
	 d3lleE4bdbuOa3vA183USQk/tRsrTXlgTKIHR8nou9BN3Ih25ccWknKDMsj9pxxwXQYxn
	 6vLkEJ2EthQJwpz/k7FKUTWsZF1Y+b8hDQEmnY0l5oJtuPYFdhU3bDPMpf89uN9yRaCes
	 8oQiF5aPC73DjQJiaruwsVomJh5MzsEOKBkYLCfLuYKm7Kc9JQo9092w/4R+AcVAQkVWP
	 OpuwpHNHdKC/7vSGMQbg1Lmo76l89VD93i6fXEPJ7QwQE972duIjjyM+CpY0Q7mH/ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567965;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=fVQXjjeDCYX44KU4ZOnbZ8m/y/+g7OYE9z9JJ6YDKgE=;
	b=iPS5/bDLZ9nTD6iyGLdhLt+heCNKBExQxVtHlo17rMS1M6/otmubrS6o+9eF+GCS2bxm
	 EN2K7QQL+X68RP9ikvNQUgBfXmeXERN0T2QHoJ7qxpgzRoiVfmVc38GagdQwrj2sQd8MD
	 qU9PYX+f1mu4TD9rcSrtI4jsr45Vzzg6RyHo18mbTBvdzaYQ02N+S6zOQr1gSnie5x8zY
	 RFdMfKq47+G7C1AF/HLlyByxmTo1Rdepb5xjVVn2QAbQUPe14UK7xNPuwsKmveG0eukIU
	 C0ndVK8l7mVZIY+YgC+TqFl4sBnYy0UsGGE704h9CJFga9GO3LKJQMjTK00fH6+A2JQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="T5p/H/ae";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FDB60A383D
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 11:06:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F0FDB60A383D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=T5p/H/ae
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so6286805e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 03:06:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567963; x=1795172763; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fVQXjjeDCYX44KU4ZOnbZ8m/y/+g7OYE9z9JJ6YDKgE=;
        b=T5p/H/aeUArPYFpqIPh0dCK/gfzgmw43sZx2L7r0jE/0pP2Txd9BxTYLUxvD4L/AcN
         XBNbzGLbVcEu25gpUEs8JdaztfVFr5FTURNEuJ/qNJuurRLGeGyxF5SetcskixcUEOid
         BTp55qKmYGwYPs+aU7C5/CMnvN53DIybnIJrsgW3itd98ivxFTRQqOEYR1jBhENMtGcN
         LqRM17mcTBLeNvZVC7/YYtXjAAJ71bJvS8f3EYlk1KHJMGKm5fi+BKNCMu15E7LsIAQT
         QyIYaO/BIu+UR84tXyDTJS3yJSB3T7Yh9B+UGzqZ5TmNi69p4MN7CBgxdVZxwlHeDF/K
         PCcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567963; x=1795172763;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fVQXjjeDCYX44KU4ZOnbZ8m/y/+g7OYE9z9JJ6YDKgE=;
        b=QfoaBITxuRlhmiG3O3a+DkCdDzpdjCWTBHPWcONwEu2jnMKNrydDFTb4U+mDNWiwNY
         lSOOJKGqC36EQWrDYBQSq+zzEVLE/XZQ1pZo+LMHQlEGuU6c8xsaotutqCK5DDLdF3ox
         OyvDdsAU1pyBwRwC/Ii+6TRttjzKiEqzFbFnCYMPjRhkLuvL3QjXJq2Q5sNcg2je9DOs
         fu4prPajBVlIRFEoQ+8Qx02aZmckp/xTq0KJNr2Ffv74w+SAiUXXBZfpYCW4Qc82qBL7
         e+62G69HVmvky+QsJPKidH43yuTmXXsLf7CtgH8KaxK/6ce5/HUotLSXvgU60IjjDbNh
         4m/A==
X-Forwarded-Encrypted: i=1; AL+hErEWNw3UNxyj0Cvq7FWZzWqlqdXBZTBRTuqtRSB6byjusIXUybWgn8xyKYaQMAPOlG3B8PdrKATiFxO6@vger.kernel.org
X-Gm-Message-State: APuU4Z8Qakp2oT5ytKp8PkHg4b2727ZcJr/2liC7LAMaspf4jm2tQT9R
	SsTASFa5C2TDVotyi7pjPvDaV0hxEj96l9WQONa3nSxAd0Tddtp94GZoJPDxcUTJJZY=
X-Gm-Gg: AYBFou1iFM/3BOF8CqBZGW4/npaht2fGKJpXIPiPOMLtP0Eqh0kPSm/nAT/QIVyniKW
	T16KnpH0nHea9ER3OnTcFKL5BNLQicU4NSvc1ge7cMpt7V7fTWj0JVqH2Dvi+uxmVmZeBA/zEGY
	wpEK4TJXzoQbaGFiSxFJYxdNeCZJoQC3NaUXgi+FnxOi3FvT6dlIQUToPs+hST1rsfCIyHCOeyX
	bdPvqjK36Qd6egVGEwHJPWz3v8Oy2h9gBFts+OTQ2ASE8FdwLJ/0ab6I3jM/KQfDtR58Zdyld8+
	3u7EJksoDVu0g371Dtokf2rHpqrviz9ThRDVUNQEuCKzhxDJiytzE1liaZWsUTbvD0QrT50ftEO
	M4kvvlD3Rqy/yFevbzLLbAQN/ZwMNaBg5xCKv1rWQIuvxdfD2QmC2P9UjoK23OzfIvSOrx6jXgW
	sr6JtsIoFXGhDzSTiCA7y7mZmDX9mzoU/SQbZp1WePdLjF+mA+nbSN5FUkqpF9N1eAfSBnB/yNz
	ejHnpb5nA0cbYCIpO4px/7Q8G1hoGsmQ80c33q+A59G3E5k8DxCGcDjU94tRaG13KoDjZGlSa8q
	VMXsKLjgkCAKznp1tREJ5Lx9x71JS/owG4NIYfvqI0wDwpTnTss=
X-Received: by 2002:a7b:c00d:0:b0:4a1:efba:511 with SMTP id 5b1f17b1804b1-4bb55a8a57dmr30894835e9.35.1794567963242;
        Fri, 13 Nov 2026 03:06:03 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5d2872edsm7329785e9.12.2026.11.13.03.06.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:06:02 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 13 Nov 2026 12:05:29 +0100
Subject: [PATCH v2 03/11] pinctrl: scmi: send the settings without argument
 as enabled
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
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-3-faccb4685d88@baylibre.com>
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

bias-bus-hold, bias-disable, bias-high-impedance, drive-open-drain,
drive-open-source and drive-push-pull take no argument in Linux, so
they were sent with the value 0, which the protocol reads as disabled.
Send 1.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index cbe4f3b6368f..221dd8d30009 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -172,6 +172,21 @@ static int pinctrl_scmi_map_pinconf_type_get(enum pin_config_param param,
 	return pinctrl_scmi_map_pinconf_type(param, type);
 }
 
+static bool pinctrl_scmi_pinconf_arg_ignored(enum pin_config_param param)
+{
+	switch (param) {
+	case PIN_CONFIG_BIAS_BUS_HOLD:
+	case PIN_CONFIG_BIAS_DISABLE:
+	case PIN_CONFIG_BIAS_HIGH_IMPEDANCE:
+	case PIN_CONFIG_DRIVE_OPEN_DRAIN:
+	case PIN_CONFIG_DRIVE_OPEN_SOURCE:
+	case PIN_CONFIG_DRIVE_PUSH_PULL:
+		return true;
+	default:
+		return false;
+	}
+}
+
 static int pinctrl_scmi_map_pinconf_type_set(enum pin_config_param param,
 					     enum scmi_pinctrl_conf_type *type,
 					     u32 *arg)
@@ -181,6 +196,9 @@ static int pinctrl_scmi_map_pinconf_type_set(enum pin_config_param param,
 		return 0;
 	}
 
+	if (pinctrl_scmi_pinconf_arg_ignored(param))
+		*arg = 1;
+
 	if (param == PIN_CONFIG_DRIVE_STRENGTH)
 		*arg *= MILLI;
 

-- 
2.56.1

