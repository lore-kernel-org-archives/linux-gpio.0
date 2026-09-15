Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB66939EF24
	for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 08:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459513; cv=none; b=YQjQdBb162fsogNNOsL8zD3IBkqs5I/l+CNRWcx5kiib/UaFiEygar2WxaUb9KOANLyzaBvPMa/uPIp/TpFO7J7CPnILr23fUI3L6b4tRXvu1WIVIEzZGjYPqIsDZdfkLNzKFAUGlsxQYlwVrJne1dEYiKvYEJUf3aE6y5SiRRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459513; c=relaxed/simple;
	bh=jPCS3jau8LEmDTrYHNirj4CmDgyzg7ELGoC7TYTJC8M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Aca18O7kOHr23OSmThinUWV33n7ZTx8W7198WlxaZ6CRrfYHCAwjx/b9Nwn3oZyBAm7jCHcWnLvjCBi7r7kmsvHuYpiMCfDJ/nbHKUr81URVzcZAl+3viJiSOEKBVGsmZ7BWMnmS8vDjsbrw6QeaGTpGuj0GjCm8Qs3Cf5YyryU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q6uXx3cM; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q6uXx3cM"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49cd38e0e5dso33864205e9.2
        for <linux-gpio@vger.kernel.org>; Tue, 15 Sep 2026 01:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789459505; x=1790064305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=71D314ftdlfb4St+4Xu8DWbrNAQlQ6pwzo/wolPd+lI=;
        b=q6uXx3cMnb1Ovbmg3f95ZqdbuIwZN3p7tKyp9YF0OB2S3WOzoN8awK1xzun4ckWAmC
         BSS5UV4/yUz1vDV6P6J4zj/6ps4kUrvMboNxwVwAbqVGR+ZI1dw30IazEOgQ2891telv
         igqpz/8EycMqaoJlJCFBT6Z2Flv21ipyT0vX3S8FQiFl23par0IvYLdr53rvPp2E4SY9
         1DA6dcKeWqtMT03iqSCe6Uu7iydXvkSMzbj2IGuOrIVeaZVKjduVfT/uEhcR5m+WwOiV
         R9vtcbC1xPf9pNeedsrUNap3aWWD7w00OmQW3okYKMjE9MOt72roEO/EXLVOn+4qKIzf
         1G5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459505; x=1790064305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=71D314ftdlfb4St+4Xu8DWbrNAQlQ6pwzo/wolPd+lI=;
        b=mCaM4FO7Vt2T9WobgSgytzrwEZ8UqrMIDW0bJ3aluWdgfk3EbNyrCrAVLqZvrc4r7d
         gw+Xgd6ZYKdLTQiA2Po8Fdk2GxeiKvt2PLYlxgc8M67U2daHi8qCbkfEZe8FaPehUz+A
         0DfgHz6osPRtR4gmVeW6EZCBAZpt2AMaqt455JW7DZMqBdxIipzeVdiWZZs8LwRdUEK/
         X7SM8OhBSnf2RFHRyM6IpEx7KRkNyLMMpz7PfLUDWA2NTRtL5D4/zmdSqZ5ejymSfewA
         nLxpFXma8D5Cdzd+/bwqSRJCUk5PUb8hW/xjScEoneBo4jy3jv5b98CjhhJRzhVvhTWx
         cbtQ==
X-Forwarded-Encrypted: i=1; AKwUvByNg54Eljccr88kYv/3rAWs1J8hVu/Ff7pHW4/aREyHw4tGXK9uBANepwNVq/a7hPrTKw2vECtJOmrS@vger.kernel.org
X-Gm-Message-State: AFuF++mNHZqDdKk9GnEOksS543eNOdixWD7QSEcg+FYuftKWHT6I90aE
	2Sit5a44IaZkAbyHCYQVW3WrnjmkSTdRMxWjt7YcdDvrhuTAtn9JG6JV
X-Gm-Gg: AYBFou3sBEd6q9m0N+gd3R/bZrDOn4Ps73zNW6yrVRWMmmqQx9CWEOy6NchVLBGJRx/
	ckfbdu0D8vuqaFUxp47VX+Wv25Me5UNb0nt2bNg4snOv7+PsqYoiKAtLvf4xM5DMdt7EBdOhds5
	Ms3yvBG1wGDhc5J42YuK7h+Qka10HuJ2YrbVrpDxxK63Kmcp1i8tzEvfM/P+bHipJH8JMvjbg0P
	ssqWCw57wCIWLUuAngY8eKK4lwIOdPAkgQ+oxLD8p7oPDhg6R/uw4oEOfBL7nCu/aXfYcS83FFi
	ODJjSTpHB06MJHSeDnfYTV9597Dt1t29rzmo6yOydl+l9IcdQFvrYzmGlBQswofE28bPDwyYU58
	eS/K+TuxnwGqEfwkKAYKBqxvWDMHc2u/2IvI/yOQ1LZQwY4TFflNzwXadUhPTnlUP1K1X4qrU6N
	OS/lxXc/kM/H8dv32nIOdJhvh337agtsSD/5JeUNPN9Y4ax7cgjYHBjXLJNpyIQ6Tp3Tg5AyNcg
	4aj2ZuC7NRYsaw=
X-Received: by 2002:a05:600c:1909:b0:49c:f89b:f82 with SMTP id 5b1f17b1804b1-49e7a677ab1mr118558985e9.12.1789459504354;
        Tue, 15 Sep 2026 01:05:04 -0700 (PDT)
Received: from deb05.proceq.com ([213.160.61.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d27315csm48588365e9.2.2026.09.15.01.05.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 01:05:03 -0700 (PDT)
From: Mehmet Fide <mehmet.fide@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Haibo Chen <haibo.chen@nxp.com>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Jacky Bai <ping.bai@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	imx@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mehmet Fide <mehmet.fide@screeningeagle.com>
Subject: [PATCH v6 1/4] pinctrl: make the CONFIG_PINCTRL=n gpio config stubs return -ENOTSUPP
Date: Tue, 15 Sep 2026 10:04:58 +0200
Message-ID: <20260915080501.329424-2-mehmet.fide@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260915080501.329424-1-mehmet.fide@gmail.com>
References: <20260915080501.329424-1-mehmet.fide@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mehmet Fide <mehmet.fide@screeningeagle.com>

With CONFIG_PINCTRL=n, pinctrl_gpio_get_config() and
pinctrl_gpio_set_config() are stubs that return 0. The getter reports
success without touching the config it was asked to fill, so a caller
reads the packed parameter it passed in back as if it were the pin's
state; the setter reports success for a configuration nobody applied.

With CONFIG_PINCTRL=y the same callers already get -ENOTSUPP from
gpiochip_generic_config() and gpiochip_generic_get_config() for a chip
without pin ranges, and gpiolib treats that value as "the backend cannot
do this" and carries on. Return it from the stubs too, so a kernel
without pinctrl behaves like a chip without pin ranges instead of
claiming success.

Suggested-by: Haibo Chen <haibo.chen@nxp.com>
Signed-off-by: Mehmet Fide <mehmet.fide@screeningeagle.com>
---
 include/linux/pinctrl/consumer.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/linux/pinctrl/consumer.h b/include/linux/pinctrl/consumer.h
index 11b8f0b8da0c..7be49d447426 100644
--- a/include/linux/pinctrl/consumer.h
+++ b/include/linux/pinctrl/consumer.h
@@ -107,14 +107,14 @@ static inline int
 pinctrl_gpio_get_config(struct gpio_chip *gc, unsigned int offset,
 			unsigned long *config)
 {
-	return 0;
+	return -ENOTSUPP;
 }
 
 static inline int
 pinctrl_gpio_set_config(struct gpio_chip *gc, unsigned int offset,
 			    unsigned long config)
 {
-	return 0;
+	return -ENOTSUPP;
 }
 
 static inline struct pinctrl * __must_check pinctrl_get(struct device *dev)

base-commit: 7257c35db0fdb4fb02d857a8197a16afa84d92c0
-- 
2.55.0

