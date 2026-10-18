Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A48A348C6D
	for <linux-gpio@vger.kernel.org>; Sun, 18 Oct 2026 04:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792298703; cv=none; b=WFHASFpeG8pP7nkmtEkjY+2tJi8b0Ia6Y0MFbecGjAclVztE6I9XcZiqezXdJRZ856ixxJwy3sPdgbcN0Ehcg7VMxDHQ9dH/jGNiG8F6eUH7nWGo6dJyAg0IFTPbtF0Lr3M9hleOWdLs31/W0RKuu8oxuWRU6w1kKJgexyzXcdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792298703; c=relaxed/simple;
	bh=UVR8uK3gHs0AIhtdg/u31FGNb0f5HUFjn/VPji3argw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bB8PTTLmfGFzc9xema4Cs1TFEp1acgcxlSx3Ui8SOQzSO3A8sH+BTn2QDFE57sd4//Khg3yrPHc5UoyQfbYvdlO03zYuG1To70ZVkN6pE4mkJp93eXKvk+exNEUjp+gXXdHEon9BQjYWkIQCkoFxQry/b68DgHz2Grqq3+noCr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UdH8vs6E; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UdH8vs6E"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e8ad5b31c7so5208175ad.3
        for <linux-gpio@vger.kernel.org>; Sat, 17 Oct 2026 21:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792298701; x=1792903501; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pZwauyHKkH+LFwe5iO/BreDrezGyTye39yS/26K8Y/Q=;
        b=UdH8vs6EamFrvJ0DINCQO3dEurgjwBSPlGigYzPpBMYgUVreXZoVBjjamB1mW/E69d
         EXf7xKoacxaVDHBvvKYqL6e/rgnVxmz4g1N5Dd5YAR/H0SI6nyLLuCAYb48AgSfzFuP1
         ICb9fbyOwV9z1uQLcq92P694xBrYdX3pdafRDXt+WQDUXTD74OTiZP5Xo8Ghz2tqZXM6
         TosXOaIkbW4nHxV/ZXEj+mVFHJVd94izbrCXs1y5JeAo+rIGbze26i6KL3b32pKUoGXq
         Ca7oxEThT3d7uaj8dZrPJMki64PeNJepmze25XwyalDlsOni+rGv+L4YUMI6A9houW+5
         QMCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792298701; x=1792903501;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pZwauyHKkH+LFwe5iO/BreDrezGyTye39yS/26K8Y/Q=;
        b=Ql6hj80ezPzqxNb7KtnVjulfDMHbjokx+CK0KhLHev47Fb3nUgijwZkC7dyb6ODH2Q
         bxtiERKjDFMRj2E6gi37DtUGOaJOcSotArUlYzd8n1A7dX7bHg9IH4SLxmtfc6NLXXDy
         6BNcNY3yyCsyJlaQjYwyicCPoUhzIwaR4fbb3/P7Fw22xaOdgGbeensWuh/qYS0zL+Dt
         Jv/pXuMRPt+pguRNje1kL2ypQ7fp5GNjfrNr9Xdz+JiqW7+YE+eQJlBhZjejZpGhDDJF
         E97yoPjS3Ov274Pt2CS8LF3Y0yeEmAvBaNfPPen+gghPIk2kUZ7c/Df866zVcxnInI+F
         1yyQ==
X-Gm-Message-State: AFq9FYJLhpvABDb7BSKp6WRaZ+bsyrVQFaaXGD4KIY3Lh3g7Qs8737wY
	4sr+J3Ksip4SjfmfZmmYiXHczwkvE6nDQJbBnbKu/4y6ElPm3Bx7HKdvhRqipdvfqIk=
X-Gm-Gg: AYBFou1f6ZNJSEu+B2L8kFOofFdV+T1XJjFz0mSm2UODID/z+L+/cZe1DOfqM/wELKO
	OSBrEh6AkKZKG69zWoU13prj4MNSghcllcP1+M+mwzJDgCdKdivA1v7ivm1Tq8vP/TqBdgRCtuG
	WY6h92VttmnCGKU1DUjJ6N12rDSss/D/gXTxNMG9aBigdHUINjGWwRn4jL2ZV0WHmnGid8lWUzW
	Ea582S1j8T+qWA9lH42yN/I8flpPM8scCCH1hW7k0fd60drdzvd/an1uhbkEv2DmMnlYeAIioR2
	BtBzNd6QNxcT6vWzxgkzw5ATDahnipPzkY/PDXFs60liFBJ+ULrQyzKyemMigL9UbCWpBi/vorY
	epWPG9Ci1k37W7ItGFguU1uvInivlGSzQ2j0DjNMfMVOU4+rM9cTwIUSPsQ3V99IyKYNqmW8OAm
	ne/uIfNnrKOAey5WjegjYpSvjx+BI0yi/Cu1FJbWkmm0pLPl7Cb9HgQhssL8WsNam7IN711sa9I
	43MWymLAYE9bkuW
X-Received: by 2002:a17:902:fc4f:b0:2e9:401f:f102 with SMTP id d9443c01a7336-2e9a6c07f83mr42956565ad.32.1792298701229;
        Sat, 17 Oct 2026 21:45:01 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e5c4b57sm25620405ad.4.2026.10.17.21.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 21:45:00 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: linusw@kernel.org,
	brgl@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Subject: [PATCH] gpiolib: Free chip resources when allocating the label fails
Date: Sun, 18 Oct 2026 13:44:56 +0900
Message-ID: <20261018044456.1259250-1-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If desc_set_label() fails after the chip's request callback succeeds,
gpiod_request_commit() clears GPIOD_FLAG_REQUESTED without calling the
free callback. The caller receives an error and has no GPIO to release,
leaving resources acquired by the request callback held.

Call the chip's free callback, if present, before clearing the requested
bit on label allocation failure. Leave request callback errors on the
existing path to avoid freeing a failed request.

Fixes: 1f2bcb8c8ccd ("gpio: protect the descriptor label with SRCU")
Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
Tested under ARM64 QEMU with failslab, a test GPIO provider using runtime
PM, and gpio-sim. Label allocation failure leaves a PM reference or a
gpio-sim request bit held before the fix; both are released with the fix.
KUnit and GPIO_V2_GET_LINE_IOCTL tests pass, including repeated failures
and retries. No physical GPIO controller was tested.

 drivers/gpio/gpiolib.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c0394c7d6279..239c0d54843b 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -2627,10 +2627,13 @@ int gpiod_request_commit(struct gpio_desc *desc, const char *label)
 
 	ret = desc_set_label(desc, label ? : "?");
 	if (ret)
-		goto out_clear_bit;
+		goto out_free_gpio;
 
 	return 0;
 
+out_free_gpio:
+	if (guard.gc->free)
+		guard.gc->free(guard.gc, offset);
 out_clear_bit:
 	clear_bit(GPIOD_FLAG_REQUESTED, &desc->flags);
 	return ret;

base-commit: 58161ead29e50d70a317ea26b472e0c7508e69da
-- 
2.55.0

