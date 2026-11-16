Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794865339;
	b=QFvHTudr6Q6njInIK7/Xa1dni6EjYT+AYZ5ZaQQUizImScoWzfb88UMQJSZ0t4Ifo4aa
	 TwoLHuaZpYe2vCAERzDRhmK2fakm+U2Op3vIi9y6sCd0ftl97Znhd1QYYnKyuLgPW8tq/
	 0hZJNvaacmoY4hA27kBel7yntHjONtNXRIeLezJMYeZK9yVgDcQpEjv5U5xL4ZA2Q6RYZ
	 5pKgyk2zhGf/rMIXmXO04DfBLvb2UuhNu4J8248LeTdvIjtQkM00t0iYJ8hQfjF2DIdBB
	 IgMB5q+U5OhmxDe1p7MC/8yBGZhNUSl1RUiSdAXp2IDBfifwrH23R6W3WYHmmQlK02g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794865339;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=WfAE768LYbofwmi9RaLy99Ikvhz5KXg5psomQdVla3U=;
	b=ilzPbOGpA9haSrXFT1jdkt2Z/ntzDB2AKLfo/tbH2FDeV5n7UtJeOUatazya8cM5HXjd
	 eRS46yGTNJqzq5ZIx4LIEYtsONWt0g3WosZhG9QfyfKsy4l0H+OW+oEVJJEKrnd0090vm
	 fEAI4zeJn6VJ8ZX2tQaS7RZzEXgVjWa/VuzMPC/TyLXHzMeDVG0p5LewEKRF6bNd5jcL4
	 jrAsmdAGwTX0vnAfXVlItTBPwqSHGFFqRrtOUaygp2wPsCS2TJ0kEMT4of9dNODWtdSxG
	 yXRXE0oTf7XTJb5E4iN9xrBaj3d4YJAvTLy1Q5MyVzjAvXe2Qv+qMwNEzeRyMCc9y/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Of+RMjZ9;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8722606A33B;
	Mon, 16 Nov 2026 21:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Of+RMjZ9
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 083261F000C4;
	Mon, 16 Nov 2026 21:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794865339;
	bh=WfAE768LYbofwmi9RaLy99Ikvhz5KXg5psomQdVla3U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Of+RMjZ9OBnbEwp6JOInGEX1JNdzNUfXHbyAR5f8bNMIT9s4+2t146uSQqD1xbt8g
	 umNuO89+sJSS/E3RyhL7Hqe8SgnV8KLr4X8Z753KsCJgAvEl7jiiHQ8RfkM0sYpb1A
	 sOeSJvYQObq9EcuUsDlHgr7gU9Go2FzyGbrLYkcgk1qfwcO3sHKUIXE4iu+xVYkwpc
	 iqLuU0VlaY5R/duNACh7GcQFsIK4D8b0p9NfAr3yNfef9pW1d/KjTrqhWiyTZ8Yth/
	 Td7wj6kwV5G3X1GW23T8sD3wib2pDkn69EBU2wyj349q/Pt2t3axxFp6JvQChP8qSY
	 1sSOiWR8KEaoQ==
From: Sasha Levin <sashal@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: [PATCH linux-next] gpio: shared: keep the atomic set_bit() in the gpio-brgl merge
Date: Mon, 16 Nov 2026 16:42:17 -0500
Message-ID: <20261116214217.470753-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <avtjEdUWiljJ5V7o@sirena.org.uk>
References: <avtjEdUWiljJ5V7o@sirena.org.uk>
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

Commit 7d1d799d6251 ("gpio: shared: use atomic set_bit() for descriptor
flags") in the gpio-brgl-fixes tree turned the two __set_bit() calls on
the descriptor flags into set_bit(). The gpio-brgl tree moved one of them
into gpio_shared_setup_entry(), and the merge resolution went back to
__set_bit() for both.

Use set_bit() in both places.

Fixes: 3fbbe94ecdd0 ("Merge branch 'gpio/for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git")
Link: https://lore.kernel.org/all/avtjEdUWiljJ5V7o@sirena.org.uk/
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
To be folded into the gpio-brgl merge, 3fbbe94ecdd0 in next-20261116.

 drivers/gpio/gpiolib-shared.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 1b76c7ce5b969..7f8b31ce4b9ec 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -588,7 +588,7 @@ static int gpio_shared_setup_entry(struct gpio_chip *gc,
 
 		desc = &gdev->descs[entry->offset];
 
-		__set_bit(GPIOD_FLAG_SHARED, &desc->flags);
+		set_bit(GPIOD_FLAG_SHARED, &desc->flags);
 		/*
 		 * Shared GPIOs are not requested via the normal path. Make
 		 * them inaccessible to anyone even before we register the
@@ -643,7 +643,7 @@ int gpiochip_setup_shared(struct gpio_chip *gc)
 				 * This is a shared GPIO proxy. Mark its
 				 * descriptor as such and return here.
 				 */
-				__set_bit(GPIOD_FLAG_SHARED_PROXY, &gdev->descs[0].flags);
+				set_bit(GPIOD_FLAG_SHARED_PROXY, &gdev->descs[0].flags);
 				return 0;
 			}
 		}

base-commit: 749a4de370409464cf8501ec5b2451df45c84eb4
-- 
2.53.0

