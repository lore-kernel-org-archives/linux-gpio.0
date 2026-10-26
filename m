Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032197;
	b=vJJoSb1aXSarNxYDw33bWSEZdzrjJsq8R6K2bQAY1wXQGsSXvq6spz//t8G15br+ONUF
	 hxK78tXM0TptfBDr5NDJgglgGm2/eQXjCje6RYOU9Ybc8gmzruyPDjperLkQ0MNCSdZh9
	 h1I4Bf7qg8Qapx+tumhL2bTGC+kVg+tdyrhpuLoW5cbmfBJmf53rmQMdBQq977NWw5cbR
	 x+RgbxGDPBIwwLoFcWqVlHFO42xuHMWN22bMsfDqSGVRb1Zl0VCcs4AOkK7+4dhtLKz0G
	 w/8aEcmQ8V1jqNFf/eA9EUamQlOGpLMFpzgmvWCQd9TotLr/c9BeH2DrwEagS38TR6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032197;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=08drD1ymTUi9hsmUJNZ4ArGmW7O1mMyycL0HsIwG3PI=;
	b=cMHt7tzoQtes7P9OCikVjy4HKFRnXSVwTiXgFEEjrb5dCt0EKziv+VHdoVcCs8M1ccPK
	 mC1gdL6d9JBtKV9IEQx8arENYpj53K2Tl8Gc9y3bKnRQ/Axi6cLT6lJLiLW/G0dsXQmru
	 6WjhmGNbeXYmM+hb3DhxWcFx/mlqI76+mxhtnOTZ6jcYKG4OPNcx9ishs3ASzbrqFrvvQ
	 kp8Xg6jo4rkmMf7VV25kjbEZhayv30yon/0Du6O6AKNllqwnoD7tNlhdA+vJm41H7hKUM
	 OT4M7R0Qkq08QJfQO9A5a4ZQU/Pdg2ndPDKNVFosgqCiKWzqmV7UuXPF4sX3Q/T7zAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b="amHo/jsa";
	arc=none smtp.remote-ip=209.85.128.50
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14FD60A3838
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 16:29:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A14FD60A3838
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=amHo/jsa
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso15320825e9.0
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 09:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032195; x=1793636995; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=08drD1ymTUi9hsmUJNZ4ArGmW7O1mMyycL0HsIwG3PI=;
        b=amHo/jsag43OcljCOXW4vz3z8ua3VyuUOPYTMKVde2FieVi/yc1yuhS8dDJuoP+jjA
         N+BU+M/cvgwzNqMlGcOYDTxuEviYmgKV4ruodeCVF6OGBO7obOkqNT2pGlGABrjFPt3O
         vsDLsrPrgmcbPS2KPTbjPmyceoHK2Lqxfi+yG80uJqltRWWlejpRGr9lwsNvl7HtecdU
         iCOIRkJ+ywNsy5s0HCsba4eDp4Bb5oZX4b9M9hjNVNcj17Z35yXWilh/QLYZf/h+z1QU
         v/IK5VMp+NJMpUQCcPttzbOTJ9c/o5oqEsr1ZtF8tzMCizTWSIFBNuUdZr/cWtSIJ5og
         HpfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032195; x=1793636995;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=08drD1ymTUi9hsmUJNZ4ArGmW7O1mMyycL0HsIwG3PI=;
        b=qYcKhVD3ipy3U0PL+lWatAkGbcbB4GOsRmACGRwR4AXKreA6GBT6uUhc0fg4gts0xN
         gl7Y714Kcpx15rdhhgtTd3Ko5aDUtqX9KiT8zZG2hIPg0lFgWQc2kdZnfAo2kKVxnLGX
         rpCZZOKAOuJzlHTI2HAebmMcwZC7NW/9A4LEPKrXl+eOC6weEsj9sB+S1L7pNcSXvmxu
         QhFYI/QAxkTDqO4PIfGSxXwV/SE98R8ybZ3dje8gC/WiRyUKhHKfgEC4JQbjJEu4TpJH
         f0QxJKyYVM48IKsgPRWvplBShUhLHekz1p0CSpnx4p5oXs8NrkGZIiPwkzalN+CSHDx+
         iNsQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTtFCMvFSVwZrOrqCo0RxzlEDUojZlBL1SoW6+XNu4nlKgs/lo4qy7gTadSYg/hJpsmqgXOPvTukRI@vger.kernel.org
X-Gm-Message-State: AFq9FYIEz3L26sJEONZB6GQNqeJRK/ifH5JPJgHKgg/sMR71wIPU7sEL
	Yp0+6Asc3wuOUpgsAlXdeLj2S7Yqij0UlzSsbkfppeGD7K5gEj45EgX6eSqM4L+GaSc=
X-Gm-Gg: AYBFou2/t0seqzuiT/ousHR6ucrO3T1HM1poKXOgQR95fXDx3Nk+eZMvAyS72QDD5P+
	T9bbubBrxrMGVxUvCFYXJrZk1q66ZXKmi2h+cAvhqkBOOVVfLJLXDOdilTFnSlXSftEm0NLDc/s
	4OR1sWuZe6+2cb+g9PUzZ5kxSDioCNqwdBbMrLVrfDtt9qcwumiGxJf+u06E8zyYwGphSMMO+Hz
	hqvyebI7a0FHMY26zPIK30AzeAiGT0LoTyXapQGu6fmic3K1lI4lUlqEVLqaacPrj2YBg4Suddj
	XNPCXSj2pXMFW7AM+036xcrg/BgajqIRC2wUlJ5389EBJtuZY8BkNfyRfxzG6U3Jvm7iAVvb4Lt
	3I/NEpt2+kZCFl7A2sM90PA9pMO+TLQfMky7h6M8xp3dueNjbE0WoBYexxKNBJuIr8H/yixIuXH
	EcHWWhJmQtws5UklHrr0zV6D0r9AJW6hNrYVQr0SWp4/2RbEW5EzY4OcXw9n8p1s1+t95KUhx+4
	+D7ArDDwlgtG9Xsevn6GGxPCTflt21bnEXq+9ANg9jQ8/A54w7RyP2hYi+sKyzzQM8UoZYaW4HP
	qBCJPGWUOxNOvjQeW5Vch/X1bbgntHRDjQ/l4VWDlZUz
X-Received: by 2002:a05:600c:4e43:b0:4a3:5991:719 with SMTP id 5b1f17b1804b1-4a7776698f9mr22225345e9.31.1793032195002;
        Mon, 26 Oct 2026 09:29:55 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3ebd49afsm17669401f8f.35.2026.10.26.09.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:29:54 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: "Enrico Weigelt, metux IT consult" <info@metux.net>,
	Viresh Kumar <vireshk@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	virtualization@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Viresh Kumar <viresh.kumar@linaro.org>
Subject: [PATCH v3 16/22] gpio: virtio: Use a named initializer for virtio_device_id array
Date: Mon, 26 Oct 2026 17:28:27 +0100
Message-ID:  <214191c76607fa156b8c9d9209ec8f4e49a4b44d.1793030820.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.56.0.rc1
In-Reply-To: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
References: <cover.1793030820.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1078; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=HvLKZnIb7RtprxLD/D+7QxSMDdlX02hi9zaVYI1agxw=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq33/E2/88AYjCtY1NH3iLuLQmQBlGZKTuZPwEN I+ROn5ltvSJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat9/xAAKCRCPgPtYfRL+ Ti09CACXlBrBIggIPRy7K+bnoOgAplGl7A2GNsIbOzirBWsIaPJ2sZoYQcdMyaUJ7dyRvMEXVbW 4L0MenSBLD1aCJBa1sMnYOMhhp8r5UL7zjAmh/SiFLr6pzbUPdtgqE5PTo7t6yueD2k3HBmQ/0x 3aepLEUro6ABLL8k3sKyfLFK18CuxIYb5BggqhKSQHjbN661TVZHaT+oFi1PkgaCWI0qSMn2jMB cizrNJq1w7ITdmWFrRo/RdJELM8a1EnZw/2y3/Whjc6kVbLVxxnBHm6F7wsZhJLgDCdt4dPBhLC dnbcvS1DmGYvPVju+7LvCxleQFfL7OzCNCctALVZU66wcsq3
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

While being less compact, using named initializers allows to more easily
see which members of the structs are assigned which value without having
to lookup the declaration of the struct. And it's also more robust
against changes to the struct definition.

This patch doesn't modify the compiled array, only its representation in
source form benefits.

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-virtio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-virtio.c b/drivers/gpio/gpio-virtio.c
index ed6e0e90fa8a..42871db05ec1 100644
--- a/drivers/gpio/gpio-virtio.c
+++ b/drivers/gpio/gpio-virtio.c
@@ -646,7 +646,7 @@ static void virtio_gpio_remove(struct virtio_device *vdev)
 }
 
 static const struct virtio_device_id id_table[] = {
-	{ VIRTIO_ID_GPIO, VIRTIO_DEV_ANY_ID },
+	{ .device = VIRTIO_ID_GPIO, .vendor = VIRTIO_DEV_ANY_ID },
 	{},
 };
 MODULE_DEVICE_TABLE(virtio, id_table);
-- 
2.56.0.rc1

