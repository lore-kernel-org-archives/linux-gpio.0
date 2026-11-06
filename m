Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793946629;
	b=SFut08CJzpy8w7F6IzAFMJwA436KfH6s1gLV6nxtp2KApJmBs4v5PdEkGWhm5L3X7Pfx
	 IHdzyl0CW/4XEMOvXjB+RhxeFuUOyxgsVIKI+WmG1t17SwF2Mru/eIKhA9fm2Q/pDFiMc
	 zBv1AttTvglfP5WnvUt75q/Ys4dpwYJE7PN+QbNZ9CG5UAtTo8Tr9WBClRb/JQ3xgyx8Z
	 SKDTM/25NgxDxyrTsDlMnk/DL2MDSqYMXerjVpe93C99IRK5urtmvRVqhPr2N03FZwMxQ
	 QZXBfjAeIuMFQIAcYOV4oa8auatfpG08DUy6KDMLIBW3jRPZAoco01mNxy/M1irkzOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793946629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=g7mFdWrudXwM2nYrMXMzR7kkLu5bcGMHbyNVyyN8oZ4=;
	b=y8sNzZRXZiKMz8S4vXMwty3ug4+Rv1FWlFJBris1fNhQzrCy1fSlNi8vhcl7gHgKUVFF
	 5DDXlT8/1uwDMYMYsqtkr08ZVEdXHraKHbErDS6HiG2X1KxznUFe4Z4K0is8GqUUuBXXY
	 YKaKLINjQNkFZCbNuBHylQ9jsaJ/znLNOlb20srKQgpro330ZzqzaVc6Fq2tmGgDN5P5s
	 u2VHfIeJKzNZJ29YxJXvkg3cC9nB9jV3kfxZI8zxxVZoAHiBtf3CEXXc2ezFtBblVNT1R
	 L0YZ9syHk/RaDfeV8DxVR3ed9awgPvaxLVRvwYpX80ka5NUgVDDUHymc7oPTsDLuZQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S551POE4;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3603606A32C
	for <linux-gpio@vger.kernel.org>; Fri,  6 Nov 2026 06:30:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3603606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=S551POE4
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-3645f0f3fcdso531402eec.0
        for <linux-gpio@vger.kernel.org>; Thu, 05 Nov 2026 22:30:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793946628; x=1794551428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=g7mFdWrudXwM2nYrMXMzR7kkLu5bcGMHbyNVyyN8oZ4=;
        b=S551POE4JMpdw1h8MBDgFKO0BBgcA3Bg9vJRYDUE6lAzJfC883E+i1XL7BvEnc/Ggr
         pps9g+oAU0XnGSRfDA2H9HJw57R8aGdy4rJCMpnbT5WX5DEQl3Pqxe+QsKVEMNGsSg9k
         3Hfo9WtNoleg9jy8zkiHR9v7900QDQkmSUtxRRdu8BScrzuqlgDlNC+5LwIuqK9iH3mQ
         lCMhTf8NmP5GJaRRfOM7JN7vkqdvCLOzSQWTOajh7W2ph+O5SlYSbwmohDANKexM1jY4
         IzQi9lnUO1m/d8MhjEZ4y8Y/6DY0WB78rQLyPCaXg26T+jqr0/cgpiYC73c/hcKQcGgI
         0jLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793946628; x=1794551428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=g7mFdWrudXwM2nYrMXMzR7kkLu5bcGMHbyNVyyN8oZ4=;
        b=TSWq3giZ6YooLjQofatliAwioQnVeqhfD4xXFQNMmJM/d3lFKdHmFKBMwVXl8ezMLj
         sPh3Z0GBXSCxln9hR91vbMLN1dLvk2PQmMxGtbIQV+AacI4Xh9amc3PhMRZwCXQBl53w
         dDeCkagmQDtwhFe2O8RMgB7Sh0pZ3YbKwdpGuptWRNXDfd48f/UYOKKGR9AWKDNAP7rE
         Bis7yU5h1QA+G3Tdr6gpdRJ6yUEJe1w1uqP5hIzK9B8IPLSbs0m+LOvrviQKpr3IRRxn
         zLXTZojrcmoZ6CYgbNQxLfbGBPpQc6aECZHbfKGRd0zC6mCGp4QiILXhOR9kMZi25t0H
         e6dA==
X-Forwarded-Encrypted: i=1; AKwUvBwpxphSivmPJxw2yOKqIz5PGzHCW6Gm69zhRSfugif2x7fZeBaacbnP1JdPt9LkTrEFUeWjeH/vMSz2@vger.kernel.org
X-Gm-Message-State: APuU4Z/Aipis6g66DSoE/xld/1lJPk28587pLY57kSYTURWfNQGn+BI0
	4CR/ukT0kSZSi+M1dBweYyY4OVfiIu5A89u58/+J7q7/KMg5t3U/ITd+
X-Gm-Gg: AYBFou2Gpb3twX6CctrovVKx61zLZZ97sfch2pSxNWinbvV5rCtA0XfbvwMuguGNC6h
	TQC5KZmOgvpHNWIvISOPhHoaDh2/RluAafZ9SBsu0SOXOkLxcZ5psARvjaAcoXWSogNABV9xxPo
	2Tdn69LxU4QssmAIKSpM/1DojXMhUTwWLjGSNEHpQSmC7AiO/jkQtG5PTFyaxe3VGxXWUC27xMX
	Yq4KJntMiKCtdMTU1uk82yPsRD4hQq4oQu+N4AW0a3x1yx0tTZrKFJzimLOXl6zL4iO/2JTe534
	eVQg32O5nn45h5H5A2baj/2bkvOXpmhYcBS/E3GTCTLr1TuwDzVi1/FMDlC27pHH/5dGghm0zWQ
	/iiuivMpIhWdInwFVi0Ikd1NIWO2khfbYTcc4r6vQ6XDnlywWeq2Q+Tq8nYKkwkA7oZEJ2L3kyi
	pIP+rxSg8Kbdhj5hlFMvAXMoRKZQSV/qxwqptUckhzG4QDkTOsRWorc8sLfS8Y3ShkhzQNYl7C2
	+l22jjrM5JWe3rIongT6FgrnQBZZ4ttkrFN/swg7MScuTSe+0CssZCBv2tldotwR+HEcn1Y5p7d
	yo6XT0dtTkn9TAJJ3ke2gPTxY8IerbTrs2qSkSZL1oa5km0Xhv/j7xOlrxflyFIwYPC+6X4Jsnl
	3V7X3PYR2OZPqhooz3z9o81bSwpQwDSMrT2aFdg==
X-Received: by 2002:a05:7022:ea5c:b0:182:94d7:f76a with SMTP id a92af1059eb24-1b25d3776aemr1728427c88.43.1793946627391;
        Thu, 05 Nov 2026 22:30:27 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:64e:8358:c9cb:c17b])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4a63f6sm3734266c88.9.2026.11.05.22.30.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 22:30:26 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Thu, 05 Nov 2026 22:30:18 -0800
Subject: [PATCH v3 4/8] gpiolib: add support for scope-based management of
 GPIO descriptors
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
Message-Id: <20261105-b4-gpiolib-free-v3-4-bb47ad58642d@gmail.com>
References: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
In-Reply-To: <20261105-b4-gpiolib-free-v3-0-bb47ad58642d@gmail.com>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.17-dev-e56a4

Add DEFINE_FREE() definitions for gpiod_put and gpiod_put_array to
allow using __free(gpiod_put) and __free(gpiod_put_array) for automatic,
scope-based cleanup of individual GPIO descriptors and descriptor
arrays. Place these definitions after the CONFIG_GPIOLIB check so that
they are available regardless of whether CONFIG_GPIOLIB is enabled.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 include/linux/gpio/consumer.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index fceeefd5f893..ee183a97575c 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -3,6 +3,7 @@
 #define __LINUX_GPIO_CONSUMER_H
 
 #include <linux/bits.h>
+#include <linux/cleanup.h>
 #include <linux/err.h>
 #include <linux/types.h>
 
@@ -578,6 +579,9 @@ gpiod_is_equal(const struct gpio_desc *desc, const struct gpio_desc *other)
 
 #endif /* CONFIG_GPIOLIB */
 
+DEFINE_FREE(gpiod_put, struct gpio_desc *, if (!IS_ERR_OR_NULL(_T)) gpiod_put(_T))
+DEFINE_FREE(gpiod_put_array, struct gpio_descs *, if (!IS_ERR_OR_NULL(_T)) gpiod_put_array(_T))
+
 #if IS_ENABLED(CONFIG_GPIOLIB) && IS_ENABLED(CONFIG_HTE)
 int gpiod_enable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);
 int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc, unsigned long flags);

-- 
2.56.0.506.g506a7eabc5-goog

