Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794014682;
	b=hn3q0EApjNsZ6ccOqoCRonE70RYyhk4gAWALSzURdBgmvej+VmCrr9nlH1fTSf9R6SNP
	 hOG/EOBTMiOhBW/xvBt7wR9NLJVeeYNRyE9jEROXQjl5vDAYYzl8l/jNSfw4bayEO4G/y
	 y8bKXaruM+ujld9Yy/llmqWh2hEb+qPxEudrd4syFAS0I1Ef3wH5YDkiJhfijLyFEFY9e
	 JOyx3DqAhhjdlLz1wxkoRR/lsCO0X0miBzpo2QdkcwSa90gatFEwetHeTmtc1QQsUlODX
	 sE03V+ayFV31F0gaw2iUU9M5W03jkMhBKbKk3zqsy+v+6weK/sRk+fCkCpYpwOUt9kQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794014682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Le2Yx3zcrP74iTf6eGB+z3D+FEYMTB52lqn+/VIHlMY=;
	b=a+N4PJJVW8iKEC9/z8e+/TuBwsZ+v090hwn40acw9DfBFqCcRihitREKv6UGsl9IYHhb
	 BsXKPON8g6I0D6yFYzdbaMLBKzpbqtl+YYK4qzcmu9JE+rQCSd5j6HnUXffRAU4PgxoI5
	 XXVfFj1l1PyFcxYxBEwrzzV+XRiTrhNuDJgGjorg1rY+V4GSMq8qBJuDyVAt/cgHLqPK+
	 f2mECHX684RR6peKjGKbwm7pt9L0ZSNW5eSo9HIzjae6Wq1/C0H2w3Pfmp1N5HHNUn5TV
	 YIqiwNIdsjbAGSgkf6xGXdxWtpa8CdKwUiihmt1cOq0v7GsKeKVghztGjiHASrbQzKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LGCymFRs;
	arc=none smtp.remote-ip=74.125.82.48
Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448B0606A32C
	for <linux-gpio@vger.kernel.org>; Sat,  7 Nov 2026 01:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 448B0606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LGCymFRs
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-170135e43c7so2143226c88.0
        for <linux-gpio@vger.kernel.org>; Fri, 06 Nov 2026 17:24:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794014680; x=1794619480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Le2Yx3zcrP74iTf6eGB+z3D+FEYMTB52lqn+/VIHlMY=;
        b=LGCymFRsmUou8HaXfCPzZUJ6tcfErn7lktszwsc7Wfdbx+ihr0WVTsd01ajvVMOxEZ
         Y6knqyRdu4rH/SSeVdFY5QXjskmiT8B+ScQV/WUmzgK7ZZHa6cmMCZelHdJH9ncxU3qn
         bQvRTCM6GDY16VYomUINKuC2XE3jISOAxshuAwJoHIobj2Ll5hIZNAltqaW8qzUw3RoI
         yeB6Im4E33csG0k1yl9Z5FfMjRkHzc2z4EW0ySZP19ECszwHHf3wUfi3b+2OlM7kIHbZ
         9MiZOJvD3em/g+724thhV//Rs50M+f7Jr9lgBu3P0fKoHpBz5Cf3MnN1aziuZ+anc0C8
         vA8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794014680; x=1794619480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Le2Yx3zcrP74iTf6eGB+z3D+FEYMTB52lqn+/VIHlMY=;
        b=eK7HDxJ/wYNT+KgyGfrv9KEcsHAOaMwobHJVqvPt7GrIa2HKxJmeWdvh05/FxEN5MO
         zY2hxvBKqpL+PrkY9r8e3CSv6RiuwW0wpnG4Zb2Jvz455oh9nxr8xoDdFQD36RdwBvor
         3x+3XueRgH0MdFfXdGbTAuv+8iMIGjMZ0oqfP0ITmPgDNnffSf/dwiWiY15Cg80DbPdW
         vfyN9/MIIcfC7ADxJJZhD5yzMXPBlHS55KAafPf7mZDxhx0r2uC3MXH3NnI8Ap8rgAbO
         2y14L/4sZk05sGbBOS5HMJteKy6lFMBrZdXsd9JedH5Hu2P4r5yvxdkC5jY4UknFRSdC
         oHiQ==
X-Forwarded-Encrypted: i=1; AKwUvBwbUgw4vOvUZBn4CGJbaRunysk6SG0rBs2Ni6ut24RPLbKek1OIR96cPox/ExapqZm85OlRRANsyjc6@vger.kernel.org
X-Gm-Message-State: APuU4Z9/buSVus4PZGkxNSjqh9PhienYa6Epqnv4Lbq9kjHNnz3M2LOV
	7BDKbKY/2ZcqfBSnZx9MZNQjftdu9o6DFwAtU7vh5EJH+k1LV0h0cK27
X-Gm-Gg: AYBFou17sz0z4XyEEYRQSdkWKuLqyDLqtRFO+o5zif2hUZOwce5DLVdqrWEMn1gKdWD
	l9Io5B3W4IgKaODyRH6AdOUEIiqcF0XqveLNcfZ8Nd2zDKc5JP3khseynGg4tyBxg1v/yCol2wv
	8XuYicbD2LO1eoo/mAoAsI7LOWvgADineWZd3t7lfEj4QYFnRZTp9bVNvtztT6M4mIwkn8EsVR5
	B3z1VT/neWph2ZNzMjvef57vU8DBJaBTcNnC0P/Naqm2jUXg1YmxaMRPlNLvwOuAfyrRn/9Cvlf
	GLb9lKIP/VNBMcyfJ1F6H/UN7PcIFxxfjZoFqu+hpZ1Zuw8xOJij8hsCbU1y15O7f+odel5OMoE
	O6ecJZgf/QIztd6CW5w1mgHQ1CymEp1gIIIaOcFrkMzsnBmp+aaICSFze/DVDbT7T1v7y6QT25M
	WNvFK5ReUXVwPJVqIJjVT+zxtrdXolaoPrC+JkQUgKEyunZ/oxgG7a46IYbfUQACWkEcqZoURcf
	Rzu4YoJGCGgX07tlRqnN8WbIFtaPZDEiippyuGImg9/a6ZeHySCXiZ1lKw99yfbnXM2qHHWdRVH
	LmlcgeRJCeybuQ6SdkToRdI37zcx3h3SUfxhBm5fBkz94w==
X-Received: by 2002:a05:701b:2905:b0:16d:1e24:5cc3 with SMTP id a92af1059eb24-1b25d3190eemr4699302c88.19.1794014680193;
        Fri, 06 Nov 2026 17:24:40 -0800 (PST)
Received: from debian.prasanth ([103.183.205.43])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4880dasm8436986c88.8.2026.11.06.17.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 17:24:39 -0800 (PST)
From: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
To: andrew@codeconstruct.com.au,
	linusw@kernel.org
Cc: joel@jms.id.au,
	ryan_chen@aspeedtech.com,
	billy_tsai@aspeedtech.com,
	linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Subject: [PATCH] pinctrl: aspeed: Use managed pinctrl registration
Date: Sat,  7 Nov 2026 06:52:36 +0530
Message-ID: <20261107012236.28069-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
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

The shared Aspeed probe helper registers its controller with
pinctrl_register(), but does not unregister it on device unbind.
The registration can therefore outlive device-managed data.

Use devm_pinctrl_register() to ensure the controller is unregistered
during device teardown.

Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
---
 drivers/pinctrl/aspeed/pinctrl-aspeed.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/aspeed/pinctrl-aspeed.c b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
index 7e0ebf11af16..eb5f404af8c2 100644
--- a/drivers/pinctrl/aspeed/pinctrl-aspeed.c
+++ b/drivers/pinctrl/aspeed/pinctrl-aspeed.c
@@ -461,7 +461,7 @@ int aspeed_pinctrl_probe(struct platform_device *pdev,
 
 	pdata->pinmux.maps[ASPEED_IP_SCU] = pdata->scu;
 
-	pctl = pinctrl_register(pdesc, &pdev->dev, pdata);
+	pctl = devm_pinctrl_register(&pdev->dev, pdesc, pdata);
 
 	if (IS_ERR(pctl)) {
 		dev_err(&pdev->dev, "Failed to register pinctrl\n");
-- 
2.47.3

