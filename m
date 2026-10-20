Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483646;
	b=sHvgezfoiwaTUi+N6SBKsIok1pZSsbdNcZSshu1toQBMEP9OtNeBgcjSGEA+Lc6sXYsS
	 8z2xQOFbIbLMTJzjsH8AAFCUjYbW8xKYxM3SJV7MNxLyf3YjTtexb8Ey4FQuwL6YbwjMS
	 IstWxkngRmT7L7cnjuzl6DoETQaHyNi7ys6ioZ7n/2vdnB6zAKlXf6WUjEYRNXN4c/iyv
	 4pWfWFG3z+I4y1BFlrw4zUbS6CafdnZ+7i/4SU70uMHJndHSK0jOC75Fwcg9ee6PcsvUN
	 G7sa9j/mDGuJKaNbm4k7bTXBPQGZcZoQfsmWO8O/isypbNztUxEjD6eau+pkypT6jxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=7wI1NMCM00O0jYZhz10E6eemMehHVqt/3ZxelxBxGU0=;
	b=VmmDKOg0wR3JG9/uBDC0dx4Kyg/z/1qj5efdaNlCXXWcUNORjA8IwMt6PmoraghPFme8
	 qfJDLxS9ktOKJmQTmQKEQ/eg7aCXFCnKf3blc8HzObi6PyqvezW/NoKR6EeAvMlHqp4oq
	 IgiYwPQOZ1v2hTdrqerC7TJqB+mwR9kNYsWlg9Y6cvsT1VvfC6h6jS4TDBUWssYRpjUzU
	 P7jEACmZPwPvA0vYptcSteJK0y97FJhz3r5PEAxh6MJeOSzNvmvVvrgtf01v9oVwQrW5Y
	 UiWCoS6+PoH21MHf2iStFBWPgDet9pvmL7WVwiTJ8dI6fbT7wcv3QomXhADify+eulw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EkrDqIcT;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92169606A319
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 08:07:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92169606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=EkrDqIcT
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so1129689b3a.0
        for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 01:07:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792483641; x=1793088441; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=7wI1NMCM00O0jYZhz10E6eemMehHVqt/3ZxelxBxGU0=;
        b=EkrDqIcTTrDWqkWArZVKTdcjvMPQRuQ1kE4WlnZtXI4djvIS0uONAfCGMepApz3TG+
         qt4bbfnDW+VwQouFpG2UMGvysvc8X1Y9E4xqp794vHR//3y51PGTUTTdSF53aBkbEuAO
         lRGfbWrdZ+47cMWammMoDjhEhvNfGaXv5kqtMSxcZ7dzLuQy6D0DoRRaQ9kvygPasdLm
         VchFNGEngOWoX+NNEhD7f4tNyWV1rpXK2TMJ4i7FlneGwEOy2wWEzC7OA9XJw2W5c1Sq
         bAqilhsd88CbOYgDsa9+qnFvLO163sZFpcBeJJfNHNgIRAOeG9mED3rqLug8I/VchgZF
         IAJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483641; x=1793088441;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7wI1NMCM00O0jYZhz10E6eemMehHVqt/3ZxelxBxGU0=;
        b=nNX5zmvIbltCYjsEbU7mKBBpImFZHT6hZxkKXiMBiR6l50PAEnlThkYwtOC5+FU55C
         kkV28quGpiyDJsiohOL/KJmXwVEMH4arn7GBaa2Wy+Atlg3xVHmt+Py0ocDmTCe8QV1A
         Ssp0P4rw0hqTrf0Yodu4ljtSnA6o7eXNxYNB07uy0TEmabBzSSUS/ZLJsdWsAcsX9c0v
         8/o/vej/S6kUm1HR0DqxC2ktSEtbALzRqtxVts25XKSRskxOQ+/AbP7APyCaOtPmScDX
         6g3SVTuVGXIkw53sZj7u2nPwvOwbEWE9BJvloibCUW/YSO/GSGNeGMcA+uFrwzEQzLDP
         iwhQ==
X-Gm-Message-State: AFq9FYL2kyVYP3XNdhw8uXZrZSJgAo6MI6XjqpkC5Z3+ISnUJsq9LvRG
	JDXHZruDh0mtVN4a/cTsmLb9UkJKFOt1T3rNEEbs6U9EGsYhWSMycuFn
X-Gm-Gg: AYBFou1zPUTVZoTUWvUCQblSBIBm6r+S7rgOWnYMN9XLC2E6Gh7gWPfnfj007D5SS7Y
	TZdYtxoqVZ2O9Z1ItOxN80oGUX77bUF6uJVaT32HINXKAqcDHuy/P8Rjacd5mTBHSP0hww69gtR
	L3Vl3ZvmQqJu1OOzPpvyFfPmp4o5OF4C3LhymuXqkP0WebYBLVelGzuMFCPoMl0w/Sqd18CFbUB
	nCWVPB+tQ8Af4aiNWT6p835hbsllJIFYm/PO/q8HpCQdvS1T0TpKMFpXTBqe8E2WfxuWYpQHr4z
	eAQnbofE5/IdvS474Sm6thkM0QKc//kn+lt4efe1e8f7I+nxBuhzxmfrGSLPcmgjoe7HuUGUjV+
	XGr1rm3/KESmeMG9SaMYkaW6UUOEhM5iMIlLjcm4um2kfGswOlS3EY4V6CeHDTO81t14qJn9YWQ
	gmIVWajyiVn7uMDd9Hqiv7eqsxlTp3KaaJSyGqCgYvQT3A7agxhBbRnKsOiPar+ZbmwtzinCXcn
	6Rvm3dLrspB8Fv2SblPmxnveOxq78fiSX6EoYU2sZE=
X-Received: by 2002:aa7:8893:0:b0:881:b7d0:8dd5 with SMTP id d2e1a72fcca58-8a04be37f13mr8631677b3a.32.1792483640888;
        Tue, 20 Oct 2026 01:07:20 -0700 (PDT)
Received: from rigel.home.arpa (194-223-74-160.tpgi.com.au. [194.223.74.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f58017244sm4571984b3a.47.2026.10.20.01.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 01:07:20 -0700 (PDT)
From: Kent Gibson <warthog618@gmail.com>
To: brgl@kernel.org,
	linusw@kernel.org
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kent Gibson <warthog618@gmail.com>
Subject: [PATCH] gpio: cdev: remove redundant direction check in linehandle set values
Date: Tue, 20 Oct 2026 16:06:46 +0800
Message-ID: <20261020080646.45985-1-warthog618@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 92ac7de3175e ("gpiolib: don't allow setting values on input
lines"), direction checking is performed by gpiolib core code.
As part of that patch, the now redundant check was removed from uAPI v2
linereq_set_values(), but the corresponding check in uAPI v1 linehandle
set values was left. Remove it.

Signed-off-by: Kent Gibson <warthog618@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 6dc01f7ea838..bc1b45f50892 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -234,13 +234,6 @@ static long linehandle_ioctl(struct file *file, unsigned int cmd,
 
 		return 0;
 	case GPIOHANDLE_SET_LINE_VALUES_IOCTL:
-		/*
-		 * All line descriptors were created at once with the same
-		 * flags so just check if the first one is really output.
-		 */
-		if (!test_bit(GPIOD_FLAG_IS_OUT, &lh->descs[0]->flags))
-			return -EPERM;
-
 		if (copy_from_user(&ghd, ip, sizeof(ghd)))
 			return -EFAULT;
 

base-commit: 47f16cf7a6017212230985f6bc7f1b55b6d234d9
-- 
2.56.0

