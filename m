Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793804423;
	b=FZO6MCLo7dZKGzpIZfet5vU1+hR54PqsX0bEXWYS0coNA/QoxrPO+DR3cioSoZ3AiE9X
	 l19OEXY7sp3eW7sPvaGOmaqyVqeYMmgL0DqS+SdKKf11Zu0QNSdqWBmb/HJx81b85yI/f
	 //pKmKk9x3N7TCsVZuWVGY1CjkBfjsgQuW65N+043usR/RL7mbBAQodpR51Y67Z72h8Yg
	 Sa++cSpjoCuw+7VkkmcG7I7R+LYGPoCqN+zrnSFTu5/cq8SwToQyEK+v16nyBlPbMm0Qr
	 7pvLepkxrXTH6Y2wc8YISQ9f1LCgOvCdcHskVkEBCxudHYY6vCGmSJnaVdlNbFRKfYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793804423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dJ5nNF8fJBCcyjpTvRB287LocZ9aEZbE3ISg2aHVauM=;
	b=JR+1UHErEXtWn1rKCEylEdvJvSzP41VoB2YL7e2Iy1x0g1lFLXJaHj5GomWgj78ZeDOm
	 xYVg7nAe6aRHdzTKY9uKUcs+DhF56jaJHbkj06a6/CMDLCHBC+J6HdCby1j7cMBVWaVM3
	 LCApQ7Wbl1RqwIN5WW+eY5Ugs39I4QljA8ZjoXLh2LZR/9oR+P5x/T7COAvIlBR5ZsKuG
	 /nAlPZiBsm8Zte+caQlmYy5GK87GXsa2/IHMJ+5ExRVF2JwyaO0WFLlxnK2Mf11Llfnw5
	 Mrk8CgtPhtvj/yVweXwLvTe8Ge5hh7H+EpnlTeQcC3HX65eSsQy6txT4c9w8NpKVWNQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lzf+dOfr;
	arc=none smtp.remote-ip=209.85.210.172
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D354F606A333
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 15:00:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D354F606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Lzf+dOfr
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8a064fac8cbso659443b3a.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 07:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793804422; x=1794409222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dJ5nNF8fJBCcyjpTvRB287LocZ9aEZbE3ISg2aHVauM=;
        b=Lzf+dOfrGHScRBAfcGM2MmST2gZLT2E4ucniQYUtPQxQRdkQ9bUBAvBHNzcKew6exF
         3B/5Y7xLOsU8qoeGzb9qTfBYEZx4NKwN27DqVjYRSkgdgiHZ6ejsSqJeRscSAfKPEW4v
         wHaxPw9IYwdJ0PVwe7gInvDF5E+irsr278FWXaE9xOUK7xbPaYgsHHdydg2Wyji4+Itl
         1BAdLy8QhMpiS0gUY8YXbj6VVByDY2dwHgX+ozNE0kCo6prFsktr/1W2h1kMdacU3Szm
         UhtwGhKQqTEm6a0oH9wYPcwRRtD8mmQpgwiQswJAFrcpCRXa4CLhEeLl2UpjLZ4kwj2W
         AMog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793804422; x=1794409222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dJ5nNF8fJBCcyjpTvRB287LocZ9aEZbE3ISg2aHVauM=;
        b=CmAFwn684ndSV35jnlMIqFdWrYkgjRPLKkXKPGIstxdZ29wb49lHfgCQNouCEuAitj
         9Tw1I4tRbO9RGRuHEY9EbjZbCL7UNaLVNk/h9KxpZEjggYXI1EVGOvcejAcL+Tf1lplu
         YwrRNkFCML3d66w421tWPd7KN9zinJI2g/RfxDABgHuAmteP6S0MCvo+4GYMVKDZxRk8
         JbC/2nzLyNINKGIYCbg9IiKZ2SJI0QwCn/hv9eXVkCTGoFT0ZgeW9Ulz8ByRY6fUVq/g
         FkUMQ7a/FfTzBBGZpx0ymvjTkBKxSqI4u595FNQUtVYjzGH4qqnYB/tezI3aPqR3MBek
         CLtw==
X-Forwarded-Encrypted: i=1; AKwUvBwZwHPZuSNyX5uizM19agvkYZ0tw4rKN8s0vEnzU7Rt5M47Cn8rmkoqyqdMX0J+bxMg47dQw5vrG5Ux@vger.kernel.org
X-Gm-Message-State: APuU4Z9PW7m3Ry365fhTwqH7jy7828uOdneHOJFcCJpb52j3qKWjU8dX
	AXDjQ4yxPU7Vl79Mr/tREAw2f43ybvXDot0K+s27nAezcSfVuHkHmjPY
X-Gm-Gg: AYBFou0hcTFvFl7hx+3cjiTmkfhWxb8Z1sCc+BnlsmceXQ3Lqumb95aEwybx6fUJCxP
	n0sExclBOAdinnNi1odwp7gjJfO8tYP57P+2Unrxa4jhUDikpYyKoyRukJvrh8zQN4c9SCXlxaH
	EhP8TG4W3L/Iz7qsROL5IES2y/7jKA8woFjY9cKHMfDAXewCjZxoOOq7tOxP9zTQNuYmvMeiV6y
	v6exi4L0Xl4dpfGJzJgDkcRvgS+vtkQ21Y0bRmRxzLE/q3kUAjtjQrenvqkeXJWuqP2auS1Owxp
	40/eNJWRraibRckMnKR/5cCGdwKmISjAXQ7z1fggd/BGRA7AVKPHWfuZK0eD+Lr2T4WGSCNWZYA
	PFjFv6UJdzs36hKmIDNn0O0fVr1XPVeGkfXLWVYHjU2EkVDd8EOcg/Dk3quoxmZ5S2aQonh5+64
	EcoajAc6bv6Hc0MasprLXrPXApIi7WdKfh2Kf1HGpOIRYY/qZVAzDpGzGVtkqdvkP0xYrg1AR2n
	5CJJt9jBdbMvWXhy2OQmjNbdJx6MEkbOnOWmw+aArp0IGyZqcu4ufG8LWzwpYBJYOB/BxStPr46
	hPIg6/4Ex94v8d0JLS7kPB4KUqFHiVtJvnybuIyhgPT27xHt2iYVB3CJu/BMcxmTHZSy1rrqveO
	/ANR61oblg/G1Q92mVnIT8rzpCmqwkmzLuEjuQsi1meT2HApj
X-Received: by 2002:a05:6a00:140f:b0:89e:f8e9:205e with SMTP id d2e1a72fcca58-8a9bf71c0f3mr13544009b3a.40.1793804422077;
        Wed, 04 Nov 2026 07:00:22 -0800 (PST)
Received: from localhost.localdomain ([2405:201:301c:f8cd:5040:8550:f5e4:709a])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8b09a7cc077sm1062059b3a.15.2026.11.04.07.00.18
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 04 Nov 2026 07:00:20 -0800 (PST)
From: Aryan Sinha <sinha.aryan03@gmail.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Cc: Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Aryan Sinha <sinha.aryan03@gmail.com>
Subject: [PATCH] pinctrl: starfive: jhb100: use str_enable_disable()
Date: Wed,  4 Nov 2026 20:30:08 +0530
Message-ID: <20261104150013.32879-1-sinha.aryan03@gmail.com>
X-Mailer: git-send-email 2.46.0
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

Replace the open coded ternary in the jhb100_irq_set_wake() function with the helper
from string_choices.h. Gives same output.

Signed-off-by: Aryan Sinha <sinha.aryan03@gmail.com>
---
 drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c
index 462a26697..329153876 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c
@@ -20,6 +20,7 @@
 #include <linux/seq_file.h>
 #include <linux/spinlock.h>
 #include <linux/string.h>
+#include <linux/string_choices.h>
 
 #include <linux/pinctrl/consumer.h>
 #include <linux/pinctrl/pinconf.h>
@@ -1152,7 +1153,7 @@ static int jhb100_irq_set_wake(struct irq_data *d, unsigned int enable)
 		ret = disable_irq_wake(sfp->irq);
 	if (ret)
 		dev_err(sfp->dev, "failed to %s wake-up interrupt\n",
-			enable ? "enable" : "disable");
+			str_enable_disable(enable));
 
 	return ret;
 }
-- 
2.46.0

