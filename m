Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B5B23D7F0
	for <linux-gpio@vger.kernel.org>; Fri,  3 Jul 2026 02:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783044599; cv=none; b=BUk4JD4+qRDsZ1eGs3uq2mnK0DgmPnBSKaJ2f16Kytcij5GF3NzbGlL8Y86jKbCk/Gyf2t+ArDooxskY2qfBztk4/2NNM0Wv7yW1dY5/C/QwGynsOfXRnRjdFc+ldzLqpx9YZYPzXH/mcM5E054EjcPkZnxvPmXj0ZHLjpp/Mg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783044599; c=relaxed/simple;
	bh=5r3nP6FZd+QxQ44+URTfI7W8Ty+jnukMpZbwFvei3Qg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bMscPVkD8lura44JE2FswfufmOoLBg89VhGgcwLWB7JRIdzlysEQlgAKulMWWr67Jpd3xFGjur1gOqaxAXnLRZ11PnYX5BYlaSbJwYHBXZHAkQDUPY7VEwfRGa6zJQLUGCZlVoH949g0wv8qWLMqufOBAo2vU0qlfafRyLE3sPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NdXh7zYs; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NdXh7zYs"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-847a69ba83dso41866b3a.2
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jul 2026 19:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783044598; x=1783649398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=41lAa+2jvLObTC10e2dWWSeglb2o24gHIQO+m0RTzxY=;
        b=NdXh7zYsnH+9s/P+WADY4yfyO1Lg6dpN5wjIeZ9mkxchc4mGYdYPskHvosOQEQfQIr
         e7XxSg7wNkaX7NODcYG5j9eVnue2Z013I395BtaEBs4GnGUCadykxi9i7KGzk7SrH0rx
         zGrDT414z2fyah6vscieCirI/eKBZrklum7ICBsXo0nl91+qMt7dbqMVgDgPgy4d2eCr
         Qr7Bn2BP8RglrsPlNr9yBVPbhFES/wMU0bL7W6TpxbUMt41I17OFieaW7FpvQhxR5jbP
         WgjJwctG18+QMN59G+xZUtxRVUsQC5aK64BEaV5w+eiSTUx0hB00py05R86M8Jl6KohY
         LoSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783044598; x=1783649398;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=41lAa+2jvLObTC10e2dWWSeglb2o24gHIQO+m0RTzxY=;
        b=MvDEkNF93xXb/u38qOBgJnSSwqf3aUCDlJ5LvsOtrgn98E2ycusAivNMt1O4zbhOve
         eOE865HhuYoNnuhFQxWWlwNOp/s8gBzarv7WNFaJNgsw/OhlE4eMR77Wtu1AppwDcuCh
         od4+PhV1liPgsaRtCITG21GtFVUQfzgECXru8gtWs6ni+HINLWk5Y14XdITB+QzG5314
         tO6DpnucrPefXmepYGecNZlD1GWT+tzWS+6hsTF2/mlZw4XnHnxUM6syRHAKjEfDUc0h
         c0AS09uIYYMmFQCR88qTStiTY9aK5h9QMNEv+cclM5xSEUpnK0/wmUsnkx3StIb5DKv4
         kCRg==
X-Forwarded-Encrypted: i=1; AFNElJ+j1Uh01oNOuKUcO28ixg4ly6L1JY+xyZJcPUPs6xo8INdwqHBhA3u0wrXsXTKYHjjc7BXuS7Pt0k8r@vger.kernel.org
X-Gm-Message-State: AOJu0YyrIOxbT8BsXmIYEQCuvH7BKZYE7UZfE49C11etLa4HLLu5T0Lj
	/WUa1xKo5CDEx4CwF0LmvA8OCMOwyhvCsx8HIAawrFkIqDMSxgKKirS9
X-Gm-Gg: AfdE7cmYiuWmhNrNV/VPa78VtQuYgXSHASBr3oIdvVoq9RVeEYwpVZjEhmJStj11AD1
	nS2jfyyZToqfzf4vTjzWOaHGIuVItDHaO4IgRFj5Wm29rDgDjkHutJImRJ19ZYT0YtIXWQYqGYh
	uHT/DJ+3FGfJLx/++XlXV3qGmajRtIkYYJ33OY6ErDnVPweIVf6BJJuDBux5WdM5PDRpokPTh24
	WcSA36C54ummtnIdDlp7j9PtVRSXrwqROU/mvNr6r15h/cXPVGe0CA7ma4BjLDnyQB5jYrocSrr
	JAoNNs5orRo6QAnYbFqG1m4QXOxq7RVr4w8NPVEoxRPShQxiC+ngi0vIywLWm3LPqX++IhaAKWG
	VLNdrgbuN0TSLN8zGRXJQyO4HOmw2Ztv5f72uGeGVfKAHOKLqA6OkO6TIB4lEBnSoqmO35XNF8J
	2/WINvxTCPChSv2pkI3V1tqeaxDsyU0KIf+rwVEzADBzVRCB4=
X-Received: by 2002:a05:6a00:22d1:b0:845:4f6b:a42e with SMTP id d2e1a72fcca58-847c0854bf4mr8721892b3a.32.1783044597919;
        Thu, 02 Jul 2026 19:09:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb947677sm2129006b3a.39.2026.07.02.19.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 19:09:57 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Bartosz Golaszewski <brgl@kernel.org>,
	Kent Gibson <warthog618@gmail.com>
Cc: Linus Walleij <linusw@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] gpio: cdev: Drop redundant nonseekable_open() return check
Date: Fri,  3 Jul 2026 09:09:46 +0700
Message-ID: <20260703020947.8010-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

nonseekable_open() never fails, so the error check is unnecessary.
Remove the dead error handling path.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/gpio/gpiolib-cdev.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib-cdev.c b/drivers/gpio/gpiolib-cdev.c
index 82f27db0b230..9f3b628d5793 100644
--- a/drivers/gpio/gpiolib-cdev.c
+++ b/drivers/gpio/gpiolib-cdev.c
@@ -2682,15 +2682,8 @@ static int gpio_chrdev_open(struct inode *inode, struct file *file)
 	file->private_data = cdev;
 	cdev->fp = file;
 
-	ret = nonseekable_open(inode, file);
-	if (ret)
-		goto out_unregister_device_notifier;
-
-	return ret;
+	return nonseekable_open(inode, file);
 
-out_unregister_device_notifier:
-	blocking_notifier_chain_unregister(&gdev->device_notifier,
-					   &cdev->device_unregistered_nb);
 out_unregister_line_notifier:
 	scoped_guard(write_lock_irqsave, &gdev->line_state_lock)
 		raw_notifier_chain_unregister(&gdev->line_state_notifier,
-- 
2.43.0

