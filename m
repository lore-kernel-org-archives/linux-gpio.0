Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10016477E20
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 12:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784118577; cv=none; b=uwFjRo2qm/u3Hj+afqrNo2MJuYKCW6aFC7JFFAQo1LljHkQjiekvY/q0EaoC8YWDEkPGtyxMFTfC/9QipSqNKx/jcSk3jlBjTvEG7TbI4cmZX/Ai1Rpjr1Gw7uI6S2xWtVTl1SsntQCS/Mb9LyXXTvlQhWts8OcMqfCTk1oRvMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784118577; c=relaxed/simple;
	bh=MlVPvpJnOzb34zOzPdQbWz4nrno9/JBgCsgLJAS+p/o=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dMOhkDpmRl+rUaesM6cCqv1titHlzcYdMBtLoZGnKR8z0LpwqTcww1QzbBSWMV43QccV6oSx0u/JKlUBhNwJpQv9+sjn0FDI2bowe1JLB7vgNXajH+TArF6S3F0jZ1hsT6ZYCDlzviJm5fMQvuWjB0SBLX/3+6txBMVjxgh1Oyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=on4sGSpZ; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="on4sGSpZ"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so3762845e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 05:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784118573; x=1784723373; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+2HhYmHPpN2k6gv+cX337Z0vUPpech30HlfXZ14MwxY=;
        b=on4sGSpZW6/TRI3K4r8aO11JA/vwuM5xkVAJKofiSnqbQl5vcV6/VCK7QW930EEJjg
         4eIUpNrTg66H2a3gtbeBXjtUAblsp1uNtLbRuRceu5lWPkhU2DoJ6EhKqsVpZEXMoyVv
         w6kKWGx/+QVfIJkUzl/ZgEfdSO9MxoJBdchkqNYiW7ZGTd+tCt0MBnXjs6pldZQaPlcc
         0it/ahkv4MLDJk7+7EaZPRl5Na4rAQKHLR+UYJ1jNiip5zhk6JzB88ilUZb2tTCYBNJN
         hatzLk9Ca2iDdlMl4q8LAVNF8nm/JTT3mk5InpyGMJkZmrFFOw37FdSIfi2vI0NTaIDv
         wKww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784118573; x=1784723373;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+2HhYmHPpN2k6gv+cX337Z0vUPpech30HlfXZ14MwxY=;
        b=jNQIpNJ9aBD5Nt3aCQvjXRP+8m2cqlFhPkdXMH76SCVHWx2knXCbhsLSzCBtOzddgX
         pwsMookzTIUXOrNJETP8eUWDk7deHarcJbNBscdkJ13zGZfJjJcOH+Ebv32ivuZiLx61
         V/3daOb2NCuVdaAy1RAOd67J8Rr1/RnIxEvWYWFzGYKo6UdghgM1Gi7T/ofFWOcGLkeO
         eRmJyOxeUzOXJhZlRsqE4/yGwpQmDstVqUQqQiLi7MNvGVSrqGlv4eGn8lTZrrwWqd9r
         TOol2x9rZDKgQBErZ3InJRjYfTtdNMIsClNC9aGlLWHUA+wUD5nCRIN+PdHdey3cAcdD
         oNyQ==
X-Forwarded-Encrypted: i=1; AHgh+RpJSdWPoVsIK0yCkuQhA7BNeEMCrZPBaJ0rD9bmYgmCgEI15afn/+X6w7Jz3i6+xldjgzPiJxiYTitF@vger.kernel.org
X-Gm-Message-State: AOJu0YzJzuTcTf+4wAMyEpCSFxGg9TbkffNPLYIMEL1pR9ji9tItBvSS
	Vvw+cvzUOkYcmATAfFSnCWX5OTPuHSQeu1u4ES7OHqNAtQqyu8dBCmOI
X-Gm-Gg: AfdE7cnQZ94kIvaZNHAtakh0u0CWyEzBaY/v4aRJYBDnRSeSabL9Im6taajb1BU8Bo/
	J1L2MnU/fgHMa39YEcCuk07qtYD7aRSXVDmjWX1uPekWE0QrnHwMQ7gQrrIQvPiIBL1V0etxv8M
	eB8yabqjBptCGepwuTT8zrKMEfedxcIRU5IZo8ZjZrw85pbQByxYJKj7sls846jh5QI33U0qU6A
	4ehsMIDW/uiePeD4qN59GWAvcHnmzs1lHP/tpXZN1j/qYUic3Xt8/Gy0OWc5cLHQMwIUley0iVh
	o/zWtWLD1bf2EJuEGv2ZGzF3OlgW/FbSBUuW2RDn9YcBWN52ZamWL8OLzvTnGnUf6Xk5cu6Xh9r
	J7RNi4JWHn+zuXhb7k5nT8yygYAYPHUQVJSKXH2eI7daYC3adZYheRb2U6YXlL8Lkm1bXwoQrZg
	Yuer21fNTgfhykaCpyM4pLm+k=
X-Received: by 2002:a05:600c:1f87:b0:493:f870:fbf0 with SMTP id 5b1f17b1804b1-493f88b3693mr214909345e9.34.1784118572456;
        Wed, 15 Jul 2026 05:29:32 -0700 (PDT)
Received: from taln60.nuvoton.co.il ([212.199.177.18])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4950a32a2casm216770715e9.12.2026.07.15.05.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:29:30 -0700 (PDT)
From: Tomer Maimon <tmaimon77@gmail.com>
To: andrew@codeconstruct.com.au,
	linusw@kernel.org,
	brgl@kernel.org
Cc: openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	avifishman70@gmail.com,
	tmaimon77@gmail.com,
	tali.perry1@gmail.com,
	venture@google.com,
	yuenn@google.com,
	benjaminfair@google.com
Subject: [PATCH v1 1/8] pinctrl: npcm8xx: drop RTS/CTS pins from bmcuart1
Date: Wed, 15 Jul 2026 15:29:16 +0300
Message-Id: <20260715122923.1938327-2-tmaimon77@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260715122923.1938327-1-tmaimon77@gmail.com>
References: <20260715122923.1938327-1-tmaimon77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bmcuart1 group currently claims BU1_RTS and BU1_CTS in addition
to TXD and RXD. That prevents boards from using the modem-control
pins independently through the dedicated nbu1crts function.

Limit bmcuart1 to the TXD/RXD pair and let users opt into BU1_RTS
and BU1_CTS explicitly through the nbu1crts group when those signals
are needed.

Signed-off-by: Tomer Maimon <tmaimon77@gmail.com>
---
 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
index 0aae1a253..c859dca4b 100644
--- a/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
+++ b/drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c
@@ -538,7 +538,7 @@ static const int wdog2_pins[] = { 219 };
 
 static const int bmcuart0a_pins[] = { 41, 42 };
 static const int bmcuart0b_pins[] = { 48, 49 };
-static const int bmcuart1_pins[] = { 43, 44, 62, 63 };
+static const int bmcuart1_pins[] = { 43, 63 };
 
 static const int scipme_pins[] = { 169 };
 static const int smi_pins[] = { 170 };
-- 
2.34.1

