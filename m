Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C6F3EDE78
	for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 07:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784013918; cv=none; b=MGak326MofvZRDMBVNI5RD6o84UTKjQSQyQLOmHdHS1a8yEFRgTinf0bf/7a6G8A1yqFk0kV6adRWR+JKjDE58avA8Y9R2nMVAnToGrrn6WJFNOHyQZ/qGWYsSzT2fUEKgoIijZrDN5/i5oLPHbaBA4eqExfdjMSO7y+T+C5PYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784013918; c=relaxed/simple;
	bh=t0FnuLNehJGLnitNhfL5kI7BpD/7c8TUeLlUxouyfKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oXvwfDdZOKFvrmgXGHGcHVLbJ9yAOxQnieiuEg9gmKlk2BQnqrdqCYKcETD7nNivshHfh7AuaKK4xSa8bUt9VpTj7xEMwyadA+PsktZQJ7J0KQSDJX0EKr7OEuvHiBX06HxNqWJxRdFvhQUH9MaSORnqfA5mPe3zC8zPR6QRwOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=UAUQ7ZI5; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="UAUQ7ZI5"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso2195264f8f.1
        for <linux-gpio@vger.kernel.org>; Tue, 14 Jul 2026 00:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784013915; x=1784618715; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AsF+pQK0l1MLgnZK3Ab9BYMXhOyF4JRp6oQVwO0AFno=;
        b=UAUQ7ZI5TYy3X5/0TReAfaanjEHRlcbm0lizF6lIwe8T8ciQdiO1moE9rJqyIvjBWM
         2DqL0pfA4IflY8FNxoWZDTwtranthci9Hwe3PQtrkUmtGFZtLhP/B0n7GFGVtQ23sran
         zpcEudbdvdEY4v9oIZZpxg1iLJVXrZJFH9sL/KTp4iJe00azel45jfw+cicFW3GpMFj4
         iKvCNE1uqx5GvwZNPgrF6p7Owrsks4IydymEvNrE3WRe3ochN0KvVmbtknLi9tKCCjax
         vuqP1UqhmShDTEvPaXcF3dxRbR5fXIVWnrAS6CpP9PU9vzEInEeHuXcGj+Ucw5nno3El
         Os+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784013915; x=1784618715;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AsF+pQK0l1MLgnZK3Ab9BYMXhOyF4JRp6oQVwO0AFno=;
        b=NTIa4+EV3cfIrO1fqhBdN3LKEIVtAo/EUzbujgn043N3BEX1mnCJrz5AjCueCFDcWj
         jhTu8aW72PUHIL5dEqBax59mim1RIwQOq1MAQz/2S6WSqk7i066lDRzFf1hNyWKUqstu
         elTNwF6mi28VW0zTaTKHrHDxviUjtLMasvIYSH8CrA5RE0sQNYpnqLXJl48W63E8m6vA
         1nkRH7SdoKhLDMYQKHunFg74gvY5XWiN0bxuVJszzVeIGelZEiV5X6bsHzScftYALNeY
         Z0b8/CgD/bjX08Dhzlg3Kdt2YxUqOFDzrtN+/P2REsmF7NFxgxCProAuRtSXegtSVcEi
         zN9g==
X-Gm-Message-State: AOJu0YwWoV/9+IxE6/17Dn4oJxskjhxTR97a8awnVNZvZcxIAdEDxB0o
	ag6rSzKZIVw4eaQcZVdb11adD98pi5vsvfYjLz+9xHSbzrWwXEL95O45t0paGBlKjrQ=
X-Gm-Gg: AfdE7cmNeHuRKlPGyAAi0oAGF3MwK6IiyufI8EVKFVZ2oqLOiwCYW6FC8eKbjZd8mqY
	2tsL/J7K+dcLvJWtf7Z5wZeOKnwb07u0hYJa0nqshMzo35poE5cTxD874UHHInHmah7b+FACoKU
	u9zgiPzzH2uUwWt366wk+ClA0OlzgOEw6v9DVGCpQ883oUKvPlk93jIqzPzb9fjFj1SANf92pAR
	Gq8DBS5qlpPHt77Hiydi8f5MFynQMVknWT4meJr/TspDQIITjwOhD2xebWzMRzP+yDTjW3VDETV
	tulvMAoiWMyIcXmAfn6KBLdMLwteERiYsNK3X7g5OuQV5D7PKDHYAAKVEk4MPpCVnnKma8lnuTo
	lG/paM4L/98twr483uZVT4a1XxxvG3j1Ig9qGbtrEKabhbqZ0/s0qsqYBKiIWOoE89VebvAUFMb
	IHlGfDMuVJf5hRCWp+DrLx7jU+EawpYaLmgV6o/UFnfn5eFk2EhankkRDy0+qNdiqOWSSu3AbY6
	01R
X-Received: by 2002:a05:6000:1841:b0:46e:230f:d095 with SMTP id ffacd0b85a97d-47f2dca8281mr14998251f8f.7.1784013915407;
        Tue, 14 Jul 2026 00:25:15 -0700 (PDT)
Received: from localhost (p200300f65f47db04b44a80421173aa03.dip0.t-ipconnect.de. [2003:f6:5f47:db04:b44a:8042:1173:aa03])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-47f464a9879sm6673623f8f.22.2026.07.14.00.25.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 00:25:15 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 02/20] gpio: max7301: Drop unused assignment of spi_device_id driver data
Date: Tue, 14 Jul 2026 09:24:03 +0200
Message-ID:  <a347b27d59a738b99d7fecd7a583e1366fd65694.1784013063.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
References: <cover.1784013063.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=857; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=t0FnuLNehJGLnitNhfL5kI7BpD/7c8TUeLlUxouyfKI=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqVeQhR/93j89H4dOm1wP6sWTX7XEeT8fh7G5BA +U7F4xZZEaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCalXkIQAKCRCPgPtYfRL+ TnC6B/95gT2d9jorajCE2ZfxN7npA4GAB+Hw+tJ+rdLtAWw9JXZv825dno3OK7wVTVb2R5MSJq2 GQ9ej/cdkokb0eyKiZJfrGwpn6t00EOtpRMXWt7RK+MDaA5WxJKBjmaAbXdxXyx2QRaM7f61Z4V WX7flE+U1OuFyGC3GABmJm7M4lwjP2uqEaMPsbdV/LnIYyF+Ggekb3Spzc8Soc2f/h/3yjxZ8+v 758Te3zOe7abPXid8Bzk/H4d8WwJWDEgtXFUyYkFonzthVibMvaJL/lzuEHndhQ4WmvRBb/O9PO PzNboHYGA2YnU5cneOunIDNX7wWV2/qJA1qDbDJm5U2ROJGP
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver explicitly sets the .driver_data member of struct
acpi_device_id to zero without relying on that value. Drop this
unused assignment.

This patch doesn't modify the compiled array, only its representation
in source form benefits.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-max7301.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-max7301.c b/drivers/gpio/gpio-max7301.c
index 11813f41d460..c8bf6a9c3de0 100644
--- a/drivers/gpio/gpio-max7301.c
+++ b/drivers/gpio/gpio-max7301.c
@@ -70,7 +70,7 @@ static void max7301_remove(struct spi_device *spi)
 }
 
 static const struct spi_device_id max7301_id[] = {
-	{ "max7301", 0 },
+	{ "max7301" },
 	{ }
 };
 MODULE_DEVICE_TABLE(spi, max7301_id);
-- 
2.55.0.11.g153666a7d9bb

