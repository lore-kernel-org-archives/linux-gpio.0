Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DE543BDBC
	for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 16:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786983738; cv=none; b=GjNBZ5Wf5I/oRE2yaxa4JxUqlXIKzjHAPAswbNfFasu4QNc8xHubOwQRpYmFSrIkMkRMQIBXlIjD4xf5IB9ikQwsx5yT65IF2SYPuwGOXnnrhTAPTgYr0JeVsk5ahhWsPMT+VMxGSJcJon8hqOaMPeUTSUYB37Y8NmzZHPxTn/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786983738; c=relaxed/simple;
	bh=RFcxc0hS0FcL8xkd7cV7Voaom5VxjURr1IJu/bHB2KY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q2gEX35JlO0Wd2ji8Ez08e1TPDrpidHjGeLYvqGXWGTeucCWH/nENiT6i0eYPvU4Vw6UHeolKuVcn3wYL9DhxHdvRWLPiAnq9g+eL+lNIDjeZPonDxm47ci5X2u6NPAIJGQ9fTDJ8+u+4Cnhc2k1rMzHGFaV3IO5fegaVHMrtVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brivo.com; spf=pass smtp.mailfrom=brivo.com; dkim=pass (2048-bit key) header.d=brivo.com header.i=@brivo.com header.b=n4wmHDQq; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brivo.com header.i=@brivo.com header.b="n4wmHDQq"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-52d8679c149so23313071cf.2
        for <linux-gpio@vger.kernel.org>; Mon, 17 Aug 2026 09:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brivo.com; s=google; t=1786983736; x=1787588536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ibAJzElUUKot6lni8N5t6jdT1WBvVXg5lJjweeU8WH4=;
        b=n4wmHDQq9NTX9XgBFu/JtkzYoZqkB36c9UjQ1tMDGeHethiOjvqgenSL1jex/TziRh
         CUPtUOEH+Ti5pCMQdkbzdTb7ZUZUMxELU1ZBejUEA+o+5r5D6pCnU3rKpRcnVdSFGZ5M
         uK2IIgX7ObVity4Yre5kTEQZwWo4gUamEAn22hGstxC9ifCo7j3esrBarRmaWsqQcLpn
         oVjHb8KngvQ4LyV2Tsz5Zwx8l9qoO2xnyEUAPpSyeu7HNhdwnzJ/woKehKTT6TKII+4G
         jWyRkWaVt3no2Ff+PEEGRgJfVzlRdnwLdKH7KNr+aHIVkCiFwOeLSv15oi0w2L3lAHt4
         BjhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786983736; x=1787588536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ibAJzElUUKot6lni8N5t6jdT1WBvVXg5lJjweeU8WH4=;
        b=CFrRIahXgRwTlrhUmp7MSRNoQxVDv49dedvFJh6aSb1PEhrld1GNcrj1x5bI3h7zwr
         UjgCw5A6YzkbIlaY+aTMBbcQ1DLeeKpZxwFmtNuN6H9zb3cNv3KlgUvacWL2ZVL+0p/5
         p4FDBurQIFkAZT/kOexF2QOdjYtPm1r293CmRu2CwVagnLR3RGFi+v4655Qm230JnMiX
         OhKAfJPJr1NeN9DsUOys+R68ohrvY1w1bzOLf9+ynSimpaWZDaQyYohr0UCei0/CyRUm
         xdlBZxYmHS5OpAbCda7pS10ElkL4JLUGASzPdCt/4q2sqb2+g/hHwgTuAGSQ6gXSuAZZ
         smig==
X-Forwarded-Encrypted: i=1; AHgh+RouEB76Q6zM0VLpETph+nEODMmt8/g0/zSmHsnmPc+LeOuzl0IsBF9nk6+LGpL/Y2SA44NFKB7A4qV8@vger.kernel.org
X-Gm-Message-State: AOJu0YyGD5IZIPt2y6ee3ReAPx63i8wMpbmhJTUB/21YDkInV4YEMz9w
	PzcI0vcMR25zs5oqfA6GwuDlDUol1LYeD8W77l5SFk01T7hgj6j/Mxyw0bdk4VuI6Yhiv81DO1U
	SoWuad9A35cCcAqCqTuy2s3PcNMrxwd/YK0LWKbyhaVW5DFFbTjFKSKME
X-Gm-Gg: AR+sD13M35fX6wuIT+YWQy620klZEDem9OJ2E2hCcs6GW55VQ4rKlZyMwhHLQLbMhKh
	e5fyYHiIL0Y9v0TKAgL7PVMSxR6PLpIlKf0Y9WoH8ERrxMkfj4Z/zN0imbVUXmaqlt6WkSY9tSv
	SOgZhixT9TFaYUg+NkCWV3id9IeZguNA2sebNbnzfLYLRRxrnVDYrM7XvAmOr6yOntDBh/pnjbW
	Q9iuqykN1URI8TIfN1v31PaKIqWipSxOuEX1wVdoXCGo5Jh97LyF9/k2TdNkBsXctkubSy43PE0
	qETPZNwfftmhj5k8XqSKcQs3ITX0D5o8wKKazeJh5Y4exBU4eC6EdfpbHrmrJmLvDSKkIA0faIK
	8N7iFtMf9swhlxCdbPcSynvKR003GXVvit+8APeh8mu+SWQmL/nEWJLeTl7wm1sCtXyMLDv3poU
	VA/Oa1GkiqyNS+YLBgQoDSEuaoAstL7KPgsNmoRghFvfnlzU30LW5PUwL0YrhZZUNrWDFJikvjl
	lTe80rm0KW+4BSguI3sELGdosjQrATjtYBNdyM=
X-Received: by 2002:a05:622a:1a88:b0:51c:51e:661c with SMTP id d75a77b69052e-52d8543f3c0mr276688621cf.25.1786983735767;
        Mon, 17 Aug 2026 09:22:15 -0700 (PDT)
Received: from strozzi (ec2-54-236-161-35.compute-1.amazonaws.com. [54.236.161.35])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52db6136569sm18142461cf.12.2026.08.17.09.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 09:22:15 -0700 (PDT)
From: Sean Anderson <sanderson@brivo.com>
To: Linus Walleij <linusw@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-gpio@vger.kernel.org,
	linux-amlogic@lists.infradead.org
Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-arm-kernel@lists.infradead.org,
	Neil Armstrong <neil.armstrong@linaro.org>,
	linux-kernel@vger.kernel.org,
	Qianggui Song <qianggui.song@amlogic.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Sean Anderson <sanderson@brivo.com>
Subject: [PATCH] pinctrl: meson: Fix typo in s4 group name
Date: Mon, 17 Aug 2026 12:22:11 -0400
Message-ID: <20260817162212.1890616-1-sanderson@brivo.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

One of the i2c pin groups has some junk at the end. The name should be
i2c2_scl_h1, and indeed that's the name used by i2c2_pins3 in
meson-s4.dtsi.

Fixes: 775214d389c25 ("pinctrl: meson: add pinctrl driver support for Meson-S4 Soc")
Signed-off-by: Sean Anderson <sanderson@brivo.com>
---

 drivers/pinctrl/meson/pinctrl-meson-s4.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/meson/pinctrl-meson-s4.c b/drivers/pinctrl/meson/pinctrl-meson-s4.c
index 872948699e9fe..365dafe457a9f 100644
--- a/drivers/pinctrl/meson/pinctrl-meson-s4.c
+++ b/drivers/pinctrl/meson/pinctrl-meson-s4.c
@@ -854,7 +854,7 @@ static const char * const i2c1_groups[] = {
 static const char * const i2c2_groups[] = {
 	"i2c2_sda_d", "i2c2_scl_d",
 	"i2c2_sda_h8", "i2c2_scl_h9",
-	"i2c2_sda_h0", "i2c2_scl_h1l,"
+	"i2c2_sda_h0", "i2c2_scl_h1",
 };
 
 static const char * const i2c3_groups[] = {
---
base-commit: 3b5f4b83c4abc0c9b0a7b9e2b44e816611b7f2ec
branch: meson_pinctrl_group

-- 
2.53.0

