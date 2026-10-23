Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792778240;
	b=mdXlpWC7oPuQPRBnNml1n+h5amtoHTzmR0ftRzECAAZB/JHQjaOUVVfwm2hR5uS4buSY
	 O8pZ9BVmsUMpREOzI05Nspqv/PjCS2oxaBChK1moEOJNO3cTdGCRc8y0zTxO84kMBCdyZ
	 o0S5bxLHQarGdzZlHeZPMMgWYiwPL02VnpBjJjTAVWc9VCxpJIMLC5dApn85lfjARWfYT
	 /1x77X4UsPmhIY3TTKpPLIh+cXn5S0A4K1e6xwb7lElXzaSVKA86yj3twyuKf1S1Ky3RD
	 vs4yIRdsSjvtZ9+6G1cyaO4QIVcDJCO8XpSy+1eK4GEu5Sm4CKZ4rhChWWFr/Gzp+hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792778240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=6brLkp4HNSnptBFTLt74SChIRfCfigfsHoKebnZBRPE=;
	b=lspjGwgZ/IZYZ+pEE2MAs3fbwEwk97k0nJQBn9hfWftSRKgajKC0+OfmmEkzIHyW/AbM
	 9MArOBixNlq1GcP1LB4b/Y6bKjRKFHEQZLdyLLPDwH7uBSiD55QrZzrK5kaJxFmt8Je9N
	 S0GTPTbAaLcKg24cDjLr2Z4RrmPqPgjNVTuU6nyaOjpEUWOcvFZl1oaB14bY9JA8ox5Cd
	 SQYwkLyz6g3AZ/lB9gVpT5DZgkXbuzCVhfd5IXW2cRUZg+VP8zdA56AZiZcQs5eX6BNeo
	 lH1lr+WzazFPAzPe8Ho+qTa1Nasmul0zqG6rSc5PYV31rR7qZeIuXfuLY2c9XQAjWfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Bj0ur+m7;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4AA5606A31D
	for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 17:57:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B4AA5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Bj0ur+m7
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3514b90bb89so2629788eec.1
        for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 10:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792778239; x=1793383039; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6brLkp4HNSnptBFTLt74SChIRfCfigfsHoKebnZBRPE=;
        b=Bj0ur+m7k4e7MizKwnGdujkcRSCNB8Qh6TlCtyipHzPPtcn2xXZ+MH8tbKC7p6lKH8
         k2I0FXBC5AaCCbuA95AMu9Lz5cdCvwir1zR98X56nWyhsVACLuE83StzhtUgOb/VP1N+
         kEsLBmNAop0m9MCi/QB6uLeBkeT10wx83p77HdTGb3k6sHfMHP1nmtgpAFs/h8/dnCbn
         uosA6muR0sgprA2WA419vs8ppWd0KZ68CPihJpF9or88vZOtmxzuQQrCqO9j1R4dUGZI
         DPGSZDSwP4XdWpujQ8YpfKlRNhhYWW4DrZgeWzWbF9k4mNBLiSCjPEGCYrzdpRiB+OBW
         QNJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792778239; x=1793383039;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6brLkp4HNSnptBFTLt74SChIRfCfigfsHoKebnZBRPE=;
        b=EOcE0qu8uvkSnwpzc7+Y2uFW7G7FcGLyvInSl25W9kxqdMq73D78AqxLJlQaW7ifhs
         b8RA0avxEU+6+HEkmW/iihqHPqvbE28hmiMl6afMceNoW21zNBL95Z53PQcbBT5uOdU4
         OjhpG6tad9wl4Xf2qwadVSkqtQy7kwjYBmy6McCdzLxjKVvcvapmDz2XNS9A+yp/ESxe
         T584pANg3x3HTrV14g2QuzEo+z4CbMdowZTNw9gEV1/KyQXPSH9LJ0VjTVccAnsT4AHF
         oMMVsWfmpJF5elRe/aLf9MBvmKCt9JCc0m2yVawr4moyilsjYVvvuBLPIy1fHI5rOuOR
         SF+g==
X-Forwarded-Encrypted: i=1; AKwUvBz9zPWpwoXodUadz6n8KhKb0UjtVysI4gV6Lyo0UeP9NQt2apaf5L8giDugaD2BkYEO5L//+2Xb3hQf@vger.kernel.org
X-Gm-Message-State: AFq9FYJ7RbFD8Nv/Qu+ySJLpR4oN0bWIcNRxHFE8SEDsMO20AfwaBorJ
	7rKfusFGPm3l+VbEH+cioXAJhBPji8kSydBpGKnnIgzGCUKLFRx3rhDa
X-Gm-Gg: AYBFou04ENrGkHTLQcjgc/JO9AN9gNfIvpAd9Ua/HgY6EP6+1rGT5N4xerl4XhCz63A
	Txe8O3RJJvaLp+HCRnAJIXh4l9JIXCtC/V6AjzFGDAdvdV67HnrJ6f9t2EEdBEfllLylva5Yp4O
	e+WVX0yWaU38658770msm1dTxQbt7iXK8k83nkYfj2vQ+HEQL7Omy6H+nh49Hh7Cv4tQ+8oyoc7
	WbVDVahEg3pmVXw8dU+bynIfmFdYf7n1r/XfFciL+A+bD30H8mA3FlLkdOwOAbWvCt4PfI6OBQn
	QB7BjnNEB7of8PiQVf5Ab0HCcqHQPppcCJ1oD/QGhuqyv6BMNsf4qv/ksN28MSEmtrldxcVTqr3
	EY6zzSZjGXPqlHXnsoMNuK9fBP4p85sXNA+qJgi4YLrzJm6G7pEreIgPvTYN52r402dPDGSvSwt
	k9tg7H5AG7qKxYh+cuBFd9UJHj+13RTPJQmkN500v1X8bx4ZuLzDEXSE/y3Pe34uBgIrgqWTUfB
	m/Vz2kS/87Rlebu9PJA5mv01VsimDAsya26tKV82nIwK+cyRokgcHfbju+UmqIAapTHB4U/VSkZ
	m4MJ
X-Received: by 2002:a05:7301:1a01:b0:356:23dd:3c72 with SMTP id 5a478bee46e88-369e834e1c3mr118671eec.4.1792778238706;
        Fri, 23 Oct 2026 10:57:18 -0700 (PDT)
Received: from localhost.localdomain ([110.235.239.152])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e6c7dd34sm1139656eec.1.2026.10.23.10.57.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 10:57:17 -0700 (PDT)
From: Vikrant Yadav <vikrantyadav4802@gmail.com>
To: lorenzo@kernel.org,
	linusw@kernel.org
Cc: linux-mediatek@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Vikrant Yadav <vikrantyadav4802@gmail.com>
Subject: [PATCH] pinctrl: airoha: fix bias readback in airoha_pinconf_get()
Date: Fri, 23 Oct 2026 23:27:10 +0530
Message-Id: <20261023175710.19181-1-vikrantyadav4802@gmail.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In airoha_pinconf_get(), the last branch of bias check
"else if (pull_up || pull_down)", has no check on the requested
parameter. It was meant to reject PIN_CONFIG_BIAS_DISABLE when a pull
is enabled, but it also runs for PIN_CONFIG_BIAS_PULL_UP and
PIN_CONFIG_BIAS_PULL_DOWN. When the pin really has that pull set, the
earlier PULL_UP/PULL_DOWN checks do not reject it, so the execution
reaches this branch, which returns -EINVAL. Reading back a pull-up or
pull-down therefore always fails.

Signed-off-by: Vikrant Yadav <vikrantyadav4802@gmail.com>
---
 drivers/pinctrl/airoha/pinctrl-airoha.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/airoha/pinctrl-airoha.c b/drivers/pinctrl/airoha/pinctrl-airoha.c
index f505a3f69c5d..8cf4592cbc73 100644
--- a/drivers/pinctrl/airoha/pinctrl-airoha.c
+++ b/drivers/pinctrl/airoha/pinctrl-airoha.c
@@ -554,7 +554,7 @@ static int airoha_pinconf_get(struct pinctrl_dev *pctrl_dev,
 		else if (param == PIN_CONFIG_BIAS_PULL_DOWN &&
 			 !(pull_down && !pull_up))
 			return -EINVAL;
-		else if (pull_up || pull_down)
+		else if (param == PIN_CONFIG_BIAS_DISABLE && (pull_up || pull_down))
 			return -EINVAL;
 
 		arg = 1;
-- 
2.34.1

