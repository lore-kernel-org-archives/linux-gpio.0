Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C493DB32A
	for <linux-gpio@vger.kernel.org>; Thu, 15 Oct 2026 02:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792033146; cv=none; b=iEfpfjdBZWnOOGqnRXOj5O6Iyl1ISD+DSlfzQWh6CGitH9KzZnms/5pgC1gl5r6yj1aru84QHhPMjrSg/0kH6GtXVIPrA9QrsmIYzJJNZZcI2Win2eGpZWkwbQiW/fbPFxJNHDJ8sXf9uqyD//MQHT05RY3Up1QqTpO95fGNGxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792033146; c=relaxed/simple;
	bh=w9Sx0hMDZcZMhMKDr8/srNZjFfM1ZeiffAxPG99aG84=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nzymiSI4oAFLMFLfWpcYmpUnUYzUb3fvL1MHr/oMf5bGaOyQNqS3mbMnV3+rE0FQnvCu1coK+e4264MvBcyQ3Oz+7TiVGe/90kaR7nyevD6etx2cYqxNZEw+cd0xswmjP+QI8+qSNWG37fUevtBvjKHDYRDXjqShFuxl6ctvHuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q7HcQxqK; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q7HcQxqK"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-887a58523e6so1449269b3a.3
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 19:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792033143; x=1792637943; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lDJNF+I2Vbw9nB1BN+Iq5g2wGAwV9CAQyrrJS3fYQj4=;
        b=Q7HcQxqK9J3QFpJWw6WzxUVmWPzbWDRA3gaUIjplsDX9G4UOMuxOLHRHyKU4eLyuFX
         icJbvTS1gbBUe/lLLKUmXAvM6dDjhb8mqlJlVfpNmZvFIj/f1XjGnQt6yvJbLf/Jyt72
         7R6JcM6w7RIGU64aO7armJ8VeglT7dkZqg1WJVWfhL9BaF5GKb3Bv/aVQDPyHlpzVxUL
         aO1bSXWTCgSoN4JLjeh3Hfe2HfNUavD4k2hdrjJ0CzW3D+Eg8diN5m63XPBg3BhfMqub
         0dt0O2v5Rg/9FfayWRAVpmUNL21R2QK4gJrxGLJgTeot8fSDm5ok8sf5d3S10zkMicTa
         vBkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792033143; x=1792637943;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lDJNF+I2Vbw9nB1BN+Iq5g2wGAwV9CAQyrrJS3fYQj4=;
        b=gBWKX2HAMDWR13FYLFuTXOeyBfmICOi0FjwkgfLC2DQSyExq+UMzQBgl2oY/WgvCwj
         QZAOka/Avled3GvteTYfPxelzTv4Rnwbwctq41Q50jiDDuv3vaz5GjinP8Ogxf0UlI54
         KgH4DPXmnsjLBq/C2qkfrcSpet2Wg2SJrl2fmu7zqUfXvn3eSck2nQAje7VpCY5r025T
         hgx1lzK65nrbR/ji253H3uk8QA5BmxbHRcvwxJbdLPQv5jk/xVnHN1FmzqqOLe/1QeFi
         2nieAUOYC5s9SpCDia7buFMqjK6qMlbgb6bcly/lGMfEvQDTQ68198IxKa49yey/xpo9
         gZXg==
X-Gm-Message-State: AFq9FYLPMCni7UCwBVNJrXFr5anUH0BuX1+Z77JkdDBPrME8iU1uASyO
	1pIXpWGCVznTPeXD5/GszbhXAZZpVPu4WsOrmnu3rNWr/mHV4Z1hy7kXAQwKVw==
X-Gm-Gg: AYBFou0A80Lq5swEUTcaVdMpSWnMomHQ1oQzdUpuyK0I6M8hMw6uLnXg1iPtqABB0f+
	5/J9Uv7DmPNMjo5PVPwrd8cyMJ/AkqfhJIRPCVXaw3yhk5ajGB6nK+B2OAND5dU6k2teZOilp1+
	Wz7zm3KT/DG+3xtP6rcNv/pU5kWoFNZkGadIWdA7zJpk8jaVbSHhuKYCQKK4V7McMK18MqHgiYf
	EV1imfd2uypCdO1uz40gtp6K5hKnjCoKiCbwsNLXVab261PyTlQyYJE8b9ZgmlKI9pSzKsyo7/u
	nDELe0sy2wSnf8bA0fmujiQirbsHmee4dtRS2yv8Vy+SVWx8LN8obwezJNBRaJn6JyEo/IbGok+
	v/Ep8VmuqAmFJH2JajvVL3uEnZ0OzN4uv6ott9iWGsaz6+xV9Qdtt2cpIwanrTUhSxYfC+YH2y3
	iNbxtnrlZeF4YhOTZSVz3l6mxC5ztH7gdG+H1MAOFR9VxVagI1gMyenc4u/MhfHsiBnrc95I3nH
	XtAo87AoBF+9OZD65OSRPQxLGrC528=
X-Received: by 2002:a05:6a00:3cca:b0:892:66a1:a175 with SMTP id d2e1a72fcca58-897c7fbecc9mr13948652b3a.52.1792033142737;
        Wed, 14 Oct 2026 19:59:02 -0700 (PDT)
Received: from rigel.home.arpa (194-223-74-160.tpgi.com.au. [194.223.74.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89e45dcb382sm409747b3a.15.2026.10.14.19.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 19:59:02 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: brgl@kernel.org,
	linusw@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ukleinek@kernel.org,
	aambrozewicz@nvidia.com,
	Kent Gibson <warthog618@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] gpiolib: fix memory leak in gpiod_set_array_value_complex() on error paths
Date: Thu, 15 Oct 2026 10:57:49 +0800
Message-ID: <20261015025749.47039-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A drive-by review by Sashiko reports that, after a failed call to
gpiochip_set_multiple(), gpiod_set_array_value() returns abruptly,
bypassing the freeing of possibly alloced bitmaps, potentially leaking
memory. It is an unlikely error path, but is possible.

Defer the return code check until after the bitmap_free() block.

Fixes: 9b407312755f ("gpiolib: rework the wrapper around gpio_chip::set_multiple()")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Link: https://lore.kernel.org/linux-gpio/sashiko-outbox-168233@kernel.org/
Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 0586fc1f9564..921e411314cd 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -3968,16 +3968,17 @@ int gpiod_set_array_value_complex(bool raw, bool can_sleep,
 		} while ((i < array_size) &&
 			 gpio_device_chip_cmp(desc_array[i]->gdev, guard.gc));
 		/* push collected bits to outputs */
-		if (count != 0) {
+		ret = 0;
+		if (count != 0)
 			ret = gpiochip_set_multiple(guard.gc, mask, bits);
-			if (ret)
-				return ret;
-		}
 
 		if (mask != fastpath_mask)
 			bitmap_free(mask);
 		if (bits != fastpath_bits)
 			bitmap_free(bits);
+
+		if (ret)
+			return ret;
 	}
 	return 0;
 }
-- 
2.56.0

