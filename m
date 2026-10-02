Received: from mail-ej2-f41.google.com (mail-ej2-f41.google.com [74.125.228.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 310A4493D3A
	for <linux-gpio@vger.kernel.org>; Fri,  2 Oct 2026 14:42:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790952133; cv=none; b=WzVLDqyXKeuPrFNVMSyz0TnRGWBYkLbcG2ukD1I3VYbdiwJFvOqqX8DnlX0rNrCwdoVD+cla8WKyTOXpRGTLLcMa9jkBn/bWfX6ifgdtgSvyMPwOkl/2zp9kaNduknngF7U63v+OTAWGqQrz6q0oS7cwz70MzT52/SORdEA7gAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790952133; c=relaxed/simple;
	bh=HkLu1z/SbgPFtEWdAtjARd7HcyvxzZ1BbkfT7JyKqUA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XPv5OgVN8a6Pu7HDxMXDvhfZCHgGZ1ExDWkLLY7NWRhEjBfjEV2IaLhyFIdvJxEzvPi0za1QUoZk11PlMz5qQwFmOTSNTbU42BUV6dRsZvLVYGsSUR6dELwHpCIOGj097wtiyEpjd7uhASn+qR6ABDgt6atHaPuEynMzmaqg1HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EHjS9QG0; arc=none smtp.client-ip=74.125.228.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EHjS9QG0"
Received: by mail-ej2-f41.google.com with SMTP id a640c23a62f3a-c2e3453dd0dso19114066b.0
        for <linux-gpio@vger.kernel.org>; Fri, 02 Oct 2026 07:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790952130; x=1791556930; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k5F3CEI3XgaKuf1OwNaDsn6tE9wpJa5Hz1OIv8VbsSk=;
        b=EHjS9QG045bwagcPbNQtae7CW+a1yd4F1WcmeFj+tewYCwMgDAfWxj793t5uYE3Qwt
         J9OVspADSNaSkW6VgNs13WTu5weMKNwhuQpV1KYYrtJdf1woTm5CRBHGkD+U9ySf29ku
         aZro/2pl62qfLnDsEjreDqesfY//Hrl3pNuwYysg/SS1HXDL5/5qyQAAW89tdAu2+fKe
         VeTst+Jt9WZyyvX9UvxBjIIzk+iSy5a586PqmTt/m+TAmhUO9TH3v+go/TTijJ4ZQWqH
         hXwjnxX3/yQwmmS5is8RfNAIQx6h+za1dBj/NgR9pGl982RqpwJr1xMaqPq8abKsb/Ow
         z1WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790952130; x=1791556930;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k5F3CEI3XgaKuf1OwNaDsn6tE9wpJa5Hz1OIv8VbsSk=;
        b=z1zdqTqZxAAnLWIyalGhJ2RXBRNm67iCssU30iJyt0tzjRztQUkNHUYkLscktTQVaR
         RZ3StV+IksUCMfhoqwu722ltXV2bULpAgFc1/QbvvVYEC0+54PcHHKFT8OJNKGQsbZll
         +LjSXPtVAPKzWFWMYharv+SMckxABePet96x4pRfQrDv91qWxq6q33YnOO2ggF3DCzF+
         sUyD2yzTSUY5VRBxuSjLL1O5SzBwByZMFfwM4uRQ3duao8NZ0j7i3NWihuTv3o6Q7cH/
         uF84jGKEHxfzqUuaSvqJgUKyZ7ql/a8m2I+y501K5EiKrN5m2nHLYnTj8/dhZvzdUpVc
         LLQA==
X-Forwarded-Encrypted: i=1; AKwUvBz4NPKdNECBvjp9DFLcDdZdWfDTJnREqNENp21lNHVl96IUVgFGS6G2h/LYnc1OOh6h+MUlxpz76Y50@vger.kernel.org
X-Gm-Message-State: AFuF++mLruOs5FAIqIyuGJITdI5jtMqOK2VjO22Da4fxb3muF62unvQq
	lG4fK4NsuTBZRw22fzvxdTK+QP9mY4FlG6Go152qH2nQ5kQyIFvju4gP
X-Gm-Gg: AYBFou22qH+6AwuxC1C6fOlEvhVAdFfL/kZmoerH5UvLpe50YDuTC2ncNGu0mYWF+oz
	UR8h/h/OAW1YacmhPyJa05jEtG24B4sZCIAsomxFsEw1fWtOobEn1fmC7rhuuDIq/Qe/TeBt2Fv
	qV+DBocULQs7aa8foGTJQRdngUnm+wpl9TKHWGgrLQnl+SJ/wYnVl0Eupnymm1UzWVTzcp3nQa2
	Apz0Xh8Fn/TWrIUOew0kp0ZH0UVP/0jWfZhtDLhp/voQzlYb6nJsleIOsnrWSRFJXIaaSqDrXbx
	Cf/pdltBY9VWm0t/C/44Vd9geV4NwijDpoNQcKUR9GamDfGcs6x3GpGs+AOGoiR4wU0NM4zXIst
	bDaCqPS5FrjdC6LIZBMfsOZsrfHth1NDG71YWmB7yAZ8C1/MbRLduEJkaSzHeL7PumRiQAonmlr
	PAtzQG3CjiNQ1nzycJMDAMCbzJicvjXS+OuUoMDhMJKiML3xPKlKPtxY4gV4w0SL0Mqa8=
X-Received: by 2002:a17:906:c109:b0:c2e:378c:8ce3 with SMTP id a640c23a62f3a-c2e4ad81a66mr241243566b.32.1790952130085;
        Fri, 02 Oct 2026 07:42:10 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e4cf7c341sm93304466b.55.2026.10.02.07.42.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 07:42:09 -0700 (PDT)
Date: Fri, 2 Oct 2026 17:42:04 +0300
From: Dan Carpenter <error27@gmail.com>
To: Long Zhao <longzhao@ambarella.com>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH next] pinctrl: ambarella: fix NULL vs IS_ERR() bug in
 amb_pinctrl_register()
Message-ID: <ar_CvNPWBA42BAlx@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The devm_kasprintf_strarray() function never returns NULL, it returns
error pointers on error or a valid pointer on success.  Fix the error
checking to match.

Fixes: b40e9d140c24 ("pinctrl: ambarella: add CV75 pin controller")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/pinctrl/pinctrl-ambarella.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ambarella.c b/drivers/pinctrl/pinctrl-ambarella.c
index 83afef6a123f..5ed1010c5ce5 100644
--- a/drivers/pinctrl/pinctrl-ambarella.c
+++ b/drivers/pinctrl/pinctrl-ambarella.c
@@ -426,8 +426,8 @@ static int amb_pinctrl_register(struct amb_pinctrl *ipc)
 		return -ENOMEM;
 
 	names = devm_kasprintf_strarray(ipc->dev, "io", ipc->data->npins);
-	if (!names)
-		return -ENOMEM;
+	if (IS_ERR(names))
+		return PTR_ERR(names);
 
 	for (unsigned int pin = 0; pin < ipc->data->npins; pin++) {
 		pindesc[pin].number = pin;
-- 
2.53.0

