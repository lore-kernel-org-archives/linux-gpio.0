Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098221;
	b=180N1Nccqz8DgGjraa6FKzyPR9j6mcn3bni2VA2KJfb4uTfRG6vxL7/1sHoaePn90VhQ
	 VIv72voOX2xxmJlaLlKZIIMFQdrocvCYOTtD69A76xlAvm6l+pG+XFDqOR0w8VTyebLb6
	 LizyEMQ8mG/7LxWYQEKZ+VGtUOaIwVPiDFbDYPH67uCgv3JZeYz0ohweONaMOuFoJ15FW
	 bvNOkB9tgNHomrLBa/oK3Rlg8WeEuEiSIdv1qqKN2AQY6TSaMrCBNoyENv3QUZLqqFKHA
	 xG5gXtU/qfYG8gz65eVc0yz2z8fvg8cq0Zze5ASJElBO0lmKeUdTVUB9zOCWsUZ80aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098221;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=AWcgq0SRGHmPYqmIYgxQKM3GrS7glpdzaZ67Xr+DP3k=;
	b=RQ7mBwXsLr5cVibMRr7GQ3qmHhR3YLA5vK1K7QJjzG77mjQQg95W9fYeYvU6kGZ9tyxl
	 dyUtqpIPGF95Msl3/TXbqIXhkrdrUAIfDSJ1Kn8wRdlxEPeq3wD4W/pUHZwSyGZj4e1q5
	 itpLsR3ekTi2GtPr5BNPIruMpf6gRAIiVQ2l0T3cjy8JopETgct/BhMycQVF3VeHwnGsq
	 9NFoDO6/aDqnEwxcxtm1q07h1jysktm3BGJ2DcMqemDta2j/GBFl8/tdtRHYijGIqent9
	 +/RyoQkx/BBJ3nLvUJasAEOuRfKOwBhSmUXomIYGpPYcVMnDbP/RPR8tK6zA7Dsv4Kw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=REVLR4Ns;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABE260A262E
	for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 10:50:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DABE260A262E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=REVLR4Ns
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48df8fe8513so3624045f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 03:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793098219; x=1793703019; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AWcgq0SRGHmPYqmIYgxQKM3GrS7glpdzaZ67Xr+DP3k=;
        b=REVLR4Ns0zEuYotk5b1VKBaPS47SZZcgXSx9oMgvd80PekIwTKlq5rvsF8THwlPGAW
         3PdfqmLLOYZOnT8wVVzjc+Jh23f24z5sozf0ZMjP+fafxIl3V6thxJ1cQIr9PWJ0XSSa
         wD9unij00JzX06JU9ory5t+0p8MWG1+skMTZ8Kx11AhZUcDwfewafsGWy8L/yO/AE3el
         KEWBCYtnxT7QgYZa7vynhmgREDFtrFLrzbKCbBLvHqXN2lIC0iyCorXPM6ZPuC2eql2R
         8BFvQ+VuTxgOaRx3X64dG8pl8R/dtTxPdn9WA9yUYECq7mBFX9go2AJURJwTkGgfZWbZ
         CeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098219; x=1793703019;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AWcgq0SRGHmPYqmIYgxQKM3GrS7glpdzaZ67Xr+DP3k=;
        b=oGI74npGJdrc1vaKBZ+3aYLzVKgBINdRnNE6pS2G+z8pbO/X/FBXPG28bA9XFH5BVp
         zwAvfwxS2b0OdFOaE9ssEHDO1JBgBgEZBjq2yJCBhlZwo/QftkCY4zm9BAkRwEtkoLID
         I1ExtnR4kJZwSyfxBEIwZ8blQSutcD71o1Ta2jcKYMuDEvAUdE9PrDmQq+D3H6+nY5xa
         suUOiOkhq797QG51szoyrms6yn9uES5r0aqY2GZLnDyHTmyL6kCkHhj8mOYb0jpMuezH
         yaZW2hV3G5b981OyT2F5Mh3EjvvnjskIceKi2HBYl8J72Ryem85A4Syh3ahMGEGYrR7r
         Imvg==
X-Forwarded-Encrypted: i=1; AKwUvByvFNEAclP+Ud103D+AZVVYECsY6i0FqBLX5XsBTgIYNHqv3hRscW+wBFmDEg19/sTEkqZtDvBkCHD4@vger.kernel.org
X-Gm-Message-State: AFq9FYLypdJi8GQNkgHS5VxUw0SacAIGT/xuReZwxpWly36KEs2ZU6Le
	qv6NosshazoxXpET5aP5uXJFH3mnpGU1Gq4GZgnJdoBQR1ew82vmx1VB3RnhvnFtP6o=
X-Gm-Gg: AYBFou3SAhrTYPr8/VnrKv9+w8kit7Qii7EYAsgt+cIFX/n8oAPj2ke43ixJ4pvlEai
	VgP96CeemDIH6+nqmN6oEVYt6I3PoF3Ju4IQ1RjWVbCggUDGHO2ykVOliTKy2v7Q37YPw0J8lD9
	XpUXfpRMuDnzEHXbhMWa7eYhLqH3d12EqlzYXypQN+oO4ki3cSpHqn43/+QeCfTl0qkF96y9uqb
	RC81XlwF5pKZzB1uN1fIrwEgGhFTOt+EbxqjpB8O01eXs8EHH69164UrUzJIdUw0BuSD5ydwlop
	YN1Gij3jP6UvYbDm58lf0C/Z/UU5vS/PYEgRY6MNkdlIAkxel0vtqzeL/NQAsjFwDgrApjd0b/E
	1da4UR33t9qMvQeljtZJbwKjmVDa8k0WSCw3JdoJT4pSUDDJvLRZOlPtzDhs/OhZUHpIixu3cb9
	C7wIl17Q9BZAIq4WYn9R3UlzsLKyupWdN3XwnBiJll9lysF7a0O7UHSZkCJNimavN2yDqCg7zlc
	jpDpV3sJmK7laTGQ2crFmu+9XXG7BWaEstXJyJA/HYzc3+6r/6sbSCRhpKVCVSiNDDBOKC8KYro
	1ofm5cbIxgEdw4TSSMO8W7Clqce0VNMb+EpABjMRPDs=
X-Received: by 2002:a5d:6943:0:b0:48b:e50:714e with SMTP id ffacd0b85a97d-48e3eb8d78cmr13717704f8f.36.1793098219089;
        Tue, 27 Oct 2026 03:50:19 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ebc3a1csm22349392f8f.16.2026.10.27.03.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:18 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 02/23] gpio: fxl6408: Remove __maybe_unused annotations from of_device_id array
Date: Tue, 27 Oct 2026 11:48:39 +0100
Message-ID:  <c266eae4a348b6b24cf842fd74b91341e7003515.1793097104.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
References: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=984; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=YIMiQUQhyiMHW5J8celUPNjx27FfZEhJJQnBL+5FhKI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4IGNG/H2ajyo+gLD8lOky8ISLuuH5x+b1K6yO 7j7JopYbiaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauCBjQAKCRCPgPtYfRL+ ThN9B/wKmotZWiI5L3tLVqAkD7PsKVnMoCN1HHkZc5wATrSrFELHZAz8xJP8q/vXWyO9cBN4Yce sVoXXes7UdOsrVD9glrGlhwK+p+3BmAm1SCvz/CWENJipV4+TAyJnrxQITvHDu94O7/P+mDsmjj wzgZXDVZrUEX2XJ0XD9ItjpO8sjcTjxZjM1Rw0N7tMFPu2XQ+ZLZHUrv+1BDKp4jlrQqpi3DafU GpGOPslQKH+cu/oghvjMAAAQq4ZKJpflBVFLRXznRTo75ktVYhwBZmlz30x1r47NAfTQQ8bb/yS 5Cd9DWOqxwrJWUzzN4WfJIOSWpSY6xk04sGR+leUiL84L8YN
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Since commit 5ab23c7923a1 ("modpost: Create modalias for builtin
modules") MODULE_DEVICE_TABLE() is enough to reference a device id array
even if the driver is built-in. So the OF device-id array is always
used, thus the __maybe_unused marker serves no purpose and can be
dropped.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-fxl6408.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-fxl6408.c b/drivers/gpio/gpio-fxl6408.c
index 45b02d36e66f..8a7e70180efd 100644
--- a/drivers/gpio/gpio-fxl6408.c
+++ b/drivers/gpio/gpio-fxl6408.c
@@ -143,7 +143,7 @@ static int fxl6408_resume(struct device *dev)
 
 static DEFINE_SIMPLE_DEV_PM_OPS(fxl6408_pm_ops, NULL, fxl6408_resume);
 
-static const __maybe_unused struct of_device_id fxl6408_dt_ids[] = {
+static const struct of_device_id fxl6408_dt_ids[] = {
 	{ .compatible = "fcs,fxl6408" },
 	{ }
 };
-- 
2.56.0.rc1

