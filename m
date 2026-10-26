Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793032186;
	b=z2ifpcoPdyX67Km8VSdWAo7ztvYtzYyIlQaLVHBHkyD8kfoK59RDwUIS3NC/nXVf7IFl
	 huQj5q9hFOvSeEBudLtN+9f+3OtUyrOKvsQ2DlvTlD0NLiSwa8zESdZuHOjabzlRqkZiL
	 VGZnPshrN8pAoc3wrRZI/axOTyV4wyO1aHTB8L6EtA3KKebj3/s7v2vE/xR5AykGVucZ/
	 G2FREvolRuPJ2VSnG3smbWBB8FSjUNpC6DH3LUG+EyKcFCVAp8t0c0m+8surMtsTeEhAS
	 1p3yp5yJsU43tI10Z7OCopNX+WDRKiEC1PC+JZWwIdqjHQ446BYRpaPE+7dvjHOXFrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:X-Developer-Signature:X-Developer-Key:
	 Content-Transfer-Encoding;
	bh=KYicqebf9EjrinyN51JvCt3VsTjS8J0EC5zey8IGKsU=;
	b=1Iyb0ndZxqvRQRvWbcocj3topW5yHhrVcFVKa51HQ5PX7XtrcKOZpvJKuTiz8RwQrrkv
	 CCd7puDa2hhDBlEn0yBo5gFywWD+BQqGKP39QRjmKSpZHQlFyaldCYItTfsR7NARQsbvl
	 kaEaoNi32sSW96o34sv0Th1nBcRt9pLHZ1zTZ0vPOwPakS67SrKJB2ggk1NJogXKHbxai
	 nN4IjKGBk+BduGTNfQmabUBdFlvk0qFF08c1mUPjFBdkgTwntmUIXJ0wrLqJUeEV/dI8s
	 dnDQJ3oJ/AAfHANXChX2sCLQtfiyHEnzV4v40QjyQi2FVB428vxYbV/bUj6Pb3hBEmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=V7GNI24r;
	arc=none smtp.remote-ip=209.85.221.51
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9915960A3803
	for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 16:29:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9915960A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=V7GNI24r
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48e00eee27dso2041799f8f.0
        for <linux-gpio@vger.kernel.org>; Mon, 26 Oct 2026 09:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1793032184; x=1793636984; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KYicqebf9EjrinyN51JvCt3VsTjS8J0EC5zey8IGKsU=;
        b=V7GNI24rchupu9qh2hxZXm3Kh+XCVPIfkJgU6U+r5cnsDKgszsX0NBMMcddgNRc/J5
         DKtZ90SLqiwTepwMZnX3H4iQZKb/pPRhS7U0yyXmfSoCBqIABNFksRpI0Swl1oHmiaEz
         ZUlSn24Biz9wGBFSnr5W6nNffOBE4PR2jCFTqlmulHbYze6l1NaSbidFMz9myEgV1dJ8
         Ani4yobOydkiTGvgMjSacgI6/U9uQa1+3oqgqy6GWGW6imEWfySbzOrgiq85emFkMuPl
         btll0oqHC8gYS2NcXFWLpjwcbSRZ5C/2d1lk7eMYSyhZdiO4IA3u92hN7jIEhrQEj3Xg
         pK8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793032184; x=1793636984;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KYicqebf9EjrinyN51JvCt3VsTjS8J0EC5zey8IGKsU=;
        b=YPjiQMxTrZmYPS6bWrDDMAgXvGTc7bpSxOljCjEhX84NAubLKoLRWwH+3dBL7J/8Bq
         nAZnPnebQye+enTB4eaEySMgTZpFXSX2LJsgYtvn8PNF5BO1SoTb8ZhNIajteL2yEXrJ
         VHQdrXGrJ1+WKo7hA4wwR6E06joPd5BH59afZhLBNT9IdLaktCAtsqxxKhxHrG38JJXQ
         L5dU4JGQ1Sv1P5pI1IQZXt05yRcoaFFdcEgXoCM3cXqNRd+iJxJM26s2OGmFf8ea1Tnp
         rZ9xP6j/YvFOY7tZfeCqhRYwcesbWt5SqweDPrs99rFH/ZEA8q9Y+Acr1M8/jGk9A9l9
         ga1A==
X-Forwarded-Encrypted: i=1; AKwUvBwlM5usNUUvoljW7zb/XYcoro8+6ZClRS2VZ1ZSj5wl0OO3kLLm6Gob46NPY7vhvItBY5teArtrGc3Q@vger.kernel.org
X-Gm-Message-State: AFq9FYK0+oTwZ3r3s+HOV2MF5xT0kum5HbFEYzKOkt+eQzQtXbDtjMRY
	JpZHqm3+JTDv+jwFd5unoza1sQQN8DUeTKbUlxAk3E31Iw4Hnp+On90HoDDsBSQk3UE=
X-Gm-Gg: AYBFou3GHgSOF4E78kp638PklmIspv/s6jRptLc/5OuCldp7ZLyllgn3+8Ahpx0S1tM
	tJoe2+3ZIkA0th9P5HsCodBE3AQ/iucfmolgg9nz7R47aak9aWcnMbtAZXsNarfLPvIEoP64vnd
	PYqvY/iJuDESzHcbQb3dB5uBfd8Qoo2UO55sqVi04Hql0B/64mzYW2TYrAMEFpuL33msbXwZSz1
	jtCJmRqMKDDaHcj90f7PdNEfOq4WifZROdm9kTd7l/uxrAu0lK6H/vpl8wtUN2pmErp7Y+EyTY8
	I2wH26Pui4PBmMyTktp6kK3r3rMrtM7Eue26gIcZh0Adr2NvMDZDT0SvBUltAIizIAKyLBTUhaj
	mqpb/G+umoOB2vUH0Lt8YLze3L4u0jej1YPNnU1efW3Biipbq91lOCV+Pb+toG9ZuX/s5RzCSpb
	vIF9TDKAbMCoJy9eIbT1KO4XaSPgASQ8tRcwkmn7wltemCJDOuTaQai9UXZvDbnQmxB3N2n5jUl
	erOOQnq7taTLrMMU6CSlWrqA/9lLw4FTE9apa74Y5VoOGBDyZWLC68WQePr4ZFtwiNfa5OE6paG
	P+p8tquG+23Mdb+b8BX4j/PjVGnpqpGi2E6YDkACJjI=
X-Received: by 2002:a05:6000:188b:b0:48d:f6d2:9c8d with SMTP id ffacd0b85a97d-48e3eba1212mr14731597f8f.46.1793032184005;
        Mon, 26 Oct 2026 09:29:44 -0700 (PDT)
Received: from localhost (p200300f65f19a904cbccaa7a4d73ac15.dip0.t-ipconnect.de. [2003:f6:5f19:a904:cbcc:aa7a:4d73:ac15])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-48e3eb8f36asm17611801f8f.1.2026.10.26.09.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 09:29:42 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Robert Jarzmik <robert.jarzmik@free.fr>,
	Andy Shevchenko <andy@kernel.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 10/22] gpio: pxa: Add missing platform module annotations
Date: Mon, 26 Oct 2026 17:28:21 +0100
Message-ID:  <f5c8fcf9a24b9259974fbf6c8c9e4659c992818d.1793030820.git.u.kleine-koenig@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=836; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=0N+lDmQgRDGBU1BCwydX6YgET7LObGjwfjhS8sLguR0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBq33+0jHn4dx1Y8sKXbjtzi+lsdHrF8HtDVZTca OkHl0k6XqKJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCat9/tAAKCRCPgPtYfRL+ ThJICACfPyKIlQ5jWHFYTvw5ECfbeqgUFfEsD7kh8/mmqOTTGbnvDtp7mxSD6Bc8HeQyjoEyxtf uKC8LLsV2LMfCvBPFAogp3ILWmTmmJbMx4oYpRDlk1fIBMh5i6q0dJtV8Pl6IOj/vuL2HsVWfIe bKMuRuZMpcs/esTZ/fArR0sefEmv3HJPoPNku/UFVdr92cx6/FPV+I7NSTvQD3BV0HgKBGxG14X cmGimPOBjyQDOjbrPitRGzLAQwXE6KWr/m0P4RmEYXd8W3Re71ABvpmMbZTrzHodcb9yabF00n4 yq4OD+eXmuRhAGJfz9/LmqUyamuKrS0ItofPcCWqPFvleCW7
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

A driver module matching devices using a platform device id table is
supposed to declare that in the module's metadata. Add this information
for the gpio-pxa driver that failed to declare this.

Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 drivers/gpio/gpio-pxa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/gpio-pxa.c b/drivers/gpio/gpio-pxa.c
index fa2087acc025..d241fd4c3d31 100644
--- a/drivers/gpio/gpio-pxa.c
+++ b/drivers/gpio/gpio-pxa.c
@@ -719,6 +719,7 @@ static const struct platform_device_id gpio_id_table[] = {
 	{ .name = "pxa1928-gpio",	.driver_data = (unsigned long)&pxa1928_id },
 	{ }
 };
+MODULE_DEVICE_TABLE(platform, gpio_id_table);
 
 static struct platform_driver pxa_gpio_driver = {
 	.probe		= pxa_gpio_probe,
-- 
2.56.0.rc1

