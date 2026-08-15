Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B3C4222590
	for <linux-gpio@vger.kernel.org>; Sat, 15 Aug 2026 20:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786826665; cv=none; b=nVgud0HQfkKzIWEub4I4Gi4CDcD3DPWi86KLiuzPjTMvEShuVG4Kvyc3Nx0j/SQ0fq2o8lnr5T1SpFSrve+wYBh/kTXL7aKhK7np8SWEfObjQyXOPWCAmR5FZgWY97jfu41HWLPT16aAkcW9JNCk7LsjqqoTuPyh1SYRN2MfSlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786826665; c=relaxed/simple;
	bh=YYDb4AW2+ugFaJh0twU/wslrnwHEjjGa2E34HRysia4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HUrlv+u1XOnA6JNh9W118AJlIJMh0QzDpQpxG57GPXQq362j9xIA0zWTDZO7F5SD8ARg4etvYoK0dIZcjYiWruTxMpKfTk7rmeTyKc0lTY3JL9wf4R/1vexv4AoWQSDe59BmKAOhgoZIW9ebEMoWcaMVI8Rwl4tq8SEgys3DXvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=brUiURDW; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="brUiURDW"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38ec1402b05so1704392a91.2
        for <linux-gpio@vger.kernel.org>; Sat, 15 Aug 2026 13:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1786826664; x=1787431464; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wt7LCCD/Ptio+NnONBpjqaiYCKLt9RcqdmAGaPTPols=;
        b=brUiURDWfygkUiJD23S0/RBQoja2PevcHBLobUkwbKYCqL5w1BopPf5xH+D5iOISdR
         n8IlW93pys5yriuD2dIVfO6aKyA5GMN9Bpdd1X4J2U1PkbiUu2H6CATr3ECxG1mYD/AV
         tkpHBlvftueuZGxChpLmlckjuWQL4vILXU8N1070eOIIbA6bDeZ+Ss0FZ8W1KoU+k9WU
         qQu5T4azDOxMQdetU2Zl2Xr5GWgqqsCMZOBopqmf0pCIYWzlD1XTYtK5N4I/MGJqkmAI
         0iNRlCj5YgHGw6/vk08+F6X+mBgiGlfdOOxxo5ouh7/gAmAcVJCns9skcAwPj9jkZSu5
         UUHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786826664; x=1787431464;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wt7LCCD/Ptio+NnONBpjqaiYCKLt9RcqdmAGaPTPols=;
        b=hebZOhxDixk7nygOAW++2p1vqj0vi61io7FWUqSPg12wO24mjW9Yu5E0Qapq3pTbpc
         wSBSTugN3BhKXYDt97xGSzdlhaUyWREU+9Zz5KFDgImoM/T/iMFcWW8/YEmNRsg9y7mu
         jj9Y7Itp7XE4/nDC1o5xZQvbt797FnV36AGQ80MIzHaXPDD56DHOPxZLtGO2/WFmknxH
         W/MOP7crRwGPcZ3sWqx2ulG4g+uvsLzJVFd9spOMHb8k9/Z+UREruxLXCGPayuGjU0nX
         UQSeWYd03w3giBk85HJCPyr2y2w+khYw5CGpHXydj2eB88nGMtXjbsgd1aK1FRJjpP4K
         ay0A==
X-Forwarded-Encrypted: i=1; AHgh+RpK3nUQwQrXpiCW0OJL174JieIb+WtAFw90Lk73KJK2I5c4VQ8eroIzH3mv5jF7b8a7BoyQPxEGj0Dk@vger.kernel.org
X-Gm-Message-State: AOJu0YxX8fpr3WeqijtcU7SWMe+CYGqeC0tEFCYE2fhHvb6GyIL9QLmB
	rwOdpS/isYv5jQvMqNRPI3Aub3H27+kjJ8bFX1TWMVVNlPFuKL39uidu/vC4QQ4x6/BxJ2LkWkK
	+KIVg
X-Gm-Gg: AR+sD13kVjFyhu6kE2y3Kb1Wco5VHdir8FUtJFb9VHIUHnxD44Q0Bij9S29fA8hDtEW
	TAN6AAn4C+Zo8C64ySLFlgSuTqy6l6FZlTr8bYvPHvYutWXXkvrp71CKpLKEMXO3kHYLHHO6m7o
	ikUauYiHLIfVn5kO+ab7+dh0RHknyD7RtTLW/w7hUYv540J+YcEaw+mAVl1To2DBR+07t5X3qNl
	W3KkVyNP+shqjGAQ49JReIPID+0KFuWNKuBGzl4ILbefH+QNTzYwmUs+0dzcPtUll7ruiXNu4Ao
	bmbPFeQ7OrJAidPIEnqwxaNPGAR14awHMH8+AyAyTAIalcfxbWQwIqdkexXoBAjn6R5b0xuovcw
	ZFwOQady4jz4u36iZAJV3riHDchKbIh1tDWkIWEw8Zk+O/ZExdbJzeRyzH6DlTHHyZaIDZl/n/x
	3zo22qKaqf8aMnXuw+c9AeqpJx00bh4DowUkPNJYgWL1ecB9NmJfO5KseaWAG1tdc=
X-Received: by 2002:a17:90b:224e:b0:38e:6a44:671b with SMTP id 98e67ed59e1d1-3933b506db9mr13847954a91.0.1786826663739;
        Sat, 15 Aug 2026 13:44:23 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea8f9d19sm18020396eec.27.2026.08.15.13.44.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Aug 2026 13:44:23 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Sat, 15 Aug 2026 13:44:19 -0700
Subject: [PATCH] gpiolib: of: don't mark hog nodes OF_POPULATED before a
 chip is found
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260815-gpiolib-of-hog-flag-leak-v1-1-6126aac5f6f3@nexthop.ai>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6DIBBA0auYWXcSNaGiVzFdAA44SsRA2zQh3
 l2qy7f4P0OiyJRgqDJE+nLisBU0jwrMrDZHyFMxtHX7rGUj0O0cPGsMFufg0Hrl0JNaUWhlpO2
 l7oSEku+RLP+u9fi6nT56IfP+/+A4TrNXQZR8AAAA
X-Change-ID: 20260815-gpiolib-of-hog-flag-leak-5bac8f98b758
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Daniel Drake <dan@reactivated.net>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786826662; l=2208;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=YYDb4AW2+ugFaJh0twU/wslrnwHEjjGa2E34HRysia4=;
 b=MaZxXeleIT17gcXhJadKRfLEsMoHBMu4PSSaKKr2LNLAVQlZeAFqC+Nk9H5H07T4o3hmgIzz6
 Bg2sC0mWn2XDjaRqV0qNT74jHyaj70F1uMokkLmezE4jRF270n7Egi1
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

When a gpio-hog node is attached by a device-tree overlay before its
parent GPIO chip has been registered, of_gpio_notify() sets
OF_POPULATED on the node via of_node_test_and_set_flag() and only then
discovers that there is no gpio_device for the parent, returning
NOTIFY_DONE without clearing the flag.

Since gpiochip_hog_lines() skips any hog child whose of_node carries
OF_POPULATED, the leaked flag makes the hog silently ignored when the
chip is registered later. Applying an overlay containing both a GPIO
controller node and its hog children - and populating devices only
after the overlay apply completes - hits this on every boot; the hog
is only applied if the chip driver is unbound (which clears the flag
in the remove path) and rebound.

Look up the parent gpio_device before claiming the node so that a hog
attached ahead of its chip stays unclaimed and is picked up normally
by gpiochip_hog_lines() at registration time.

Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Fixes: a23226b7c1f6 ("gpiolib: handle gpio-hogs only once")
Cc: stable@vger.kernel.org
---
 drivers/gpio/gpiolib-of.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index 940b566946ce..f36e4b171fa7 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -788,13 +788,13 @@ static int of_gpio_notify(struct notifier_block *nb, unsigned long action,
 		if (!of_property_read_bool(rd->dn, "gpio-hog"))
 			return NOTIFY_DONE;	/* not for us */
 
-		if (of_node_test_and_set_flag(rd->dn, OF_POPULATED))
-			return NOTIFY_DONE;
-
 		gdev = of_find_gpio_device_by_node(rd->dn->parent);
 		if (!gdev)
 			return NOTIFY_DONE;	/* not for us */
 
+		if (of_node_test_and_set_flag(rd->dn, OF_POPULATED))
+			return NOTIFY_DONE;
+
 		ret = gpiochip_add_hog(gpio_device_get_chip(gdev), of_fwnode_handle(rd->dn));
 		if (ret < 0) {
 			pr_err("%s: failed to add hogs for %pOF\n", __func__,

---
base-commit: d58772d8520c7ef247c4b95c9bd76d3a25da9ff5
change-id: 20260815-gpiolib-of-hog-flag-leak-5bac8f98b758

Best regards,
--  
Abdurrahman Hussain <abdurrahman@nexthop.ai>

