Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E89BE481FCD
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 16:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784134572; cv=none; b=B5Ku5gZ38BNjsqdbW6+9vTrpT5gX0+jWawu01ABmmWE92AhGRjgbQoM0AVq4wgCWh2cpHFfpjWvnRglBmb0lg7O1WYGBvMWqpgnnEihrasyuTU6S8LpY6Np4+blueUgFFMbUYYMhGjz19A1gK1UuI0SrT904OHSas8UVAmTRx1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784134572; c=relaxed/simple;
	bh=t0FnuLNehJGLnitNhfL5kI7BpD/7c8TUeLlUxouyfKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ckVTC5RpHLg48+JCEArVtnyvsivsv0fqYTlFuxnz9+tGHCNfppS4CWtfXC3HSO3uej21Pg72Eiw5tvWutWQE9/G/5BOB/AtaY2+N5URqEzRIahbRiQM+veymBrYR5GMVfZYPJ6hzSaD/ZalPBpBHynVCBatPlUbL341zlyw/JSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=PDl4xPth; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="PDl4xPth"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493e4ccccc2so36009915e9.2
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 09:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784134569; x=1784739369; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AsF+pQK0l1MLgnZK3Ab9BYMXhOyF4JRp6oQVwO0AFno=;
        b=PDl4xPthNXftzpyvJb0YNko9SKkmq9YDaDDmexISO1NlcTfHTNyOOpQcI7jng7AqYi
         qP0vhuCCgdt3gedCDDtaX3NtDSqaBUJlEaAEqYS2ap4odkDwiWSpBZsJrewydvzYvltP
         V5JnnZaqxbt6RVCX9yCiL8TZ8Wpl1ENahgToUJwJDmkqOomLNaAIC3SfpP707TLfeDTw
         MbH/G3xqthx4TSd8LKLwdgxB/GImmud+AC9jLkgkQ/iStmLNZGrj7+3HBL4FGUN6aXF/
         qxbqzArXXouYBdJDGcqIehL3dXWuug50HqNFfnf5uZmwiRsw8BVOsBEy3lnENZgVuMD7
         PBJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134569; x=1784739369;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AsF+pQK0l1MLgnZK3Ab9BYMXhOyF4JRp6oQVwO0AFno=;
        b=iNvb902ZmULngZq3w53ABP8oNRap/4oCh8whsx6mpNwwLjS5L7YrKcRM3EgVfswQUa
         6P3gu8sP7+/8p9fQKedk6cDywhnQZFdRDQZAhfysNt3+pQD1NoMKRHqlm911TybUDmjs
         ZR8MG9up0ptfv3LCCteZ6sscmBQdcDeaK7LUDdhxvlWFmGWfShYcjyzikgI4VOWh5icz
         OV3Enh5ixfuHo8QZ3NC+xqzYvxQpmArNgBwJyxje6d6CLCPHTfh2zaPNpDlxvwRAUGaE
         kdlu3cy1Qsw8BPwCKahI8opDds84lVyAtgVLg0J31Zxk8a/+j1BL2PU/1azx/uLCIS6L
         dvdQ==
X-Gm-Message-State: AOJu0YyBugaCrqtjYDwnGjaWpPeEG0DYKt6gk6TlMscTtQJN8r0uD5ra
	MCzuzOIC7BqYIFC2tlWGDzzrpLbhocYmFYLB14eGAm7vtSkRg2+gPUbLjeByZQoaDvs=
X-Gm-Gg: AfdE7cm4oA4qfgaF084ba7mKXDzsfOMR14aoPuzo5TiXa+WqwuoLIB7FMTtg9RrU30t
	OKhLgbSCKfn2CY6ZZgUzuYrONU80fwSp89YpYJi2TlwMYaIjjXlUYDo1DGnE8Ka4xBENjcmEEye
	MmlWE0r9YWxW+4YdhbwOm2SQEeUcY2n7/iAjWJcM8Pr2Xx0uEObBFIYLCGaclQXpyBLbtlflNFI
	n6mH3MHt5875Bo5pLWkcWmztVMp5OiHyaln/gKX2RZHLS1ATaATV92jxZhTtc8/B0R/VqBQ4uB9
	0Qiz8ztE8O6a5EU/FSlgc4cTtCxmI7qJY7f2Cf0oAOrsEFM0sa5dMs5JY7GlBfCH6MP9+rM7LGV
	5wx5FZ2knGifwvy2zSEkEgpF76jqcx6dXEjBrpTawnZG3yhmMS4zLvpQcOYoMcPOQ6JjwYeKfA4
	UMup1vw2ue8zF+u2rbyPXLO1Uf5vbCU+KksDdChCHetsv7lso+9TUB1z1eXvaFu0kWC372oG2jZ
	Bc=
X-Received: by 2002:a05:600c:4614:b0:493:cc25:9c0e with SMTP id 5b1f17b1804b1-49538999453mr56165705e9.14.1784134568704;
        Wed, 15 Jul 2026 09:56:08 -0700 (PDT)
Received: from localhost (p200300f65f47db04249e031dea91a10d.dip0.t-ipconnect.de. [2003:f6:5f47:db04:249e:31d:ea91:a10d])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f476e9d02sm18110821f8f.19.2026.07.15.09.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:56:08 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/21] gpio: max7301: Drop unused assignment of spi_device_id driver data
Date: Wed, 15 Jul 2026 18:55:09 +0200
Message-ID:  <4e0876bf803938e09b5b5e4aae0f3c66847762a4.1784133987.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1784133987.git.u.kleine-koenig@baylibre.com>
References: <cover.1784133987.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=857; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=t0FnuLNehJGLnitNhfL5kI7BpD/7c8TUeLlUxouyfKI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqV7t0er4O9iFGZT+mtKDG98P5hs9sePtVCfV2c EhEfDc85EmJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCale7dAAKCRCPgPtYfRL+ TgqUB/9LEvJrJ6VGk1bWpofHOWjMixzjZmi5m+MmzyDyK9VwIAJXTaWZsMpdoHUw9ZC6oANNbjK PJgI8QN1Ep8kq2J7rG68tSVxUFu05adgS0z69XxiMBM8jsXkVanpWYAwGOA8KqDprdRfrJoyNCz lLcx/lKjPAVnQf6TTg4HrSvFSw8Sx49xepQ77tm4mwE88k660hNWrbVUzFPZvDVCf/9Byrm/fY1 rD5dPu+Z8DggbH5FEqtSdAwJ5kt5GcUM4QawS3auZ0v55IO9HloB+x0BefWVKG/9nes3jlsAQJ3 vOsp1YZDueEOW5S4guIkKvV2z16qoLMhvbrRPypGdrWxDgm3
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver explicitly sets the .driver_data member of struct
acpi_device_id to zero without relying on that value. Drop this
unused assignment.

This patch doesn't modify the compiled array, only its representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-max7301.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-max7301.c b/drivers/gpio/gpio-max7301.c
index 11813f41d460..c8bf6a9c3de0 100644
--- a/drivers/gpio/gpio-max7301.c
+++ b/drivers/gpio/gpio-max7301.c
@@ -70,7 +70,7 @@ static void max7301_remove(struct spi_device *spi)
 }
 
 static const struct spi_device_id max7301_id[] = {
-	{ "max7301", 0 },
+	{ "max7301" },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, max7301_id);
-- 
2.55.0.11.g153666a7d9bb

