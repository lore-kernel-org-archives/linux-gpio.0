Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792456685;
	b=EziklRYJdk4LhyZaKs6/KOpkJRK+6eUx/214dPn1jW6qTgwdXut4X0FoIqcVi+MvBUMk
	 AbSiBvZmADYzXdwaCgWt+drcQzym1aGXbcHdGFpJR8oq0F9Ljzj3ClpPIkkiwLIRvZL6u
	 dGo+CJmUbdVRiAh2niEI9ovOAMFtwfx3uS8QPeDymZK/Keh0e9W2Rr0VlBemNWUchMnk/
	 XOmPj0UIwl5R28Zk/Wq4f5ZaGqbKvIfX7LXLLRFaKEILZ8bbexZm6R1PrLmSHXgvc76EW
	 mdxbtoXGsjN+sZrbMwez6UHvfxewwpvb8e3LyyaYW8lEzhJa3X0qBWdQ8/gdk6KaoPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792456685;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=dRHoyo0nFFq4VRpxejhdLO8c01cfqDGnfJcw3QA6rAA=;
	b=ATucszVudnPU0pZxZx3n3uNljKcN53iloCMJOxGwWvj4O4MylT736B/8NfdVpPEq4pch
	 BSzgJwm0XJ2jllgk3W3/QLMsoj3voOY0DOu9S1y+4BTp3BAfllqOYnlSF+ZaOvaBvq4d2
	 d7ZcHkrABjZRTGUw0NS/5hUur9ljBLP8c0UF/cKclmcgl4+wmhlToyBz3oHibakooeujH
	 ZbfCTf+dzd/73WlrGYpCPyPm4BYKNw1cNB4z9++I78zoxL/wDRmYYbm4ViksUq40M/TZL
	 lCkAWPgxxrOamGxpzO9G2a4Wr/AiKahxOnWmhL/EauOIy2vR/IuFkG2XSSAp+H7trzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jsOGDxXM;
	arc=none smtp.remote-ip=209.85.210.46
Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC29606A31E
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 00:38:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CDC29606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=jsOGDxXM
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-83bbcfba0ffso1277639a34.0
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 17:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792456683; x=1793061483; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dRHoyo0nFFq4VRpxejhdLO8c01cfqDGnfJcw3QA6rAA=;
        b=jsOGDxXMs314x476d0vL/mzsDxMFKrdHcMWRkroi5yOSpT251E1Nqfwh7FtXza+IZ4
         uSGI3mbeEHWMmfGYaVa+btij4H/uBMTOVxR8M3NGjVwVhYxMnWtVwr7sjLD4iwCTnR1Z
         DLdDMR8lUeu8MW2/1ocoG+8GQk/Tfb+Zyk9EEGqMlPAj+kGVpW8dOPVJ6BmeNAxmFB5b
         pKShCHlYZmHygGfKdhRAqOolH/pyQskyn/creFU7nkK1wDAMFF0WvnZ6NOGpJSRUMWXo
         pzXvTl0/8xEKd8Mx52wQj6GXO4V5qnerq+/5DT9clW4Ay9HJhVKUto25LUHoPssZL0WU
         DhGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792456683; x=1793061483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dRHoyo0nFFq4VRpxejhdLO8c01cfqDGnfJcw3QA6rAA=;
        b=ph62PRuVa2l8X+jfv4lPX+GEnyz+dTnyHNzhFrJn8LrrP9dK+iY8yWA+PppOGnSS1d
         hU6BWyHQKUKLxkdGzp10B2WhACFn76o9l1DY61HllMCZi51qjTAPYOvrEJYlWU7Kscxa
         kO6y7GBMWaZCcM7KKQpboT4TTlZsD3O3hDtcCHoHEMhl2jD0AfH3RZQhQ7+0wpLAzo8N
         RlmsfREaX6QuVZ1THgGjolOWLOJkv4uUKZKCI1XNwFpYSMBpPMC1MRGo63rwC29wN2uN
         vpt5qLeMMPGPFlgMqsX6lDJV9lCe5aqmsu/gc4tU22HPUIXrnejOD4KK5TqyfQRh0zw6
         joWw==
X-Gm-Message-State: AFq9FYLLcdRcqbA79XA9LKOtnaZ/I+hTaC/i75x15/n4DlzQ5CsfQZWh
	KiX73iTwWG3OWCOwl2IlbjKkU6GYih4moc/u57FHbCj2TcuET5OWyT4UdDa9JQ==
X-Gm-Gg: AYBFou3WTOmdlRWWYuYv8FjDheeGerml8MQZyk+h+JArvNnff6ZEHjJjXV3gk72jBFj
	fSZySHa8qR+6z8lREUxhGHCjmt1PzuWJmeF/+7G8178mdWuLXmbW5Y3KS65AHNbN8pNd0dw80M5
	nTibXp57HJkUmesDwajZY6LlXpY+K7tQHhlTGHPQ1L0JP2RuZTbZEImuiKDL+SFRSq9P80Vv+XW
	Y4+4s9dEu1t6bcgE3bz2FsGPk+FYQPav9JJi4fozKoCG2vSYbbbddN9Po2hjNzM5PBdc7wHSF0/
	1V+aClvcP3m2XVZgFJAnY6C9vvew6Z51f33o0VcnNpG27DUoZkW+FraNW94mcgUucQusmt2ELdo
	1etre1H34ZvXZ/oYI+cs/BgKGR3ir7A8d7Qqwg4zQeUZhcF8DKSzN1i3DqMywPgMAQuhhxmPySA
	kBbOMi0lI8yCqfpJoVvXl6+q+bc5rKMNCx9sN4k2/PUY+nWmkc6/FCQ7JVNebPBya2Whuvab3a+
	xJpDA83w5zRzSn/vyh+dXbg1r8e2vQRBMAG
X-Received: by 2002:a05:6830:3889:b0:822:a76e:95a3 with SMTP id 46e09a7af769-844f3d48a48mr8998749a34.0.1792456683605;
        Mon, 19 Oct 2026 17:38:03 -0700 (PDT)
Received: from Zephyrus.localdomain ([66.188.87.142])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm10373383a34.0.2026.10.19.17.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:38:01 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 08/14] bindings: python: chip: drop redundant exception in reraise
Date: Mon, 19 Oct 2026 19:37:22 -0500
Message-ID: <20261020003728.13669-9-vfazio@gmail.com>
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

When re-raising an exception, it is not necessary to respecify the
exception object.

There is no functional change here; just minor cleanup to squelch new
linter warnings.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/gpiod/chip.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index 229891f..8712b2b 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -149,7 +149,7 @@ class Chip:
                     except ValueError:
                         raise ex
                 else:
-                    raise ex
+                    raise
         else:
             offset = id
 
-- 
2.43.0

