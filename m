Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793763651;
	b=nORN77IisSM5Zn7zlBud3C7a5dExQ8moqa3naFhM/ehZQ5AmGwWzhS4oDCONQBp21AZg
	 p1YvP+ZlnZr9CVxj9FIuyIzYM9xkusBGI7YtM6c9oYrKFG0JTg4FBVkvgROtHKuD7YScw
	 Q2QI/X1SENU+k1sRMnmvnUCWxsqfQYWCI3plxO52hAkwsd0Sr1BjaTEK/ZM/bP6wclqas
	 +68xSlTBGVTO8rmefgnSeA3O13YTNqfZ7SDD5Wje+PotCEfaBI5amyi+V072phD950VgW
	 y18v6HLBoZDbChZ8T+gFIjbk8ksltn+haCJ+ANRscRvaqokwQaL5Fahio2npC6r3CvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793763651;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=7tLpRU/GEaCK+ENwOIrn/UUBZtS7oPSYWzO0iXkGUew=;
	b=KJoURsV7bGZvwFZMeSh3IDKiFyKoE+09B+hwlWtxhFoI+rkihNxi/JY4J7CNeodtaWei
	 U/et2tyT07SqwvzVttt7wGCrcO/oo5BT7fw5iHouLbNxHZs+Qk2K2kovDGyHbAElYxJzR
	 eiQEUNOV4aPfXcvSILXaelOrFdifY1k3i/Nm9SrbPSvxVwPl3vZC176z/ueXL/nNYCL3M
	 +LFY+fd7po4lroF9WmGEwH2EX5WPZQurjN5nKSIuDQwaeIGkR2qUm3pCI9PAQEIHZX6/W
	 Wl46aEGw74t3+LBMhoHachTEkaAnf98lMal0X0/BpDt+Hjyr9JRUQgTWaA1mYdIaKxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TNShc140;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A79606A332
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 03:40:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E7A79606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TNShc140
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-35c76e9614aso304231eec.0
        for <linux-gpio@vger.kernel.org>; Tue, 03 Nov 2026 19:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793763649; x=1794368449; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7tLpRU/GEaCK+ENwOIrn/UUBZtS7oPSYWzO0iXkGUew=;
        b=TNShc140HF6GeM3l0UhgsC130gsMRbIFXc7y6L4MvnkM5SJtkw+yaI/Q5OyKn3JSK4
         6MytQRnySFW1OOlWm1A2EuQ40Ybog/6Kywh0hMP4GHARZbQD5AtOau9Oi+OFUXmq0Zh+
         GiOC/uaPmT6i15VzqLly7EDOLxW0tw9/BT3ZxcPHqNaiaceWZVi0Sz6LC2IBYb+6q9d2
         DpXJ/WLrim0XE4oMFRFjsEWL/BMAbMqXqE3zMzs8Sz/tB0AyHEinTCdG44PtZsBgqrFi
         Cl1QjE6awQ8D2bmYqNTH8Rlr6sZ4BhsHAyFGcwEIfrYDtlYflmrLcoPp8icIa3lGilgn
         SrkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793763649; x=1794368449;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7tLpRU/GEaCK+ENwOIrn/UUBZtS7oPSYWzO0iXkGUew=;
        b=EgPrEW99F5Q/nKLUclAXAN0Q5pOR9glyH6HMw6TEkHAa5TUMhv2GIoyVom5v6zpRmd
         CglKS/7B+rrjXMxPTzgMtvSz3BiQRK2yQBfUB/AnGkaKiaoAg/cUVhVD/7Gwp6p0Q7ne
         1s6RDk6RgKTvO5q6OdcC1/8/Ytkz1Q12vYnDr6QZ5B8qZdL5ovJ5/8W4viCyeQShBDNh
         RTWTP2jjzhy2nyafJSB9OhELFE6QK5h0xbLnuXM338/lZ00E10TF8WgauUQqQbPywapZ
         eZcdRRvkziun5ONmA/g0hBiyShgzRHNrpgw76/gtQ+JGujsn6gls/OnaSR5ZSoqgLgAc
         SmPw==
X-Forwarded-Encrypted: i=1; AKwUvByLBhkkDR2t326LC8wSEuPQasTL4rUNtCsaqJBMP8wA75JDVi4Iz2sihryo4LuJOJdAov+ZKlonOKSw@vger.kernel.org
X-Gm-Message-State: APuU4Z+Z5RwCtxHSjwRNDrCHth2qQKopBQyAail47oPKmUuMuZVcZ6Qa
	UTmiMyJu1erFdcuXPWBn2qsG/wZqrFMsDOWnW3gyoo5SyGBkMHBnZYdE
X-Gm-Gg: AYBFou1GrJ4KY2XmsR/Xz0NNHw7HAKraxJng03ulMoSYprZL7x565Zhll51Im1wjoeD
	wlwVUhIIjpweSBIB+XWQSMpdejQjsKyPEo7YvZ4R0JFY0pLLXJkuvVU7vSE9pjRIDUcjUnXePoR
	ypj+R5RONMdrDqiuw6yHhTCA3cE9yzCACitt+KHT4U/1HDjmzguuq+ZM68hlDiL5sIRRfV6TWCo
	3R3RQ0kwZExh8S9jGWJoAx0ndBvJDZb7DB5qmEe6Gz4XPdSaYzSZoZG50WdoSa4b4n5wxY8IImR
	EQ3C2Xs0ZybD2aRyKyZxoNxye/oG7uwr5CjHdwaXc1EKaLyiOMQpgi7P4+uaNgrOU7/8hPwRUFd
	WYcmSZfa+2J3olir8rxbUCFf2idVRa6FfI2eePsd2oS7UR5zATX9BCRG5Hqw0lzR1AhNsWRd8UV
	yJO16FPnYC1NXegEQVKsCuekj9hpXi5IASAnfiea/9s9BtuCcIGi4WhOxDvg1VlGFDRNKE6WQ62
	YtrY1lvOucilwleLVokvTPc5z82Qcr9BmGzZTtIl/LL4oQU2k5bjo6x0LYBzLLV/2FAN5IeuIDx
	g6ORxE4C6pE/HT0/e/NqYCAwAyOUZw6kyeJSBlVwrstK6sOWbrEtkAfpNHTuRrU5wci9JGUvAwD
	vpieiq1miAykRwy9j
X-Received: by 2002:a05:693c:20c4:20b0:36a:75aa:33bc with SMTP id 5a478bee46e88-36a75aa36f2mr8196445eec.24.1793763648908;
        Tue, 03 Nov 2026 19:40:48 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:88b4:22ec:d621:c1b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36ca3784f78sm3528508eec.2.2026.11.03.19.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 19:40:48 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Tue, 03 Nov 2026 19:40:31 -0800
Subject: [PATCH v2 3/7] gpiolib: of: return -ENOENT from of_gpio_count()
 stub
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
Message-Id: <20261103-b4-gpiolib-free-v2-3-ea46767c9cf8@gmail.com>
References: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
In-Reply-To: <20261103-b4-gpiolib-free-v2-0-ea46767c9cf8@gmail.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

gpiod_count() and its firmware backends are expected to return either a
positive number of GPIOs or a negative error code (-ENOENT) when no
GPIOs are assigned. However, the !CONFIG_OF_GPIO stub for
of_gpio_count() returns 0 instead of -ENOENT. This causes gpiod_count()
to skip the platform_gpio_count() fallback (which triggers when
count < 0) and erroneously return 0 to callers.

Change the stub to return -ENOENT to match the real of_gpio_count()
implementation and the other error-returning stubs in gpiolib-of.h.

Fixes: f626d6dfb709 ("gpio: of: Break out OF-only code")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-of.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-of.h b/drivers/gpio/gpiolib-of.h
index 218cfe5bc4ac..9ca540d93f93 100644
--- a/drivers/gpio/gpiolib-of.h
+++ b/drivers/gpio/gpiolib-of.h
@@ -46,7 +46,7 @@ static inline bool of_gpiochip_instance_match(struct gpio_chip *gc,
 static inline int of_gpio_count(const struct fwnode_handle *fwnode,
 				const char *con_id)
 {
-	return 0;
+	return -ENOENT;
 }
 static inline int of_gpiochip_get_lflags(struct gpio_chip *chip,
 					 struct fwnode_reference_args *gpiospec,

-- 
2.56.0.385.gac671c819a-goog

