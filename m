Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792872055;
	b=Fv84awBBV5XWWEKwdn1L8VnsrQqGjQvJvAurO+nBbvBUfY8kWCBJr5n/fB+lyZPa7CLY
	 fF+0tzk0faf/qatCUFSHVDs3smhu3/GD+VbZ13WAyA7SqgZD1mihMpmRC0T6isq0tL7le
	 NFwN5FsSk/umtXZG0MLaPyGoXvtQ8O7JStvwnEr46VyqA7m7ARcxI09ZSbehXs63w+fxN
	 U8C1L3sZbncdwl03YEC6b/IUykFVjSiL6jz/08YW3lzFL/UojSg5k2/1wh5H0ftE/EFDm
	 44/dhlQWeflSa2Zjf1Ude7A3qBCQAKfngsoEYqFk9TRmmF9oJTKmNoYT97oMw5u032A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792872055;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=S3E2LS/2+wwSHAsgRkwj14NIvGh7m7D+2n6O+kCWqqU=;
	b=3kvRUNWLPpZzL+P/A6FMsMjjt7gXLRwvBduiiKMjiktvfLhcOe8aU4ZBmNUavf0h0JIj
	 h9LnpBajqP6d81cSjvgZ6CevqEwJYn7wgcBSUK6jmgZUyfqJXGrbhKy0whgP/EAF5fZti
	 OqTjU0L2dw+Uv+10k6d8cTEJ9BmldXxTKsAcUMgUCw7AXML7MJqwDOvD+pgYmNkHwoIME
	 CJm+iqvtmFe7GA8zWFECraH2Zh3h74Z7D8A26XYzKtf+WoN/4hRz9YzES8MtiJTJLHCDg
	 kNhswSAY158F/T2664AkNtUA3pvbsWJ5XAlDmHsiyq47nm7QkMV767mRdXDAKUCB5zA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H9YtU1DE;
	arc=none smtp.remote-ip=209.85.210.53
Received: from mail-ot1-f53.google.com (mail-ot1-f53.google.com [209.85.210.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB26E606A31A
	for <linux-gpio@vger.kernel.org>; Sat, 24 Oct 2026 20:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB26E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=H9YtU1DE
Received: by mail-ot1-f53.google.com with SMTP id 46e09a7af769-7f432ac553fso2048523a34.3
        for <linux-gpio@vger.kernel.org>; Sat, 24 Oct 2026 13:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792872054; x=1793476854; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S3E2LS/2+wwSHAsgRkwj14NIvGh7m7D+2n6O+kCWqqU=;
        b=H9YtU1DEOdBtVg/4F4Wq+12BSZfOICikWvRdliDJVwff+3tsTEYgFd/TDeYiFWdeSX
         TQbIl9tdHwkmCATSfjkZ/ljjOmqRbUE6FE3QIqbsa5KpWUGAzQMdaMkvUSaSaNCmKo1t
         6RXAMZJM0W+ok6L9QL1RSiikLRwxY/vWEQ0xvUfA4hpopXmPfdEmFzleLbmQtFmXraim
         JHA/4nOjfkbj6SDm1sNRTximru4KL8thsfOxjgldv2wK2uTxvUf/tDuYmoNt3qgyO7q1
         H0L4oDTPLbyjGlSYCm6NhwJKYqYEVWjgB35fynG6wpTkk0k7R2pGSBUb4VEUN9Rb9l6w
         4ppQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792872054; x=1793476854;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S3E2LS/2+wwSHAsgRkwj14NIvGh7m7D+2n6O+kCWqqU=;
        b=sXblc4ECSAX1Te4Sza5bytGuLfbE6pJuG9zghfviDvrYwqZc1hHjpZsuw1h7K5e+no
         LaAyDcNtIovz4OgpBV5mOlulnV0ZW/YU5aHAFXnZ/PngrcngzG7/GLMXe1c/guuAflxQ
         INF9OKX1NK4DgLzhuMOVwZmir9rOyGXBl4+hoBR1PBzPfn6873x6vaiompJmukKfK6IE
         DcWcHvQSw1DHQVffb7ZXKLIbI2On/hB1C3iOTL5ZdpTD0r/m6MpMIIZLJAf+lSvi+xsb
         WvfaCvxW9uZZOpueY1eU+9G9aJA9WRa58pR1FzbCnRQ+GNU6ns685gLFoJW9Lh1DUURL
         Oovw==
X-Gm-Message-State: AFq9FYL8X9n73HMVCG/sEOJPurbXp8kDTD8rWVEH1t4feC3njMBxk+Pg
	VYtD8eUNqSmnJtZf3K5blTL/nfNn7lmQagmofoNw7AI4jKSCkuu/07wrPXio5g==
X-Gm-Gg: AYBFou3VsuLyBGgEKyfpLh+RzuO0Q/hVhr8o3So4W6yf1hLlPPaoeKb0JtLin1i/ocl
	r5tUPXa4Uo2Sm1jt4eoPU+ptQgp8y8Tl+Pkt7Vft5Dqzkzy98D/axPd0ZDYZ5bYAk0dUipsp1Mm
	qrIYfD5OjE3cb/hLQ+/z1HefdvmJ2iDjYaqACmdgC1Z1Qzjnw7AkdKZekcefRQtvAkm+JwKd+So
	VwOd4Hxt6jYKocPrTCb/NaMV4D9RQMYpMADaxXPko9yQc39mOb91ecqpzpl+Pfw8NUHcYruVmcJ
	otrjdzZq/hPRKv4HIHAm6RVH4Nbm2uVyuA0uE0nSBACNuvXlblSDGqxqozan4CDUTQh5c0y1Q0G
	HSFK5cy8Xg8dtW8F1BUXFlEZ20qw90aLwQvSkX/54wP/GvA0SZ0KKei4F6ySjElXHxK0IbMn0kE
	4Mpod+NYgdLbqBxMgcAVZFshKURQ8iIhZGGASZu26UhR/5W4uNooOlgpr7qSGH1vEHF/EUaFnMm
	LhU3ILH40vcOObk5mcc8ZVumjn2+A54XWREcmbyRmngIYUNQhG08P6Gu3Z04HqAp9Na/wqxZL75
	CV67MTG9kU20I2EvPg==
X-Received: by 2002:a05:6808:221e:b0:55b:fcf7:61f8 with SMTP id 5614622812f47-55c00236318mr1939345b6e.40.1792872053754;
        Sat, 24 Oct 2026 13:00:53 -0700 (PDT)
Received: from Zephyrus.localdomain ([66.188.87.142])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-55c042da8c5sm1731361b6e.14.2026.10.24.13.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 13:00:53 -0700 (PDT)
From: Vincent Fazio <vfazio@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	Vincent Fazio <vfazio@gmail.com>
Subject: [libgpiod][PATCH v2 09/14] bindings: python: chip: use literals for dict/list and declare types
Date: Sat, 24 Oct 2026 15:00:43 -0500
Message-ID: <20261024200048.25987-1-vfazio@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Per linter recommendation [0], use the literal form of the dict and list
constructors. The long form is not common in typical Python code so it
stays as readable for someone familiar with the short form syntax and it
has a very negligible performance benefit.

While making this change, specify type annotations for the collections
to reflect their contents so type checkers do not try to determine their
contents implicitly based on assignments.

[0]: https://docs.astral.sh/ruff/rules/unnecessary-collection-call/

Signed-off-by: Vincent Fazio <vfazio@gmail.com>
---
Changes in v2:
- Reword commit message to provide better rationale (Bartosz)
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

