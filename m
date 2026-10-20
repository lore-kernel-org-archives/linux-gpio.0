Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792456676;
	b=GamQJRV/d0iSmQ+TNQtI8qQavQ2H2c9mpzL3bA/Hzy8XwyONCQvL323yIzp9TRFIhfRz
	 X0VDYehifHBHKwRwmMEcG4Om/ek7w14EXkq/4f2e17kztFf+B7lv9ffiDVqoMawYWKEH5
	 BOr4DPAVunsMcngJmKh/9BhCGiQgkhmP4J0sTezzJNDmms5BYxJIh1Xd4lzD055BFDANX
	 ETKQJLOP3/CxAB+anLc2bsC5QSzRRZ0Nw176ZxBWp0YpwU20JxSxAbt4H9ssfT0Bw+ii5
	 4gF6O4zrapHU7YrTrTdyjtcXS1Onq5rc+74JN4MpPdccl4ZSYYvGh4StDkB63hTMGWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792456676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=V09IXa2Ktn7fihVXeQFZD+DPn6rJTgneo/lQ/XYGFuw=;
	b=orl6iPT/aoQP1mDTmqX6myrm75mdum5REyPFC/Ag+aRaHIJUPMsFyBRLHVTtWR85TaDG
	 b5X/Pkk6xeN6WweQPMfI+JD6vryufmzhg7gGNTDpf2w8dzvGAoBXvFCeAqmD/sdGET3dL
	 ZS3/vVQHzblRjuEMQjPZYxighPvrvjw+auIMcDlVaPH07YaGSnpbmtLH2/UEgZtpSjZCi
	 Z7JsJ7kyXtvNpSKTvDIsOj/AZ5sK3KG+ks2sbaIoP52QpNCxdLzPo0QLVTVBn6wfokdgT
	 RmjhtV4uRiiZj+GA6Xuqfsn8PukurVGWiU+htJGcRcV6QW8CFIAMzM56IdbpkGQzFEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dyKwCh1F;
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38117606A31D
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 00:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38117606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dyKwCh1F
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-8470d7d430fso935340a34.3
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 17:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792456675; x=1793061475; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V09IXa2Ktn7fihVXeQFZD+DPn6rJTgneo/lQ/XYGFuw=;
        b=dyKwCh1FzcdxphGlBbj3j0tTLkxh3vsj3pD7cnfMnP12N6Kc60zGq1cpkCBVoSZXiN
         dUvotDzo1F/MvS2h+w0/Dlj3qPcv0z6YZmOnLvnbdOrD+JkjDNdld2YjNTxqbtGBEuUM
         LiSvzEEpc5dExrXTdC8fD/ilWlYj8MJ/Cpbp2Wujr5aoOOEICG53+m6/hWhMSnBmx/se
         hFI0R0jHYz1OyGxpw1MIzoBOtLBCFSXjswRCeN1j2lJPFf3o4N4El9P4g3q4AatIL3rb
         brQzyBGFnPaY+qz8WBb/OotK6ch2UuI3wEPhp956kU+eGEr5LKR6tXvy/RDfpgRAIYiQ
         A+mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792456675; x=1793061475;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=V09IXa2Ktn7fihVXeQFZD+DPn6rJTgneo/lQ/XYGFuw=;
        b=afvaY2LH+MqxJ/sGBxfDhp9PoT2Onp/eyaPs0jHEmH062CFUtDbZwmgJhqRjHJ3QbL
         bLxkXhChr9IQD/BuSZ47T5difFeVNKl1hx2ja+JH/j9IV7uQo9roHaYmfvEeV5iX8PlJ
         86wHoHPRFGvHNapyf8yrUsQ4hJduuWlLa6TIfiPyPkGNYhGaNujb7+rUq+k0fbRPeufg
         d/RERfBEX5muUs4hICKiiVY1arPkeuzHCo9c5gFrmYTbeFKH/hMDiYns9/a/E5AOe0An
         BQ/MNUqYRzNOtCh3C1K/ChPOwdymKgQJlK/kG+0/btYS7uP0rm357BsLdXIcp1Ra2QqF
         MYYw==
X-Gm-Message-State: AFq9FYIwAW/AqB88OEJYFrEKzhIaiFj9Q9FwSbPYxP9sGtI9XZaalqMC
	xx7N8JjB85ON9uyIf12E0yEAeXGojXQ+0wn1nB4Bif4cSWrrdMPjfnxHhkNdKg==
X-Gm-Gg: AYBFou0w67GldwftCRnmUmbd6jft4AQlbqsq4J/R7V5J6+wI0XjW9Lkl0inhMdVOCDt
	EacQjiAoQft7/yTHwJUCVGU3bnSeXrQKwjfhToUu3u3oXsY0RJVFf99Hm8hD+AkOgRo/K4WLsf7
	ehFmv1fdppZvr4I5muwkMLUAVHtPGvmwIDIOWm/DTln9sL2zwjVlqc+xDRbbqIcFFjIvexpoGZ0
	OADQtzUeZ/nWnz8zAgtOCJir0f6dNSP/aCi9HGu4/uCciuIWxucfJtYOQHaxfBW3J7va/Ek+bEp
	dBg7h93un9uyyxj7PhKtFw68JgA8HD/2TKlGHRkYy4DHSo6PI/82Copk+Ynlzvd3YEXV2W/lEJs
	rxe+qXSRJxMPl35r1eaTfBI4I+EOAvMkH2tYWWSrb6EH4vxhhpeLQuiXovrYJEYDObrzC6HKwYx
	8BXuld7FcJ88QpzhPfIukVuAFglI4EU4W+IxYSJZH3TYGEB2c6fR2W34k2zoXPSSYyhY+vAUEnI
	ijfU7WSkfwpSollWHb4+G4PullFOVCoMzIZ
X-Received: by 2002:a05:6830:719c:b0:81f:92c9:1f80 with SMTP id 46e09a7af769-844ffcda39emr8587401a34.16.1792456675212;
        Mon, 19 Oct 2026 17:37:55 -0700 (PDT)
Received: from Zephyrus.localdomain ([66.188.87.142])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm10373383a34.0.2026.10.19.17.37.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:37:53 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 05/14] bindings: python: line: sort exports
Date: Mon, 19 Oct 2026 19:37:19 -0500
Message-ID: <20261020003728.13669-6-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020003728.13669-1-vfazio@gmail.com>
References: <20261020003728.13669-1-vfazio@gmail.com>
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

Ensures the exports in __all__ are sorted alphabetically.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/gpiod/line.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/python/gpiod/line.py b/bindings/python/gpiod/line.py
index 0cfc854..47961be 100644
--- a/bindings/python/gpiod/line.py
+++ b/bindings/python/gpiod/line.py
@@ -6,7 +6,7 @@ from enum import Enum
 
 from . import _ext
 
-__all__ = ["Value", "Direction", "Bias", "Drive", "Edge", "Clock"]
+__all__ = ["Bias", "Clock", "Direction", "Drive", "Edge", "Value"]
 
 
 class Value(Enum):
-- 
2.43.0

