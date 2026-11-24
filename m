Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795510360;
	b=um77N5rjwi0NV9JIi44I5SGc5HGNzEljVoOLGb06M+r9cf5bQWqIPobKBM58hFtNXCY8
	 bSlwq9+eZ8sRO0DB6p7+/vDgpTnSFEzSBhMzCe4F2doYpw0gJwxbN1tC9lsOLjnNdSVNM
	 8iSYeBSnjz0flwuJM6RlkSOx7L0zZrbMXAtMd6XV031eX1Rt0pmXP0tyUsNI88+c0KnjJ
	 DdF+IcsgX1DSLi2Fm9KURvcekepD6Ctdm3G78GdaNu1iAVM6wMbZTg79g5e/NB0diovWT
	 GC9+KWiejwuUBwX3u4ZcJ5SWGkw9kGtUXvfbbsyXLvsT+szXVNXZOga+CEa7ArluOAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795510360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=7uDWlUAJr4F4CNK4r9GLKQshi7c+5aaomjZZmJZJIvk=;
	b=JOfB3dVkjlOy4gw32Lz5bLwT7QwdNTE9I+L5KYKqR9zswFR2FU5JLB0bLNHKuGJ+29oB
	 hgIevFlx9mAyaJ1Rfi0uZIluXOl4A71WhYijcA770yjTGFfQqq8w7D24kCHMnT3Jc5vtP
	 /NHGYDc+fghu67otnh2IPpyzgvwtcN9rXu0l1sOBEFhrndfDGbVYSWFBsE1FhWFZe4eXo
	 QHYnPCsoP0t7XAKByPXejzIqu0os7DfgPdpYVWrQ5JUErSt0dKejQelLm1uhuVkN1kSYy
	 wjkjWUqn7D+KQGSG4qYd9qiDogy7wEJBv8QhXrT1PY7sA8Ll2LgnBRwybua7HYITnvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X3DmwPyQ;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6A80606A68D
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 08:52:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E6A80606A68D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=X3DmwPyQ
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-385d8a00598so6073307eec.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 00:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795510359; x=1796115159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7uDWlUAJr4F4CNK4r9GLKQshi7c+5aaomjZZmJZJIvk=;
        b=X3DmwPyQf9VYf3na1eu5jUwYshDRMayIaxNQjKAMUANy8F8EWm+8IFJ33rAwMsK9bt
         I0VQYF+gLyeL4j9cu4seNwIUdV9Uz62KUfzdA0Nbq+xsuDy5nRv6UhqpG+Ar3xmo92Vs
         Cil3Cx2SRPrK7FRkTLH5PGipnklD+Oi+S6OjvH+Tz0lKLWdgGzvBe0FNkVK+oxlzM6WR
         cFR2CPLqURQgEoaV7ndLHVKQuXMpcweigODPKY6tRISWKn3RbkiCr6S6x/6cGr7yKk5W
         BO5WjNJm0Ox/Jd8DHuZiSE+Rn9IP20+fjm8tQyFMYbCh9Un66ngiV3O6YBMvZHWuLnh+
         Gckw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795510359; x=1796115159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7uDWlUAJr4F4CNK4r9GLKQshi7c+5aaomjZZmJZJIvk=;
        b=MA9oZ57wx1UvJF/w42oDvqiEs0SGNAQ4wDIwx+YW+T4G1Tw8JFERyHprsgvuZEj5eC
         +2yM4D9xASqKukLVqjLfUDXn1rgQmvdkOgLogqNT6g1pWrMapbJtpXpmuoQCT3Zt/xVP
         8k5SxFuKY8BY4lCLC74kf0b39bL45j8sNGRHOfkaxl7h1gLybJ9tIkAcWclUxNRAJO+y
         ryawwyoz88+UspGJ5myVFg3bpUigjLBIKTRjWXT+5xV2KgN6RnldPDViPdPeyXpcjgrZ
         b43eCC0B/pkXnzEP5jM+XYvPQzCJhXN8SYCXkEd6IpNqx3psONZe603ms070+GxK4aHj
         lVnA==
X-Forwarded-Encrypted: i=1; AL+hErE3uKLW1Jl8pdVQ89C18T8ccYg3fdIPEusM9rUu+SZlLjuj4s8VD3JlxYQgAdepTQCmqSUYAr/1s0CE@vger.kernel.org
X-Gm-Message-State: APuU4Z8GUoYZzJvFfgDwmgl3va0QmudTkTyF+qpItO6cbjKh29xOYqB4
	PxUwUAJXXk/T0l1llrdv63gJ+xsrIvVvpkGhVyZUwyBd6g7boOx6x+HT
X-Gm-Gg: AZFdTZeduqRtpB/isTf+jtVJNoFCGWtIOMo7PmycO2NNJMhlV5HU6m9CJQpzXNsXy0I
	4QQ6pSZ5nTomd0FPWeV0+QnQ/trdp4Tl75CLFglHa7ZMgJgIDJIcpsX1RIwEc2IDF35VaN0wmnr
	+FnlhVXHcF2L+0HUDqw/7yvJqFmD74cQBlQHtum5g7Xy3FSVM12+IEYEOfshUKbw04i8JdakPNf
	1WiLtnjDo8RQdkh/RTpXYZtUEx/9JfwUWfIYfNW/HVgKdx36brk48tYajpIOiVBiir+rG0ub+FT
	yf+BkGbXHNMiAI88MYWeGqXSeNHGEdNP/JJZdYjeIf27wMa0HzXja+OupDSeFOXz8wOhAnId3dr
	zEd1uGf/iAbsJtXSnrvU+oaSh+DXtzSPQZ38HkRLxp1SDAzzD+G9R5aJkYxoRfMKcM5oxqQ8V9q
	h8DEGuxddbfqMW3oyyTatTWqIeGtdJvQZAF+yGMrPPZjA87UPAfBVD8Gvz4OJpD0F4TkeHRdfTm
	TmIHUaGkeaRc4OqtXzj+S2Qractp+Y7aYCvlm0CJfJuNVWl5iOJLk2bk8vw3OIssrmaMUIHPU8C
	eRScTdbTMWQpsZVJR0XutAVIgiW+1jYnWcPicoiXbL9HjFI=
X-Received: by 2002:a05:7301:d587:b0:381:d92e:ecab with SMTP id 5a478bee46e88-3856f25884emr13127421eec.11.1795510358951;
        Tue, 24 Nov 2026 00:52:38 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7fc3sm38060789eec.8.2026.11.24.00.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:52:38 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Jiawen Liu <1298662399@qq.com>,
	linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: omap: do not unprepare the debounce clock twice on probe failure
Date: Tue, 24 Nov 2026 15:52:31 +0700
Message-Id: <20261124085231.3696739-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
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

The debounce clock is now obtained with devm_clk_get_prepared(), so
devres unprepares it when probe fails or the device is unbound. The error
path added for a failing pm_runtime_resume_and_get() still calls
clk_unprepare() on the same clock by hand.

When pm_runtime_resume_and_get() fails and a debounce clock is present,
the clock is unprepared twice. The second clk_unprepare() warns that the
clock is already unprepared.

Drop the manual clk_unprepare().

This issue was found by auditing the driver with an LLM coding assistant.

Fixes: 9df982f1f283 ("gpio: omap: handle debounce clock preparation failure")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/gpio/gpio-omap.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 0da628ae77be..0af26c3f7197 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -1463,8 +1463,6 @@ static int omap_gpio_probe(struct platform_device *pdev)
 	ret = pm_runtime_resume_and_get(dev);
 	if (ret < 0) {
 		pm_runtime_disable(dev);
-		if (bank->dbck_flag)
-			clk_unprepare(bank->dbck);
 		return ret;
 	}
 
-- 
2.25.1

