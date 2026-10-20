Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792456687;
	b=qN77FDAfcKxIn3jVMpbYhsRLB+eaN4BnaXcp0StulN47joJR9zo5ZWtbug1HH4mGySzw
	 i9PExmRjpwCdi5UwO4l/EF/zo7g8C5R9dRr31WhdO7Cw6WhlaWrLHT+GHkjXtZTUavCgx
	 VZf3T7OAmBMrm0gLxYerafvaMQFIoVF1wIztEp7FFdPiGkgJ3hUxxuc+rGUXVAiaDLPim
	 0gBNEQn/NTSIFONj8YqTgikxfwDbkw2qUN0wmyH2q/zpNb9+VcqLrqyQnnYEzkj2m1/9u
	 whPbBtQFZkaSJxWAmBwDcGg1bIhzl6UFJcJejHEfauOBsxo75j9yHMnoGz/jCXVEP+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792456687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=c3m3TKoMLCKqodrlgvSnDQJaWolnMkqkBszaITzVwP8=;
	b=tn426yAAMzuVhEPBmEamoueyDLxRauDZnnet4cDpTRLSZt0qPVG93qu2COOXF5sfxaiq
	 B/l7tcWQ4xag6kSb5ZKtIkEd25MKr+S2+z8VOOu9Isk82aegWHIHpFeon9vcvD49pzejD
	 nJNmpPojj3CpVQtHZjs/iIB7P7OkR7rjLVZvWP6m6te+cEcoBlJPEGJ8Wt9WuYi9sPOi9
	 bJF79RHqswc+fRtNpONMYj3R/mmfi5o2sAsfzsiQNhklnn4QlLq06CZB6Wz6Vm5KsLPpx
	 7RL7BP8ZXMY5ZuxZ8IS5vv8rPQnBlXNrZKwH5vXovqAJMoGQh7ofEXTcbV3SqBafeuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IaXIaQ6X;
	arc=none smtp.remote-ip=209.85.210.54
Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16661606A31A
	for <linux-gpio@vger.kernel.org>; Tue, 20 Oct 2026 00:38:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 16661606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IaXIaQ6X
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-8256106635eso1163648a34.0
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 17:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792456686; x=1793061486; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=c3m3TKoMLCKqodrlgvSnDQJaWolnMkqkBszaITzVwP8=;
        b=IaXIaQ6Xu6TuFu/3cwe4XcvbE7fpLGeCpsNyyt7KUwv24giKK/NHlbhZCrJIzi6145
         7t6w8MoNbljEmtJloglMiugVBdSYU65GPsMJBrVFQI47IWneGFoGbnAMv4lYASg/IMuz
         MGWOMMmQS1gYaMkfewEV2cJieFxfhiMAvC7u5bGHx0jElpcqFj4yonNC2rXPh4MvhLE6
         vudWwLb9gj5iAS5H8wQXz1Hs0wC4dT86aNPsUFtssytp4DLVhcm8RslXwvo8EUS5HSIE
         KL7+D7zeMOkwk4YFb/xynMZNop0aC+5lofo3y4P1OKW0RuytqqpX6taBAGU4eI48XXn1
         icbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792456686; x=1793061486;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=c3m3TKoMLCKqodrlgvSnDQJaWolnMkqkBszaITzVwP8=;
        b=Knv2YB3LPvup3DrwVQU4gdOrW6JrZwqF6CJYQHhADJxGvIdb2nysTxln16zCWRrUPD
         8m96X3Bv6VvR/S+rr4HX3jD00x+UWwJqVOptQHBZvku93yWRZjEOSFh/NN0Ric/CmSyK
         JMEqdu7QusaI+k86Fu5ATH82jFtTst4dpmafQlEGcvJqPpJRWbqJ7PH1JJpQ33nNzN0P
         2k7yq/5xsoBSyDyv5u7MmhyUOlb3jMmrGdD8ikgZFXwzMqJkiUK8oI0EmXRh5c95WKwB
         DCcfPoDHDbPt//J9Bqk3uczV0BxWxKJ8X5o4wfDDho8WgSK2LVTUMIj7rxPJ3vLyANWU
         vgoA==
X-Gm-Message-State: AFq9FYIfQZJVxDuwDDuXxNwrbWYecU+56T8dZLgfChsqn8TDDF9oaYJO
	0vsxgTqhCCJH8AaI4RwGnnwJr1PBO8rLuEMIjYYiZOQB4XLcKBWVDU4tXzXORA==
X-Gm-Gg: AYBFou2lw2yyjP2Bu8/3tm5uUTCZDGIYanaA59n//2fj5eJJoLlqHVRhsX3CHRmUKhn
	WJInZzY9O6MFaUZgmJANbS4FSS10AadpDNlY2HNakaWdo2EjhwpG0YECRrbyQ5zeM2dFac1ZAn2
	aJG/QxajZ9Bp0QSJnNIJtolobhB+ye/swxAMjHnNHVCxELT1/9ZhZAoQ8wdBJtmMWJ5zJcmHrL1
	x8XN3UY+rTB7rx7rRTPYBZ22SqH6zv+lmCRIINVmbW6y7rivaPCcdGRpuBT6TYCbCrFeNL5OPAe
	KwQwgvmxs5E9OtgPuppbBGUC5GhlYoCG/B7GmLuupihbv17vdlenGCc6QMRLSzWjOx8TO5YuUdY
	4N7WqjSXALEPUqOTt3yZTTlgIrwRqzZq6arJZ7V/tDIzyBT8LAHCVBDcTzFm2/yf8Dd1ElAzlnM
	SosSrNdt1gKgWnIL0FBMgABR3jEfmLaxUFAgOLufzgsrwovgiiMZUfAcLL83F+X7ICWL2xxMV7m
	ZIBo6/qVwqq/e0pqpGQu3awnuzI6R7cPKBFM0Fdy5/MCNo=
X-Received: by 2002:a05:6830:82f4:b0:7eb:9464:ac2e with SMTP id 46e09a7af769-844fe598564mr10128254a34.11.1792456686023;
        Mon, 19 Oct 2026 17:38:06 -0700 (PDT)
Received: from Zephyrus.localdomain ([66.188.87.142])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-8429b57870fsm10373383a34.0.2026.10.19.17.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 17:38:05 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH 09/14] bindings: python: chip: use literals for dict/list and declare types
Date: Mon, 19 Oct 2026 19:37:23 -0500
Message-ID: <20261020003728.13669-10-vfazio@gmail.com>
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

Use literal constructors for dict ({}) and list ([]) and explicitly type
the variables accordingly.

There is no functional change here; just minor cleanup to squelch new
linter warnings.

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
 bindings/python/gpiod/chip.py | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/bindings/python/gpiod/chip.py b/bindings/python/gpiod/chip.py
index 8712b2b..94c432a 100644
--- a/bindings/python/gpiod/chip.py
+++ b/bindings/python/gpiod/chip.py
@@ -275,13 +275,13 @@ class Chip:
                 for line, value in output_values.items()
             }
 
-        name_map = dict()
-        requested_lines = list()
-        global_output_values = list()
-        seen_offsets = set()
+        name_map: dict[str, int] = {}
+        requested_lines: list[int | str] = []
+        global_output_values: list[Value] = []
+        seen_offsets: set[int] = set()
 
         for line, settings in config_iter(config):
-            offsets = list()
+            offsets: list[int] = []
 
             offset = self.line_offset_from_id(line)
             # don't allow offset repetitions or offset-name conflicts.
-- 
2.43.0

