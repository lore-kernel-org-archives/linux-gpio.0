Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=183.62.165.209
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794039185;
	b=xSjWUpYRs8MJkQeSkr3DXI/sDwyBeOCBYZ0f4Yf7BTtYCUiD9drg6QYq2pkpLPRxCxbj
	 9kb7+AMNMNv6jhZ4cJoSyB8/PJL98jNakWHss7UtGeq7MRDQbbSlgIPVkHqJqHr2k4OeG
	 RrbF544z9IvIs4HhQUzS9tTjM/YSBh5hkP907Xd+kUjOq0yuH39dXfDoCQ6S9pRrh4fUR
	 8AcU0xA2EMS9VFE5x2d9dotLJOLsse9zu790J5J0sHRK42ynlax/bQ9Zs1OJ4QnngRpQL
	 5j4sQN9wbJTGK05lreELy5NfwsLRiYWMp8U7AbaT4ib8YDovvR9HzVvUV/+cpdq9mPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794039185;
	h=DMARC-Filter:Received:Received:Received:X-Zmail-TransId:X-Mailer:
	 Message-ID:In-Reply-To:References:Date:Mime-Version:From:To:Cc:
	 Subject:Content-Type:X-MAIL:X-TLS:X-ENVELOPE-SENDER:X-SOURCE-IP:
	 X-CLEAN:X-Fangmail-Anti-Spam-Filtered:X-Fangmail-MID-QID;
	bh=ap0/iTJsU293AT//0bINA/srWiUIVTQ+IfEBCf7nHnE=;
	b=hKDJxyi8tcKddklm4uQrblqDq7yoaFPNxipIXAK6FKm6T1nFZX+NBszEaKzAzzmLdlnz
	 RbZCkUTH3by8i/bFciG/D6Ld8MH5chvm1lDkAEJ7TRkbx2nrhBs6RwCD72DW3ee0dZlqh
	 u5f3NmB5/Jf1EXvLETWwCEAZQkPWGq9dSjLCtgNKMyod21VepLWxxT+B1rsUPIDczmbb6
	 qkuRoXLe8kFm4U3SC0vR+jOM8nlIZnnGUaIe89SjTC8Uio4+/nhKWhwTOdA8GL2GWY7SX
	 dpDiNDE+NDpPpZVRWMTCNNxi2oDOAlSI7wT2M8Oqb8Drdw8xaAQjTRpLOsKpc2gY2ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=zte.com.cn;
	spf=pass smtp.mailfrom=zte.com.cn;
	arc=none smtp.remote-ip=183.62.165.209
Received: from mxct.zte.com.cn (mxct.zte.com.cn [183.62.165.209])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77EA1606D806;
	Sat,  7 Nov 2026 08:13:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77EA1606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4jM81R3G8Fz57HS5;
	Sat, 07 Nov 2026 16:12:59 +0800 (CST)
Received: from xaxapp05.zte.com.cn ([10.99.98.109])
	by mse-fl1.zte.com.cn with SMTP id 6A78CsOB025396;
	Sat, 7 Nov 2026 16:12:54 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Sat, 7 Nov 2026 16:12:56 +0800 (CST)
X-Zmail-TransId: 2af96aeedd882c1-86e6b
X-Mailer: Zmail v1.0
Message-ID: <20261107161256805UKbBUjg-wlWpCWzE2fBjl@zte.com.cn>
In-Reply-To: <202611071612471583hApcIRmqJX9mMWQtxmcN@zte.com.cn>
References: 202611071612471583hApcIRmqJX9mMWQtxmcN@zte.com.cn
Date: Sat, 7 Nov 2026 16:12:56 +0800 (CST)
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <linusw@kernel.org>, <brgl@kernel.org>, <linux-gpio@vger.kernel.org>
Cc: <linux-kernel@vger.kernel.org>, <geert+renesas@glider.be>,
        <andrew@codeconstruct.com.au>, <wbg@kernel.org>, <opendmb@gmail.com>,
        <florian.fainelli@broadcom.com>,
        <bcm-kernel-feedback-list@broadcom.com>, <jelonek.jonas@gmail.com>
Subject: =?UTF-8?B?W1BBVENIIDQvNV0gZ3BpbzogYnJjbXN0YjogZG9uJ3QgdHVybiBwbGF0Zm9ybV9nZXRfaXJxIGVycm9ycyBpbnRvIC1FTk9FTlQ=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl1.zte.com.cn 6A78CsOB025396
X-TLS: YES
X-ENVELOPE-SENDER: shao.mingyin@zte.com.cn
X-SOURCE-IP: 10.5.228.132 unknown Sat, 07 Nov 2026 16:12:59 +0800
X-CLEAN: YES
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6AEEDD8B.000/4jM81R3G8Fz57HS5

From: Shao Mingyin <shao.mingyin@zte.com.cn>

When the "interrupt-controller" property is present, brcmstb_gpio_probe()
maps any platform_get_irq() failure to -ENOENT.  This swallows
-EPROBE_DEFER (the parent interrupt controller may not be probed yet),
so the device never gets retried and the GPIO controller is permanently
unavailable.  Return the original error code instead.

Fixes: 19a7b6940b78 ("gpio: brcmstb: Add interrupt and wakeup source support")
Cc: stable@vger.kernel.org
Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/gpio/gpio-brcmstb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-brcmstb.c b/drivers/gpio/gpio-brcmstb.c
index 3b1aaea639..e23e8f267f 100644
--- a/drivers/gpio/gpio-brcmstb.c
+++ b/drivers/gpio/gpio-brcmstb.c
@@ -655,7 +655,7 @@
 	if (of_property_read_bool(np, "interrupt-controller")) {
 		priv->parent_irq = platform_get_irq(pdev, 0);
-		if (priv->parent_irq <= 0)
-			return -ENOENT;
+		if (priv->parent_irq < 0)
+			return priv->parent_irq;
 	} else {
 		priv->parent_irq = -ENOENT;
 	}
