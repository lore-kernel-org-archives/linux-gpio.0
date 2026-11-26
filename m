Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795652813;
	b=wRPL/o31HwJfoGJ5wJ8v/9LXgsScACEdfAWQ3MvCnXN7BiaoRVwGG2oiGx3C+8OtvfEO
	 MneIy3RvHxNFJbnmmW9i/g6I8Accc5uXXM+TUt9eDb3RsAW/CFEtGnkvcmVQ/9D4UCnyv
	 CDbDxOI7qJVdxfyoLHChY3IiX31RXEAYAdM6I0b1wr/9JQ2oYuXc+yE0CEhWjNwQPWywO
	 5aZSPDDdm2F+JaBqom3cj4oBRRDnx8W7HtS5qFMXKCNmSonqGip9Rx0bXnOAQDCroEUw5
	 ayYo/kSEbZZEVYRF8DxrL5rVW1WjOKR+MKjynVoeERqmuDXiG5AFbbfCJdghX9blj+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795652813;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=jtugGYj2KzKIiuUiozL5YVvfgMaZajhHVat+B+fErZQ=;
	b=EkS6P5zDo1d+SM6ldIReqN1fAhzP+9P7LscVDKEYe75JNoi5ZLdoEi6FZ0m22ilo7YyY
	 IifMU21+O1ADxlrqgOfoM3t6YLcqVpYKUjW+ISjK5bQgcgmegctRnbvp1QQjcILQwhkPZ
	 WScpMUFesAHxbAaFhIb9aTnl89S/9Rtc0ToEoHtEIb+B2m667r62WxhRdmfoqtr0Ydvcu
	 /mc3bvO29OC7a63Fg33xyKkTEK0CCAl9Pm2pbRbeaDt4JudcAtfDU0J4wwcH5wdmyTLkp
	 uS4Ezl9wLw2b8Y5Awwr8zz/Cri5fcM4xAaFpz6jNyhZE7P3HAMpAPBW+hR7xIaGZD6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gjHA+sAm;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4DC606A31E
	for <linux-gpio@vger.kernel.org>; Thu, 26 Nov 2026 00:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D4DC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gjHA+sAm
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3b0ae87069dso2740802a91.2
        for <linux-gpio@vger.kernel.org>; Wed, 25 Nov 2026 16:26:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795652813; x=1796257613; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jtugGYj2KzKIiuUiozL5YVvfgMaZajhHVat+B+fErZQ=;
        b=gjHA+sAmDSrXBo7slcTEhMIL6BhlInqaqLOOsZjcpyyjAm3e/c21MR7xRkeyv1/Wno
         nUWNodF1xi9VDVVSLJF5ISYoy16kWiCqpmyQQ1uI+qeG8bgjnrAVRvMpjgF2p24T8esZ
         2G5gqM8d1KpRq4yNRTWsfC06ul99DF0rR+G6MUTRF7Ud/gMwsOJYQdccz2MSLt7yCu8T
         xnuxGU0HEfHy52RluYyfslrX6G7IawGSec+b4BOoSatP3YqCBtTZTHl392L+uVmnWD+a
         n/Az7mDVSIFCbcoIX4QFwPgFFO8ZzeTHnPei4XQsGpQoo6JbMGVx2Jx1uo7KxUgHGijL
         x+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795652813; x=1796257613;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jtugGYj2KzKIiuUiozL5YVvfgMaZajhHVat+B+fErZQ=;
        b=vCd4tkx0QHIwbN+X0W3Va+z/5bZdHpqs25L3spbftwk4Bd+1vlRp+uDES6Y8Edre3O
         kSC3n8c+TZpCLYXtXl6Ac2eEVMS5jrEy9VlsBzkixSiTUvw5oKe9otzP5hDST4yLR6As
         yAv2S3Av+WYR6IAqLjIQA4+0bAPBZ2CoJr9hhtSaOp1JNkb+/3trlM/cXv2Gak6DAfmi
         4PL7LoQebe1OqpQ7c71EFjBf/mYpL94xZElaOAnPCOai85s6aWG6jNCLsBBbj24pb85d
         lxVCNZkl4CZM6ove0oouj06CC5qwfMTzj6zcBDDjY5D8yVedb1aI0jOoesQr0EKmOjGG
         RW+A==
X-Gm-Message-State: APuU4Z8yjhmAXsUCJlLpCx15IKSmPgrIwvLxvruxslfqBAEobiJOLFcC
	V2V0DUAZ8OiucqIa7MI0V4kvPLDVtxEb2GXACR9JkRg6Qcj0oOR15++Zl1jGCw==
X-Gm-Gg: AZFdTZfL8/mXdO22CwwFcKjPfF2GH2pfZd/X48lfpYQxny85aAgfd37suXyEWoQqsTF
	lZ2Bf8yBrDTjCpc8v6Lpc94+aDuUNmJ7jZDqGroz+OSet9FRQdZkft4a4sZYYPocA3vcQ9/kElf
	nJVclcvBihK6krba3oLGpmZgjB+6qnjxB5mmYPXHKv+wmLMDx7Nr+xqN8VYsCFk8cqDk35ArkSh
	W0k9IKvzth5xE/CUMV8GoWq4syYIyzTT1j/sRQW7/FAcZu5pR1WcORYX2d1ecRnA1+MYCMOoo8A
	nPT24jxFy3H6ZPFE9l7IIccXFFoYCovL2jAQvHcvtYV0R/ph2IdpFVBd92o8+fVPf2eTHqDg05H
	3PoOqKlqd6kUQTvSN8vWUq8KnfQXV2SZc1nppmXVdU2zHx24QEF2B8Az/Rhgk3FRHo6hPrtzS/s
	xdy1LpBzfrchOXJ0VOsfuSx49GTL0HGeXVCBmGVKRvArGkUfkGCdQOPaZNHP+lrjbrTEabkPBze
	3gSc+m3CgnFMtEogvZnNDSf681r5y+CgE6LVw9QBc1UQ68WD2KlpeljrDGZKLnz2aUS8KYfy5am
	T1sX3Bkh7CxnxEQUvta4LXqXmG0KOCC54A00UMxkIbo8PGzXm40AD8R2GBkbYdlMN7XzmBr7KfL
	Iur/6ULmXTYcdMcevBUL+sPedWg3LVYQJWxL+9xi6NKWneYgITX1zMUN4k1ZCYWxvwuBUNVanPD
	n/bA==
X-Received: by 2002:a17:90b:4cd0:b0:3ab:36c4:b4ff with SMTP id 98e67ed59e1d1-3b41c925a85mr19219602a91.24.1795652812641;
        Wed, 25 Nov 2026 16:26:52 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b405d639fdsm33013866a91.10.2026.11.25.16.26.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 16:26:52 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Jason Cooper <jason@lakedaemon.net>,
	Arnd Bergmann <arnd@arndb.de>,
	Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: [PATCH v4] gpio: mvebu: validate ngpios before use
Date: Wed, 25 Nov 2026 16:26:50 -0800
Message-ID: <20261126002650.603321-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.1
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

If ngpios is read as 0 from device tree, it is passed via
irq_alloc_domain_generic_chips() as irqs_per_chip, which leads to a
division by zero in DIV_ROUND_UP(d->revmap_size, irqs_per_chip).
Reject ngpios == 0 early.

Also reject higher than 32, which is the limit.

Fixes: fefe7b0923459 ("gpio: introduce gpio-mvebu driver for Marvell SoCs")
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 v4: resend
 v3: use dev_err_probe
 v2: reject higher than 32.
 drivers/gpio/gpio-mvebu.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpio/gpio-mvebu.c b/drivers/gpio/gpio-mvebu.c
index 46604093a01e..f0e8ae657d7f 100644
--- a/drivers/gpio/gpio-mvebu.c
+++ b/drivers/gpio/gpio-mvebu.c
@@ -1214,6 +1214,9 @@ static int mvebu_gpio_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
+	if (ngpios == 0 || ngpios > MVEBU_MAX_GPIO_PER_BANK)
+		return dev_err_probe(&pdev->dev, -EINVAL, "ngpios must be between 1 and 32\n");
+
 	id = of_alias_get_id(pdev->dev.of_node, "gpio");
 	if (id < 0) {
 		dev_err(&pdev->dev, "Couldn't get OF id\n");
-- 
2.56.1

