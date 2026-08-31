Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6ADD4E56FB
	for <linux-gpio@vger.kernel.org>; Mon, 31 Aug 2026 14:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788186738; cv=none; b=l8jK/LNscxfGtD3t2a7HCjzxzpW9/Lp2KC3s57957KHuUy6/Nb47LuxbpgSzENe8N9b91rceteAEDvwHb9aTtWx/JDgMJ+yEkSwd7fgE6IdlwdaV0kxNf/tR5k0Rrqh/j9dBJGM449aWBQ0ywB3rvkTwT5x1qT2W09N7Vi/ry+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788186738; c=relaxed/simple;
	bh=OzOvqUUyFScK+c4Qm0JM+we4nmEqm3utvu0fjkr07bQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OfAr8qbr0+eBOXJmYB4l9MyqLn6rJNKerCvC1TxaOYgOIkLjLRrVXBt+HBsBfZORpOB3GjIjXKhzBT23i+9S6214C56lCwT+JqxAkFY+7GzMUsiFDlknenbsH//1LtltA6reNcciIeHiU/5GV90Fvosqyx7OFXPpIZbRQI40Z2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VuFS7zui; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VuFS7zui"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-49b0d8bc2aaso35601035e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 31 Aug 2026 07:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788186735; x=1788791535; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/P140PVQM179Ozwd8WDoSSuyK9DDQ6P2ESr69rhbMhw=;
        b=VuFS7zuikF7DdpJdHg+JELfjNSOvQUwUEw3P5IVqe7DRtCcJLMftwcQtBCnP+gt6lx
         yEh5yTx/M+zAQpdzg+YCt711JxkNRL1mxEFuTR1+aNOSspgLNmvMaLwOGmI53nOTFEBf
         fkhXxQBBRG9BvV06G/sBQX07n72zz88wZE7q7P+RNy2GstNo1zus+cYB/w2kdNVRpaQ/
         Wgm/Zqq4eAZ+2BUqzgCw35KbmrZSBehlT94UNAfNS0Pcja5DJyJbp9odSvEn7ydrRKDr
         mROJJlxTL8J2NBUQuhQAolKFmaGdN/ENDUrnTGZ9mgGm98/LSPMBZ0vPX0FYOq1w3WtK
         SLsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788186735; x=1788791535;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/P140PVQM179Ozwd8WDoSSuyK9DDQ6P2ESr69rhbMhw=;
        b=Bkz+NJjjxE4stawp0pi5fpnng+125zAbAkWWuy7DXOKgxzyyDCqltSvBuaIpvq1x1f
         bHi3iIgfh1b5uvpmrBh7tSKb4m68CCe4rckY/PUyH56XsGyZKjZ3ZnY1mmX7CRKV8OoU
         FGly9R7HELaNlGTqqe2IRC8cOHGGQCiZM3vOdqiv1z5MQbDRWpWNp58vVExBZ0DQKz4p
         tuFNwPiDpQX2PVchk41F+I3K+0+ZdpAy/wDIfO1qjO3IP/dr2xcb0pc954vX5AoXwLjC
         EtFmd8yPJ1QyqVa7sZk6ZCxJEDhSMLa2HRLftcUGI+g5J0kGpKPcY7YuhNykaxLx1c6N
         ZnBQ==
X-Forwarded-Encrypted: i=1; AHgh+RrVOeMHR5HhZOOuV6D6qJKFG9fnosN/rH84cCirWSrtFlS1u3lIl1x8o64v4Xp6US2wSPUXw3TczD7n@vger.kernel.org
X-Gm-Message-State: AFuF++mcqqwwNapVuF14c0NMnkRGAenDUXaX8TFugiMN0/ya0cP8gurm
	r5pZKXiqBqkwvYpihYVMyJj4qBNJjexe8aEnjf7gPQy3xJZKYwF/Fd0l
X-Gm-Gg: AR+sD13KHKzP8pclgjdaBmqq+7tpwtidEeghdNSPcPjS0GK6z+rBG0K/J7sZ93xAApF
	bKdawERUgi/3rMJQDRmQYlT7pgx8n8rgrQeKvH9Dp9ozgs1hDM2hZuMafBqrJs/3V7M+++d6ycQ
	+ikug1iLI7zjqb0LYvssFlto3kOi9adDQ1KvPKcZmLH1e6CXZQ6/RDsKh+C6WzaYHsHUYC5yRN3
	BEO1QGm68erADQqLdGL/SrrdDop/9xevbl95ogiLH+0IPM5QRlpDIYLOdQ1jTzVxvgs0fp4SeyG
	ZWvi1H7EnvG/V3sJ5Fx4uh8Uqcmsqf9tmtm9PU4DQy5yJslSumItIinbRRZuUjafId7jC/rGop4
	IHjAjqTowkdHmx9NdiT3hO+0F0ArG/LKbjYLsK9lPjhI5Vt1Bt6prQ0U+2jLGcgZrJCiwqw9Tk5
	MRye0g1GhwQ1V17eSZCkASPdxG6SfX6Ok/hJpFXOM16OFKGgZ0pzosRVv3p7v3jz4M2GrEzvhxD
	ck2LlTr0igZyURTJg3iDUne
X-Received: by 2002:a05:600c:3b20:b0:499:8704:242c with SMTP id 5b1f17b1804b1-49b91bd78cdmr340102515e9.0.1788186734682;
        Mon, 31 Aug 2026 07:32:14 -0700 (PDT)
Received: from unix.. (244.red-81-44-253.staticip.rima-tde.net. [81.44.253.244])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49b945816f2sm344786125e9.8.2026.08.31.07.32.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 07:32:14 -0700 (PDT)
From: =?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	Jason Wang <jasowangio@gmail.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Iv=C3=A1n=20Ezequiel=20Rodriguez?= <ivanrwcm25@gmail.com>
Subject: [PATCH 3/7] docs: gpio: note lineinfo padding must be zero filled
Date: Mon, 31 Aug 2026 11:31:21 -0300
Message-ID: <20260831143125.151360-4-ivanrwcm25@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260831143125.151360-1-ivanrwcm25@gmail.com>
References: <20260831143125.151360-1-ivanrwcm25@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

GPIO_V2_GET_LINEINFO_IOCTL and GPIO_V2_GET_LINEINFO_WATCH_IOCTL reject
non-zero lineinfo.padding with -EINVAL; align the uapi comment with
gpio_v2_line_request.padding.

Signed-off-by: Iván Ezequiel Rodriguez <ivanrwcm25@gmail.com>
---
 include/uapi/linux/gpio.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
index f7cb8ae87df7..5515b718886e 100644
--- a/include/uapi/linux/gpio.h
+++ b/include/uapi/linux/gpio.h
@@ -218,7 +218,7 @@ struct gpio_v2_line_request {
  * gpio_v2_line_flag, such as %GPIO_V2_LINE_FLAG_ACTIVE_LOW,
  * %GPIO_V2_LINE_FLAG_OUTPUT etc, added together
  * @attrs: the configuration attributes associated with the line
- * @padding: reserved for future use
+ * @padding: reserved for future use, must be zero filled
  */
 struct gpio_v2_line_info {
 	char name[GPIO_MAX_NAME_SIZE];
-- 
2.43.0

