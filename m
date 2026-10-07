Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32A2353A7B
	for <linux-gpio@vger.kernel.org>; Wed,  7 Oct 2026 06:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791352889; cv=none; b=QMt8+KzSHa5fFlnig8bywtrLcjINve91rWsfElNORrRxRIONJQHKfBAxQhiujNhI89I0W8RGqH9hgph346vSYrWB0e+0o7G3YRbDrJPNBRSQwoJAbAmy0Rx5G0CQzLGU5v5SOCb5u7SukxSl1Z5g3ON+eYz6akP9Yib68fwxj7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791352889; c=relaxed/simple;
	bh=fUkZRVZThPrAIiUI7nNS/oPVIqZ1p+N6QBHZ5r01/C4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T8/MinHkcDuOSRslCvg61k1/8aSCJPSEKZ4INKv9F+3ULSrtg5hmc2wcaI4sf91ElovnkO1xZR+SGNfizRC/QcOC9Fa5sKvL2ewnVq6YDrCF1TyQUPEJu6CCslaRTvuvqIC+LuJwAf3AKdlBe1uvKF+hwnGvRXgKlDX+UnHrAA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eb4ZzBax; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eb4ZzBax"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a061a13884so11933005e9.3
        for <linux-gpio@vger.kernel.org>; Tue, 06 Oct 2026 23:01:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791352885; x=1791957685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xPj6yjALXRppnwgH/9Fv6hsVla0KxfcdinEDCye/m1I=;
        b=eb4ZzBaxSsIZgNsCzuEUciBc8eJlHiZUF6gj+w3V5CmMPoasoVzd8Y1c7k8Cgs/4As
         dagweCT/ii+MR8KGWokIuunxySksPKEiY6wQTqPSzd9efW8It5xaFNcjfMtNh8SWHV1t
         3Oec1hVYVmEvl9YsZ1h41htpHiK0cja1PRgWMbu1wccBufvn26ym4CV/M0pN0GRHiwu3
         696yj/ghTYcnnY5X4Bir/TUWIyP1UuSwh9jZLRAFDZ3xGImIPAcoBjb/wStfWCJK+1+9
         Nn36/VWgklMg1NJixlGfhLwMMj+ReLCacQ38go3GtudMXV/ZsCEXdZK6jyxLRLqPaHmx
         KkMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791352885; x=1791957685;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xPj6yjALXRppnwgH/9Fv6hsVla0KxfcdinEDCye/m1I=;
        b=UXt0npjjIbBVLPTbUIag2iMLJeHuYzjKjD0VameyOfH151i6YVaPHoP3qFT+S3qEdm
         LLiCa8/rzbSwsFsypNAGPf1vxrXJXm3j1ZxK9Aww3YH9GDFf/tUVSIVSVkbRHJqnYf/F
         LrWPhajOHPqM/c+9/Sz+vao67tGUNJ+nL7+69iqmYYIYujegCdMgDv3YOoKD2khfsUKg
         cDyJpM6yDB/aywaEbR82pNAuG3w75H7rA04EWJyFm2BSDprQeezkejvEbP4W7X8TN3k+
         m2m7dYHwLgYl57ZxHfK4OQxehjI0Sujtgi0EHPgxT7hWEQeDYsPV714s86/F7yQPUGqR
         nk7A==
X-Forwarded-Encrypted: i=1; AKwUvByfTDScizLc3XjphajQ69ZEtse7HjPsJSmK0zAAbxjcGQOaPJlN7P1mJwywdarauU/dXyq8sR9BVBuI@vger.kernel.org
X-Gm-Message-State: AFuF++mbSVxeeRRNEHltmkdK85JYchNoZWp1tZcaL/B86GiEUKta5jct
	fgkuARgV02qJTXi6P4CNsihhiZzqrjAITFIDlj/tJbZgxPzBuU+qnKno
X-Gm-Gg: AYBFou27xesDaCz92JXbqSeXgpJXXp9KoGm7hXGReZv8XKw2QjBfA51M9xndcMxj3co
	d1xlJQ11gTiqCYb8KyUrpSR13l12tqVOnZaJz2yXy+V777pULMXyqM5imk/TjNjj/QviJH2kKwk
	rDWmZ0NPmjYZ1xUsoMh8fNg6+WAluP1Gd4LoK43GdEd7RRm/yImZd9QWi1NUlFGu9O91gr4Bbzi
	ftJwvvqKX8hBoSvY+mw3W3qKyqJ0SWbgqXfN657vCt6XN+4cq6JCy1okWeNqs6VJWfi0ZY4gJOV
	97WqzSuvCCcokcFnSpPY+Hnh23w3ak/vHe2N42bU8PZFMMWj/fMfEuUtQj9hlC8kI0sqV/SQ8pq
	giECN4Fmn/PnXExg3fTmBBVNY7Sjx09/XIEKhh2Re7K5fSiFl95rijGuxyBgesN13juXwpkd+s/
	ppya+IqLo0uHXOXncYMuQp6VKfCavMwF6yHWriEd9f259QvI/igqNEDe13kro=
X-Received: by 2002:a05:600c:314f:b0:4a0:1c69:f607 with SMTP id 5b1f17b1804b1-4a1806509b5mr13094935e9.29.1791352884569;
        Tue, 06 Oct 2026 23:01:24 -0700 (PDT)
Received: from debian.tfbnw.net ([2620:10d:c092:400::4:711b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a17f4eac2csm49696235e9.0.2026.10.06.23.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 23:01:22 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pablo Mazzini <pmazzini@gmail.com>
Subject: [PATCH v2] pinctrl: sunxi: dt: do not accumulate npins across probe attempts
Date: Wed,  7 Oct 2026 07:01:07 +0100
Message-ID: <20261007060107.62221-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

init_pins_table() adds to npins in the driver's static descriptor, so
after a probe deferral the count doubles and the next probe fails with
"pin 0 already registered". Reset it first.

Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
v2: reset npins instead of counting into a local (Andre)

 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
index 50a16f3bd131..8bcd566593ae 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
@@ -84,6 +84,7 @@ static struct sunxi_desc_pin *init_pins_table(struct device *dev,
 	 * Find the total number of pins.
 	 * Also work out how much memory we need to store all the pin names.
 	 */
+	desc->npins = 0;
 	for (i = 0; i < SUNXI_PINCTRL_MAX_BANKS; i++) {
 		desc->npins += pins_per_bank[i];
 		if (pins_per_bank[i] < 10) {
-- 
2.52.0

