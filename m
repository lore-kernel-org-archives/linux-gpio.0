Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68E618BBAE
	for <linux-gpio@vger.kernel.org>; Sun,  5 Jul 2026 07:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783235095; cv=none; b=VDTTqcO3WGbTSjrYtNK6GRM+TaXpHPD4VegZeWD7R/EQs7cyHBgBA47BKUxzjIQ0kL7lWzs0apeVQvbfGoF47VHiw52P/2O3RaiYYUSMCI8NQaN8fYYrX8/A9fytjujpHpYsHRpyVFsVzYRNcSypCMsKUx1x0sEizkm92uMlcOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783235095; c=relaxed/simple;
	bh=rVUEl79PoXlXUwAmZC2UErhUtKZCSu0B1xf6Wz6IFuw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Dcc3hYYJS6rw0YhhfotBGWIIRDhKoI14pQqaSgU2CdLOPrXa0AR/OsUv5h5WUvBDB9N2yqK38hbCuS+Lm3GOA6VwkDsFUFcQzx43r+22Rq10+329KRYeha+YfDSvOQhCJJGZq53bRygnIrQsphXuIOlWJ7hcifbOMmq1dVYduXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=otsbk5at; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="otsbk5at"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso1921911b3a.2
        for <linux-gpio@vger.kernel.org>; Sun, 05 Jul 2026 00:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783235094; x=1783839894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=wwuaRcvZpvE517elMjV7huVW3y2374lD/GTgCqXZOsI=;
        b=otsbk5atf66UubxH+brOs/j3GW8dAEIbsHYGvvNLRt5K2KYQuNzJOnDQ3pqigI97WU
         vhMW1pkZzU6ZEzDz/gfpTDZw/forUg2LDY4vEtqZRJxNyLqi08kmtt8enheiKEujVgSQ
         E+pHy4a7X/D6EHxVr0vFguyEGNOMwYi9vZUHTyAfyjdB5Ck8kO6s74KP3FjhEMPfxLaM
         rgpbSIW/jvEVzfDlXOujm2LYlVOnAMhVd9EXpBAvdS0EAHZPXDnUTTEHyGpPxgB4FfRe
         edKN1wTHGIwhmBUm8sHMWpBjW3/f2sJmzZIRfPnlWdxIcGff9TfGsunjz4ENmOrCHFpq
         aW+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783235094; x=1783839894;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wwuaRcvZpvE517elMjV7huVW3y2374lD/GTgCqXZOsI=;
        b=Jf01wsCoDIc8adYUuzW+coWjmPCC2CtJMLv5oQ4P4QEt3cW+QxJ3zYBEhxAyQruVzq
         0d7Sd4rpJkjkp/iecZolB3pX/xbVoiwPaZLys7y0g2mVPDm7WkRfiSocGScrtKm8bBS+
         35kjKaCVtEGkfIHb3aslmoZ9BpFk7MF7GXgkH+U5xS/nde7cnq+ZIFTTS/rV7+azxdWl
         rngtrk7y56YeE8yJiRYNzc553vqD7hC2gv5sbgDUbwrh69N4kg1ofWPFcpvSEOBKxktI
         1lCEeZKrBLU3+qDQnq3gYKbexOP6PA7UTIIDuoLWOIKm7659XVzU6rgeECIRDX1D2iTZ
         5XTg==
X-Gm-Message-State: AOJu0Yzn+bGtXPx8p2hVmZA2qnb2uKJMDwBJFRqSQb9IFwmH5zw0eO4R
	ojo5IDKBhR1YJfyKBGSiyeGYvcUJQIEPGQt6dJab7z4BOCCxr8pBa+Bze8kPNJP1cRHBwg==
X-Gm-Gg: AfdE7ckHT3oV/WCm6XF0jXDbFMRzoqJoWEOM5QH2YBdgFN9uv3QHq1aB6Gezfzdutn/
	EHEpZZqOfrXmAiSjcOEhf7/LQz6/6UU1NYJ3llg7CVxmc9NBIh2r9HVOoXiNMuFMhFeOzUyoj8C
	MYHG11GS2hwCTpCeNTySZScwDoyR5UQuzsPs1KOTFLO4y6gyQ0gpTh4+qOjBh+ZkTZNlJW9JPtB
	Lg7/fNgvEAs+6BVbSO/efVFgGZbvzrY0AZxJP4W5qhDLy+1trzIUPIzBTYOSH2k44rIwJD91tHF
	wO1+Xcqn/7HSsC1hpCVwFW3zr+wHrJKyPcGb279QBdLr0xxXqEd0IloMpnSyfpjSEudKaxO7f10
	fI/dmkFSfowtdwCfbW8AdQUnPdA0lmH7gTnXwbdpMaNvmAw0ipsaar9DicW/BdJIPk7SA4kQhBX
	lY74qzCzAqWL7ONb+scfCT
X-Received: by 2002:a05:6a00:189e:b0:847:973b:3d04 with SMTP id d2e1a72fcca58-847f6d67be4mr5897810b3a.10.1783235094116;
        Sun, 05 Jul 2026 00:04:54 -0700 (PDT)
Received: from localhost.localdomain ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6bcf03bsm2012675b3a.26.2026.07.05.00.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 00:04:53 -0700 (PDT)
From: Yuhong Cheng <ceohunk@gmail.com>
To: linusw@kernel.org,
	corbet@lwn.net
Cc: linux-gpio@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Yuhong Cheng <ceohunk@gmail.com>
Subject: [PATCH] docs: driver-api: pin-control: fix spelling of below
Date: Sun,  5 Jul 2026 15:04:22 +0800
Message-ID: <20260705070422.764-1-ceohunk@gmail.com>
X-Mailer: git-send-email 2.46.0.windows.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the spelling of 'bellow' to 'below' in the PM API section.

Signed-off-by: Yuhong Cheng <ceohunk@gmail.com>
---
 Documentation/driver-api/pin-control.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/pin-control.rst b/Documentation/driver-api/pin-control.rst
index 1f585ecca..80106e44a 100644
--- a/Documentation/driver-api/pin-control.rst
+++ b/Documentation/driver-api/pin-control.rst
@@ -1175,7 +1175,7 @@ Possible standard state names are: "default", "init", "sleep" and "idle".
   selected after the driver probe.
 
 - the ``sleep`` and ``idle`` states are for power management and can only
-  be selected with the PM API bellow.
+  be selected with the PM API below.
 
 PM interfaces
 =================
-- 
2.46.0.windows.1

