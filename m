Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792456670;
	b=Njpog+5Wj1xjrSNXHSNqdQRThm16RHlFiRw2+AzaP1mCvwEMubMCVDJG9H5jn41eBMwu
	 Mc5AWo83S0PkM5TjrSTAMnALnH51Nw9YiWSyqhncpF5fnat2ErjasWg+G02Kh+KvfjT9V
	 SogOJhrKWIkzmEJZZCp9nb48LWnzJmDAsCY+hjkL2XPNNC7LT2SfavYCOPY7hkIGf8lEk
	 V7Uamk8jjOXJ0P8qjE+RgQ3gnxdMctyRi43QUmLNX0Qbzc0zDes9ECqrhI9ITlWGtE6/6
	 vckBWYxtSksHC7WzuoxfCyPzj6hiujafw6OgVfT8tvY6f7rHrXAae8X7EBAXQrtYKKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792456670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=w7SGrSC6bMvdTB0h0kpi5vxu7txzJTVze5oFaZI0+t8=;
	b=aWanIiqiNgPk8K8YljwQZyhd9fFpivv/+6JxndsA+FMbURbJquXns/ejJjft6hzmuwNe
	 yRokJR+tsFsqc58FrFales2GpLo6KJLKZGw+f0yLy07aMFicxATOxl3fT4RT8RiR2ibj/
	 v2pX69+mqN5qkfvLLYCGMLIHVjUyPu450pOldbeBJHIRWSGbpvbqKDLMX7/Vk351zLDum
	 sDYbn1DmSqORacUNf43mpDpGExlaB9XIh9eQw5+GBlQdYT1ZA4ZQL338tRK9tdwJe7d/t
	 sBtlyBZ0ysUNQCHPvnOZeITqs7HzL5OmxmKta8XCSBdYVZ7iibsfair8PlZJHvG2cUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZgIEAjjJ;
	arc=none smtp.remote-ip=209.85.210.47
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7250A606A31F
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 00:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7250A606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=ZgIEAjjJ
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-81ba09a5d23so2343139a34.3
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 17:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792456669; x=1793061469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w7SGrSC6bMvdTB0h0kpi5vxu7txzJTVze5oFaZI0+t8=;
        b=ZgIEAjjJ57czSB740xA2B03ScB8peYgx8DhY6KIicEcsyuZZaM7IC3TeULMd3FPAv6
         ncKvJo6EqKygOUiJjq/8kBAcEiGvdVI9SNulg6+rwmpDBRvS0EJIaXqno/xvc10kgWqT
         ThhO4KY9ISQHlWPggWRzAuP41PuUJKMFgYNMbEceYGl0LNmygAgqlxXdoIiKd+GnZxLZ
         u8M/a7qhxTzOJ7avoBC0EOHA68dL+dP3O59EgChEQ2uCoxV9jLIpas9HrSAEPgpt3Cqd
         VE2mZdKoiTIrG527CMuMcrKzqQK0mJln3K4fdoqa84B4nDA+BTQT2uz1RVGBmWGOXEDx
         p8bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792456669; x=1793061469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=w7SGrSC6bMvdTB0h0kpi5vxu7txzJTVze5oFaZI0+t8=;
        b=pViLMOx3zZi2cwhuY5z39vtcCRqNeoECOjam2cwHZL8+04tCFG7v2pczBviZytrzLP
         NX0Q45h81wqzBLk2lHgEHiWLOht6OLB/8Be5aLDB7JvAGJyzF7fLw9dEU0gOJYnyofQQ
         hUpjzTCxPc1lPrPllKL83w1nTClAya/nf0N6TZFrVXF050PnJMfOChaUPO6wp7qKRVqf
         1SoFId6ob65biLRYGRnvbIZLtaTZ/yrYlDk1UUjheL8BO1BjMkg1uqlI0W7WJgDQQLUa
         o0RAVyiPyOwaAq27EbetopHyJRO5fG8bBcnB1DhFwqH6o+H7cDtVhDl47XX7rN5Akn8k
         aM3A==
X-Gm-Message-State: AFq9FYLwLJYS9gmnGXmc5eUIeyNKH/TuhmPrZb1SjR2ahovROJ7y+3KC
	g5tpj23rRZF7Zlthb/nBa0QEihswI2Hja/j62J3vVD4v4sGVKJhl8QQTxmHprQ==
X-Gm-Gg: AYBFou0FHAV3yjcEEHSPlYHG/a/K7MjZl11NAGwNqD7ujIsceJtUqIHXfO4hWtwJRTa
	7vy4/RSuOwSRKckFLvHiKGqjn7/dj7B6u6R/yqQ2WRzWonmP8+/mi1iNswO6sdJeaaUgxXEV3Yq
	Ff+ZV1cDlgvua4XEZ7VTmjqZzyT+Fl6JYekqO6UwUGvKsr6tkqrhbRBEif/XosGnt/fjRkLnvDr
	VnEkB83PsrvMLUDINnZhZVi6Vdqmriu4/o34wMx8c+jiv50KF7HDpJIEY7NwK1OcetDWj1Z1V31
	A97M9VKnyOirCT/osdbHf/7ewX6SWWsjA8vL4seKn2sDDUcd4sxiMuwhHnJ/RQhqLAGe8RkZwgU
	PYwB/pJRAei28BO0Kh7B447uuQrj07KfmJ2LIcOOTVUN7cjV/J0tU7yS1U4GXtF3ZbWyonXdvZG
	3Mxe06+PkEIy9SwRNW0cW3U2F69nir18UfTJcbqBiwHkggpzK4aP20iEnTpv7A9lMfh0TR7Vt5/
	HO/PsZXARnASqpXS1eKJtBPhncpclMy0SKtLzdBw6A5ASc=
X-Received: by 2002:a05:6830:230b:b0:814:8259:780c with SMTP id 46e09a7af769-844ff326b4fmr8607619a34.19.1792456669328;
        Mon, 19 Oct 2026 17:37:49 -0700 (PDT)
Received: from Zephyrus.localdomain ([66.188.87.142])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm10373383a34.0.2026.10.19.17.37.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:37:46 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 03/14] bindings: python: _internal: collapse isinstance checks
Date: Mon, 19 Oct 2026 19:37:17 -0500
Message-ID: <20261020003728.13669-4-vfazio@gmail.com>
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

The two isinstance checks can be combined to a single call that uses a
tuple of types to check against.

When 8c9d5b4 was prototyped, it originally used a single call but it
was falsely micro-optimized to use two separate calls due to the single
call being slower.

The performance overhead was likely due to the tuple of types being
created on each iteration of the loop. Using a module variable with the
proper types avoids this overhead.

  $ python3 -m timeit -s "x = 42; T = (int, str)" "isinstance(x, T)"
  20000000 loops, best of 5: 13.9 nsec per loop
  $ python3 -m timeit -s "x = 42" "isinstance(x, int) or isinstance(x, str)"
  20000000 loops, best of 5: 14.6 nsec per loop
  $ python3 -m timeit -s "x = 42" "isinstance(x, (int, str))"
  10000000 loops, best of 5: 30 nsec per loop

Fixes: 8c9d5b4 ("bindings: python: make config iteration consistent")
Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/gpiod/_internal.py | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/bindings/python/gpiod/_internal.py b/bindings/python/gpiod/_internal.py
index a4c997d..f0c7450 100644
--- a/bindings/python/gpiod/_internal.py
+++ b/bindings/python/gpiod/_internal.py
@@ -14,6 +14,8 @@ if TYPE_CHECKING:
 
 __all__ = ["config_iter", "poll_fd"]
 
+_LINE_ID_TYPES = (int, str)
+
 
 def poll_fd(fd: int, timeout: timedelta | float | None = None) -> bool:
     sec: float | None
@@ -30,7 +32,7 @@ def config_iter(
     config: dict[Iterable[int | str] | int | str, LineSettings | None],
 ) -> Generator[tuple[int | str, LineSettings | None]]:
     for key, settings in config.items():
-        if isinstance(key, int) or isinstance(key, str):
+        if isinstance(key, _LINE_ID_TYPES):
             yield key, settings
         else:
             for subkey in key:
-- 
2.43.0

