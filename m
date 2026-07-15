Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D776D481FCD
	for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 16:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784134574; cv=none; b=NfOisx3V2jUT1ftOWSm5Y/am1dzlrydzBMlB5mZ75U6BTH6njblqtOM91nLPHzvyOQZEFH88pTTpNiifL9w3d6Fb+c4gezp7LWDU77OOkm6q74Aar/OywYzAnWSIDYlmYAnBaKzY/DmG/l8cNWrLxq80ZAlI1xWIhxFglConxRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784134574; c=relaxed/simple;
	bh=V8d6/iGROTnYyhmR1WbpzEmeMZygBh0v+CqGCSdvD9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YrmXR1C123Z0Gok2F8brLlU1w+OFkthxzunA1LCMyuaoUMkgo57jKLEc8bCewMeu3K8FNCoFCXXnK0fNaXAlscozubrrGmNXctvuhs/y60wWfli4ltOLU7FGmSVBgz0j6YXZVA0arbx8ckr1Tns3aV/anaHHS2Z8ck9Zo8Hoqwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=Jltbrm5p; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="Jltbrm5p"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-493b779003fso24744635e9.3
        for <linux-gpio@vger.kernel.org>; Wed, 15 Jul 2026 09:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784134571; x=1784739371; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1oTeSLV1thkBfwriINCaK/hChud8arHNg2YHv8Jfbts=;
        b=Jltbrm5pgx1FnPP63a0EWP+Hpdhr8esWQYmUF+bua4zgLZ/ZfRobPT/PiKCeIPzhl3
         tYo+w8Y4Kf0NrmbnW28esVvngTcImO1tbjgCh0g9wAiufyTj+/w4f5/f7/078qMlSuQZ
         KzOs9YWiBs2P2HhKIEHODUVJPmiKkP6lVlLc2lwOILC2cmTsTWBg/aHBoSEPYDdxgHub
         79G3bwst4e68WGWY3G2qXflB0VXyH1srRxI5rFFFRbFMIrNd4RdZCIIHj9uPKz9flV67
         V+LIucCa5rM8XY0z+Oh3S/Md7mot32seeiOMb894uhDrBAqBXFpu5rrfk05u2zZv3y9Z
         huXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134571; x=1784739371;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1oTeSLV1thkBfwriINCaK/hChud8arHNg2YHv8Jfbts=;
        b=JMbAPpor7uPs7zQaYMXdlhtXiRTubVCDUNTR9rWU7+OB4vd/1GBnNnIoH15/oiBQXF
         6zqRUlDoX7Ozf1TD189Q4V0nMsoAIYxeBQuTs89NahczCeQ7QWvYrJ6wcsl+AdQ3/ppV
         XZPTQ+I2uIRdbN5shd2S8ZER0b78SPlHxCvHKc4BnKWVgt+SB7u+BOClhAa81SVc4EKc
         ciAL5OilgvStOmoADX3a/BSCOpjj9drpD0frVC0jsUsKjVDB8N6OECUIKTihG1L5cjOa
         Ej+txA+AQfd+1vkFCvU64Epn/w5QVS53Tmyp6xbU6Y0VWpETP/QrH/3cNen3LjYqAAxa
         rSew==
X-Forwarded-Encrypted: i=1; AHgh+RpodYTFCMiCe99ynjBJlFFzgI+cNFOeHEwqigNo4W7XZZq1Pe/ejZm4sBNCRzNByaITJ1A63KAWFeAn@vger.kernel.org
X-Gm-Message-State: AOJu0YwXGZTruUQ4QAAZf2Sb5PT7II/18Emh4Z/5lBB4C72BtSgIKCTI
	l4CZpsbYiseyCSTdLK0jKzCZd8K2nFGTWhwASSyKJp9NVWLPst4hCAnktCqjzRqdNAw=
X-Gm-Gg: AfdE7clUL5x3Q2PH918kCa3eB38MnKsEDzYs84CzVx4MRJkg30PfVK8cM9yCMADB9vQ
	bWw8UEl2556OPwP2BDfIZOW/0MuXxzBTQo75x26MEWWbBE/9V8y639oXIGYrQ6xPy//W3/0S+0i
	mwSzCYDZfRUvZRlOEWMTSZ8ycpbkE3hGT1yd3Mtc899nDWjSpBdK252R4NYb/Vld8SAQRL0YbOz
	F7ytAE5BivseDZ6O5tyxBruWhZDT+qTJEnlEgl4FG+XA1X6V8nYkBNoSEGkjo1pnpPD0+KSoUoj
	RDGXEXDavY1eBGsUAtw9p1x6xa8dE4tzfFrofDH/tJDNBExy2F7uSbK3V7hdw0CYML1Zn0a3POK
	iX9aMgOmU9s89K0OCphoelFUX5thYNPI5o/stxuQPXg3yk9yS0mpzNLVzniPR85MzLsGtWuIl8S
	l3yluVQXGznS+khDXsR2cQ42TQQ5JvRNMz0LZto1LLXXiYnGaz5M7rSMW33s54pKzRJCbF+AuZI
	Z0=
X-Received: by 2002:a05:600c:5292:b0:495:40aa:d982 with SMTP id 5b1f17b1804b1-49540aad9a1mr4948285e9.6.1784134571208;
        Wed, 15 Jul 2026 09:56:11 -0700 (PDT)
Received: from localhost (p200300f65f47db04249e031dea91a10d.dip0.t-ipconnect.de. [2003:f6:5f47:db04:249e:31d:ea91:a10d])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4950a2f635dsm171324075e9.12.2026.07.15.09.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:56:10 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 06/21] gpio: ljca: Drop unused assignment of auxiliary_device_id driver data
Date: Wed, 15 Jul 2026 18:55:11 +0200
Message-ID:  <feaa1389121f4ccf9e948dae4e6bef9b2498e93e.1784133987.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
In-Reply-To: <cover.1784133987.git.u.kleine-koenig@baylibre.com>
References: <cover.1784133987.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=981; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=V8d6/iGROTnYyhmR1WbpzEmeMZygBh0v+CqGCSdvD9k=; b=owGbwMvMwMXY3/A7olbonx/jabUkhqzw3RWnmhvSYkWsXO9NYVYpr8mtyzjGIJPpb3Zqdc7Pr W0SV7U6GY1ZGBi5GGTFFFnsG9dkWlXJRXau/XcZZhArE8gUBi5OAZiI5X72fwYVydWKhzY+5RZ5 ucPiyXP1Pbf4Xhvqz3TevmefYOY3L77eSYda3FT3h/iFxS7TEjGa5y8tkuRlvCa2wqnzFvd2VUX z26lsE8XuxgXt3G/A9ehUpTbXoU1shb6vq39Hpv1g64+P3GlU+pyXx8EqcYP+H3em5weVGNQD2A V++u9f1lgVUVkb8PJUsKiHY1LRqeOr5i3K8l1REnhG5csbcYeUmz/d288yvjhm8+jwn4L8FJnO/ KMqoRm2Nw253zRob5stPLtp+7/1bw1Lfk5qEz3u8XGzSJVSg8y3SNeGr9pvVktX5wY0GjXbu69e 5qjhYRhkuefzrDoDjq97m5I2FPXqrD6S0nVB+cK2NnMA
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The driver explicitly sets the .driver_data member of struct
auxiliary_device_id to zero without relying on that value. Drop this
unused assignment.

This patch doesn't modify the compiled array, only its representation
in source form benefits.

Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-ljca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-ljca.c b/drivers/gpio/gpio-ljca.c
index f32d1d237795..ad5dc9a3a119 100644
--- a/drivers/gpio/gpio-ljca.c
+++ b/drivers/gpio/gpio-ljca.c
@@ -472,7 +472,7 @@ static void ljca_gpio_remove(struct auxiliary_device *auxdev)
 }
 
 static const struct auxiliary_device_id ljca_gpio_id_table[] = {
-	{ "usb_ljca.ljca-gpio", 0 },
+	{ "usb_ljca.ljca-gpio" },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(auxiliary, ljca_gpio_id_table);
-- 
2.55.0.11.g153666a7d9bb

