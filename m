Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098240;
	b=rwWPGrq/S8cKqPP28k2ldSiyErBc8vz4x93H5DMLxih6lyqZNUiSUlAEbro0KzKJw1hl
	 1hkPk33CXhwZ+oiSof43R4oidzE/R5aZZBC31jZBa1L9Fa0dMAoCuLiUiF6qYKhYAx3n1
	 rc7XAIXrvf6Z0uuWt5vvQqJyyzQEjXbHSAjt6lp3TDrwKNf3LtfHRiz33BdoUM4r2eMU4
	 36U1xNzU2gaU346lBJvDmSEPwaljr1bX92BqUeQL0JAW9XQajIR434vnngzupdcq9n3u7
	 vKCVCHxuNFUya+f2EgbgsbXtpTr7hxZXid7jtvm+m/9PAkK01piCp3eJre+xZUrYhaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098240;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=RKcXzPxvin5lwIxGObv+nbNRfrLQyO7ePF6o4zMOL8k=;
	b=rf84MGrvDyRTOWgSmcvcz9/0XwRqXLi7OxNoY3+kNQnsDIEQJ5vpytFcTvv+crdrRwgB
	 7mTOa2ES+WfrMTr9pLH6k0MjuWZSyXkniNZX3zyD6C/ksMz3wa7EyDsGJP4BQUi/Bbyoy
	 w1lz0O6Czm5QP/Qaxz4qNBL2JZ8wiJNRtVe3AkEsGyGnjTYWLf97J5HFimDJnnxL7w61I
	 qeJZHH136opcxuYF9engHuN2csoRfUOFZ81vI0P4Zcv5/DXRv5mxrO3nQswU1ZDWm9wHY
	 qDt0Qfcj/lAN4f2MAqGb04Nc0K1OWUbwKqfLXTZJkxs6uRJDfry+XCDoFYTnQrZFdaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=DK9AS4Cw;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E1E60A262D
	for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 10:50:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92E1E60A262D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=DK9AS4Cw
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48e04773687so1310412f8f.2
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 03:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793098238; x=1793703038; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RKcXzPxvin5lwIxGObv+nbNRfrLQyO7ePF6o4zMOL8k=;
        b=DK9AS4CwFQITVbCOuR2rsrN9qvm5DV69r3abBgOccZk9rkDjC+yKRSsQMNoC3xoota
         AH+EkShreAto0DZdFx/VR7MxNeswWVa3K0+vAKQMO1zkuZGg7CDttKseUQANX2vyqoHL
         DgRooymbF1Dihu3isIm7HQd5BrTm8up4cKTyAGcz1N/1rpXn4pAE33MK3ykCpb+tLAc1
         waRxbYNFaCX/XCPCABng6cKYOzyWGBbQVuarvxckXrmqReAeZcx1MDFzseMnGluY88ES
         f3y4D9pvCQGFlU8FIf6I1c9hkiqaiveYSG5PoHAGHR2f/ZTA4/wzV0Vv5kMCivllin+0
         7Xfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098238; x=1793703038;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RKcXzPxvin5lwIxGObv+nbNRfrLQyO7ePF6o4zMOL8k=;
        b=kfdrchEt5KZ3WqrKzHcbPNxueAH70/ckraDmr2sRP7syddc5WutPcK3rcM2fdHKXXk
         ynBejgH32Tj0cvsKFOtlQ6xn1BTyaBGEMK9l6ra8SrCsx5ujcHRFF8qAH8i+7TNqy91n
         7lTPqgQMiP7R5UkqJDHSf2PKQvRCzpIclBqniVx+Gidt9u1nv9Jx8lgbR3Fl8kk1Faby
         M4GHnCd1NHNai/i2pqtDXGVOXfs9qta8NjJZ3iMByaZckK4tmfSMPx/vfo9CGWhSW/M8
         9h2wUJhR4t/+bNr/wAKolfk9qejUb7mee6D+eeXaNW0jUA6CpqzzdY6IM0HmoV+yiBwm
         heMg==
X-Forwarded-Encrypted: i=1; AKwUvBxPoouGrRoS+ULpuAaPl3C28VuD2tx7YZFdE31tjhk+92UJgh+ZA4lX6vj0oI6nLAeZJWpDqWiog+Jf@vger.kernel.org
X-Gm-Message-State: AFq9FYLOdR9dYMyWM/TF3+Bsy2X8NpXUIUYlUHKIbDCwzsieo/c7QypY
	wQsdlCdTtk0w36RKqOjIMW1ZhF58sUhjfi2NZ2ry97ymce0oFThmSm2J0gFHR4jkCK0=
X-Gm-Gg: AYBFou1VoHQ9IjM6uL8kZEgIYpfwgGlffwg4ZPf6PNuICbhmCKP1RHnTdueJPeabnOx
	WWgbVqjJfrVznokA4nprsOfyGUr2rHfiIW04ulrfTSTA73PghC5a/Rb1k0D94HHkLEVh4kbiZcK
	hD45AwqXJXPdJ60Cix8WWztuXxgnJpIwWZeb+QkSUPX4CF+sUhcHy8BUsYJtsoMi7LwvURawKi5
	3TvWvJfxrMSPnK6log6S+OVBWHcvaTh/nXV0O1SSCWEbkEzt/t54t5mzzeZvbcU212e2wJ3uR6o
	uxIxme7GIXhn1ZIs6qdF+G5JPY2PT+Kx2CpuDX9cYYdIKG6uiAfhD8mcv2Ul7jbiuW53KsN+EBs
	6J1A+1u0xGpWIhFeZduB9oIJat0SyLIQK5mD9C4u8Vov26drD/JP2Ed0JE3YWDH10wyns4wvYEu
	1+OgR6ZVEWuE/nxyU5mPTEvTScQhxbpg9B6Vshg1GhiFgOnkwlbnRKshe6CgICZfsvF//2+h9a3
	+h8gIpGEPPIJX9NMYJM2x00SLgjEKR+0YJV4HHyX7A9S312iC4kfzmrXgL/mdtQf9ruVudmCSW7
	4NmDDMktbm9Dq7EgYxMa8L9H693slJrLlTcnp1ivRBs=
X-Received: by 2002:a05:6000:40de:b0:48e:4a8a:e17f with SMTP id ffacd0b85a97d-48e4a8ae18cmr13762733f8f.4.1793098237881;
        Tue, 27 Oct 2026 03:50:37 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ebd4ba7sm22249916f8f.33.2026.10.27.03.50.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:35 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 11/23] gpio: pl061: Use empty initializer for amba_id terminator
Date: Tue, 27 Oct 2026 11:48:48 +0100
Message-ID:  <b355a54a01502619b94c75237d187f53e496be9c.1793097104.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
References: <cover.1793097104.git.u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=891; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=F0NDFiED5fE2YvaHL9r7KOPlatK3tsaZ/Ub3SUOTuFA=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4IG04mxX49moMc1ZwmXpAzVIJYDr+Nt0mz9oG K7c8VUV+DOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauCBtAAKCRCPgPtYfRL+ TlKRB/9/2SD1P45lfIQc5ZOezBh4bFIx07gZ97Q23pmsOlpZHMwynGjuFJIZjG651A1vQ0HjkfT MJpq8IpYdQnWTzbcIuyFvzbn5JJIR1Q46daNppiOYD+viwP3yhdCKrdem1CbzxlViKnTjWk6v4N HU71qBLesIjYFdYzBjfvIcZyZmK8rtQbUkvEDprT2Z8bhjn/dtsjRqF6n8VD/eqPi6EsdqKKEjH OO+kUefD3FdWyUk2EEMx5+SzwrZyuBFDDbaQnPwm3jNeP6coEJQ0wf/8ihyE/Zt68LoBbwoKd16 FQvf1EAerdeeOthDBqOrGO9rgreVIkojOENBw2lKiLiZzXBI
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

A device-id list terminator has to be completely zeroed. Most such
terminators (also for other device ids than amba_id) use an empty
initializer for that and let the compiler care for zeroing the entry.

While touching this entry, drop the trailing comma.

There are no changes to the compiled driver, only the source looks
nicer.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-pl061.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-pl061.c b/drivers/gpio/gpio-pl061.c
index fcd44e34f65e..f180e5f4493c 100644
--- a/drivers/gpio/gpio-pl061.c
+++ b/drivers/gpio/gpio-pl061.c
@@ -412,7 +412,7 @@ static const struct amba_id pl061_ids[] = {
 		.id	= 0x00041061,
 		.mask	= 0x000fffff,
 	},
-	{ 0, 0 },
+	{ }
 };
 MODULE_DEVICE_TABLE(amba, pl061_ids);
 
-- 
2.56.0.rc1

