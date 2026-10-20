Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792456681;
	b=2pqq8ZHHc/IY1UudWcaNyK0u0y2ryupcVZ3ugnRaPXUYxdE6xphfD7hcYK4lIlM47O+D
	 YwKv3NR0RH+F5yeH9x3TxmDi+D1A4a9bZ8Wxlj1VPcU+MZZs32Cdlx3Ql9RfvW7Y1NdLE
	 NGsiw9AGzrpK4gNs5Ny0D9OobZj9H6spsHpMDA09lvTMTt8vfuGO7WUIsgRkfvwJrG5GO
	 tw77svUd5QJO4Mx7e9E+y2h4rRZtCSYeynHNhDkk7eN/KUEPktNOqSUyLQkJi5D6aTWnx
	 Nit+/kpYJNGGvjllyB9usia38PXX8a3+JbpN38MeDTwq9F/U4jN4hbyluMKhT95en2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792456681;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=toZr5pd5MYeJ2Mcro4Zsbvh7V9IfGmiMx4M0AAUZIxU=;
	b=RUDNxpkJRUvOhVBCAnXU+9E5NsCeaDfLABE1AXUE4hcawbzH4RHag/e6r3n0XbvIRe1u
	 ZyUXeBiVfG29pMcQpksZass6bilugM+4WrsrvGt2Uh6PhjcSaS/Rue+5LFaY83Bomm+pE
	 gN1aT5VWwjkBneYXKUIm7s4cHymdRCJavkKoYs3ytx8Mg7SzmTulmI9K67emtTx/WGxPR
	 xbH2E5EXdBJ2v9X3lHMYcG2rjcPz+FqloQ0vi8xZ4spcgK/RyvBe2vu0UA2cI+FsgHUQQ
	 LWmIFQFIQjXyxWHzxIxWIu+DpcNVXgeDl2YrAcrR3NZ1JI11esT1KdRjpZux7bXAhzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XFQzGMcv;
	arc=none smtp.remote-ip=209.85.210.48
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8655C606A31C
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 00:38:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8655C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=XFQzGMcv
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7f432ac553fso1962107a34.3
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 17:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792456680; x=1793061480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=toZr5pd5MYeJ2Mcro4Zsbvh7V9IfGmiMx4M0AAUZIxU=;
        b=XFQzGMcvc2gYG/reDKTf6b5J5qknEr7i8XCCqJkSPcqcvvq/CJQiVkFqDXXNt//Rg8
         AuyjxbrnrJU7gJN1jj5mjIGpofWerMtzMY10qp3tPSqMb+a8pX05e2x0aFhQqgqEmGFL
         EhiR5X6lT6Dkw3eLItAHrx+VVq07fOX0nvigpBVV0vTJTLAU2dp+Gaj1+enQIe1DPcLy
         iOpWv0myW4s2GoBUHy+JBKLj3ofCxXI94RPwrOjfT9uH3MMP9kmTpA9oSnseeUEDaXom
         ftWYNdo2EXU5Rin7CBVo7KF1MgYL11DefTb8ddzdtBOsOFJ75+H9bmbPLoQA9STsvqT5
         jtzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792456680; x=1793061480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=toZr5pd5MYeJ2Mcro4Zsbvh7V9IfGmiMx4M0AAUZIxU=;
        b=qH/50Y8zLHIDNW9U/fZH+3moMm5OOuZzDhUVLALL9BoZWx6zzMEqJjauMxu3GmUGVS
         3PKbr23QyTRsi6meoF0c5QT1HlNRhUrHfK2u1lk7Q8uvnyF1uEC/aytLK7wDVR5lvxAF
         9cvwlsV1oWF0BrKVlvqDr8OSqFFgKjCeVUFi0scQGFv6sh8uF+M64X4Y+eRD4AGhDpBF
         xCi45mgKWMBcss6DYPFyT+ywHZgUnvP7SpnkweIx73Bwpa5reIxFbF9mex26X9pqKyPL
         MA0jZ4CQJcqx+UINVxGmJlYXk2PUo0SymzMKwo3ho/CsNrpxnu8c9moh6iiF1vxV676y
         1eJg==
X-Gm-Message-State: AFq9FYJW7Uw/2FNDy721ufKnE0tw7GonsxSkKjHM7E4Psn8JBk5IGpPc
	HMuyY9VBigS0L8OlByb0OAFUM0icamn5VjSyGRLKtrb/9w/icJ6neRZsH6HuZQ==
X-Gm-Gg: AYBFou2XJ6lW9mgO47gO8FMR4pE8TUnmXDLKhexx887EEFeuGlUwGdimMiLR/logUmk
	CVwFVWchImgnIUScqA2spqf/nWXOGf56K6szGeEVcrA1VkB0917Oz0yXleROOdmkYxzN8/ZlQ6r
	fTEk2he6v78AeXVOOLP+Z7TPE6KZdR4CniqymqC1VNUIDI2lFpxnUWHL43rJD8Chgg5o3n00ITO
	YEBj2vjCsfK8NEZdIJFDh7MV+8i5J2svbdo/LeEPcqR4z6K9wxVAzNQSJQsF+10/iDCttC9MDoc
	WCTOXtZj4YyFeK3AXWISv2oTE3eAi3/orLwgdXajXPWx/rh+4b3LsGBZ2fxLMb0ssSJxXRtCv4Z
	4Au/lu31BJFnvZdpjzMgUPlmCWn2a83S3Skz7WM5yyBgbpH9FBoLe+6mtwkp1ksV5XihFdOumsM
	1Qx48bV2XU2Y1zY4lb5TqmcY92+kRyImWbz5HX0+0ZyfXwZeiWzxR+BgOg1NtlN94BPj1cz0bBV
	YwP8kI/0607GIzlYu0vDmYa/TNzun7E3j3P
X-Received: by 2002:a05:6830:648c:b0:80c:d30f:97b with SMTP id 46e09a7af769-845013408admr8440595a34.28.1792456680524;
        Mon, 19 Oct 2026 17:38:00 -0700 (PDT)
Received: from Zephyrus.localdomain ([66.188.87.142])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm10373383a34.0.2026.10.19.17.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:37:57 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 07/14] bindings: python: chip: simplify __bool__ expression
Date: Mon, 19 Oct 2026 19:37:21 -0500
Message-ID: <20261020003728.13669-8-vfazio@gmail.com>
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
can be simplified to the bool result of checking if the chip object
is not `None`.

The underlying `Chip` object does not have an explicit `__bool__`
implementation so the check only proved that the object existed which
is preserved.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/gpiod/chip.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index 2acb872..229891f 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -73,7 +73,7 @@ class Chip:
         Returns:
           True if the chip is open and False if it's closed.
         """
-        return True if self._chip else False
+        return self._chip is not None
 
     def __enter__(self) -> Chip:
         """
-- 
2.43.0

