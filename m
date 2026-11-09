Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794196638;
	b=YMFMLSDt3KWjMAXrHYDlPGwsAaGHDvlvH/CXno86z3iU6WLWqkwqyLuhDOqyp6IAIvQe
	 Y+QS0umc4h3obT6ZeYM9p7bsUVCNyEH+2hNfO0cjlU6YURL/jdPKS+jDHmlEPQR5pe188
	 d8cS5vk2J1bkppiQnbna3TLSwH/d6by6Too9GzK6YYhKQgKh7Y5pHpRpEcUFEaqGg0lPz
	 Wm9New8z1kdE9Q5coJ97vzfeUr0l+4fRLJM1JhinT5obXuIGZts++OGU5ZEiW/djhrXdt
	 V4T7KvsGJ/vLQ91qs+k3HP82uPP7ZDCZ1AhedZlBmYch74T3AvTeVsrulMxaDy1SjSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794196638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=zzUsqoWWp/37aI1KkAkv33nSCnrwJtj8I9U8iTKFJOg=;
	b=h+8UuizFN1VI85djrOGVwGPQwumdOoBUX3nt4suslyaV0h6zeOjttrqCcTf0x6IiLAne
	 eqAcUU65HFAdJONvi67yDgI3g+HIr3OqevKnx3tb5+Nfu0Su8vTUFOT1Py0tn1wdM73xO
	 yomttumVgcG4faLfJzWpSxI8nUEevIKSD3HA5w3MvL498ZtiEKvghRESWFUUJGNXqE4Dd
	 9mJm0gh6aY4HHebKRegnUEgWUUS+M6lagcFDSfS3lgESmLyvuNjZJAfHM6BmWR35o2rA9
	 rAk0TPcg6ih8b9eelnwX/y4nLat9dbFKzEOpYSoGhF/+k3/uleaQqqpAzON52+umeew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UhD46Ax0;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C39F606A321
	for <linux-gpio@vger.kernel.org>; Mon,  9 Nov 2026 03:57:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C39F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UhD46Ax0
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1ae18eb9ad0so436003c88.1
        for <linux-gpio@vger.kernel.org>; Sun, 08 Nov 2026 19:57:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794196637; x=1794801437; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zzUsqoWWp/37aI1KkAkv33nSCnrwJtj8I9U8iTKFJOg=;
        b=UhD46Ax02lVvzTXSCqc7wlSSw+K38YCbkGD8adP6ACr1JIGkoKbsmH16TwSp2vKNMO
         7g2NyPuAUgmx+xnaC1ezwQU06ZLtzuLkwL/i0lwTF9RjsN/OeDGWhL5fkfh2OFYRf8nE
         F7U8x9Fgqk++v81kIKE92hyxZ6k1bqefPf3Q93M993Xkk3T86PuVon2G06fxDbJ8HH4a
         w06NLtCCV4RqoacpvuzLXldopi8YATEG4gOqseckgHiV7R7S2AqdG01D4RwWBsXZlKYJ
         lahxFEk4ZXrNOJwu3FZknXFXq/WgFNVBNrcBYIWJcUkutxnMGHhgs5rbxI6gCf68bUjq
         xPBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794196637; x=1794801437;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zzUsqoWWp/37aI1KkAkv33nSCnrwJtj8I9U8iTKFJOg=;
        b=0E+pIWqBgKxcLwFhKQ4mpluM3DD/Nql83A+K0tDqE8zvWnBsQ5740CKeFf+Y4UMUOk
         tbkGzyqtavjq0ZtfFGk0j114Jna8CvYq43vccmXt9fmakuYEoOTaF86AWqzhz524WdvW
         bdDvb4JDt/AFBld7i1/aQXc86q+09bl8RGsInGysG8VfaLpwBqn6hjMP9nrc7gPrWhnX
         naSwu4jB1M9uFjTkdCmwIkg1PGiWeUclrbG5HizpmPRX7NrxsclrT4hPrwoe42UB++GP
         1a5X7t04pGKdPkI44o7Xq7pDzN4a4JknFhGHviit11y/PPumZym2NkpKwfk3mMKamcaN
         naqA==
X-Forwarded-Encrypted: i=1; AL+hErHyAb3XqaZi0ZydSMjNie7N6a30Gp8GxtOfCJwk54e32HqXN+6ReRIpkNc83VLoVzqCCCVMImzRvcTJ@vger.kernel.org
X-Gm-Message-State: APuU4Z/R0t0Dqf6PMqteKBxpGJuVvdnSVGBJM+G+q39aupLCViZ115JA
	MRsQniN7+vMAsTC4cTerPK4KO+Ku5icPnTGUbfw50lYryqmRk2yKEe+2
X-Gm-Gg: AYBFou1NNuCVW8mVfAO9ex2i+Dg3vTkhF6zieeGfywQEHwygsVT1V8lysB66RsGsiu9
	yd87XCfoJfe+PXFs0SzZpoXyl3TrQkgUarKmxw4ojVxv4DcPjfNUSmXiWuBr/O0z7RltC+EqE5Q
	vx5TBpSjVZfypU1qEfgWUE+ICHb+Bmj8WEfsH13YcS1rhlPk0exs0ZZRIu6f4QnKTHGR5bRow3l
	XCd5Bf8Pex1b2Vq+nypL0HtQrpri6TTlec+23UwMCiIELchMJaiJmJ/pWhQBbQBDEtADw1TeWZZ
	ukb0+1APGURWprXSrbmv6GSGdmvjmDxA2AtLEFUnZ7AqX1LJsiRfNVIBOKcOorWxJFJsGgslE0j
	oA+yog+uveTykyyr3cA9YLPTw/0h/Tqps+mknC8YUXG7WzJwLcZF65vF3V6zHsHKaWwSGBGgea2
	wmvltI7BHxybu5w4QbatJ0929bd0DsWT14Wh2HIUjxKY+8TE/3Hp4e28c1VyD493kwmnDTH8dj+
	JsWjpNkgNrL6Uk59WCpyCYz3XjhE6YRlA2pWeeGI3x3Ef+HTFP0x8KSALDmoc4TL9V28ie9RsOO
	w2jG6lBMYF5sptqrkFd8Ek/r4ctXmt4ZDKMlFY34RnIykg==
X-Received: by 2002:a05:7022:1709:b0:184:992:c9ec with SMTP id a92af1059eb24-1b39fecbba5mr4108971c88.38.1794196635837;
        Sun, 08 Nov 2026 19:57:15 -0800 (PST)
Received: from debian.prasanth ([103.183.205.43])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b37560d95dsm8720109c88.11.2026.11.08.19.57.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 19:57:15 -0800 (PST)
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
Subject: [PATCH v2] pinctrl: aspeed: Use managed pinctrl registration
Date: Mon,  9 Nov 2026 09:26:33 +0530
Message-ID: <20261109035633.93522-1-prasanth.padarthi10@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261107012236.28069-1-prasanth.padarthi10@gmail.com>
References: <20261107012236.28069-1-prasanth.padarthi10@gmail.com>
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

Fixes: 4d3d0e4272d8 ("pinctrl: Add core support for Aspeed SoCs")
Signed-off-by: Prasanth Kumar Padarthi <prasanth.padarthi10@gmail.com>
Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
---
Changes in v2:
- Add Fixes trailer.
- Add Reviewed-by trailer from Andrew Jeffery.

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
