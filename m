Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326E037AA9E
	for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 17:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790703463; cv=none; b=s9vZk6rBUmsjVIaVjX70jo8CiRiaNSatvPlYIYjXeLAszQcht/XTVTkvuFb9yA015JW/pvP4IwCi1BICJGNWAxQApe18yeRE8OLUVTitr/eNrg+BMdUqdq1w4yA0LYg2k40kAOzUkSamEDOfvJ0KWJt/qYimcX6iu9GY71xmtAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790703463; c=relaxed/simple;
	bh=WuUcAzxORAi/NvzLQhHihO2F18b29yojE4KRQaUUVOo=;
	h=From:To:Cc:Date:Message-ID:Subject:MIME-Version:Content-Type; b=bsf1f9fa0A3mt+rpKaUBWB7UEZIw8TycfP2LQomi9369ep+RyGSav+jcT7BolC0TcJrVzH0zKj24hWCahVTJXqIZ4SnCoURIYbjGUbEpnQP59PlOznlCSOhBUJGuEEavK0PhYo9H7X7rtgDNJ8nF4L6/48OFfj82+JFt3yjzs6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aRuQ88z8; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aRuQ88z8"
Received: by mail-pj2-f38.google.com with SMTP id 98e67ed59e1d1-3a4bb1ed012so244086a91.3
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 10:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790703461; x=1791308261; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:subject
         :message-id:date:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1LgjjHuZM7hv4U9FzcsiGLGTjI70HTgY6uQOec3GLSE=;
        b=aRuQ88z8fZHvQpiFGI6XBaukcHlzIQd0e0RT6Sf7gu4IhmSTfwjljs3oJwHpM1d32J
         swGltt+lF7Wu9Tp1RuB/2pRSLg7UXR/WyqzWz1iXndeCIGss1428Roq4AfNfAxbcF8Kh
         Taa3yquPITU2MLfbAX9TLISo0bMl+xzCXYdsHrM4pZ+yrhvDksRyxrAx5VbYfMIbdDxy
         szT6+6+qVM3qWZWyIrMYg41rRiJqp/Yj7XOR97kBQT3Uu12vfvwr7Fl8kpbMQpIHraUM
         /2JfoYcZ5ip+P0C7ZdDmuNbIR0bA9j2hYFUi71bn2/QfF/oM2aOqM5Z1wM8HBtgZObzv
         NkRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790703461; x=1791308261;
        h=content-transfer-encoding:content-type:mime-version:subject
         :message-id:date:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1LgjjHuZM7hv4U9FzcsiGLGTjI70HTgY6uQOec3GLSE=;
        b=plPtrN+mNyo7+UHYw1M6FsmN6sr5qkNO1778L+QjzFTo2ASZWF4HnpXWvWaYiYJ3W/
         dj7/djw+Nx1fhBriOQxKkgdyZr42Dcl2OcmR+EdwxAlLXLPWz6XQG4CRLs6bvKw0yCOQ
         Vy8AzDAXBAytvT/FJXo4QTcZkfi0zreM9jYo/EEhd5gMakqT+1oFYTFdUwlX6cAkRo2o
         IK41fXEXc3/v+LCNz7xKRBXPyiNR6l/gOb1An4H+JGbcLFf887iIG58VoxhBXKGgXCPn
         hVJqY68t+m6NfrgX7GeyOxksTimMsm08iV+kMvvpyECP2tPzLde1Bs+2YduFrgFXYx4K
         zB2Q==
X-Gm-Message-State: AFq9FYLp79hKY7btZI8huB26g4t3zJagMlzBkymdXOMqq0qjK7PCyR5U
	AuIEbU6S8UkguhPMc/szkYHopjgT/q8qqsZMwVbo+yMiEgvYE1CMbnyNEX9T5w==
X-Gm-Gg: AYBFou1PO3BQEKWfY92TUNs4vWdWkZMq9ZCdNuFbV82cMVNpNVD21fclLYLnU+U6TmS
	n5u8c0qxHXK/CaE5tko1m/So2CunDS3PdjU+BI2MuW82HMqYr8R21TJZztbm2KuCkGYrWA9Z7BD
	JV10UYxVVarJbDh7Cqi+8THWQRXzFl5bcUZjyv5L/CFHgqrK0HTVNPQXNkhb/Kd7njqiR6+PI4N
	6FHLZW9phG7RCHezZyG2Em/XIfmLBhGoKHNeLM/psQdf2RwemIS1zGm5jun2qTR84zkHt8A34LP
	SUa7ZWkRvutMCwfxcOUQEsChHdOxfdhN+qvbd77jIAyxjcWTl7Oip/6Yj+4MI1DuIYK0eNhx+RU
	TC0dSnnSHfWtPe/saen+7PMBGtuF9abrAqbnolF0FS8C3Cc6i64K8WajNuVFvW0y9L6Euf59ocz
	KDoPQOT3j2/LB4YcNlhycmjJ8W/Sxl8038cbJhUjlhsVd3FfxNSrFdRmrlxOzZ3TzjpQv+N5GUP
	5EAuZ+yMpDEJG3dgfAS5v4=
X-Received: by 2002:a17:90b:5343:b0:39e:5cd8:2140 with SMTP id 98e67ed59e1d1-3a4bfe25da9mr87041a91.20.1790703461517;
        Tue, 29 Sep 2026 10:37:41 -0700 (PDT)
Received: from SANGHOON. ([1.220.132.212])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4bf19bf4asm124187a91.2.2026.09.29.10.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 10:37:40 -0700 (PDT)
From: Sang-Hoon Choi <csh0052@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, Changyul Lee <lcy8047@gmail.com>
Date: Wed, 30 Sep 2026 02:37:31 +0900
Message-ID: <179070265834.12871.48183786512201899.idr-bug-79@gmail.com>
Subject: [PATCH] gpio: exar: initialize the ID before registering its cleanup
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

devm_add_action_or_reset() invokes the cleanup action immediately when
registering the action fails.  gpio_exar_probe() currently stores the
allocated ID in exar_gpio only after registering the action, so that
failure makes exar_devm_ida_free() release ID 0.  If the allocated ID is
nonzero, this leaks that ID and can free ID 0 belonging to another device.

Store the ID before registering the cleanup action so both the immediate
failure path and normal device teardown release the correct allocation.

Fixes: 5300ebb695fa ("gpio: exar: use devm action for freeing the IDA and drop remove()")
Reported-by: Changyul Lee <lcy8047@gmail.com>
Assisted-by: LLM
Signed-off-by: Sang-Hoon Choi <csh0052@gmail.com>
---
Compile-tested with x86_64 allmodconfig and W=1.
I have not tested the devres allocation failure with fault injection.

 drivers/gpio/gpio-exar.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-exar.c b/drivers/gpio/gpio-exar.c
index 9053662f18177f735db2cb33fd690b39dcf3fb0b..f629cc526f3ee71ae20e88ec1979f93bc04841e5 100644
--- a/drivers/gpio/gpio-exar.c
+++ b/drivers/gpio/gpio-exar.c
@@ -199,6 +199,7 @@ static int gpio_exar_probe(struct platform_device *pdev)
 	index = ida_alloc(&ida_index, GFP_KERNEL);
 	if (index < 0)
 		return index;
+	exar_gpio->index = index;
 
 	ret = devm_add_action_or_reset(dev, exar_devm_ida_free, exar_gpio);
 	if (ret)
@@ -214,7 +215,6 @@ static int gpio_exar_probe(struct platform_device *pdev)
 	exar_gpio->gpio_chip.set = exar_set_value;
 	exar_gpio->gpio_chip.base = -1;
 	exar_gpio->gpio_chip.ngpio = ngpios;
-	exar_gpio->index = index;
 	exar_gpio->first_pin = first_pin;
 
 	ret = devm_gpiochip_add_data(dev, &exar_gpio->gpio_chip, exar_gpio);
-- 
2.43.0
