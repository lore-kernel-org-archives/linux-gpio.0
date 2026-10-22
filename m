Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792705994;
	b=kfozx8LDWX7MHxWr265sXvI4JSgVggy9yOsFo3E5TSCUqMu7n9+4AVlWGZLlkuR6BIsN
	 vKeXDaoa8Kgyk5J5D/qqrED8p3EMvYOcU1F8IYtu/Zm86XEWne2ZtWxPRt+j3Ko66bFPi
	 85Wq9fPObgGSLX/BWv65vbi2FAJz8z4dJaKZqIzH/jIYdRFKgnMpZtTounzKmY2DEJSU2
	 FyXkX9BPxjHPUFPUMBQ47KQLslJrNxiBWUHptQDsKf+b6zF9k1yWBUZC5ZsIt6JCHUvJH
	 vK0q35qEnv1cPTHVE2jkdqpqw2+j0C159GkFAYoe2geFBOR/IHrEDjyaSzfRh4Elb7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792705994;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=gxelPk6ZytprQYsPLhQ7wCDi9Bqcy2qLUW6bdd5fyas=;
	b=leBO4u4QeLLifltfV94iX+IYKGMw694q1QaTzdolh9t7pYOnhN44jpcBBigLYSXNC9B4
	 md3cH7xewBsorYVKTQxr6lfaK/Y5g9UGLkxxgYf92kVknag6c6cJrp0dwfHOlD232/xu5
	 jf/b+UIfI6Fzq8NOIz4Qf7KSUnS6LsXjMD/UWgDIcHgwIT4bwB+hxmPEM7p8bDTBY+jr3
	 ud25iuIR36OEIqtJipG1D3VMCH85hLrAJNd1/E6EGutrPc3ufNaD+6EGnaA5yqbIXMWZr
	 aOMoV9mOlsQ6fWQExbQpo6YGEu5Z9usZ9VhLd/n09SWJk+3zKQ0pQi0SPCSejWSFt4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lMvs7mKt;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB64606A31B
	for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 21:53:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3DB64606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=lMvs7mKt
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-188406bb948so123927c88.1
        for <linux-gpio@vger.kernel.org>; Thu, 22 Oct 2026 14:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792705993; x=1793310793; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gxelPk6ZytprQYsPLhQ7wCDi9Bqcy2qLUW6bdd5fyas=;
        b=lMvs7mKt2goRR3E7XKFcNsskAqipH2+jWWLWLLP5AG2y8Y/ibZrYGhpy2USVDZbFxC
         tdqizyjf07B3ZXjbgGWvWHSP3ctGxZPSmIqlDAUmi8gRscL94fsHphh2+Vp0t/BcRNBb
         H/wBJ4lgdCVPRzaWq2v5KWLHuHl57pND+K8DSIYYAGkmccFaEFOyv0X/GW/WMHpwSWRS
         Ed8PJlAf/2laLwlezpIeir28PoC8hT/xW0NnqB3xSCklg/hWl/2TdZLNSGhUfj2TxHij
         clDzyzHi8fqhMU3whXVgrH0cXSdAL4K71UaXFMqaSaBTkut9EzkWZxpGeVGZFEapLvY/
         R5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792705993; x=1793310793;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gxelPk6ZytprQYsPLhQ7wCDi9Bqcy2qLUW6bdd5fyas=;
        b=1GjBNNGTZ+Squ6y1E/0DYRZ1Kkz+dw5BiYB6KgNwd5p9/Ug6YCezI8x2GPxAhKykbi
         zxPZKHAUqTmhB6TTgT/20sS1thrKqS5gKd5CfS1pY1dT0oE5M3aJvvzOH5gIiZsz0bJr
         u0Fw0QFCFUBYCga+BtP3TuxD2wBw1TfqbJZkz9h+8FjGF5DwDK/Y+lwGSmevz/XuCuNu
         briQQPc1nOXvxOFYO+usD4tzvLe2MvqHNv1qDjjv6IraDc8TWLdHhjV8ZFHvhaMWofy6
         BE8uVtvUYp+m7rpQcYW6Nv9KRGIFVkM0dNoQ3K6AEEw5FFZgWKKBbnGVoI1mxNxDgHDh
         960g==
X-Gm-Message-State: AFq9FYJXce7SlHDHuVJ0QnVjDLk0Tovskqb42Ve7wLjG+d+0A7WJyHJa
	syuNIdVl/mwEJPDzqc2ziIAzLpgwm56TtgEFT63pnhYCalsJzmoV4YhQH3Yqrg==
X-Gm-Gg: AYBFou0ARNpmSBlWsz9/w7ZDRvzhONw8taradFdXsG3cbAptWuaQgW3JZmwFnmmYJqc
	OERSXDWd3ps+rHTWOeQ1QYQVZ8v7qpm9CYNhcMoiw5BOUXfAvoDS3aWWbeqh+qeMYAW+Td9unub
	L+pbeUYLye1PK/dCAaBHw827fcOHy2FXAo1tVnwpBaa/zX1879gDzLCcJ8YyXBGc6bRmc/SaVUz
	tgIIrV6bKw34K49a/ndjkQsgYFnr4nBQ/3DTx5yPHfGd4FFd1DOd6tzrAAcAJfqYpgFsEdaDFAr
	0ajwoRmblTWID86zIfE/ItPcaMSqeM1E1zB8CvAxTYdCzghC/fuLmSHIKtOkVEo7GlmunRKMBkJ
	gdx7+c/O1rQI8scQLdVjdrZluhTU/2XJtXH7WtGc+Nf1OwWPOw2TiEdAG0DaR+hj3H9avsUk6IB
	2pwwRV2BPIgsyEoL6QwuAQk8Ci/o0pMDVGMiXlOKks702TXZisml8ia+yqG2xwHHoCYqaIYXbgK
	QpzTDTvnglPDpNICXFbZAm1CUS0xHLd0ALy45VZ9WCgPc/yC7YHd2vORw21MFP5mwtW48IDTeGo
	suQQgpc7HMDTCc93BKYjYqgz4fKSXkBdhlSI3o9QIdXN
X-Received: by 2002:a05:7022:4588:b0:14d:3c0c:79e9 with SMTP id a92af1059eb24-195c4f4ef8amr912186c88.11.1792705993359;
        Thu, 22 Oct 2026 14:53:13 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f2d1:b7cb:a745:829f])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-195ec82eabfsm1110403c88.19.2026.10.22.14.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 14:53:12 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 22 Oct 2026 14:52:49 -0700
Subject: [PATCH v3 5/5] gpiolib: of: use __free(device_node) in
 of_get_named_gpiod_flags()
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261022-gpiolib-of-v3-5-42c3b6439fba@gmail.com>
References: <20261022-gpiolib-of-v3-0-42c3b6439fba@gmail.com>
In-Reply-To: <20261022-gpiolib-of-v3-0-42c3b6439fba@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Linus Walleij <linusw@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-e56a4

Manage the gpiospec.np device node reference in
of_get_named_gpiod_flags() using __free(device_node) so that error paths
can return directly and the out label can be dropped.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpiolib-of.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpio/gpiolib-of.c b/drivers/gpio/gpiolib-of.c
index e741a4f218f4..25b97109f97e 100644
--- a/drivers/gpio/gpiolib-of.c
+++ b/drivers/gpio/gpiolib-of.c
@@ -430,17 +430,17 @@ static struct gpio_desc *of_get_named_gpiod_flags(const struct device_node *np,
 		return ERR_PTR(ret);
 	}
 
+	struct device_node *chip_np __free(device_node) = gpiospec.np;
+
 	struct gpio_device *gdev __free(gpio_device_put) =
 				of_find_gpio_device_by_xlate(&gpiospec);
-	if (!gdev) {
-		desc = ERR_PTR(-EPROBE_DEFER);
-		goto out;
-	}
+	if (!gdev)
+		return ERR_PTR(-EPROBE_DEFER);
 
 	desc = of_xlate_and_get_gpiod_flags(gpio_device_get_chip(gdev),
 					    &gpiospec, flags);
 	if (IS_ERR(desc))
-		goto out;
+		return desc;
 
 	if (flags)
 		of_gpio_flags_quirks(np, propname, flags, index);
@@ -449,9 +449,6 @@ static struct gpio_desc *of_get_named_gpiod_flags(const struct device_node *np,
 		 __func__, propname, np, index,
 		 PTR_ERR_OR_ZERO(desc));
 
-out:
-	of_node_put(gpiospec.np);
-
 	return desc;
 }
 

-- 
2.56.0.257.gf7497c7d27-goog

