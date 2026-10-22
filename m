Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792705990;
	b=iTlnKnpi0eE79lAgXZR/Q8wRhkTUtQVHmgZBFT1fUz+Pw8MnaXbioRD6VEuXDnWz9Gxz
	 QcAFX9MjPJPqx1Sgky0gOZNsSwru2FkZtgh+kBj9qG1t0CkexsQTzrneeRfTRUXZsIDr3
	 /GT1/bl3wbdi7ykqdlda/HQyR/cTcCU4A71Be7OIpXlDZrvEzVwtnY+AVDizS031Mo1UJ
	 DPfv1SNIvI60dQu07Gk69kGOqsJOFtvEqenAlETJLJyQVKXbqoIvQi+vIGre88OTuo0AJ
	 p0DOYkjDeMs5YM0OWDSOhcBTjYIQaqiqlr5Zau9/qk2YpMJl3ggABTSdtKC1j19yamA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792705990;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=uhtP9+xIJ+/btqQFJ1BUxvwX/N4DreYFh/wk1Ug1uXs=;
	b=x/07mQA17R5a7vn/zSIqFqRYbsQ3MVcURzdfGwPev+///vLcwa8X/emTu75u+d/u9xa3
	 aHAU6willkKdZl4GKxUEyWaaFivzizHM5i4Nf544FXKAcnnxP8M3K7UXxfbX0bAhOg+7q
	 CAq98HgZuK9eEfyvT9cd7ebEx/kIfZxIFpkzrYwoL7RM46xSViH8TA0qCzRpRfCk2PuGf
	 YgBqX6mXdUncHX8CKFx7rs3i1ylXdCrTZeclSqUIXWJbSiquL83e+E7Ic0zZvxFkOzoPQ
	 grOq9Cxss3+gBAS67vJJbayUG+IIiXM0kHDjMajscy0aLlob1VyMCyr8P0ZIWCFPUzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aWerPP2T;
	arc=none smtp.remote-ip=74.125.82.45
Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A70A60A2612
	for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 21:53:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A70A60A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aWerPP2T
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-14394530ec6so310117c88.1
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 14:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792705990; x=1793310790; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uhtP9+xIJ+/btqQFJ1BUxvwX/N4DreYFh/wk1Ug1uXs=;
        b=aWerPP2T1G+0YUzHsifQ4h8KCo9WhQHXTGTJ4UD6c+v3Lhry4A3IP5pWv1/Vio7CGm
         9GUpB+FNKU8YoKw1lZM46jz5aW3NOY2Y2TZqLh1Rs0SoEXPcY4Ve3xdhMD1InndCFxwj
         952qjMDy+GYlpu039Nhifaiobe3a5zmEWo+O/0nGv54ao1FoBWarTmucs1D+oTsJIgG6
         9fzEpPrSizRThwXS3yxNFdxTC3Uc+tvoJ3gWIu1kJwlrQwkNcl+3n8l4bllM2lMMCegx
         ryy17yn10IgIf/gmF1+XOQjlWEITcR0OGnzK9f7lYI6vKARRNdy3oEDqV6z8m/Q7WXY6
         VHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792705990; x=1793310790;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uhtP9+xIJ+/btqQFJ1BUxvwX/N4DreYFh/wk1Ug1uXs=;
        b=DhM6wuVG3KGuhEvmBo0CCyE1naU8ZVb+1uW5cDKJqhgiuLj4c3rG1tYIf2H6dNgtT0
         o61E2BFaEDTqefsSN9y4O0tXFspbahPIxEHt4xMcXdB23BNGFRcbBkIFzn/qEe3mx47o
         WN5LMAVYVHzggVuT2rXeT33h1CThIq4qZyVqfZbpYGn4LktoEshRXaG3MeCPNyxajqgE
         T2XrAFptwiPzvu+c98WLue4mPKiUVcx++vciVMjlBZ8Dq2zTKyO4depYtoaXiGNjvTqU
         ZOP/nPv/qwq5BCknN7Y8Gs7xkNGzMY2v3/B2nvV1OihzbzJic13eVbprpNTZ27WGLmo4
         FTCA==
X-Gm-Message-State: AFq9FYLQpxljREp6vB0g20qpGM6Cor/OWOvwsxZgojWwsIZm1OdEBG7r
	0ff7ahG488nit558auwh9mPYV5JBPTjbjV7SMiaW2hc8KFuU7QIrdQwE4/Nypg==
X-Gm-Gg: AYBFou3UU5/iNbXRhNUwcVrVbcxMwGiJOV8EKahjODhUV7Z3/PM802tgGWfDmjuV9RT
	DFcQ2VRbRoL8PnxiTLUrVw8A9y8/xelwUdcrGiVskWnPFvUUb1xF3yXsnS59PTEi5UQITZ675mD
	RlxCPYanVWz/97UfUkb1PC8YXKjpOIJo2rZl9c8PFwgAIW6mjdyGErJjzlZtRimWthFCizat12X
	6n5m5YTV834di7zmPRPG9BcwYY6GR4qDVUSrRP5hH9BrZcecjw5+BbKcDnkE7Kw7YC9e20Pm+kO
	Axh/gC9QdUW3T8pCD+C03rjRiR3NVzn3G8KsBCSCwGld9JPc4hctiq4QWGODbPfNBVWVVzem8ZS
	Hrya3TgLiemltnlMl24oyHjJadzyII2EKowSsIO6nB34egp/Ho5abHZvn65az6KDSpf/4+wL0RB
	GAOVbS4mvO8NmquNHnge3hkVpSQOniYMWEl7YxNZi4mK0u1Hm3mpPdgY4zJPMstz7VOnntkJfg6
	XpH1ZvQ4MKw/XVIXVK8PZ3lw+n1MxYAkNKD8HKoe9I76wLwcPxpN4fWJLGjm0ajlLltHt6o+crz
	x0I0gutJ/E2sx6tifmOPXNwG92sDvwW3EjHKFzKzxk7EJM/MBLnev2BVfghNvpOHnw==
X-Received: by 2002:a05:701b:42d3:10b0:182:6c6c:d876 with SMTP id a92af1059eb24-195982d48c3mr887162c88.8.1792705989671;
        Thu, 22 Oct 2026 14:53:09 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f2d1:b7cb:a745:829f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195ec82eabfsm1110403c88.19.2026.10.22.14.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 14:53:09 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 22 Oct 2026 14:52:46 -0700
Subject: [PATCH v3 2/5] gpiolib: of: compile of_find_trigger_gpio()
 conditionally
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-gpiolib-of-v3-2-42c3b6439fba@gmail.com>
References: <20261022-gpiolib-of-v3-0-42c3b6439fba@gmail.com>
In-Reply-To: <20261022-gpiolib-of-v3-0-42c3b6439fba@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Compile of_find_trigger_gpio() and include its entry in the
of_find_gpio_quirks table only when CONFIG_LEDS_TRIGGER_GPIO is enabled,
and remove the redundant runtime check.

Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 03ce98baf68e..44799a4e9d97 100644
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
2.56.0.257.gf7497c7d27-goog

