Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793375920;
	b=ebqSWYFkRPIiiYk/GppP3PPNRvJcITpvWxlWMNZqH2nvfEENMMLr/+3L+DxMubcwkJpg
	 ng0XLinuFXzDYWw4s6lY6DA5vZ8WyE6qvLT6zSVTeV5CgoBSqDKC5/6lkUqX/f+2Gh/Y7
	 BVm2cbZMRe/Gh+MTs2jDxX0FVMcVZuRCGU62DAXduLNw4vlVhCeqfpTHf1IYiZb/ingrp
	 huugghnDUDPg1aVCF0LUwJieLeV1/JNwl8YWOse7IfYydU5TViwBFMtGuiBr6TAEgXr4/
	 TExCQUePBenEVhipOnKDQUx927qfd2YD4BptX5KWuRAzmToR2nY89QoyIxFm2fvvYcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793375920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=TbaN4D4zPrCE0j2WU/cjpZg5LgYUpD3eA+3kZLrtZK0=;
	b=uGKxSPeBRBl8Ht41ABhOez3vDcaRTXsFjeh+OvDvz02/B2o8ygRDWHAT7x1ztFGFnSvX
	 fcrOJaxUcUlnxPxtxC4aUOOHZueCPOyrpU2JxfoASqqnF2jwGYxDPctGvuGu2UvyMyy8q
	 sKRBPuPm3qZVd8B9qHd85CQptBlOQqeYzMVF+62/M4JmrqVUbDSjpzHK+fU6QNH6zERZl
	 I0zQrp1pGEj5bIckH9TC8V8JcC53gUh6fn/9mbTc88mwA+KVp8UIWEomh3RpLdToMXtay
	 PODMRIqNXCIfPrGCWD2EE/7LDFLm4cT6XwMn0NAFy4+YneZ/2EB/GWgujd8GYvryo5w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QcX7czRU;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8253606A32C
	for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 15:58:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8253606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=QcX7czRU
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so8852935e9.3
        for <linux-gpio@vger.kernel.org>; Fri, 30 Oct 2026 08:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793375918; x=1793980718; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TbaN4D4zPrCE0j2WU/cjpZg5LgYUpD3eA+3kZLrtZK0=;
        b=QcX7czRU7i5SmOrIAuO82prn6x/lb2cIaIcvGWBYQmSqy07CTmQsdM0bqqZLopTxWT
         ERLJIt1gU9Gary3puHOeypsrLaZAg1D/yFoBPGHc0WKV9aMFTq8nhxFcgX2y2Vd08ILK
         vTSnUnh+ORhxTQ9jJKOP7JzpfZCYXdsn8Hyd4Hr5mCAfyIrhXx/ZmEw3WPJOZ4eAv4cT
         /seqlTf9QpAVI53Hxlo7OepHfycULrHKt09H5BUFu5ymcI6esSPpyKveUFp26jHJJNyK
         8v2Tmwy0Tl2l2vDSwC5UZHJdQsl6UpbPtorWUl5H0rUhy+FjptNgrw0wlqg8MSXwnUT1
         ud5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793375918; x=1793980718;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TbaN4D4zPrCE0j2WU/cjpZg5LgYUpD3eA+3kZLrtZK0=;
        b=BOgC/qa83p4XwbYMbNX+7xywDjJC83d4qdU7N0wirz1NZ1lmb/whrtpMWjqYqv4hmh
         am5ER/KyzbKcCI4CIGlHyt8t7oNRlAVdSo24wlvRT1KMf9M85HWUo4FKrNm622AEvGBK
         GGcgqkd2hQ5tgboER5EXA2PQhbKEsHUQyNDqUkFKbBxN8dfMHm7xVEFbftQ0KjHyGJg5
         4H4TGHBwtbBu80cHM3xlDeNS/IfolgVe/Fn1lbtVVFTecw0qVHuB7upIY9YjIual3UVk
         nGZwBRlS0wrS5emKqUQcmHrX3RY9C7p/1WxdsJmkZNUEa5yV1LiYrQbZUj8XQ424yDPK
         KpcQ==
X-Forwarded-Encrypted: i=1; AKwUvBxHORO7VZMv3uPcHLTg59RdrxsIjkaqOIJgRElZ4dCN3k57BQ1muLCtQ2cQAeA2FRg++/u69yMGrIL+@vger.kernel.org
X-Gm-Message-State: AFq9FYJTL1rbGtTs53k1twHPdbFckGPjHWhYLg8p7V4LLwaBFlEU2LBz
	Nnkw6XETLS/oWGFi1reTC8TRDQ5VcDlWOFSVQPfPqPzER7mHBr75oN94cB2WURB2LD8=
X-Gm-Gg: AYBFou2IDpbhXYnwY0Z+3k7hwliUPLPx42PWAIo27MBMh89HeyldsdNxE7iYSucS9c4
	O0c2eZg+mNbARBAX03X0NyksY6iednTY4MXYVxb3XMMpaoYO8yqlMbFIRNchFnK67s3g9CUO+BF
	6XkSqh9DECRZNwES39cWRFsxDf6GKjnA1x03MOMGoeLESqzBs5XluyZbQfkyCMD3tNPvrlXgeNn
	ou8rpMm+UzJwd8TqcXU/wTIqUEERDWFEtlJOVoBm4RygsBdQFi6lWy/EcsOh0qpQPicDhW9fswz
	xQimFqQIeSvOGQhMzNEJf8XtTak9Vz0NL6ov8DF8wVwhkbl9GBffzVDQwcgpYhRpDdEWyVh7mCH
	S2KgLh0fOxgKbAjKEK6YIubqMAHPjFNvgHtSBlOcP9Td7C6MWxjQxcDnesrmY7kBTUKJwbUTWYf
	xvbTaqB9p0NaCcOaF33RxAU8vXa+Ttza9ix4WlafCtwvkmCZvqeMhUvuLNZ9xc4Xh96meRVaEJ+
	I4DNul1i/Bqu6DG014+FM8RnZE4ZPWnMre3eAgb/XHqa73HCYD0oTtQtz1NdC7p74uWzjoVD+ID
	SoqX6iX8WzIlbc8wk96Ghur85w1tB7TW4Q+rXn5MRiQ4gke3JsE=
X-Received: by 2002:a05:600c:818e:b0:49f:fd40:80fa with SMTP id 5b1f17b1804b1-4ac1932aa2amr62355485e9.34.1793375918383;
        Fri, 30 Oct 2026 08:58:38 -0700 (PDT)
Received: from localhost (140.30.66.37.rev.sfr.net. [37.66.30.140])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ac08b72578sm27102895e9.2.2026.10.30.08.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:58:38 -0700 (PDT)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 30 Oct 2026 16:58:34 +0100
Subject: [PATCH 03/11] pinctrl: scmi: send the settings without argument as
 enabled
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
Message-Id: <20261030-clegoffic-pinctrl-scmi-gpio-v1-3-52d92843ad97@baylibre.com>
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

bias-bus-hold, bias-disable, bias-high-impedance, drive-open-drain,
drive-open-source and drive-push-pull take no argument in Linux, so
they were sent with the value 0, which the protocol reads as disabled.
Send 1.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index 5de47e060e8c..f74ef0952ba9 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -173,6 +173,21 @@ static int pinctrl_scmi_map_pinconf_type_get(enum pin_config_param param,
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
@@ -182,6 +197,9 @@ static int pinctrl_scmi_map_pinconf_type_set(enum pin_config_param param,
 		return 0;
 	}
 
+	if (pinctrl_scmi_pinconf_arg_ignored(param))
+		*arg = 1;
+
 	if (param == PIN_CONFIG_DRIVE_STRENGTH)
 		*arg *= MILLI;
 

-- 
2.56.0

