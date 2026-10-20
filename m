Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792456678;
	b=Cy8e2jLvYkxqgTGsHnSEX9vANIsnDLRKdmORl27KHJhGz7jgcM0oqRseyRdv8R7pby99
	 I9lAZc6lNU8Bs3mPEKP65bz8F7butu91nUvfiPGzHgP/Jxeeg1vtLx6W1L4aTe+0UVdd8
	 UHjfyu0kzj3j0J2gw8gB5OLAbJOQUrloqCnlTFEmAPNuNGE3rX1H9utXDnLvhq3vZI4Gn
	 9eg+7Gb1cUo0uS0fj2RhQ7PJ2RZ2i0ii7RcEX7M4sSmkZbA4xLA/yKwW6p3yaF41DoR5D
	 jYbflrE/kXG+61crfY/expMFOd/N0AZuLGgOCQ9FEIZnksXnWFF0Kr3aIKoaoBvQPMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792456678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=laTgXEreyYzyPi2jGw+N3FMI54r7/RWeo4kPfmlcmG4=;
	b=UTMsi3Ug3wS3unDrJhMaGHfyGYdzAwOX446IuimQkrPh0WqwbMKAQeGy2B28C+VHWBAb
	 J0y9EmAKrsFP4k6GJkL8RUZmgJktUxAjryi9mgK7XA7BI5/ExOryA9Xcg6QZ4vRXvddlJ
	 +Cfet5UmlkclOadBQLdiKt9tUzwSGtMZZQHiBcVhGjqSnra2iimO3xsVaETs8PjMRxIK6
	 JNLBv2BWSAoCZEVC4l+82kV+wiyGLpoAKPSB13bzy4ji5jsE3hXpEU0IJ9OO0loYnBexm
	 1x8yyCemIG1o+r86ddeXZnYSc8uQTK3p3MUQHpeO74kzK89yVAt6yMMs0QV2MfSsxoQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b="kwfQi3//";
	arc=none smtp.remote-ip=209.85.210.51
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD557606A327
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 00:37:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD557606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=kwfQi3//
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-8479f46ecd8so1000376a34.0
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 17:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792456677; x=1793061477; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=laTgXEreyYzyPi2jGw+N3FMI54r7/RWeo4kPfmlcmG4=;
        b=kwfQi3//DzyTNubI7sNNQPojt38pme9hcKHn+P7+1hmniT1vTf7I9tG/b5LdeecUdG
         c/9z6m1ClqVh4VVTWr23FRm7dAxORGigAdipQgGsHRnS1JR5jQ6Y1syYlKof01GMNUeY
         nSszXxBFhngbMviFeTjFs7Tu4fA0QYRsipZGG40vCQP3uPapRgygHlnY4l1Sr5UO92xW
         zyWp/Knj3LiPTmhes7n8X943F/gwRlG27Nigi6StiKN2ZauebvJEUST6jpUJTdxsXZR4
         qpQfK9J+BRLEosiWg4KpsnW7USBbgfV5CwSDR/ZJXHi7Av1Xo4tQ+qw76DbDz1Z3gFKc
         p6Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792456677; x=1793061477;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=laTgXEreyYzyPi2jGw+N3FMI54r7/RWeo4kPfmlcmG4=;
        b=FRBOqCEfvIH4BHE2w8cFJlJPzL+0FbiJ//udf2/YO8+5lsfLEbXVRdRkobiuQIl1qB
         QneBedVOIw1vJLm/t6BzciZ6o/K2IaTXzOxntiJzITyevYhDMBM9ScnYTjOn0tMu8YDI
         qznuhwYh5PyxrD3C1rbQWnKvjudrhhDeNI7dfjFEb9yH/bQ/8F4PlOZ/L6+kuj5LCEvr
         49WvqTj+xPWp4FDZ783zve1Wv71sPKV9bAh01ZLYaB4r8s9eC1f96C8kWuBeX8r7Kkxj
         fZCEtDF5zl7k3CxD8rdnbKm96uEQznM48RmwSdEU+FbP6bgpHfQ2ExgnQyPCv5lfGZzX
         JPGQ==
X-Gm-Message-State: AFq9FYLDtz/JThL8sitFl1fR6/Tw9SGkGO/4zXg6ICBKw8FOVVEl6eBF
	6lHS8Z5Jhqr5q9JpaiCxkdw2Oawc/srSiHwBALkeurjyVSQ11BBv6cdL2MGK4w==
X-Gm-Gg: AYBFou0l/pYnnskxZTZbDsjqB5+0vEm36JMwGU8vSxDsMOzC2Q8v4fArVkmOL0oFmxv
	XEvhSGPLPIQqWoAV42n3c7anZCxEwwdpKC4rghUXnRrlj7MIr2gTuKhHdCL/NPb+i8AYWiX7oxw
	T9O4IPL7y4uNgs5S1StcGhpLyP8gecfOujokxq+bTw24CVy7QAhR9Gmzsnod07fNfKZfD1OEsn4
	om9SNFjSXVUXrWcC1DymrsWUCs0+OYKjMOZCLrgwe1CPpBgOlEmGtGH63UTvg4dKZsz4wevNdIv
	B8mkiE8jFHw7qub1TCC4ksbVAILId9pdJ/9lRMc20i2Dgmhf6qlZepUN37HpatuKKyvN+HBPM4o
	QK4phVTOYXixBiVwZAwq7I/VYYB4sCwpvZl93BvfSkksdDCPLrCKpdS2t+FZuiRVqwpn7HQZmQO
	TG+gpiHalivcxmlM2PXXiYrI6r3anDKDwJZZh3U0fA0fBIQswkWXgFSiewOKwAuIOsHbwM+TfZy
	0tgHGuku6JIfMSemaKr2G+2SndbjqrC/roN
X-Received: by 2002:a05:6830:83b4:b0:81f:acdd:bd05 with SMTP id 46e09a7af769-84500f547bamr9474365a34.21.1792456676898;
        Mon, 19 Oct 2026 17:37:56 -0700 (PDT)
Received: from Zephyrus.localdomain ([66.188.87.142])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm10373383a34.0.2026.10.19.17.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:37:55 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 06/14] bindings: python: line_request: simplify __bool__ expression
Date: Mon, 19 Oct 2026 19:37:20 -0500
Message-ID: <20261020003728.13669-7-vfazio@gmail.com>
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
can be simplified to the bool result of checking if the request object
is not `None`.

The underlying `Request` object does not have an explicit `__bool__`
implementation so the check only proved that the object existed which
is preserved.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/gpiod/line_request.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/python/gpiod/line_request.py b/bindings/python/gpiod/line_request.py
index dc7cd22..077bcc2 100644
--- a/bindings/python/gpiod/line_request.py
+++ b/bindings/python/gpiod/line_request.py
@@ -49,7 +49,7 @@ class LineRequest:
         Returns:
           True if the request is live and False if it's been released.
         """
-        return True if self._req else False
+        return self._req is not None
 
     def __enter__(self) -> LineRequest:
         """
-- 
2.43.0

