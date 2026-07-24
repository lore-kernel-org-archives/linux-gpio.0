Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54DE368D4B
	for <linux-gpio@vger.kernel.org>; Fri, 24 Jul 2026 05:18:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784870310; cv=none; b=PFTGlqYZ1grxmuFehbE0Ds6J1nGAF9pmgWskJP74BlctY/4ZQ5YoXCOSVLWpdtaw9U2ZFWvLQmf/7Xq+FIyKIUY7jOL782ecwN+4r3+Ms+UGWznI0X6rNa0wuvwNDz8PAbhDZrkQRlKuW1X+lI8kQV68BdXM2OSF3ICwplAcHE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784870310; c=relaxed/simple;
	bh=CPrWshwJHJ9NrCImC0buWOyrE0jsWcl1LbTLMNodNog=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aKjQhBAPLQMRntkbRg7iz7eAhv0dMSGD7GtZW5j0T0PYXpMkivjrJWjWUOzWg9yDr0LNBekJhABdFP4sQffjUitGRFqkt6KUD9SdF4PLLrQ1scEzIqSpORbh8o3a6HRi3+wCLN+8JNvjs3l4GX5e7vWyn33twg6Y/oQ7o4omPDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GNs60Jih; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GNs60Jih"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38759bcd877so7459a91.2
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jul 2026 22:18:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784870308; x=1785475108; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HqBAOdQoUNLZYyNV6pFXVp6oAJoLSt+ohQb+KotiSp4=;
        b=GNs60JihZf6tqRmvfbU8Reu+WS2ScfuJgBkqBpBFJw4UCV0ILflMeMwh25bbwZcLJ3
         Kb4Lj4xbi9jNupZImYzOrUu3pf4MvRz/EUMTkQiK+3d1vIv23+JyhPIx8v5nU9sXcKli
         PToZr4hgBoVSYumeZxbxQvuNlYbvU8sqz0jneCRoBQLJm/Dape66qdVStR9GZ8dXXPbe
         B2FQLDWVMx/Wl3kd0MotC0C2FW2MkeHahaJbsAfA+TkMkCdh7qUFKgVL156+mj0At4fX
         8jywd9vthQqReY0gbUnl0b+qpYCUQHvBnH6ri1QA9eX+2FQQ539mW0BcGkGtu0Z8zK3j
         DAVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784870308; x=1785475108;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HqBAOdQoUNLZYyNV6pFXVp6oAJoLSt+ohQb+KotiSp4=;
        b=NNEdS2MqvAcxDKeXzojT5vF6R7F9jiWPxaZ/y0JQJtpXHdQKzVzYWl5GbfqRa2d8yu
         mSAvsjbyPAVxJuscLJrwmllojuxg8YcdNP+MaP/kNiYkkOERwxfa9X0u5bqkdKmj6kF9
         1jzTQ0f13e4brGkglXjCmVO69KxzC4n/sB5LbI6hs3xiscH1EdqddjveXwYCdHgXnaxa
         LVNssA/Wh5e42epl+/+Z1cqJDaAy1illLGO7xr9VvCfk0733ur71lkPfyzBwv3SZamKb
         KSfHfYWsLW9Of1AXFXGpsu9KOlDX4PaeTPT3BLABoVir+f/beWr6qpckoit5ZZ/bTvr7
         hIXg==
X-Gm-Message-State: AOJu0Yxa4yQoGgbybEREh0yn1EEIIaCpwlfHAQZ03gk+kCgRQmRbNFQz
	69kZ1mSrDUUGFAZ2FykycYN5cE6iMHU76pYaQiK1KkmnEl24NK1bZhMuqcb12w==
X-Gm-Gg: AR+sD13pLiJdMvaOa1N5MtfYa3oLADUpUM1wCVfL8u8uHYHXO38vCGUUW2eJ6i0tJpF
	tSYx+54Cx9de4dkzL3u2vAcJrMUrAlTtllw6pR+0wbIb9Pz1qY6Efss047sReX8f9LHYb2n98ua
	WRZCxmZRzMs0kxl6X23d7avF6smNqnGfdikweBC7nx1YwSLWYWJ624Im63JDDzbWwicifmXmV9V
	COcIAxLBdjAkyZZ61AakQsDpu/xt+RCDKae+Oa9iXgCovlRQl9IHxdydETw8WJiCBtkMXT/3BUc
	TYId/n/EJQ4sKtQwIMNGyWBTIvoUcoB3Pf9d51/yI0G9c1ay72htfXWBEl7Ky71V3dm0WFifydQ
	Z6F/t6UjXOWkemU8G2WuORg3QXrQlqLA4rfiL4JVWwvRJ6yEGWOb79ckwNMiaVDnqdZ9co6MUlZ
	YwM9rRzQzGa6BZUUEjN/1vqXRcoBWcdEHrgeSETuLmkh4wAJWn7Npb0IJ9HKULkvNcMaxl2R2wR
	xo=
X-Received: by 2002:a17:90b:3b81:b0:38e:f6eb:2b38 with SMTP id 98e67ed59e1d1-38ef6eb2c2cmr3771845a91.17.1784870308213;
        Thu, 23 Jul 2026 22:18:28 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f5d:dfe5:9bb9:71ad])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130a8421sm19974430c88.10.2026.07.23.22.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 22:18:27 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/4] gpiolib: of: compile of_find_trigger_gpio() conditionally
Date: Thu, 23 Jul 2026 22:18:19 -0700
Message-ID: <20260724051822.3545532-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260724051822.3545532-1-dmitry.torokhov@gmail.com>
References: <20260724051822.3545532-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Compile of_find_trigger_gpio() and include its entry in the
of_find_gpio_quirks table only when CONFIG_LEDS_TRIGGER_GPIO is enabled,
and remove the redundant runtime check.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---

v2: no changes

 drivers/gpio/gpiolib-of.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index fc77cf6b306a..f4ea7ca27296 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -651,6 +651,7 @@ static struct gpio_desc *of_find_mt2701_gpio(struct device_node *np,
 }
 #endif
 
+#if IS_ENABLED(CONFIG_LEDS_TRIGGER_GPIO)
 /*
  * Trigger sources are special, they allow us to use any GPIO as a LED trigger
  * and have the name "trigger-sources" no matter which kind of phandle it is
@@ -664,9 +665,6 @@ static struct gpio_desc *of_find_trigger_gpio(struct device_node *np,
 {
 	struct gpio_desc *desc;
 
-	if (!IS_ENABLED(CONFIG_LEDS_TRIGGER_GPIO))
-		return ERR_PTR(-ENOENT);
-
 	if (!con_id || strcmp(con_id, "trigger-sources"))
 		return ERR_PTR(-ENOENT);
 
@@ -676,6 +674,7 @@ static struct gpio_desc *of_find_trigger_gpio(struct device_node *np,
 
 	return desc;
 }
+#endif
 
 
 typedef struct gpio_desc *(*of_find_gpio_quirk)(struct device_node *np,
@@ -687,7 +686,9 @@ static const of_find_gpio_quirk of_find_gpio_quirks[] = {
 #if IS_ENABLED(CONFIG_SND_SOC_MT2701_CS42448)
 	of_find_mt2701_gpio,
 #endif
+#if IS_ENABLED(CONFIG_LEDS_TRIGGER_GPIO)
 	of_find_trigger_gpio,
+#endif
 	NULL
 };
 
-- 
2.55.0.229.g6434b31f56-goog

