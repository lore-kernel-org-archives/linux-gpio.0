Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793829604;
	b=Yv4x+UdPUb6uxne4ljxnUVUhaqDPloAjle7QWy5cR0gCU40tR+52jmKI+75PLw5fdp2u
	 kzX8UySJZT3OOCg39fu6rSobOLHIjNroWz4VHfsl9hTMomWIaBRgJPpQ8VVzWxaJ5p/qB
	 qPAqzv8kRrItuYIfBIITMJ1Y+JrWYJ7ycDy8sPeqgBYRVC4XzxQRrS0kS6Q1iSP2XHV27
	 FdZ8/hdyKWSFtvUCL1mQbzjUtsAr387M7WGsioXALqnE6oruzNUVblOma2CaiGKOSdinw
	 gskapqaTMscWH8p+sjvjoHHw7UdCQUiJ5ByyqsJoydbY//c7/STqJzdBUNvXyvx4jwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829604;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=J9/dIP50LfxLxmgwX1/nD7PItF1c308mZZXr4RjSQ0A=;
	b=1HdFQFFmig4ZaEAVejBf68NSfxxNjTDmyWvUrBcu8qukKLHEIjrin9V4ynGB7oCFq6r4
	 ma9GyuTQgjAd9ODziPTndoK30gRymfydcDJqtOhSTrbyQItSnP2QkLgKntzLtGHUnWyw4
	 DpRapqdInNX4pZX35KljlAtoxxjVeFU4JlxCCYZlK5YX6SOf69By4WVEbsHHnA28z6Dpi
	 W4bOSlt36Sd+gktOFZlhd1BDJDlB8pRNnLny7SvTH38SevcOh+XPK9z6NjSUf25cXa2Vx
	 h/0ym1UU8YWtTr03HkiirTBOvQdeJR0KUao4UjOtGs0T5zrOFJW89tbZAuUM2+ATpYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h7EyQPdT;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7424A6075DD3
	for <linux-gpio@vger.kernel.org>; Wed,  4 Nov 2026 22:00:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7424A6075DD3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h7EyQPdT
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2e987b4a710so219535ad.1
        for <linux-gpio@vger.kernel.org>; Wed, 04 Nov 2026 14:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793829604; x=1794434404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J9/dIP50LfxLxmgwX1/nD7PItF1c308mZZXr4RjSQ0A=;
        b=h7EyQPdTHGRBJC/MZIucnXYjrS5YFVIC7dor9ijgRMhgf936Ljo9gz031Dh2uTgv6k
         FRJzPt3+Wyd1OWzZdPrJ7gKvn/9/wBw+eg+luyPMOOJ4Bp2tJrx9gLz8sZP8W4oiMQiX
         fn09CTk0v1qxnG6lfDytttE61Wozden10+JzwbLjieHhViKp6mBC45io6YfpWBqMhv9l
         3fXUi5e8H2Z0dC0lP3nSCt90mKFuwACDesE4vJX/cqjZWKEEKukjch/tdO96IlZPpXfl
         nUdQiqpZ/ueC1WrtYUOBp5gzS1+AfQnxr/7jlBG/+DWjGaWGj/S8Mt37JIZuGP9xxoE4
         tr4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793829604; x=1794434404;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=J9/dIP50LfxLxmgwX1/nD7PItF1c308mZZXr4RjSQ0A=;
        b=caWnE5BnsncXRAGOvTVGIbmlqV8qyKC8Ga+wTNcJOxEz2giQ3ir5vx9ms4sc0Gtul0
         3YiDTIczgW71bxzl/Kx86LPGmybJOgaEOd55akw8DbAqkBLoEdYeFIEg5Ehg34g+zeEV
         BnDQVMXkHckb+ZO5LaUUdxuZ+i1csyBswYJ5HsyKHWOjwpEbl1T/FxfJ6TwG0qzyN+et
         8fBwxggW8ARR6G3VWiGbxpqqNe/4UOJ7HbIJRclarTpOb8NetGiey5ZNsAy9mvTy5G/D
         LctO+tZAOhatCTnA/TkEOuMiPox8FWP3rMqjzDfOePL9VcmiBwBCeVch/bGpgVcdIiDK
         yKXw==
X-Gm-Message-State: APuU4Z91FQ4t2I2P9+nuxgBQGgSBIqrmAaL5bqqLghi3K78KvhJDxF7g
	8OwLYPYd4OhbySC4zCMaPpmp46Ff/YaVi8BZlkiX1l2gX5xxNMxBJmZkYWSmxQ==
X-Gm-Gg: AYBFou2+Tff5Ft0YbNeC6beZEvAEdkTHkntBr6bvtn3rVmndbfhWq02HnmfZRqd1Zji
	rL28No8ZB0dy9zYmgNmUpG2JxL/GDFIs6MnxBSmo9QCFRm9Dhy6537NGgHQ+XS10RH5GJ7wXcc/
	cEzlmCNWvScpvM05VPoZc5rzOp/X2aaGj1YNO3qsjbJ2CdRV9HLqbBY3OJv9WWizT0aTqEQjCWR
	GOedD076TQiYeTMO6ubwtmpAkiEAe1UK0C9EbIlYrgYPVKWWNRhgyROR6aHZR5WoKWKTeE6fVNk
	J05Wt669XoGx/Jnwm49XiijyWhRmE4LYixjbYRBmd4oWWZOah3G594R2HVZHfFJrM1+rDaGqevq
	iJG/LJH4kKgnUguxWqN68/uJGaZeEHUy6yh6F/u5A3OZ9Ou0akmaawOBfqmFHM1R22VJbblWWIo
	p87yOPLJvzCDRgPQv6zy6DKWsShZTeY1HGW6ZgDVZriEhK6B3sY/ZQelYvyjGjS6TC1EGmdqk2O
	usJPf3IWYovqv5QXCYEGSVcsBLIw65NLsJ86ZDdvpizhjrne1c0g4PQSU8ObBdC6kQlHucx699U
	zT59XNsasPZXeBNGTaEkrqELv5NTTCy6kpJ0gNKQgZIoG7eYgTFIhdd0bez6jI7UZC+QcJlvcD3
	QZrZ8xW8uuyZUBZCkRZC+NHXlyCod/axcMmBitpQc+e9rmSqnNQLC2UKycMejSCnXHdVGK/pPx4
	+JcqMKh/lCpa0KW9xfdQobnJo=
X-Received: by 2002:a17:90b:3fcc:b0:3ad:6090:a17f with SMTP id 98e67ed59e1d1-3b0afdce8aamr519591a91.10.1793829603412;
        Wed, 04 Nov 2026 14:00:03 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed08fe1e4dsm11237865ad.21.2026.11.04.14.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 14:00:02 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/5] gpio: ppc44x: drop redundant label and parent assignments
Date: Wed,  4 Nov 2026 13:59:55 -0800
Message-ID: <20261104215959.24035-2-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104215959.24035-1-rosenp@gmail.com>
References: <20261104215959.24035-1-rosenp@gmail.com>
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

gpio_generic_chip_init() already sets gc->parent to the device and
gc->label to dev_name() of it. Drop the duplicate assignments from
probe.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-ppc44x.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpio/gpio-ppc44x.c b/drivers/gpio/gpio-ppc44x.c
index 189667e0e1ba..01dd5e7cc311 100644
--- a/drivers/gpio/gpio-ppc44x.c
+++ b/drivers/gpio/gpio-ppc44x.c
@@ -178,8 +178,6 @@ static int ppc44x_gpio_probe(struct platform_device *ofdev)
 		return ret;
 
 	gc = &chip->chip.gc;
-	gc->label = dev_name(dev);
-	gc->parent = dev;
 	gc->direction_input = ppc44x_gpio_dir_in;
 	gc->direction_output = ppc44x_gpio_dir_out;
 
-- 
2.56.0

