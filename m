Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36752DECCB
	for <linux-gpio@vger.kernel.org>; Tue, 21 Jul 2026 05:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784613034; cv=none; b=iWc/1S1m+Zn18MrS2u11hssXM5EfvLhxEzzpthaDoWYvvJ4VVV5+bQWMCR2aH8Inrx0KiZl3WJyTDTpqov9G0wc4tZUqVGDvOZFyRYXpyuhY9kdxWQp5l54UUk+sYunk+2AL1yNGUZAhqrlWeznyIYEONJhW5EjRAPRnoNpLYng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784613034; c=relaxed/simple;
	bh=Ez5w7zvTNFZ4gFy5ylLJYttK28CEOO05StpVXafibco=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=At34UBjjcp/AEo4unfYDmAO9YhCPn47fIdDRiEmsnvCCKaVnXaMcAVfHGnB/W2Uy4kNAc7OtwM+FWnnf4N69ztu11K0z4olJ1OASCRsVx9CHyXsNxFC07isqUTZ2H+vHEpPonCR7GoSoPgIHxUQ0bxLvP8vPhgyKI+mdyLLe+Hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CJHxktTH; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CJHxktTH"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-84a2c90e383so3064300b3a.0
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2026 22:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784613033; x=1785217833; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Irned0KcW0F4/+po4+h2gUa9EK+kp0SPiPjmk8rujME=;
        b=CJHxktTHPmBPRqmOVQamtmScmi6zoMPEqrkGfwLXB58sLHp0gyct9bc7bNX39RaUQW
         ToGF+RE6kllUc/uFrDcTjTVapTzHxhcIMDLuADrPkqZa5QgXYRr6+J8r/M4nvzos2e1Z
         0bnaim5lkWj5/oAwIqvJOUX4D+q4a7ZypBTpTqCajTitWo7m8GVQuqfmKVUlrI5Z6X/d
         CBOkFEPIapR+/L5mzkvCx93N+QhmDFoG9wsWFvD5fXQ4JxNQULWSFezLn2Ih0NaCmQXP
         AGAv4RmddAln+UG+2cL4s1qGPAY9X0QH5UbsAgJpULVozkCIaDWdoa1tW2a+4m9EUl7L
         Q0Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784613033; x=1785217833;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Irned0KcW0F4/+po4+h2gUa9EK+kp0SPiPjmk8rujME=;
        b=kjF0BWAC6tx7Wehjfk6Ds4aLgs0D31ZtPCDfwomdOK0OTlu7Secmx1sSETC5GMhlRm
         62EfMTcx47oCDjCzoN32Tjwhu8cLd9zvGlCikXLQjHaKwHceKSxAfHN7EhCwTvFSWDMB
         Oh7I/A1Pc8BwcS1vLu3+UYOkMYFW9wLnnumZ/OzVjo4pbFWsRWIaYDpzCCQd178uTRlM
         izI+InWgtuFD0Adnz04Gxp/kJijLcIe0zBwrhpy08GrApwXu+dYx2+WyqJbJg2swJmFx
         C+F5FhwCvTnNtIryFHQhCjxeOkT93Hj+KDETFVwrXcNJavVqvRL7azskfoK6O1YnGSUc
         Vdtw==
X-Forwarded-Encrypted: i=1; AHgh+RrAkflCATXV4iukrp70NV1qC73pckR7slolQiYkf7OLjJyMm1QA0SNv/wPctoZTKHKYnBG0QnEE7rvI@vger.kernel.org
X-Gm-Message-State: AOJu0YwFqoo92p/ktK9BpUaIIkZ1Ygu/3cshKRSmEfmTtKClyMXOlH7j
	rj4yHCI7XSFCso3umT81/+22loWnWw658smyfs/9rkHQZGaPEUrsK5s=
X-Gm-Gg: AfdE7cn7loInrZiTfuT59mmQb0LDsAzas9bKPpGFYyiLjPKri0wI4NE6eoXwFMLHQbo
	daCwUJ93nHKVi4YcY36QH6QXr8ctLnULP0CSEF33lnmWL1S/953TVgMDdElVXvUAe2z4mfViiS9
	vj30SVE5raJGnXF/aYCef2agMEcosl8Au3rnuXP3iqf1e/2/4e3tbxHid1iIlPmw5g40olJF2Y7
	wVaJuGEr3xmb4fgRNcAu+vDq7yiBVnJybscJlsXQ62C1XgYjI5hBJYyyUzbV1hXqqScF3hmA4fA
	R9g/ykmjtCnlrlwvZdjWO5eedpDhwyGu6vigden3UJpSpG1utokhyXKRkSLc3CSO0HtBLP8Q1vE
	fv6fGsYDEEPXg4ZkGkxBnX9FYqQJ+bFTml89cNOzCXIXnLaOj/vPR7gFPslvnTzf4cTdihpOnE8
	wxgKE/XHh7oxwq1QUhZ1N409TsktQ=
X-Received: by 2002:a05:6a20:d492:b0:3c3:750f:3cf9 with SMTP id adf61e73a8af0-3c38d90c927mr24013128637.11.1784613032892;
        Mon, 20 Jul 2026 22:50:32 -0700 (PDT)
Received: from t-rex ([2401:4900:adc3:1a5d:adf7:50fc:93fc:9a82])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1de21asm43606969eec.23.2026.07.20.22.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 22:50:32 -0700 (PDT)
From: kr494167@gmail.com
To: linux@roeck-us.net,
	nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	surendra <kr494167@gmail.com>
Subject: [PATCH] hwmon: ltc4283: add missing MODULE_DEVICE_TABLE for OF match table
Date: Tue, 21 Jul 2026 11:20:22 +0530
Message-ID: <20260721055022.34629-1-kr494167@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: surendra <kr494167@gmail.com>

The driver registers ltc4283_of_match as the platform driver's
.of_match_table so the kernel probes the device when a DT node with
compatible "adi,ltc4283" is present, but the corresponding
MODULE_DEVICE_TABLE(of, ...) call is absent.

Without it the module alias table (modules.alias) does not contain an
"of:N*T*Cadi,ltc4283" entry, so udev / kmod cannot auto-load the
module when the DT node appears, breaking modules-based deployments
while built-in configurations happen to work by accident.

Add the missing MODULE_DEVICE_TABLE() to fix module auto-loading.

Fixes: dd63353a0b5e ("hwmon: ltc4283: Add support for the LTC4283 Swap Controller")
Signed-off-by: surendra <kr494167@gmail.com>
---
 drivers/hwmon/ltc4283.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/hwmon/ltc4283.c b/drivers/hwmon/ltc4283.c
index 9b85293ea664..9ec409bc2648 100644
--- a/drivers/hwmon/ltc4283.c
+++ b/drivers/hwmon/ltc4283.c
@@ -1772,6 +1772,7 @@ static const struct of_device_id ltc4283_of_match[] = {
 	{ .compatible = "adi,ltc4283" },
 	{ }
 };
+MODULE_DEVICE_TABLE(of, ltc4283_of_match);
 
 static const struct i2c_device_id ltc4283_i2c_id[] = {
 	{ "ltc4283" },
-- 
2.55.0

