Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098249;
	b=2GGcWCFz3yepdqDnbH3UPKIOWqvzrdB6IdmA5FqRR/4sUAGzH6GD6pdMTsjfDcPgkN52
	 s8KQdTp4ZjM5pf2+Qjf6OJYghyY3j93rZlTF4Pu25k5p8e0CwsZTyHEg4jSbX35f7LIbZ
	 GFla6oqo+kxZEhIWS3bJDGl3on4P1RO4ifiLsRIwTW6AR8ob1rNs+3xuN1JFZ9RuXbatE
	 kJ1p+o8FjTIPILWzMJ4CE4M32mrjHIE3oh+sn+C7fn4BhDeuVfK0IT5zTUuCejc+hMcaE
	 3hTIJaawdf/4ejLwH1qgrL1IRxqrgngtC+FtjXGB/8dtUmvWJCTuhr1hf35OpHZP6Ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=I9rh3Te2xYwf0xNAqLGtoJ0ZzJXpFdRlQePYZj4wULs=;
	b=QuNP/mkYY1NGoSDFQal8WSWnLebyP8IXq9qKCY+Hx2q//w53kSgdqw/SpR3+EeNTAnqV
	 5FtFpoUI7d8Eo9gesA6BkeRmGXFlMnTALvJ8eAWohh/MsZEJEOT98SsAdowlqfniYMX1u
	 JKKB2zXtlOGINSuZNpBEW0gWJRlikskYn9X1A6MV2axhG0OevF7eidgp7NAXPlwDC9rp4
	 dq5TJEFDBMw2nyTJUDZvtXDdnlYKDIHpbQHBCFU9TuMDwD+2ildmSzSpPJocy9qJOXi8H
	 teqi5SKBhGQP8GR5GGtwy3Mx6va1YADkBRbzQhaaGTYRnKAPhCshu1TRxGgCvVrZuXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PWA0E6pf;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56AE6606ADF5
	for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 10:50:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 56AE6606ADF5
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=PWA0E6pf
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48afcfc4bf5so3282981f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 27 Oct 2026 03:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793098247; x=1793703047; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I9rh3Te2xYwf0xNAqLGtoJ0ZzJXpFdRlQePYZj4wULs=;
        b=PWA0E6pfguevg4TX/fCH4G1cUCChZGK9BFBwhZFZpHL7/dK8WwnARewBJCjN5Fxmca
         /CLnoG1GRH4kD/KtMqzppV/N9uUT+vHlOiUT+YmsIArh2yD38iJgF4kh1NyxNtEXumL0
         IanYQbEW0WMr1oRXAfKwuOj9FAiEwzd9it/rzPk6f5POzYV6wNVqsZL1HoZ+PKPMS/Ij
         KjqAeyWajRnmsei4ZVh/yhtiGe8zw2qxCl4Dhp+3Qh80qblQvdwOXzwVphsKJlbn9d25
         IHd+o/7iCLHqrZTLRQpbHwTpkfZBfKxD3D1OVFmE8HChpjGyPQg3rKOQCpAwiXIwbW9S
         K7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793098247; x=1793703047;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I9rh3Te2xYwf0xNAqLGtoJ0ZzJXpFdRlQePYZj4wULs=;
        b=zEpYP+t44q98aZRpCLYemRymXlQsn2UObQry9J957jNWxwG5UlJhvW1wCE0M+hwxBy
         PQOdInl4Ui2KUTu7ULK7IB7NETnH7pTU54Zvyglu2QaftP1WtS0cUhnT1fBsnDeM/e4Y
         s3ZW45cSULe4rbSychpd1omWXhljknzTmYut9FjC7WdsTIJL7z+dlbHfUO+W1Lthlszn
         uBfTzZpLFXbk0uU0VA73ZQ5d0cmqr2bwlGs25OAQjJBY3HI7jIvO4r7zGNl9LhvYxI6W
         q62jFSuiZRUEjw6tY4zM/3JPV1whJw5QHyC4glw9/FfsNg4hCiuEnfHPalDTaEG9S4WC
         GXSg==
X-Forwarded-Encrypted: i=1; AKwUvBx2cwot7gHxlosmH3E3TSvXeZoot0s1mS35sjUhNcHYiBLRpv3KKyICCPqggVsqdkUzDbuSHgi5Nuv8@vger.kernel.org
X-Gm-Message-State: AFq9FYLudzRYtmxkF7sEkWn+ffb/oo9N7Q6nNbBDHBui2V6LgJ2BiSLY
	z3npw+irIdoWF/DfDYCmXtxgGGqTtzlnUdLUBI7BYNJjV6T9R3mElVCkIz2x9kv4bgtQNE0Exm6
	FMgsn9Ew=
X-Gm-Gg: AYBFou3ucVxuN41zsZVqKM82w0bfTDyXf3rSFdenSKd0Vfkn1jDc3Jx3lRveSOxEq8a
	NM20T2jz8e5LOet746ISilVCj+7ehCmKhWeRS9lUkrBTleRoyZxIhugwdhl752PCoeYxGQmS7Ho
	AfGISjj74W0uA00+WPN+8AIosLddzH29tVLOYYa8cpUTCwFPK6qDj+mgx07uJaowdEgpoOKkrSB
	Psz2LLF1+ErgpxKkx6j/A27mwxKlfBrncANwWIx9LRHONBPfXqFiKKXezJR0FgLFPeI9T1+B+yq
	3/2kO8tv5rwKeBJfP/R03GlcbWh1C0jvBbltqvLsTkZFag1dj0Exz5/7wkd/6CTXJ3LW/9pGdgv
	qEHkZ9hYtLc3C4SPS9Hw0YAeUPrM7pART1j34Pe0byP5jkH38PMPf3UQ9kg8R73IFNmw5OTlqJT
	1F2X0mMCPmNOg7kVZWR2v4HZDn4HgPU35k2ffv6PzB6iAKG0VNJ4AUGJePD8BqMuNVyVFdr6VYB
	KksjjDoO6+GmRXMQhfS9DKYy2tQi530bqvalHC0uRHZXMf82N+w8DzC8YE81RVYw7LnkPvjmQKK
	prglCcC/1EC3Sv/2gTSZ9VGEug1SwLRlcB9xiJKTucA=
X-Received: by 2002:a05:6000:2206:b0:48e:b1a:fa3 with SMTP id ffacd0b85a97d-48e54a0a7f2mr5629085f8f.35.1793098246696;
        Tue, 27 Oct 2026 03:50:46 -0700 (PDT)
Received: from localhost (p200300f65f19a904240e81f1f32a429c.dip0.t-ipconnect.de. [2003:f6:5f19:a904:240e:81f1:f32a:429c])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ece5e4asm21603671f8f.59.2026.10.27.03.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 03:50:46 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 16/23] gpio: Use named initializers for spi_device_id array
Date: Tue, 27 Oct 2026 11:48:53 +0100
Message-ID:  <11fe7ed408b5c4f8b9e67208363108d192d5acf2.1793097104.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2931; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=uNWJjvjByUSk/Alx6uwMJrOimvtVntzmd6YoLQUBMo4=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq4IHHIPl67+WUpoSrkDzCHbqDUyo2BVaVgefq8 AD7aObIeaGJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCauCBxwAKCRCPgPtYfRL+ TkgKB/0SfJ8fTC61IW0Yk+XPjTjoN5MZCzoJEO3QepOvDaZacI+LXqNwm+2rV0/6L2SjwEcdwsu WiTM4MiH/ttnsc2gkH0q5pCNclz9WhNX7TW5gf0XpfIqcEfZhVQ5efaDL/Rqz0aOXqW+7j/nxkB U4LGvGNU9mR2rEiszaxK8IjA6+2N3dJitrY+Xv7VM5sRzDW8Jl+oc28AmwkHTqT49knGsFvOwN9 WXHucYE3zuy2v+6vAje9QwoicbbeHuNT4t3QdSIAFz2JFxfhEsIfp5qM4waqI4aHWtjuUmdr6g1 dFOXjtPGOrD0YAc3M8zKNonm82Pgvi28oV2xWuQWDLo+fy2+
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

The mentioned robustness is relevant for a planned change to struct
spi_device_id that replaces .driver_data by an anonymous union (though
none of these drivers uses .driver_data, so this patch isn't strictly
necessary for the plan, but still ok for consistency).

This patch doesn't modify the compiled arrays, only their representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-max3191x.c | 12 ++++++------
 drivers/gpio/gpio-max7301.c  |  2 +-
 drivers/gpio/gpio-pisosr.c   |  2 +-
 drivers/gpio/gpio-xra1403.c  |  2 +-
 4 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpio/gpio-max3191x.c b/drivers/gpio/gpio-max3191x.c
index 6e6504ab740a..b06fecc98633 100644
--- a/drivers/gpio/gpio-max3191x.c
+++ b/drivers/gpio/gpio-max3191x.c
@@ -449,12 +449,12 @@ static const struct of_device_id max3191x_of_id[] = {
 MODULE_DEVICE_TABLE(of, max3191x_of_id);
 
 static const struct spi_device_id max3191x_spi_id[] = {
-	{ "max31910" },
-	{ "max31911" },
-	{ "max31912" },
-	{ "max31913" },
-	{ "max31953" },
-	{ "max31963" },
+	{ .name = "max31910" },
+	{ .name = "max31911" },
+	{ .name = "max31912" },
+	{ .name = "max31913" },
+	{ .name = "max31953" },
+	{ .name = "max31963" },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, max3191x_spi_id);
diff --git a/drivers/gpio/gpio-max7301.c b/drivers/gpio/gpio-max7301.c
index c8bf6a9c3de0..9db20c22ba9f 100644
--- a/drivers/gpio/gpio-max7301.c
+++ b/drivers/gpio/gpio-max7301.c
@@ -70,7 +70,7 @@ static void max7301_remove(struct spi_device *spi)
 }
 
 static const struct spi_device_id max7301_id[] = {
-	{ "max7301" },
+	{ .name = "max7301" },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, max7301_id);
diff --git a/drivers/gpio/gpio-pisosr.c b/drivers/gpio/gpio-pisosr.c
index 2732ea8c16b7..75a8f3efaf94 100644
--- a/drivers/gpio/gpio-pisosr.c
+++ b/drivers/gpio/gpio-pisosr.c
@@ -150,7 +150,7 @@ static int pisosr_gpio_probe(struct spi_device *spi)
 }
 
 static const struct spi_device_id pisosr_gpio_id_table[] = {
-	{ "pisosr-gpio", },
+	{ .name = "pisosr-gpio" },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(spi, pisosr_gpio_id_table);
diff --git a/drivers/gpio/gpio-xra1403.c b/drivers/gpio/gpio-xra1403.c
index fe0fba6ea902..3713475bdb75 100644
--- a/drivers/gpio/gpio-xra1403.c
+++ b/drivers/gpio/gpio-xra1403.c
@@ -185,7 +185,7 @@ static int xra1403_probe(struct spi_device *spi)
 }
 
 static const struct spi_device_id xra1403_ids[] = {
-	{ "xra1403" },
+	{ .name = "xra1403" },
 	{},
 };
 MODULE_DEVICE_TABLE(spi, xra1403_ids);
-- 
2.56.0.rc1

