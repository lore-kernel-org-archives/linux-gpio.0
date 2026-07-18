Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C1A282F3F
	for <linux-gpio@vger.kernel.org>; Sat, 18 Jul 2026 04:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784348002; cv=none; b=Ae9ZMsEhOlKmq2WB/2kmLKkhAttSwzhCuKX+cU4W+8wsIPxvlxO+baVrX+LUIbwp60eOeh1UCCeeuXPAdVrBWXmjuEQ5p6rLx91DKnCt/qnrl2jTYGSBgiIob4HQWEkFiKwcB0mNTeOQLF1g/RMRv2dpYl/1UytUolslj2Z+QjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784348002; c=relaxed/simple;
	bh=W+RDstnb+d0nIXwyYz5P4d1fMKP2EWQOaub4TisuCME=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aKmyHzWcDhquJllRfyATwpm8vYN8uIBk00ihOHYcpv0PAuupayKQFQnfFlCtCm9sQ3qIwR/1uuNxZa73oBrjaXi+vCQPPx9cNX65XJ0/xUOI7zOEKGsnwjVpPXrltUVbffJbhKwnsyzoaFsG3TmLxvhOd7P1LhlEaRIfZrIFCZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nGrGhxkp; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nGrGhxkp"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8453427d3f4so7834367b3a.3
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 21:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784348001; x=1784952801; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/ItLwNwYf/ktBrsVr7LkeZLMNAmknWOTehFVxX5Sr9Q=;
        b=nGrGhxkp7tUoiuzcsamNuibChkq2j2E0iMoiVImSyALj27Voby/Df/F4NJQXXVyKzl
         qHxthwnUIAq+t0l/Bnn5dnOTkJUBiuSMq+SFVAQ++dSJt62BbVusvhQou1OU/aiWsmBu
         9Dr/Xp5q2RqQDKi4f4uzx/6Vi8rSGmjSfEgAPQyhDlxdZAfypzod5YHDw8UdruZSKdfK
         rzbtEOxqcPxTImJFzuPqry0CTF5058M2mDbvjz0fiOTov2wa5o+Hjo+uUpublyRZ7AD5
         hsLG3voJf9PkZDhU1EfPdWQNfuWBwj0dXTJ8BWRrO7rvWFRKgp2uKZ9t6sPKlwGIXa1Y
         dJrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784348001; x=1784952801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/ItLwNwYf/ktBrsVr7LkeZLMNAmknWOTehFVxX5Sr9Q=;
        b=GyVssya20xDaCVObhESrmyuXEklV+BspoY8T5u2qb5vL5zwrVsM+Vm8XQnD56kYvI5
         +prOW7THqQxWRzxOCVoeQr+2UtiLHCl5f1FxouE5aaqQtlW+lStEVJMKTYf02lPn0m62
         eXNJBzYNPfl10A4bx+UffO2zUQQeejS7O+vjhI95HkKBi37H+AXDCa/fW8FDFayIwoyk
         tn32iYX2dNX/61UOvLpdMFInO80W/5XsN/YkP5tUiGoCOVbcrCbTVtNTQmWesa5KtU0s
         wCc9DaS5hv3lm5CDW6EDAjtm6sNKSGvbmoov4NzJ5fHDIR6XWXWRvfPTMKwQ5BEGGUtD
         3Gag==
X-Gm-Message-State: AOJu0YzpEtlEQ6hxZ40LAnBX+jJGqU33L9B4Bf+W59R2+xyc0OzimahV
	BjP59bYsjY8Ht1PkWFDBrm/OkGwI2tNp04ViQ4H5lK/ggYJA58Q2/Xsn
X-Gm-Gg: AfdE7cnBov2hjtG18hveA21Gi85tqwNFYMp1+KI2mw07raPKHMCOYScTBviVIObLjJ7
	ZnhztgDXZzdA1LaKLw9Nlvg7uDp/eS/rOOAyhI6FK8+ubBEUfac+Dej8Ea6JDKJYY1M6y4mWn6r
	qfIrNK6LOD5FYB03q8aSswUMRyD8WIxTDEH5mm7YhvZpfFtuQ109Sv6jdTjgHC7JnUXceqDe7Zr
	DD1y2Zy0XTnwijpjseoyxaoYsVn+Wiid5afhR13oAO/rVXRXhmq0csZ8kr0xndH8dl26m6QfHNq
	aEJh0Ob35vv0hbxKwp9sV2uPQ8cTHIZ5r5eFgWsD/UaxbA+67Kkm8zoZeGtvyPfEX+aS53dyPGk
	4WEptCx8vBiIuZ1yJUyEt3ynYJGyxHn4cJJWKO0lw2BFo90Epp6jdrr3tUuyS2QOAvvntmX5Dmz
	GL7YzFjY1Jv6zu1vTfc3uOm2Q1uGdzhc9JmpdY+8wy97jEijIg5AevxVLMGkd1O3TN0RxhluWVt
	tqc
X-Received: by 2002:a05:6a20:d529:b0:3b4:731e:6f95 with SMTP id adf61e73a8af0-3c3ad947d7fmr5548096637.39.1784348000845;
        Fri, 17 Jul 2026 21:13:20 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:7638:3cbc:f1c5:2eeb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bbaf6sm11052109eec.17.2026.07.17.21.13.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 21:13:18 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] gpiolib: of: add a quirk for legacy name for TWL4030 external mute GPIO
Date: Fri, 17 Jul 2026 21:13:07 -0700
Message-ID: <20260718041311.2605172-3-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260718041311.2605172-1-dmitry.torokhov@gmail.com>
References: <20260718041311.2605172-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The legacy property name specifying external mute GPIO of TWL4030 audio
coded is "ti,hs_extmute_gpio". To allow converting the driver to gpiod
API that requires names ending with "-gpios" suffix, add a quirk to
gpiolib.

Note that we a custom conversion routine is used as compatible check is
needed on the parent node, and name of the node ("codec") is also
validated.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index f4ea7ca27296..67a36e3851a4 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -676,6 +676,35 @@ static struct gpio_desc *of_find_trigger_gpio(struct device_node *np,
 }
 #endif
 
+#if IS_ENABLED(CONFIG_SND_SOC_TWL4030)
+static struct gpio_desc *of_find_twl4030_gpio(struct device_node *np,
+					      const char *con_id,
+					      unsigned int idx,
+					      enum of_gpio_flags *of_flags)
+{
+	const char *legacy_id = "ti,hs_extmute_gpio";
+	struct gpio_desc *desc;
+
+	if (!con_id || strcmp(con_id, "ti,hs_extmute"))
+		return ERR_PTR(-ENOENT);
+
+	if (!of_node_name_eq(np, "codec"))
+		return ERR_PTR(-ENOENT);
+
+	struct device_node *parent __free(device_node) = of_get_parent(np);
+	if (!parent)
+		return ERR_PTR(-ENOENT);
+
+	if (!of_device_is_compatible(parent, "twl4030-audio"))
+		return ERR_PTR(-ENOENT);
+
+	desc = of_get_named_gpiod_flags(np, legacy_id, 0, of_flags);
+	if (!gpiod_not_found(desc))
+		pr_info("%s is using legacy gpio name '%s' instead of '%s-gpios'\n",
+			of_node_full_name(np), legacy_id, con_id);
+	return desc;
+}
+#endif
 
 typedef struct gpio_desc *(*of_find_gpio_quirk)(struct device_node *np,
 						const char *con_id,
@@ -688,6 +717,9 @@ static const of_find_gpio_quirk of_find_gpio_quirks[] = {
 #endif
 #if IS_ENABLED(CONFIG_LEDS_TRIGGER_GPIO)
 	of_find_trigger_gpio,
+#endif
+#if IS_ENABLED(CONFIG_SND_SOC_TWL4030)
+	of_find_twl4030_gpio,
 #endif
 	NULL
 };
-- 
2.55.0.229.g6434b31f56-goog

