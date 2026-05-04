Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55523033D6
	for <linux-gpio@vger.kernel.org>; Mon,  4 May 2026 07:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777881348; cv=none; b=vFINaZ4jXVzvNjTQN33p7fu2j0metJ1jODV2nkLsjSeJoH1L5WhiIg7UL9EyMUtDmKAtegxMWftjTxvmbjcQvxWv3fW4UMVvh8Uhcy1wHVTnBs5aCiOMbB54jbTsAN9hDmRRohNmPGOv9bKmjNCMczd2vd12zUUFfVmVPuuTJ+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777881348; c=relaxed/simple;
	bh=QvyuQCHEboflnCCuN9D1S+AakS3CU2JEIrh4zt6RoFk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=h7t7IumGYIJgODwd5xSJ2SPH1JqkpE2uVbdbYNdTIGlP1m17cUFxXvE6Sx/g5rPBvmbNmpqLnJcKFAdFel3lanV938v94aqLHv9xu+SPtS3rG5DtKHvSfOfhLzwYrfu/3zlLezpP3Zj/NF2EUlT45B9CI4EnnG46iRPbfPW6vb8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=efazWtJF; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="efazWtJF"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2ba21d32776so4968695ad.2
        for <linux-gpio@vger.kernel.org>; Mon, 04 May 2026 00:55:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777881346; x=1778486146; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VHjgl/1wytnQCLsqD1P4cixgWTDwTcW8CasfAcSmZtM=;
        b=efazWtJFMn1wtsgSj5x04JNWM78Z1xmHkWJmdPRua9nZ/tJFtOupHyBbrD2VoDfiOK
         Thgn4zvebLiZ0WfcvGBUaN+ryy+GTcVkNDCaSigyubNSgxY7Om5MxuQ1v8LXQjwHYs60
         XLd70OgsHq/5G0TJvpaQT5jBXuGGyBXpyPC6q4wMhTkGoz1aJEaUrOJlB/3cIJnQl2bU
         Mz0y/cjlsTnBD44iNCTovhAVniS0sGydb7vvV2Il+J6QWO9qd1j1aWuHIXdYtelEYNLu
         QzEayaiAvFOwEjfnPOkxQFwT6hYVh7C2E0dEb5qS7Rg/BMOyW2b7/n/+uQtYORH4mCuI
         aLaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777881346; x=1778486146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VHjgl/1wytnQCLsqD1P4cixgWTDwTcW8CasfAcSmZtM=;
        b=VJ61TWDfMjn/bVDZlOVB/09E8zX+w8Ga5+TiZlvsXpHX4AaP3yYLh/H2161Nbe1clj
         3uX66ZvCRJPT2cDBO50PAL1rQumze0AyTGXrSmowcJkApAwazSdNA+PJpo4HKODVQtbW
         RMZnkLceOOkSpse0gx7rapCopRNJr1BV0cJhIAg2JODoXKlk1dMhtd8glqOKytYjj1vL
         CWXe9PPZG9ZezM2MteWkMzRaUND+Imeb2a4K5yiBmO8RhWw9+QwQlYavf+iNVsInLL+C
         YBb2SFRnty3GIJyKHd0wZA6YIIZiEvOuTofJjNGmVPzWmwE/WyDXcxom4yNJszt5vMSB
         QQFg==
X-Gm-Message-State: AOJu0YzHJ0Zx003iRAjSC0L482h0kYLXTom95zZyCXpqR62RV7BUKQvv
	+qJLLuT7P0PTo4Uj3L7+6H5R/8glETKLPa4dFRrZ9/uH64884kmwz5yXV2c26g==
X-Gm-Gg: AeBDieu24+rVo0U9lkdRXe1h7Oxv7rQFmbJGgQMZUuK8yBhnVPod9R+EI+OjS0twR1s
	WjkX9RiIE9TP6Zq5EqGLBrlNCpHRZbsvDgGxHSzmm0GnxDf7Xz83dlF+rO52DNr83CUlVIR1rG2
	2RmxWkID4oLuMTkXh9BPmeKftxUx9xDBNwJsmN/OLB3w0TxIVu9ho0DN4ZAlIMOGfownzcHOxjt
	7aZXrdp6yPTGlcOfin0eNCU86hOC770v5fKf6U1pH+qSKkjE34IT2ssi2rXkvmjyV9ZfjFDkj/4
	/uKAymec0DzCbDuwbrC2FOP5RfoltmqqbvSO1emSUpd0tKY8iU9HKF0fXy1QAh+8hawHaXrGQDd
	JmvxHnzfggx8DhSWfS2z0ppX2uN/eV/JOX4qle0DHlLzQ5rYOTgKJA9RqORBHXmbaF/nU37ZvII
	WhcGtL5oEaHUjOxr28MCugOfbBgg==
X-Received: by 2002:a17:902:da83:b0:2b4:5e65:5d0e with SMTP id d9443c01a7336-2b9f25575d8mr82184115ad.10.1777881345729;
        Mon, 04 May 2026 00:55:45 -0700 (PDT)
Received: from 007.. ([59.66.153.14])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae0f67esm99898255ad.51.2026.05.04.00.55.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 00:55:45 -0700 (PDT)
From: Zhang Xiaolei <zxl434815272@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: brgl@kernel.org,
	warthog618@gmail.com,
	linux-kernel@vger.kernel.org,
	Zhang Xiaolei <zxl434815272@gmail.com>
Subject: [PATCH v2 1/3] tools: gpio: use strscpy() for consumer name
Date: Mon,  4 May 2026 15:50:34 +0800
Message-Id: <20260504075036.12190-1-zxl434815272@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260503190016.13439-1-zxl434815272@gmail.com>
References: <20260503190016.13439-1-zxl434815272@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace strcpy() with strscpy() to avoid potential buffer overflow
when copying the consumer string.

Signed-off-by: Zhang Xiaolei <zxl434815272@gmail.com>
---
 tools/gpio/gpio-utils.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/gpio/gpio-utils.c b/tools/gpio/gpio-utils.c
index 4096bcd511d1..176bccfcccb0 100644
--- a/tools/gpio/gpio-utils.c
+++ b/tools/gpio/gpio-utils.c
@@ -82,7 +82,7 @@ int gpiotools_request_line(const char *device_name, unsigned int *lines,
 		req.offsets[i] = lines[i];
 
 	req.config = *config;
-	strcpy(req.consumer, consumer);
+	strcpy(req.consumer, consumer, sizeof(req.consumer));
 	req.num_lines = num_lines;
 
 	ret = ioctl(fd, GPIO_V2_GET_LINE_IOCTL, &req);
-- 
2.34.1

