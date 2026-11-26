Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795735026;
	b=hlJZOthDBZuuIXOHd+YqOeBcfVQf6MSi5/lrSbaN9YubVZcglSkuVk2S+oT20+eOYDEz
	 +NCvOllPttXomvKdTJFynYNl45+dzMi0+yetQ1mGxpcgkx3GNBms2cPKB2yjFi1ErMxuu
	 HqNwBAIX/kNcbN1zKmx4ETF/9yKEClGPAVM53aGezC9Te9huIWS5riJJrg6zygWpLXdLT
	 c6fKUV9kWQEOUc/HOaDdWfG0SRbPmdk5qnzKvd4ye/IZvOIjBqueFbe+zmHHYp5EvDVw6
	 oDH6esChobzQ+3UP7n6zPTAoZMYVQjNQL3Hq1ynk1Hpxv+wTLj0xprZdHDDWHg9PvOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795735026;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fPaYYz2xYxvoDkUsKrMbXMBJUPqVTod8eYBtQmhIkAM=;
	b=gJrA5QbzIH5GsP12NXGo2zTnmYfWaYRK7T2ANpmCrBqmOuzyt7Eg+isgdQ8iud6c3hM7
	 LoTtdLfXenMIoPDLSNdkztLAApwqw+Px46VApFj/fHXXLXKujlG+6A+7JY9ok+FUVcITs
	 q8381H7Xkj/yaWUbZgedoWLtwyAt8yhvVnG7WDZicdoZ7ggJ8pZGA84iIwuRHdn3ETv/t
	 NfX7UoGHGWlBpScbYT6zTdo9EcHCA76FwxjiBHOL/vIX8+nJavGXEMKugVtm5XlW1dk81
	 D84vEaE0jm3Aqmh7vrEJSuagfYpux31bubc03UIkS+OhhVrAYw/YeMdLynxOTP9/MbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="je/RhZZm";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE976606A31E;
	Thu, 26 Nov 2026 23:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=je/RhZZm
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 931DB1F00896;
	Thu, 26 Nov 2026 23:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795735026;
	bh=fPaYYz2xYxvoDkUsKrMbXMBJUPqVTod8eYBtQmhIkAM=;
	h=From:To:Cc:Subject:Date;
	b=je/RhZZmQTwR3KMITsSUgI8U0ROIAOE410R9bgQg0vvh7cL+roDSvBIGjH0LuQOB9
	 Qzz9nxyBiN6a65piWkMBV+xOAt7N42zephvnd9ZBev9cYv3VNtz/cp+2NbP6FOmQRP
	 1+C09UtuMUDADT0YWqIGRrfs1+48UjMfznCghWJLl6dIdP43O85aWpmN5JmaZQafbs
	 qYLBruRGH/gMwKO+A22N0EY4lsNZmSmkGA16n31hx5C8MZmOtbMRtNXQTWMNE9A3af
	 dfGPC9Yx2QuFNPSgqFJMTpDNmrNjMvNatpYZMFKcyDiwk8De04ARKrJEWQl6ZFKE6q
	 +x8Uuht69ODiw==
From: Sasha Levin <sashal@kernel.org>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>,
	Kent Gibson <warthog618@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-next@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] gpio: shared: restore the atomic set_bit() lost in a merge
Date: Thu, 26 Nov 2026 18:17:04 -0500
Message-ID: <20261126231704.1303448-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
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

The v7.4-rc4 merge into gpio/for-next took the for-next version of
gpio_shared_setup_entry(), which commit cda42ff53c4b ("gpio: shared:
factor out per-entry setup helper") had moved out of
gpiochip_setup_shared(). That dropped the change from
commit 7d1d799d6251 ("gpio: shared: use atomic set_bit() for descriptor
flags"), so GPIOD_FLAG_SHARED is set with __set_bit() again, and merging
gpio/for-next into mainline would undo it.

Use set_bit() as mainline does. linux-next has the same change as a
fixup in its gpio-brgl merge.

Fixes: 45b9f0f3fcb3 ("Merge tag 'v7.4-rc4' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into gpio/for-next")
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
On top of gpio/for-next 0a74985977e8. Built gpiolib-shared.o with an
arm64 defconfig and W=1.

 drivers/gpio/gpiolib-shared.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 62c3d8a6abdcf..7f8b31ce4b9ec 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -588,7 +588,7 @@ static int gpio_shared_setup_entry(struct gpio_chip *gc,
 
 		desc = &gdev->descs[entry->offset];
 
-		__set_bit(GPIOD_FLAG_SHARED, &desc->flags);
+		set_bit(GPIOD_FLAG_SHARED, &desc->flags);
 		/*
 		 * Shared GPIOs are not requested via the normal path. Make
 		 * them inaccessible to anyone even before we register the

base-commit: 0a74985977e851196d69e5364f4787adb03a5fb5
-- 
2.53.0

