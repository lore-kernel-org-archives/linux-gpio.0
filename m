Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC0C33CF662
	for <linux-gpio@vger.kernel.org>; Thu,  6 Aug 2026 21:47:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786052860; cv=none; b=d5/4JoKV4BP2yMSKpX6uKkJkDCqKPf/xcD1xKBuCVkR5/qkQ97+Zd9acv0JkoYlxOfb8I6YYg4E+9r2G+EjrY4jd7ZUDVtcIOky1ssq+y3h3mccTTiDFxMa218TJsjHIDosISjZlfKt1xKxcZNiBSUYYmNyiDRmI3NNQREYeBf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786052860; c=relaxed/simple;
	bh=+GNH2F4aeOtIGizhRiNGDbEbL2RdT93YxRHlaG2amGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tuwDLIyWQ4LYinJ5UMyeHjvi9skwtv7RkeRlrVo+NcDz5peWVZim/8D/cN/WC4jEDDluV1YtJIDkviGdp7HW8xqBc8fdWatq+xrzioH76ZpqzxR8Orw++Oeb0Vvbhhi3EK0txOe0oWW8Oc5XxVPfS/vo9Qf8ZZhEz2baBATUZhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=o4ASzZgX; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="o4ASzZgX"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so22864505e9.1
        for <linux-gpio@vger.kernel.org>; Thu, 06 Aug 2026 14:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786052857; x=1786657657; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sn7BGT/EwF1MgKuWfdXxO2R3nAaFfm5S+vD7bXMNl4g=;
        b=o4ASzZgXcfefbBo72+PDwtz1QOkiwgkNhVpX6mUaZ7bU9qBRig69ttjDm1ScxVwhQT
         shWtLUYoBEkTnpu7Wzgr2laPSvOZ3sQWAp9sZrXCKnkp7yU3YPFbf1O9c1hPUlDvtSX6
         RrPuR33YBne1xoQoKEYNEUn8PREVrtR4rhBUENiDho0WyjXxmkj2z4aUap5j0npL0gNb
         Zfm/9z/sqL2lXlmSzslI4H98jMCPXhZXobuq3XHvjmBjV4xSlkmduhWflHFWIWtfnsaL
         uiZhurO0j34IMQPsTI8Oayg3/fiEsArZJNg7waDQzmAWY7qDV30NH4QvlVGFJ13J1BAY
         h8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786052857; x=1786657657;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sn7BGT/EwF1MgKuWfdXxO2R3nAaFfm5S+vD7bXMNl4g=;
        b=gcBINP7Tfu2sttj17JKt/v5LxBvC3zZyktmUzVDd9W5MELehuLmGTLCrXBwvTmVRQe
         T9SUYlYkc5wJNO/lwNSL/SqdWc7rwSp5/2E64f5T9mJ3vaNZxNIXiVnka8ThDSMXFdJH
         cJgodcc7dJ735HXlOYcrxRm+7FtXgc7ii5f2GICOUpiXdRclxh6RzaNLt9QT6EtTJ9qE
         cvsQKUy87HvqA/k/HT4e6DkGibsJERWEjN93nIBudIDYK1C5j63Y8t6RxIoklmtMOCAT
         wyCDo30lQZf6sDBBiP82e0R9jXD2mp3fWh3rROM5P/J4sUtwvrA6uMnN6OIGQv3T6ZiK
         m8UA==
X-Gm-Message-State: AOJu0YwNK4k9Vy4YMAaTdRTdDZDTFXAK7YnKctig0/QRU5vHS3/slkQs
	DspiXesDeFh6walJq6VIpYwww69b2Q9WSzfOLGvZeNiyLqKcs+0HX2eAXmcVJA==
X-Gm-Gg: AR+sD12hsbUP/J8x8a/CuV81uPT8sW1JBXrhF4Dy2nu1PPTlURzG+hr/pjXQ9Xwxbip
	uxPc5e4Y1ef4M2OMyKoFVhu+2AswmCz9B6t1ik7D43aUHPielCVKEn88TaX675CDzime09SA87f
	fP0dxdyZUdDewvUsRtC9ZMraQkLqTKKFWsLWdX0sJhDQ5z5C/eMk23c2GUAbeXm/P9nK6esrsyT
	Z1EZClWA7OQPHfP3b2/i66PWQX6BS1WHgRYragfWEOZSAsIXDRBXw06u5oClJVwRfd6ChoxgqtL
	P9Lxmc69e+yXvGZx7zFyIcp3t9VGCD7FYrZRFLjFGcBivs96iN3r5iUP1UeD+8QtiV3u++TeZ8c
	afjlQO7A/BfQ/lEYqIzUxCX9eN333O2o7+EjAcHg6YsUTdeVeZo8iSbfS6YOdKfsZiuwqgbGWLY
	a/ayglCDOrYoeim/N3GK22jTDXuPuYs0dM2TnAQJm011r+VHlo+jf8VO4sFhby1cXqvuVC9j9G0
	hg9kzIQYzZsTaSEJS7MTpbs
X-Received: by 2002:a05:600c:6d03:b0:498:2b1f:e0c6 with SMTP id 5b1f17b1804b1-4994e7d9949mr210592035e9.18.1786052857037;
        Thu, 06 Aug 2026 14:47:37 -0700 (PDT)
Received: from michalis-linux (adsl-75.176.58.251.tellas.gr. [176.58.251.75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49954213479sm84823665e9.6.2026.08.06.14.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 14:47:36 -0700 (PDT)
Date: Fri, 7 Aug 2026 00:47:35 +0300
From: Michail Tatas <michail.tatas@gmail.com>
To: linusw@kernel.org, brgl@kernel.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] gpiolib: Put fwnode reference on failure
Message-ID: <anUA90ZcyYp9ka3E@michalis-linux>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

We get a reference to the fwnode handle which we pass to
gpio_shared_make_ref. In case it fails we do not put the reference. 
Fix by putting the reference in the failure case

Signed-off-by: Michail Tatas <michail.tatas@gmail.com>
---
 drivers/gpio/gpiolib-shared.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 495bd3d0ddf0..5f9623e40b0f 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -261,10 +261,13 @@ static int gpio_shared_of_traverse(struct device_node *curr)
 				con_id[con_id_len - suffix_len] = '\0';
 			}
 
-			ref = gpio_shared_make_ref(fwnode_handle_get(of_fwnode_handle(curr)),
-						   con_id, args.args[1]);
-			if (!ref)
+			struct fwnode_handle *curr_fwnode =
+				fwnode_handle_get(of_fwnode_handle(curr));
+			ref = gpio_shared_make_ref(curr_fwnode, con_id, args.args[1]);
+			if (!ref) {
+				fwnode_handle_put(curr_fwnode);
 				return -ENOMEM;
+			}
 
 			if (!list_empty(&entry->refs))
 				pr_debug("GPIO %u at %s is shared by multiple firmware nodes\n",
-- 
2.43.0

