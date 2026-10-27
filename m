Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793074776;
	b=tS0EPagvY8ltHB0oy5Jwn8XmqzzTrbjVD41NFZoZl3KPj/UzcGORgRuAdjMW5FmGucWc
	 5KfOpccRTaQT+nT8SETGERYTt4dyBzygldr9P/1sdEj48tJdc8qPhySdV1Zr36KUUDApN
	 3QEQc+CE+JdXidSae2G+QdZc8XUl9jT4+/dqRdhazBsk1XOYAOt2zcq5f9ltmNa8KjSZ5
	 q1/J2vaNg2jHOIEVMd6XhjPlmxXtU6+YpyYF/NkGtm23KRIEY+CJhKTk34VNNMIj5iiGi
	 bNJsMawDvM8B9MlfkgFrfJYAoPCrrxWGnEcZ87MBJW0EJqS6I6YYKJJP7nZvVspOckw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793074776;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MN4E7aT82xy+bZjOGUk2oRwfeBWLpK4D9PSia4dRSug=;
	b=TQfsuGsREgTzG1bbJmOD0QxVDL5HFXYfcqkgPmp6RaB6HbjUH/v262BtzvYFcxD7hfIg
	 lAz+vbAj5zC4i+y2OuETrhfzSsIPj5ak+wC+ZJXPXDSNWo+32fb2LSJIhGd/5CqM3Witn
	 /gHKJFnoc21KQ8Jcl8zVDul5MRk4HfjfMWyBK99FwDVJfN5hWRv+adDlu0gJjso3IZkYF
	 42Y1dHuXYSUYRkBkBhOX1ILNP7hFNv+62g9ks8HM1Ak51ITdUXpTs5mYE02VzvKyOMFEB
	 R4qZy/ChFqSdIpK0Jd/qoZrTz2+939KLohoTuTPtfIM/vcs0JX20ohcfFec2l3k4heA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VMxIWzQG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB5460A262F;
	Tue, 27 Oct 2026 04:19:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=VMxIWzQG
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793074771;
	b=Qu/QcsFCu8kE3DXCUWtGF4UUskz7xS6K6NW+PmT5vlChkaJACSpYkgGtPbtPKOfDH7gg
	 /K8kJMY7hDnkEi33kS/v9wV9iHyOSATG8f3fmZno+qo7XOAA7+OIlPX3mIwJWHyx+sICI
	 nBgpJm+qaQZhg2Acay17BM6gBgFa8krIWoZ5CmkzF2RYWTW9FnB+vFOIvXyCdvpIMYeWj
	 0q8tzm41hH2MRi2W3nMrOlmGKOEKklXJwDJp+yNlheGZ2gnkCzXDkXiZ3ZD82MgA5TG4S
	 2+33PgQjz9HGK3mDqHeat14F8Vs8r9yw0lCB4VCR+++fXaJ0qhnr6ECY+8PwT75pjqQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793074771;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=MN4E7aT82xy+bZjOGUk2oRwfeBWLpK4D9PSia4dRSug=;
	b=X3be7iP2s99LnAY0eNHBQ6AhvT5nK93bZLcDhzwnWt/mxp+xAONjtIAuVQkuBENePnY9
	 1hi5Ir6IYVS4mrmmSuVuSIIMjElVYC870wXVP/+EhqE22TPpEVMnB5zvqtWkxWZ2KSyNd
	 Ske4gpdIavX8/xulTDFe8CPBcQGjsxPkxUY4AWuLDb/JvT8lXfJ8l0+v7rJozB4F84UnB
	 YqKEExYtMaKMV5TX4V/2DAH0hkHoBWXtaU/vS/nKKHSmPwgndWb0/36bCer63vh+p/8Wk
	 kiFDGvLbQrp08fMDuNWOq/Yk9Yy889H1V/fijVWk2pnWs9dE9P/JsCI4epbjyj0998w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C9AD01F01825;
	Tue, 27 Oct 2026 04:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793074771;
	bh=MN4E7aT82xy+bZjOGUk2oRwfeBWLpK4D9PSia4dRSug=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=VMxIWzQG4YqHcTXq9Xaw7y/egQGA1lozk7LR8tX3Pk/lhXgjsvGXbHjOrQRnUvnNZ
	 jna5jneqyLHK7LUnnv1LcH97mdE1P5L5KF/dHrnxzCDBC4ZSy9/vcmrriXIDrAkLEI
	 FKqNGbtWixzMxdf0bXXOak2gU+MAUjVbyJpUZgQnQOc1ZIyyH7qhI6ILlotFUlSy7/
	 eZPpqUfCFJMANbrBqoLVp0JXy8snXtZ0Vc9aBb3aqGPE6Z67slDFJ5R13QDEjFTVci
	 htldLaaAL7UY0GZ2ScUvZaY19KBIuDRAMBVSUhc5zGQlAg6NvIDkLh/1DjzdKfS3P4
	 V5AiDzr7xR1eQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 181E944FA8;
	Tue, 27 Oct 2026 04:19:27 +0000 (UTC)
From: Long Zhao via B4 Relay <devnull+longzhao.ambarella.com@kernel.org>
Date: Tue, 27 Oct 2026 12:18:58 +0800
Subject: [PATCH v12 11/11] gpio: pl061: tidy up IRQ trigger logging
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
Message-Id: <20261027-cv75-gpio-v12-11-c22555400e18@ambarella.com>
References: <20261027-cv75-gpio-v12-0-c22555400e18@ambarella.com>
In-Reply-To: <20261027-cv75-gpio-v12-0-c22555400e18@ambarella.com>
To: Bartosz Golaszewski <brgl@kernel.org>, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Long Zhao <longzhao@ambarella.com>, Long Zhao <zl020895@163.com>, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793074765; l=1621;
 i=longzhao@ambarella.com; s=20260730; h=from:subject:message-id;
 bh=1GuGXKlnEY6PpajjHcqcaik0zUQB0SPUsJ46RPfbalU=;
 b=GodvFEubUMxao50zjXFFH7bLQM9m4iylOUF1Gtq3c+A7J8mpRur1nocl0dI+ZStJKg69d2nKw
 K8S8hD5fdoSDNOVz63/CypOBwFVYJKmmWd9KUz1XDWaGJYtLyEP7N21
X-Developer-Key: i=longzhao@ambarella.com; a=ed25519;
 pk=/xGhPTOX0/eYsyTWzyjjgAIW1Z/YD+IlnOnvcdRozow=
X-Endpoint-Received: by B4 Relay for longzhao@ambarella.com/20260730 with
 auth_id=903
X-Original-From: Long Zhao <longzhao@ambarella.com>
Reply-To: longzhao@ambarella.com
Content-Transfer-Encoding: 7bit

From: Long Zhao <longzhao@ambarella.com>

Join the level-and-edge dev_err() into one string literal so a grep
for "edge detection" finds it.

Use str_high_low() for the level debug line. str_rising_falling()
is not in linux-next, so the edge debug line keeps its own text.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 drivers/gpio/gpio-pl061.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index 0fb42c531451..1d77afd8c409 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -26,6 +26,7 @@
 #include <linux/regmap.h>
 #include <linux/seq_file.h>
 #include <linux/spinlock.h>
+#include <linux/string_choices.h>
 
 #define GPIODIR 0x400
 #define GPIOIS  0x404
@@ -171,8 +172,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 
 	if ((trigger & IRQ_TYPE_LEVEL_MASK) && (trigger & IRQ_TYPE_EDGE_BOTH)) {
 		dev_err(parent,
-			"trying to configure line %d for both level and edge "
-			"detection, choose one!\n",
+			"trying to configure line %d for both level and edge detection, choose one!\n",
 			offset);
 		return -EINVAL;
 	}
@@ -198,7 +198,7 @@ static int pl061_irq_type(struct irq_data *d, unsigned trigger)
 		irq_set_handler_locked(d, handle_level_irq);
 		dev_dbg(parent, "line %d: IRQ on %s level\n",
 			offset,
-			polarity ? "HIGH" : "LOW");
+			str_high_low(polarity));
 	} else if ((trigger & IRQ_TYPE_EDGE_BOTH) == IRQ_TYPE_EDGE_BOTH) {
 		/* Disable level detection */
 		gpiois &= ~bit;

-- 
2.34.1


