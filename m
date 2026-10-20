Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792456667;
	b=X88UL/GDtbF0077/thjhD/XmTPgRKJZBKnEfta58HvJuVw9ZiMX0VAwyzo3XRle5iTmK
	 XLCy8mBQGIWNONnvsXvoP9VFABswah9hbrziCUEQQ8KuqlONK8i38pNTddTNuwJhHEoGD
	 ZB0H02Hy9i+E+aFuGjijGxj2vslEonak1I63dEeM6oz0LaHAP83i++BkrRhmrsPwX2gTg
	 DtsTwWt7uRaComchSbpLxB86UXOGTirkvcAlugdpylxf5AXnN1F9bZoR6wJH9aBmkcvcJ
	 NC4rSCF3zSbsSNXa/yetx8E/zRJ1DHLuGTBhO92mBV6q4ALdKqSR6LK9ELXXdfazq8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792456667;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Zb7TV/Viao8d4JraUMHrWOJ6tZ11rzWUOsA3pX0yrpM=;
	b=oaz8J3B/Yv1iNYEle7NBgj2MFQdCN+ia9sP305Dj/I1+6Qp22oCNF53g3L3a1R7uATFh
	 0hXP0wD/rbF1dtL21qI3VgKpG7ixuZz828kjRVQkB8EZg6mi8KjD00cX7IKXJFYEXY7U6
	 614nY3o24EydjuGLuKpnf9k3c0qofkIxAvQe96+ab4n3hetfTYWwzmQWH9owWBxhTPyQY
	 us085/p5AkQYbmZ3+FH1Ctwm+9tNiPdAgUrWXTZJNryqSJgyFdBP9Bdov11Z2/gqYVbV5
	 Ska60gpz/aw1yJWtTpcQEvEt8zgj7afULoQ0mBno0lMmaS5YDnP7AJUjW8G55LsQZpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VvP52j9p;
	arc=none smtp.remote-ip=209.85.210.50
Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D99606A326
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 00:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59D99606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VvP52j9p
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-82109f51565so1095705a34.2
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 17:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792456666; x=1793061466; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zb7TV/Viao8d4JraUMHrWOJ6tZ11rzWUOsA3pX0yrpM=;
        b=VvP52j9po5Yc56WnXExdCtmahvpqzThGqgLwDCsfd95Lvrx6tcxm9p9ZAQvOY9Xodo
         lLRNV3+R9C92nCaJx5nZDymKskomfsdgs58giJ3GCNdffjillk9QCXddNYT/wtpuvz0q
         WzSm2CnxQohYY4W2bGVA/T6nCGIh+I3r5JWbTJYbz/5+GZLfhQ+21wHW8t4DqB+fQCWM
         gDEePz3d4bpB/1HGHD2Dmst8cOACp6wkrijcjR+QVGt3CQYthr7e2fS5oUSYAgyPVRV0
         WFMRswryktXTSxlNBtnPyOwFXxMpCTYo352+eo5lGBfEg1LHJmBl4uPnkrEIYGI/OX+c
         y9GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792456666; x=1793061466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zb7TV/Viao8d4JraUMHrWOJ6tZ11rzWUOsA3pX0yrpM=;
        b=lVB3VTT9066LOje5N/VfE/iq5+oxYybqCBPc1bNrm7OEx7KyFvtcyNhsiq69y0bRJJ
         7j5GwhV/B50lqXN6RY2KzCpYZjgaYBjcK+IyqzHFJWwDvbS5egZ5pJuXzIcH623GAsck
         zy3rMg8YBghwhVyCXSdzp4hZ/k9dqxrhsW0JMd5IIEz5bNhslolyZOn3/5OKuua+Okru
         bn9i/r1vbkXF4nlH4pkg+UL1vNY9lKA1mbYNVacMSSZz+CNXxz6VFphIE7gXF7w/7DWu
         vec+03VDF9DqFcO1HWFh3Oqg68tHO9I1T/7ZWMyUeflnYsn0esuuRgsAP99pLcnH5Vqt
         o3hw==
X-Gm-Message-State: AFq9FYJTRWK9xaaC9EQYRIB7aO8QliRJn2lrAoIWiIzgoJrf5EUcCwTQ
	nj+XZWt03pbeSGhygYezUGO3IxLCbwyibIPCCvOQH9yVop8OEo7YrGokRthMKA==
X-Gm-Gg: AYBFou0aVlp6ftm7G20KVesPA45pI39XQ992TLFwOjKGsnaxsEoi9Iu8zmRTOrvt3+V
	tp7AxAVvEyrScgxJPYRRxsDz2awzkgusvgx6DCBaNK4dcBmrXHUxoLkNiXv27YVSTjgSNRVYjGR
	ovhrrMCW+IwDKcPYAvA/7F7klHbK1grEda2vXi1w0X6RZb+6Q2Bm6FgyyMIC45uDDZylujZbzs0
	PBynUhHjlHbKBPot8CjzD1j2v3F/EJ52LMBA6sT1cVSgK4nIvw/vs2QDJW2U+MWMazy8ODq+j99
	r+FdGKFQ+zldW8LB2AyjY58uAg8BM96r9YnN1ZGRX3wt1G0xbVTEwwPXKM2lAvm1wjvsO2xI1F+
	80c5Bmv03uHrloBktNLPJKDDjAED5Xkzyard/j297vefW6u8wCKKafP4JWjxJYAK/9hUwN5VuhX
	ySNqjcBV76C7lCxaw5HT/3lRkx0bTbmtyPVVtbWhpv8hyRaW2PJHuwXJCBXCpms0qEUymivHZ+5
	gpD6jGa/d0Ol+FOF7o4QtdgXBLLhfshoVCP
X-Received: by 2002:a05:6830:7309:b0:829:8a9b:de79 with SMTP id 46e09a7af769-844f9a8b6f4mr9090296a34.4.1792456666285;
        Mon, 19 Oct 2026 17:37:46 -0700 (PDT)
Received: from Zephyrus.localdomain ([66.188.87.142])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm10373383a34.0.2026.10.19.17.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:37:41 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 02/14] bindings: python: _internal: simplify poll_fd calculation
Date: Mon, 19 Oct 2026 19:37:16 -0500
Message-ID: <20261020003728.13669-3-vfazio@gmail.com>
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

The `True if <> else False` ternary is unnecessary and the return value
can be simplified to the bool result of checking if the file descriptor
is in the list returned from `select`.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/gpiod/_internal.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/python/gpiod/_internal.py b/bindings/python/gpiod/_internal.py
index 6ff5b97..a4c997d 100644
--- a/bindings/python/gpiod/_internal.py
+++ b/bindings/python/gpiod/_internal.py
@@ -23,7 +23,7 @@ def poll_fd(fd: int, timeout: timedelta | float | None = None) -> bool:
         sec = timeout
 
     readable, _, _ = select([fd], [], [], sec)
-    return True if fd in readable else False
+    return fd in readable
 
 
 def config_iter(
-- 
2.43.0

