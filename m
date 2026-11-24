Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527424;
	b=x1t63+oB+fsVCI+iko6IRAznguXxUhK4CGIKoo73CJIVEQZPh2QGEAKoBprIHiAsVSWy
	 0CHNMwKBt/1aj9X4wqEyU4JHcK+Xa5alZL3Akddwnl09uBpusx/Ea1L5CtONYQRxQ/Do8
	 /EumUGHfYsd3WWmtRMAPvsWyzXCydiJDYRcde63vdMQW4S/PxPuWMyJKT2OSIsKC6Lh4U
	 +BOll/wLziUUT3HjodgrEF9kAxZ2Ra4jDVXZozT+CTHWyFzIqAg7RHQfIVGXDRrc8/9SI
	 DOduaNwBrgwDiktWaFo7ZTDjc1zLdvNVtlYs7sUHesRINLh53oLhio5Qs/2n1i0b10w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527424;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=3MEgTk7j9nX99QBZKWtEZb/AYxV2KoXFIEW317dyB6Q=;
	b=Hf9nWMcUcC3y10wE+Ti2ZmkL6CGJvK8s29NZeYumbiaJzB9oNBkBmzDGjmwpTVIR269M
	 am3oAYL3WgCgFtE/KpXQVR+kxQytG9jopWIAyNB/whiZkyJVTrjGqYUd7rcXhTSKLt6ZQ
	 KJON1CQhbq8bKiiH1XUOwiPgaPVlE6WRVuNdP9ZI68g/oP9cVbL+Ok1TS4Yeq2x6JTC1V
	 0saeBRM/BuRZZ+5BDMhFv4T0S5tZ8JjAq4oo+LnCOXDtL2xT1+8T1D7+fw22nQ/BwgXKd
	 T1UjfiS0D9SBxsW2H+yvIQlvdiX5yj21av37OXqFsQW/88r9C9gzW3K2XKVeQbE3LUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="TL6LTV1/";
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF787606A336
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 13:37:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF787606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TL6LTV1/
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-9212dac247aso47746946d6.1
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 05:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795527423; x=1796132223; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3MEgTk7j9nX99QBZKWtEZb/AYxV2KoXFIEW317dyB6Q=;
        b=TL6LTV1/L22QmJ7upT+HDhDi3vgzK0PwLMhx1CAqua2uY3Tcq4fNgH9boDBYKrOf0I
         yst/a+bUnIhuVCl3j2kgoDwFCUtYnnBB72jjcgXuE367gJgMOUp5ngYCIv8MrvSA7gtr
         7QiBBRHRPsUe8v3hh+Qy1A2Op/ENYF5aZzbFhECkf2gP7sjA+H+P0/Taa+wpzQ46eeV6
         6EttxW7eG/bATwBFGM8wd9gj8yo/ALRNW0J32YznHA+pNB/Pca62ZwbeXc66aMJi+VfK
         Qy5PS5Y6p2h4OxqWulqoh/lNcX8mRp7VS6OOO8qFTssKOlTGzeBSwhiqmEve9D8/MgTr
         PKgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527423; x=1796132223;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3MEgTk7j9nX99QBZKWtEZb/AYxV2KoXFIEW317dyB6Q=;
        b=phANRVXWnPpnZummAmpYZsHd8umIUuN+IfUutLiGnPOWf/jE07FY3LUHVe1dq95c0R
         ak7q3z0hCHktdvzMepSrF2Zw0oEcIqYLjA4gbbmBkrwT/ompFstVabFOziNAOjWpi5qS
         dAcmlmsQGSmhGEB0P7I18AmOe7trZwWcxCE9NtjUCgAfdJ7j6F+bFOYm4tOzj5g5TLhJ
         iqUiBZRRTZ7cdqx4nUgZJiWdJnjoCGL7Uz4VzpS1rxlIOHaWDREj8c/9nHDYbVo3Zk6e
         9ANVkE9/OHYLCZpmHfNkzUEOOpRA7Lb7tlHEGFhofB4ORbYj1jUqDCBX4MLA9syTUjwe
         BQXA==
X-Gm-Message-State: APuU4Z9nug4L6Bnqr28iMplqpJL+cPKiVTYsfRujwQfuGgFTlScTDjJB
	gOcr+Gxjw9/TwzQ1uAkihNzgEfAuKUZaqls/SRAXneRzJy37WuE+yIom
X-Gm-Gg: AZFdTZcom+yVHoNkGbXbcMurDYRfAm5LXsM3mW1yLOS+VMUR+3ogLOUSZwufMmDeV6S
	6/vF9AkBWwHh9qtbEKq4ZUfySskEx2Axt4EzxvEcaUU0kuEdDF1yUbPJNJ0PjIbf73v8sZVYCjn
	dVh/jCDc5AZsX0RJtj0Uhz7xV1o2DpE/zAS3Yf4zxRnMyUvI7F4at4u4gb2FAcggysGagCT/Zxg
	4d/r14AtQ1yytx3B7GzrtIBYshuY2jmKCsdga16msZSQUWGA2APVZOqr6vOvIA2FC3bv1Z44/Ht
	LQwwHhcXabpLBO7Ue/Vout/hj8oT+ubeQPztJ37WWuG5U6ni4qkxwKN68hbXbqUm+TqtW9lRCoh
	d5HionjwgUMy87pANeF1PUDgq9a38OR6pXPPxkYPjWW8j9Xti5FtIan6Bd88W0pseciDWegKDnT
	VBvJkeinzGGFfoNSTStL1COzQvYB0SwV+VyzIQmCjmceOFNq/2/SkNm2c6vcAy/GyouxU1E6CFM
	S4lxDMCUL7/lt0iDhUu46fzHXPAqKt3bWgDF8/i/cCMEGYdMti3nVAfFZdPuhEhNYOxgLDxBFI3
	HCoRhtjWfwP49cf2vtoRHphhHYSBZt4cRlBO97c/BZdVPGIKS9RL8kqe7ADUOE2r
X-Received: by 2002:a05:6214:8504:20b0:920:fd27:87df with SMTP id 6a1803df08f44-92134abf65bmr195937166d6.48.1795527422777;
        Tue, 24 Nov 2026 05:37:02 -0800 (PST)
Received: from obadmin-Precision-3680.atlascopco.group ([167.103.3.1])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349d383asm133834536d6.22.2026.11.24.05.36.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:37:02 -0800 (PST)
From: Sahaj Chaudhari <sahaj123.sc@gmail.com>
To: linusw@kernel.org,
	brgl@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	j-keerthy@ti.com,
	nsekhar@ti.com,
	prabhakar.csengg@gmail.com,
	avinashphilip@ti.com,
	sujithkv@ti.com
Subject: [PATCH v2 1/2] gpio: davinci: use controller-specific MMIO for BINTEN
Date: Tue, 24 Nov 2026 19:06:53 +0530
Message-ID: <20261124121500.2cd5cbf30f89-2-sahaj123.sc@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124121500.2cd5cbf30f89-1-sahaj123.sc@gmail.com>
References: <20261124121500.2cd5cbf30f89-1-sahaj123.sc@gmail.com>
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

The file-global gpio_base can be overwritten when probes for multiple
DaVinci GPIO controllers overlap. The later IRQ setup can then write the
BINTEN register of a different controller.

Derive the BINTEN address from the current controller's mapped bank
instead of shared global state.

Fixes: 118150f22d6b ("gpio: davinci: move to platform device")
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Sahaj Chaudhari <sahaj123.sc@gmail.com>
---
Changes in v2:
- Rebase onto GPIO gpio/for-next after the devm_kzalloc_obj() conversion.
  The fix itself is unchanged.
- Add Linus Walleij's Reviewed-by.

Previous version:
https://lore.kernel.org/all/20261109194910.2282454-2-sahaj123.sc@gmail.com/

Testing:
- ARM64 W=1 driver build and mocked nested-probe regression passed.
- Instrumented AM642 baseline selected two wrong BINTEN targets during
  forced probe interleaving; the fixed series selected all three correctly.
  See the cover letter for test scope and limitations.

 drivers/gpio/gpio-davinci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-davinci.c b/drivers/gpio/gpio-davinci.c
index b80c1a27d591..7961ddee9f40 100644
--- a/drivers/gpio/gpio-davinci.c
+++ b/drivers/gpio/gpio-davinci.c
@@ -43,7 +43,6 @@ typedef struct irq_chip *(*gpio_get_irq_chip_cb_t)(unsigned int irq);
 
 #define BINTEN	0x8 /* GPIO Interrupt Per-Bank Enable Register */
 
-static void __iomem *gpio_base;
 static unsigned int offset_array[5] = {0x10, 0x38, 0x60, 0x88, 0xb0};
 
 struct davinci_gpio_irq_data {
@@ -168,6 +167,7 @@ static int davinci_gpio_probe(struct platform_device *pdev)
 	unsigned int ngpio, nbank, nirq, gpio_unbanked;
 	struct davinci_gpio_controller *chips;
 	struct device *dev = &pdev->dev;
+	void __iomem *gpio_base;
 
 	/*
 	 * The gpio banks conceptually expose a segmented bitmap,
@@ -586,7 +586,7 @@ static int davinci_gpio_irq_setup(struct platform_device *pdev)
 	 * BINTEN -- per-bank interrupt enable. genirq would also let these
 	 * bits be set/cleared dynamically.
 	 */
-	writel_relaxed(binten, gpio_base + BINTEN);
+	writel_relaxed(binten, chips->regs[0] - offset_array[0] + BINTEN);
 
 	return 0;
 }
-- 
2.43.0

