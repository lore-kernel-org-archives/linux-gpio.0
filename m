Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792456662;
	b=3ajg7NCRJxkF8PaPLfrWdd11ZD+QuTKXMeR/90KHRhMvt0jSvyeBMt1ex02ciFfRx5IJ
	 phaG9n1JzmZ4SWwrvH2TWR+z4ufzTMzF10t5JDPli6YPGEkke0oBNeGBG1PAxIYRKFlBg
	 BMfkomxghfkeiwfbXBPOAfkTaavfwOT8LL8z54uB+LpXQw82Zh79JfoCqBYn7e7EM2YYQ
	 qxc/K4q22B1ay2cCA0S7bEmrwtnFj5aqqpcRykTlgF6aWZi0KHWqnu9HbiEOz/BlO5fUV
	 2PS21MW+Tcxk+AhcGHPSr+vVW6PZf72WEyT6krXunVnfNefN+O0k8z27jf94pz1FJ7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792456662;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Zbiqa6kMau3kB/F9YIeTqT1RRHFKebQqqLzq3NNQkyo=;
	b=nHzvX55A5m9u3bJamuGieiMgc4k2g3i3AQyi841xdLLImtIFUMZp7X4y1Ob7hQ2ItwqI
	 GuDPYHEQl1n79M05xNEMM9G+mRLm+x2RKwe30ku1zHiSvf1Sz5/hess4mYxHZojfK55Ka
	 ByKM46Cnmv2190sv/vYyKyGyXpvPfTK43p+/u0zNSXiAcGacZ+3lmOYXYyaGvs/PQiY6T
	 MQ3xjrl6JjZVPF04cAB06RrhdIvDsd/gh+bS5E+TK1OLEhM7LpNq0OuGSTHBRi9NMhZZD
	 dL3eFjmErW8GjkYhk5gNKsRpVwJR1lBccMRz7bgDbKpdvxC5A18fKFWG//wMqVpvRUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="O/HKjnqd";
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4965606A31A
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 00:37:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4965606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=O/HKjnqd
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-8439fe796ebso1592302a34.3
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 17:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792456661; x=1793061461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zbiqa6kMau3kB/F9YIeTqT1RRHFKebQqqLzq3NNQkyo=;
        b=O/HKjnqdhDGcpBtQ+iGr5lCoEJpGIITQPA2DbWk4oClFspQojMXgt501VidRntaHil
         2McWMD1rEh4IANnNTdKGew14xnyPT/wDYL/cd/V8bcUgg5nI9k0YMKPTTFEBO9kqgwR6
         KQN7j52l9YqTPLi+D8ooBezpI9DgEqcHwixYo471bbhwNsoDslBXdWEp+gF9c32d1/rt
         lqECf6PCRVDv/P3l/ASwyuUFo9iFUIofNII2mIBkb/8sBrJDVi0zy7K5yCLklvjRUoLl
         09JiK12jROM/XA9XaIHLaB3BAop0elVH+b2dWL08XU9WvrFvmHVjE2ImUBGWdmYzmgKR
         LN8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792456661; x=1793061461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zbiqa6kMau3kB/F9YIeTqT1RRHFKebQqqLzq3NNQkyo=;
        b=htMY2wSXSHQzacKzgn4OwYoKGYykkDx1VCe7cmSNUE8K/pViz0ZKT5Fb/ZEfGd1zKb
         RwplcK1/jfl+PzdTFj6WMJ3wiB34zevUxkcZ+K2SSolV1Vz2lMKc+/auA+vNIo+1bcjx
         WC8Q083ED+QoAHNHlqQPB7EuWm87WqqEMnN7uZh0he8VGe78Sr4V4N/QpcOvjwUg1hxc
         /69OxWigRex6scTeFd/g9WP3rhtKrXk6tJtU5uEPEOZOSMCifYwe8jHv3MdK0eWMIGum
         Bf2s412iNSLduqU+c10a4nIw21sDKtLCW2GVIdEz4wM3Rva8cMxATJgBgNdAkJcCfKSA
         cApA==
X-Gm-Message-State: AFq9FYK0Xj9oBo1ocQms+6+wgaC2EaBk8po7YQpeKhWEKuyOhM+a9v2P
	wrZOOXI4/KXFHhBttbRGkwqkOQiYX8/sUL1E6Y3I5plYJHSmvIu3WineiX0yZw==
X-Gm-Gg: AYBFou32AdTBmDs8y5vpLwyKEcy+zQW/gg9H98+OJM70HevgQQsJtTmLzj+dQ2ckK9Y
	KBqJt2WlwI0v8DUxoRDHRwa09kfuc3Lc2XYLID6+ZIA/WG44gcOh8AIUAbiN6fV2edeTT8WuZKt
	A7NcCtkn2GbXJK+ipuerC3gyhsIZ1NHS4W58vZFKBH8voMD69+q7anAaXz0JszgS3JRLAS44O7y
	ndkake6vu0I5bbDmCl6Dot5ax/zDEBFUEIOMH+zmOG8eWwHMfi6+KLj1jl6gZP7R9xdButwtaFk
	ZxKZ9pjvQaODFimt4wJoOJ+rgu5vBBMyLQBaLj+1LIVYLpKfCasLB7Nl4fci3cmXnCK6dvfjIv0
	YprVuf8lRnYfgRME9vP5HJ+HHfKSzFR1zvK1E124yscwxzSGB+7lt0k4ft+W+gokzfr1a2FSs7G
	JEDwzuUI38PyhAzmKLNgeDLtZvWJuqkLY2XBZhVDkEsUS+x9NvzoUdo8aK6kEqGHqGry9/taMC5
	J73qdBb2t4vNj5mT5vnvlxfiOUqWRo4VZAV
X-Received: by 2002:a05:6830:a216:20b0:845:3cfe:608 with SMTP id 46e09a7af769-8453cfe2af5mr5587486a34.0.1792456660757;
        Mon, 19 Oct 2026 17:37:40 -0700 (PDT)
Received: from Zephyrus.localdomain ([66.188.87.142])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm10373383a34.0.2026.10.19.17.37.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:37:39 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 01/14] bindings: python: _internal: sort exports
Date: Mon, 19 Oct 2026 19:37:15 -0500
Message-ID: <20261020003728.13669-2-vfazio@gmail.com>
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
 bindings/python/gpiod/_internal.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/python/gpiod/_internal.py b/bindings/python/gpiod/_internal.py
index b81f970..6ff5b97 100644
--- a/bindings/python/gpiod/_internal.py
+++ b/bindings/python/gpiod/_internal.py
@@ -12,7 +12,7 @@ if TYPE_CHECKING:
 
     from .line_settings import LineSettings
 
-__all__ = ["poll_fd", "config_iter"]
+__all__ = ["config_iter", "poll_fd"]
 
 
 def poll_fd(fd: int, timeout: timedelta | float | None = None) -> bool:
-- 
2.43.0

