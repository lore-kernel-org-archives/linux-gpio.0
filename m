Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8177A3CB555
	for <linux-gpio@vger.kernel.org>; Thu,  8 Oct 2026 19:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791487113; cv=none; b=dEc/dKe2BFNBCjxH10Mvznzw4jZkmncp1tvkIHRJ96pq2IZubCZbwg38BAVEf3JRFZvnv0Lzs6ilklSwFIubTgv7ZimZ/8RTis0p8C0tnm9ocE0ZI8HuyFpVh9eGyVANSk6NLsNRM06c2eWxsagYdVAD5jWJbasYEUPXZrzIqII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791487113; c=relaxed/simple;
	bh=/9WsomfC2lAj9ZoN5Gi42D+1bJYjyuJE3VvFwcTOPt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AQr8mtYXtNGlm+tvINhngpLudAFUZH4q0vAKYKY2IPhVfHE92AB9YMiThdU9pmXSeuX8jpx8h+2XQPme5R8bJQv5titvM/WYwAbt72eN57hO/J8rvd2jmGN6oYQnjFuoawOCf5t0pQNcrjikY98dKhFFzzqCYp0wiYSCzV+gv4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com; spf=pass smtp.mailfrom=trailofbits.com; dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b=FgYrS/Jl; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trailofbits.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=trailofbits.com header.i=@trailofbits.com header.b="FgYrS/Jl"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso3153530eec.0
        for <linux-gpio@vger.kernel.org>; Thu, 08 Oct 2026 12:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=trailofbits.com; s=google; t=1791487112; x=1792091912; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RZKA77jm9kbpECwes2HBBFKfBcH0wMfdUgHPGsHOLoE=;
        b=FgYrS/JlAyIB5cfsbiMDEMIXgvofotk8ehbMomRNVchsiLv6JruRMaAKoezGzL6684
         KCNMsmYT0QAqIhuvW5WtVEGGgElvxjW8XxvsRremVEOLj4O7VxfO0b4x5wD6rBGGdd4p
         Er+T4nmv+eHubQ64VMt9pQfT0iYSlTjPSdTdPBM2SUp8RfKf3X1K8UrxYbHBver4z2G7
         9RXlLQMAS//x0XKwwzxOlplTOL7Iauni0HVIZvhgyFZG9RibHojx/PQRd7ZGth4g1znh
         yInv6XTcpuFYjpoVwceO92jsvwmvKiIG/LT6LkeeL/4loStcjM74YVtxzICNWOCdaTzq
         vbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791487112; x=1792091912;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RZKA77jm9kbpECwes2HBBFKfBcH0wMfdUgHPGsHOLoE=;
        b=CLME2/T75LYp1CSj/aHueYraZB/u2Gh8qYHK9c2K5cAYyYFMu1PChVKJ23lLUJSD/F
         qf7RF1+Q+9aF2iaxivqUEGGxEfUnZpisU1YmGH1RWs0mt81leYpeGgkNnmEk5NwnW6un
         /66yM8tzAgoFRNj3Wus7B+zv2b5FNdPt/MxhHhiSORZPzbM5x2RNkKmDWUz4GgGak3aH
         0sHZjhT7F7CKC1nztEqmpIOI0Mu+tiRZNn/T3cqBQNQqvoBNXK1LFIChk2oVcgderbod
         nQKdF+nO7fdtfiGIYXl7msABKVpr4ktq6y6xMoxm+KJh/VkiwtGf8IiEx4bVQAizDmSr
         j2DQ==
X-Forwarded-Encrypted: i=1; AKwUvByFOYTchOKti2t++yDB7XbcuKq4mt9DIwap+EfXBH2gyh4pyERj/PcKxx3tbXWWM4Rw2DxHJE7IjphN@vger.kernel.org
X-Gm-Message-State: AFq9FYIagroQ7pRIltnxqb2Q6AYoBh6JOGDPCVOkmi3IuSZ/Rk85yc9I
	xJCW+0b8SI1452PeByTAOrc/IzwyaM4p7vzF20deh/yBgWS6qrV7vZD0r5crtrISTTQ8C13NIlY
	FMVpY+TgMqg==
X-Gm-Gg: AYBFou28UXnZuuxQrd4X7/gEsgwH27J86kvSAo1OK4MJKIyHVk4DVoEj/ySlFsTJE76
	Hbrg9HH9kghYkS+aIM/D2SXfyn9qLHZaSsEaRc6r8y2saYJKHC/KK22K5zd1Cc7sC5NuQp0ISB+
	6+tbo+30km/lC/hGxiC7eyQjCOXWkEybQeBam07dvKAoWmnrSsf3Z+d0jCWzrdvJWiwA/5HfmlK
	4jXrz5ryKGYb6gWrc3F3/4XWIBRs6aySlAxPT8WP7Qs3hqoVQY7hSiMiffCbfud9vdKyV3zIq7Q
	ccj0FAMj7deO1EhrGGl1Bgs/fXt6EO7f96eDWXb7+nuJq1J9E2ADMSofbDNUg7lChmeU+yAABsY
	bL6nZmX2Px3z/lfNqDhFSpkQodcA+We4PCVDgn2E9tosyh6WgailS+pw9qMSNDP5YmDf+uWqdLz
	8hRPtD7K0QIQ1xgh1luBAnItICbADcx6mtd7B582uGiYTOvV9I7XbDNgn3fumr6Haq3u/ipCVHJ
	U5sv1xy31/wl9ncTrAX5o8+YhVKeTMSz20OTFC7pFw7AIshS0VZxSBW58R5fu2yC1O3zQc=
X-Received: by 2002:a05:7301:5416:b0:351:58d9:7d9a with SMTP id 5a478bee46e88-3515e0066fdmr8007040eec.38.1791487111442;
        Thu, 08 Oct 2026 12:18:31 -0700 (PDT)
Received: from localhost.localdomain ([2603:8001:5f01:8bab:bc88:5ec1:4f8a:5b23])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c841579sm117933eec.4.2026.10.08.12.18.30
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 12:18:30 -0700 (PDT)
From: Artem Dinaburg <artem@trailofbits.com>
To: stable@vger.kernel.org
Cc: Artem Dinaburg <artem@trailofbits.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Marco Scardovi <scardracs@disroot.org>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andy Shevchenko <andy@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	jay.xu@rock-chips.com
Subject: [PATCH 6.6.y 2/2] gpio: rockchip: fix generic IRQ chip leak on remove
Date: Thu,  8 Oct 2026 15:18:21 -0400
Message-ID: <20261008191824.98662-3-artem@trailofbits.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261008191824.98662-1-artem@trailofbits.com>
References: <20261008191824.98662-1-artem@trailofbits.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Marco Scardovi <scardracs@disroot.org>

[ Upstream commit 1c1e0fc88d6ef65bf15d517853251f75ab9d18c3 ]

The driver allocates domain generic chips using
irq_alloc_domain_generic_chips() during probe. However, on driver
remove/teardown, the generic chips are not automatically freed when the
IRQ domain is removed because the domain flags do not include
IRQ_DOMAIN_FLAG_DESTROY_GC.

This causes both the domain generic chips structure and the associated
generic chips to be leaked. Additionally, the generic chips remain on
the global gc_list and may later be visited by generic IRQ chip suspend,
resume, or shutdown callbacks after the GPIO bank has been removed,
potentially resulting in a use-after-free and kernel crash.

Fix the resource leak by explicitly calling
irq_domain_remove_generic_chips() before removing the IRQ domain in
rockchip_gpio_remove().

[ Backport to 6.6.y: Use the upstream teardown helper on 6.6. Defer 6.1
  because irq_domain_remove_generic_chips() is absent and needs a
  prerequisite or reviewed target-native cleanup. ]

Fixes: 936ee2675eee ("gpio/rockchip: add driver for rockchip gpio")
Assisted-by: Antigravity:gemini-3.5-flash
Signed-off-by: Marco Scardovi <scardracs@disroot.org>
Link: https://patch.msgid.link/20260607230504.35392-2-scardracs@disroot.org
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Assisted-by: LLM
Signed-off-by: Artem Dinaburg <artem@trailofbits.com>
---
This is patch 2 of 2 in the ordered 6.6.y backport series.
This change addresses CVE-2026-53226. The target creates generic IRQ chips
and omits their removal; the prerequisite supplies a complete teardown
helper and the CVE fix invokes it before removing the IRQ domain.

The fix is already present in 6.12.y, 6.18.y, and 7.2.y, but not in 6.6.y.

 drivers/gpio/gpio-rockchip.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-rockchip.c b/drivers/gpio/gpio-rockchip.c
index e0e4f3ed5fdd..86cf3cbcdb40 100644
--- a/drivers/gpio/gpio-rockchip.c
+++ b/drivers/gpio/gpio-rockchip.c
@@ -786,8 +786,10 @@ static int rockchip_gpio_remove(struct platform_device *pdev)
 	struct rockchip_pin_bank *bank = platform_get_drvdata(pdev);
 
 	irq_set_chained_handler_and_data(bank->irq, NULL, NULL);
-	if (bank->domain)
+	if (bank->domain) {
+		irq_domain_remove_generic_chips(bank->domain);
 		irq_domain_remove(bank->domain);
+	}
 	gpiochip_remove(&bank->gpio_chip);
 
 	return 0;
-- 
2.39.5
