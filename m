Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BC272618
	for <linux-gpio@vger.kernel.org>; Sat, 18 Jul 2026 04:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784348000; cv=none; b=KkICoM/ME9PiFY3jTlPeGEFvYw8mVxBpIj1CNpyjKgGM6z51eqeJzkyFMitR0Q4SdlLVOyoCr4H+FQ1Q8yol5KW8JsmYndRzl3o9jCXAZ7Gd30qzjDdKXgNVVf+f6eUhar1nhQ2llwoplntUPwvI+l80k3jPbZij8el6xWGRVfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784348000; c=relaxed/simple;
	bh=xQb4coZfpWrjigkaUG3SD+9F/JAInpSwhf+MNngfJgc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pocb55K36KFYEw/IzvkCZmoWhnLkDFrCuLntvLIzFtivWKQcNQH52nQqCbY36l6mjVV6Bml2WAndTPK5eDxcewGAy/VTfNA6+kZ0XoxrX8vuaY3RXEy2NdYPCo1HOUQj5FIbVtJWbkIk/J8CFbLd+DJdp+Yp/R4vtEBlnGBIwd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jDFubcYM; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jDFubcYM"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38de840f2f0so4976008a91.0
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 21:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784347998; x=1784952798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=awNCmiuzQvRjC+cVqe10JWSeLPQ45yHPdtX/Hktck9c=;
        b=jDFubcYMRwqp4s8UK2TiNLZgBwPPmrRSSd9mxERS/fSatDk0xcfpCuCgjQBstoMgaC
         PDnr0JPi8v/xhEnobiSoLnqCjjwXWE69890x7uzjW2GyMvshnDpyRDepC6aJgVL4/ec+
         qekChn0d6nv+EBtN4XSW1RYUmjrPjRXu0TzqrIY4Glf8WviaeK7kFNMoqnsQ6EeoDdDi
         AjwgQHPiLTnhRUN7T62u9X0yXBHZ2UNx5+Y8Ws1ax4dYNMFXtTV81ZkK2o6zZlDeqRLY
         oXEhhZn2K/NzR+iLY+7aiQ0RzHXDHv/Ix+72DLY3bdjJ3a06enTIcqKxaZM4LXe6qQJ5
         7ubQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784347998; x=1784952798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=awNCmiuzQvRjC+cVqe10JWSeLPQ45yHPdtX/Hktck9c=;
        b=CpM11SeHejLzR0Lewq/tGIFBnuS2miScIqVgBFDODXR1BrbI52Ro2SlNG88RgQlQxr
         K0MtGu3WpeSNNK8RPG0beLEKCT5/sPgyWnzAb5f8C2Ie8WkiaQXCB+3UwQ9+RiqY/KE3
         geojHUG4hLvt9B0JWVprCXe3HBJlBGUIQ9o/8d+FN13yJFcz7HuSbo1YpAO7/FBZiWhD
         spxNO7mFjjpCEYKAGjgW1hpAJYmu2eS2ZfWsQZoseUDqykzcaR17aVDGMzKrtm9uB81s
         /2MQxrEqh88+7N2ayTMt9xq1YuTlKzZkn0I8uqJxGkYYucqi1xiz3QBUq3RU3YNH/nfm
         4vGQ==
X-Gm-Message-State: AOJu0Yw4Th6A0t0pT/7S03EYFZ6aqOi4R9YpzED//cZ9006YynmQnKNQ
	SC771oAoSDx8lQw/g+cguOu5YWjG9DlK41/WItruLkDq9VUT5vvp+y8VHTtW1A==
X-Gm-Gg: AfdE7cmYEDoNhiJkkPct5VtosgNTfNq7tKwDcld8c2+GzdPByGNG/p5RveYFrgNN8EB
	tVDrkMZBdpmI8SXEOMaom3k3uJ9s9wYTXfa01j4nOIDX5jaxAGHit9+P9CiXEpWp0jx3k19sfIr
	ExZXpiC8zTaaDOtQWpUy45YpGCfrF0C/HSxXDHA6QmLPg8XdFhXGOoiXBgojAjlnUaGtzLaO5rP
	QpRz2tVYlhlAAoCTgW0bmHkluYiVeEnRoY8rZnffR6VaktZBj6tOuCRGxUxrLpK/B5cEWKdjZ0L
	+qir33vBPE48t+8Xy30uj6MdifVYbp3387stWFl2usikB8BXYEQ8Vr6AoOEy+7+rvzNFQCxb0xQ
	g0NbE3yaJG0TfHnEUDvBcRTocuxFmR8Fd+IQF9GF7y18Dbo5R21xCIHr+J5E+P4M7/H18jJomRa
	PG3M/0+a2oO7DLoifk0dpC9BdKhoU+Oh9znH6ftANHpa3mqty8vF1ihIXLTDkJdHe6vg==
X-Received: by 2002:a17:90b:2f0d:b0:387:e0db:bc33 with SMTP id 98e67ed59e1d1-38e4b5726e0mr5931371a91.41.1784347998278;
        Fri, 17 Jul 2026 21:13:18 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:7638:3cbc:f1c5:2eeb])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1bbaf6sm11052109eec.17.2026.07.17.21.13.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 21:13:17 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] gpiolib: of: compile of_find_trigger_gpio() conditionally
Date: Fri, 17 Jul 2026 21:13:06 -0700
Message-ID: <20260718041311.2605172-2-dmitry.torokhov@gmail.com>
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

Compile of_find_trigger_gpio() and include its entry in the
of_find_gpio_quirks table only when CONFIG_LEDS_TRIGGER_GPIO is enabled,
and remove the redundant runtime check.

Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
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

