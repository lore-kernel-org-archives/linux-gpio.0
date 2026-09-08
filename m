Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B14854B1A4
	for <linux-gpio@vger.kernel.org>; Tue,  8 Sep 2026 13:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788872849; cv=none; b=iKPD30veTkNucOZKE/T1IbjQX7dTUVJzN7OR4mM5VaihNol95GABk2dEdG0fLUp20TjHMnurimUY+GCRknwlfmqgQgO3CYh3Iuk1oVCXvce196Fs/U4RlvzVxBl1bmmCcB1wi9v0KIzPKHy31xzNqpLeDBmjr6px8pTahDfET0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788872849; c=relaxed/simple;
	bh=zUbYzyK4H/GKh+dAUruaqSkERYasj1NCBLqNSm11zjo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HN6SIDXEiVn5gFDq1P88XtwJ/v9PJTaXIkFfi5OWa40oDP62Uo1vdKHP4amfkkb0Tn8AOmsFEpg61kNIwoIhZTpXbcY3rKxxi/LKTPOZvg61l76EdVOiq0nqt3O1OOvUIUP2dclt6jwtHaDazgVi60Oh+AvacYdPiuzQbo/pN50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mWr8nk74; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mWr8nk74"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-85c9a79590aso4377496b3a.1
        for <linux-gpio@vger.kernel.org>; Tue, 08 Sep 2026 06:07:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788872848; x=1789477648; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Y7dULp2jgzMlC/BI0kPlFE1r8grwAUi6RVwGhJW3Oj4=;
        b=mWr8nk745nK2mQ+eSWRPpAWtgJHdGv2wbSUWGqQnQQjhHBFHP+k2RNxvRD7yyZ3tQc
         +PSUyMO/yhi0wZYB+Xta+vvWVzhlZHwzYzdziKIRcHvFWFOf3AKaJyu3bPtEJCcxD7wi
         S31ynXvhYsOVAFLmWMyY6cYIFF6aHGv6ms2mEkexKAS7jni9QYxU3oQBuRRycXApHgjj
         giZnBjMXTO5JcrOoVLTDLkO0LvQ3LY+8hxAx5yJittFivdSgGK2f4GFUCN9YXOfchXbN
         y4gvq8RSeYpEFfYCI73IBpWto5D8GF3837pBAYAVX7ybs8bSDfEkTJ/awmGM1MIXZM7C
         ggkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788872848; x=1789477648;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Y7dULp2jgzMlC/BI0kPlFE1r8grwAUi6RVwGhJW3Oj4=;
        b=dxjcU6qXAjAbsDuxeEq+xwUuHx1mBZ7n8JzO8NG3J+tFIXsK+DJs/IHkmSEnrnkuzd
         JkThac63BLdBiiJ+H4HQ9h9UlEeplHpt42BrKz+YCs2XfuoWxmHXDMfcmgZv3xnFvJ7R
         O0MIXCTGG0UGBwBFlhvgcDy8oFM8q3hqtLkPOd++pg+0uixlFRV4Y2VYHf7Ehqd+g6LK
         P2dshD6KYgBbsIAdFZvDGnKW1c1YkWGYpQWG2dZW5TuG4gYVepWCrcx76E/kFuVuAygf
         lL7P+qQplqbbzy4GKYafQ9rcTPCsXDQU1zTlDieX8mnSIOtC2XlpmnwUTPLdjhdrOB0W
         6GVQ==
X-Gm-Message-State: AFuF++lAkT+AiKe3a59htE3hdT0UpvW5lbXwiiRapCz6SbwlKPAHCd5B
	gt8dQdhWhe2wBx2OA0qPzdwhGVUFTHce9Nz9kAOWCv3acDHWFH7x+76D/uLBAg==
X-Gm-Gg: AYBFou3OpUwqN01KNLSxbOO9Oxlnza72WT0jJlevmE53rjWzPK5MZ+Aq2i/s5jcHe1L
	hZDWRab0ZsSGhvbRX9gh/pbNbM1z7wRC0hI40Y+DORbBTl+Kyz34bBZ7PrHtvlCfUGPQfdDyXIF
	Tc/Ufo4hiUcWBN6B/+/RgQwxvGZqz/zhGKqFrcxA2/4QglxuPkJ1JPIqR1q5D+Z86MOS8OpyL9P
	DMTsRLrSlRHEgFQ9/V6n+efrlO3GqNOLVTjYo/q/3p/WukRg9ZFu6++HvFHPeWYLiuWm6DlQwKD
	1DVERt3EPTUwMeNDSL1XZUSPJDRG4bkYO2JB93LqBTOF5iCcKWKzgbZD/cjMm4t9sPZOHMF2S3Y
	8qLq/ESXPFWdCSONf+YniZK2R9jnUQFhxhvrKgyNq5T/Ax06e5l8sXhttnPV/YS4NqkmyPOvScV
	ghUMAdmFrULMtQVWjFsRZLomfiAqp1PefezbM+iOv93ql29P/ZZjLbvHJqDENYnzzIQ8hm350UP
	MjYZs9higNqKe56bvOatAICRrIBbQ==
X-Received: by 2002:a05:6a00:4fcf:b0:84f:b01d:3693 with SMTP id d2e1a72fcca58-86169b6c458mr36739170b3a.15.1788872847662;
        Tue, 08 Sep 2026 06:07:27 -0700 (PDT)
Received: from [10.10.15.228] (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8629b0cc638sm4434273b3a.57.2026.09.08.06.07.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 06:07:26 -0700 (PDT)
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Tue, 08 Sep 2026 21:05:07 +0800
Subject: [libgpiod v1.6.5][PATCH] core: gracefully handle disappearing
 chips during iteration
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260908-gpiofind-error-enodev-v1-1-c7756aab9568@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAIIoGoC/yXMQQ6CMBBA0as0s3ZIIUrBqxAWtp3iGNOSqTYmh
 LtbdPkW/2+QSZgyXNUGQoUzp1jRnhS4+y0uhOyrodNdr0c94LJyChw9kkgSpJg8FTRktDsP1tA
 YoLarUODP7zvNf+e3fZB7HbPpyfb4eFXapm8uM+z7F2RfPIiKAAAA
X-Change-ID: 20260908-gpiofind-error-enodev-7e70c48b7e9f
To: linux-gpio@vger.kernel.org
Cc: Cosmo Chou <cosmo.chou@quantatw.com>, 
 Peter Yin <Peter.Yin@quantatw.com>, Potin Lai <potin.lai@quantatw.com>, 
 Potin Lai <potin.lai.pt@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788872845; l=2232;
 i=potin.lai.pt@gmail.com; s=20260522; h=from:subject:message-id;
 bh=zUbYzyK4H/GKh+dAUruaqSkERYasj1NCBLqNSm11zjo=;
 b=zP5JUbQcbQBUCfUCl3d8/6i+w3w+HGNtiPaCHCKjGnZh5Zf9wFa/NAmph9p0ffREd2yY9YxSS
 hAO7BleQTFQBG2KtXJ6eurJ6X0mol+LIjuBPdjy2ZkHBR8e2/NQge8x
X-Developer-Key: i=potin.lai.pt@gmail.com; a=ed25519;
 pk=j3/nMxzz1ZPpp1revghyZ8IqOnwi6RWfuxXN2XrNMRE=

When hotpluggable GPIO controllers (like USB devices) are dynamically
added or removed, a race condition can occur. A chip's device node might
be present when iterating through /dev, but the chip could disappear by
the time we try to open it or query its lines.

Previously, this caused tools like 'gpiofind' to incorrectly abort with
a 'No such device' (ENODEV) error if any chip on the system vanished
during the search.

Fix this by ignoring ENODEV errors when searching for a line
(in gpiod_line_find()) and by silently skipping chips that fail to open
during iteration (in gpiod_chip_iter_new()).

Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
---
 lib/helpers.c |  2 +-
 lib/iter.c    | 16 ++++------------
 2 files changed, 5 insertions(+), 13 deletions(-)

diff --git a/lib/helpers.c b/lib/helpers.c
index 479f370..6d1836a 100644
--- a/lib/helpers.c
+++ b/lib/helpers.c
@@ -423,7 +423,7 @@ struct gpiod_line *gpiod_line_find(const char *name)
 			return line;
 		}
 
-		if (errno != ENOENT)
+		if (errno != ENOENT && errno != ENODEV)
 			goto out;
 	}
 
diff --git a/lib/iter.c b/lib/iter.c
index bfd2852..7f5ad9a 100644
--- a/lib/iter.c
+++ b/lib/iter.c
@@ -51,7 +51,7 @@ struct gpiod_chip_iter *gpiod_chip_iter_new(void)
 	if (!iter)
 		goto err_free_dirs;
 
-	iter->num_chips = num_chips;
+	iter->num_chips = 0;
 	iter->offset = 0;
 
 	if (num_chips == 0) {
@@ -64,23 +64,15 @@ struct gpiod_chip_iter *gpiod_chip_iter_new(void)
 		goto err_free_iter;
 
 	for (i = 0; i < num_chips; i++) {
-		iter->chips[i] = gpiod_chip_open_by_name(dirs[i]->d_name);
-		if (!iter->chips[i])
-			goto err_close_chips;
+		iter->chips[iter->num_chips] = gpiod_chip_open_by_name(dirs[i]->d_name);
+		if (iter->chips[iter->num_chips])
+			iter->num_chips++;
 	}
 
 	free_dirs(dirs, num_chips);
 
 	return iter;
 
-err_close_chips:
-	for (i = 0; i < num_chips; i++) {
-		if (iter->chips[i])
-			gpiod_chip_close(iter->chips[i]);
-	}
-
-	free(iter->chips);
-
 err_free_iter:
 	free(iter);
 

---
base-commit: f1af4b189fb4074b08eecbc50cf33306299d6a51
change-id: 20260908-gpiofind-error-enodev-7e70c48b7e9f

Best regards,
--  
Potin Lai <potin.lai.pt@gmail.com>

