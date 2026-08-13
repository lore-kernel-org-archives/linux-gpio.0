Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B785439C013
	for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 17:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786642615; cv=none; b=LM/FK7qz0UtxOkIIbMhaH1+gRyYo0xdV+K98wAsu1CCcCpnCW97WLjaekiWL1qlo+nXXXfEQv/jcJiBgaeffSfYQWvX2zLBNk1Lv6nGp+FQu9RtoYGD13zf87Dskrtj3A+znhj1NJS/yNvyaqY5O91wQPXbq/leut2MzqgZFD3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786642615; c=relaxed/simple;
	bh=BdVhuTOIb8CM1C0Z2pwcAVyjnRIeMMoFvnQIP2GWqE8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HajWCHh8BGwzWoUknxr1kcOYmSmmu3VKS8y3o/dDn0zg8Tu+HG3FvVjjskvwh8VObXt/aoHVVRfiB1Py3EaH47DYzK/2SQFnN69wWVZ2wMLlITymSrVRBEJ9kZkIrMx7/HIUsNbaLP7sROwyFK27zmBjhtraIaZJ5bOZkAd/qSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Se/Yg64F; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Se/Yg64F"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-480001972b8so34237f8f.2
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 10:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786642611; x=1787247411; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZcQJ8CDeUi2Xv2AodUPmyd0eqQd7G+WJbpf9TAChEp8=;
        b=Se/Yg64FKDh43hP9/phqdKgIKCox3OlaAvCy4vKB8C7cEYVAE1x9NQw9kbYU70fl0w
         b2qQEblKMgPs+jGlGrLm7Ei4ACLCu6Wik8h0rgGNQg62o+aSVrdLzoWwe6sSNjWjXkQY
         fkxLFepJVGAEA7AJNAvDG2tVCqWQMIz6l6zF3iAD1cR2omimPh87Rnqx9Nh4E4bw88Wv
         n5/w0KWroDWd2bGr1GzqBV7GeBoNuiGMZGVvvZI31l3V62yIP7mPoekhU6TMbjJ7BV2b
         33BsKhXOn8gQ57dja++SpFUHyXfPiJE0dzs8987aoxBUGQKRkPTI04ENw1/w8LlAhYqu
         Ac0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786642611; x=1787247411;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZcQJ8CDeUi2Xv2AodUPmyd0eqQd7G+WJbpf9TAChEp8=;
        b=IED52Nez7CrD3ch7emYKzNIeTO7Rg7Irqi7+10T3ZJFTAukmsxlEVrw5+xBXRRvaJS
         di1dD/beQTZgKWFi/mwzPGdyMxzNRsWOJfFvkZ/OMLCtyTmU0fNWD7nXimmTf2ZCekv9
         vOAjGIleI8+ToW3sPYIV+MoW0i8LLnVWIJ4ihLKRTg8Y+r69kbRyzPQBaNHfB829KtIi
         apKx0NL0rxtKtBq1wO0jCq5LbE/Nng6+wz2/PRTryvQ1L2umh8GKaVtjKMJz6Y2ZDiSS
         2FJaoT5Qh0zTU6ESBI4Zmgu8KfZOlpaJqbsdVQuHxRv15RTbOKZ9EFLgUdOg419vYbWk
         BmYw==
X-Gm-Message-State: AOJu0YzZBBsTRZ5J+N7a/jJb1dSLlmhXN3323BTs5dQIa6UA3wprj049
	8m8GGlJaHf1ByL/UAXA9oz/QP8PyXPo4yDEInTcrUsp8WbHpVn7uzKjq
X-Gm-Gg: AR+sD11orQdA4xvZMULlMyMysvX21Y6XcD5Jw6ULP6QgJwtYBZEzIRS6VNJj1q0Ls6k
	+7Dcf1TUct6hesWEULfTCFQLGpvYGxiPaBF8zp3HEDORYgXm/bhiqyhJ0TuZJ89hHaFRkYBP94M
	MGPp7tSwVMjA27leLCSZyQW7E+2NOADbkYO1s8ckMJ6okg7slAE4e0LN8+hlpa8iNEk0B7TT0Pv
	zInE/WSZ6P2fA3jqYJ9fIaRXITL93xgV+ihTRsMfOa+cN4IX8PKBnSe+QwSSSG5/1W36gBwdeiD
	X9Bi7QP8HsEUOJtAEE7lUbGBEBcUsssQwgpu0AkrEa/JuZ3MbKP8vIVWu7E08NBmel6neQ5O6xW
	a4rmoXKMCHHO2fqHkn0a7AvqMEiUY8oocgyeiJfRFiCoBS/r3INgnOwU8DyOF1rDRqQ9zj6l71r
	fyoSIDCn2BdYx4XQNB5yoOS23iEXbOJ7nRsx3PV8HIeZc1wM/vMBseri2BnjRrvpRGqQHfu3YI9
	MD4bo2dJdS7wFSvO6bJdT8I
X-Received: by 2002:a05:6000:11c5:b0:47f:7b75:9dfe with SMTP id ffacd0b85a97d-48159cc03a1mr9333850f8f.8.1786642611456;
        Thu, 13 Aug 2026 10:36:51 -0700 (PDT)
Received: from michalis-linux (adsl-75.176.58.251.tellas.gr. [176.58.251.75])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4815f1ffffdsm852124f8f.2.2026.08.13.10.36.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 10:36:51 -0700 (PDT)
Date: Thu, 13 Aug 2026 20:36:50 +0300
From: Michail Tatas <michail.tatas@gmail.com>
To: linusw@kernel.org, brgl@kernel.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] gpiolib: Put fwnode reference on failure
Message-ID: <an4Asr4tx3D2QvLD@michalis-linux>
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

Fixes: 49416483a953 ("gpio: shared: allow sharing a reset-gpios pin between reset-gpio and gpiolib")
Cc: stable@vger.kernel.org
Signed-off-by: Michail Tatas <michail.tatas@gmail.com>
---

Changes in v2:
 - Added Cc and Fixes Tags based on the review from Bart

Revisions:
 - v1: https://lore.kernel.org/all/anUA90ZcyYp9ka3E@michalis-linux/

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

