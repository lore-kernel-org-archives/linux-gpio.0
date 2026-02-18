Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E392F341060
	for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 19:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771441627; cv=none; b=GpzjwfO1wvfQvLkxm0tW7hcjPoT95H6teoVxVjfG16JGwBcUXLoEuTjaeCsejpg7KfyXdHZZPo/2puOaBpSPtimfpPHKWDu53hU57cq6JQwTlm+FzGs6QjI4keChOeePebJxjQ2QQjkWhLaR62fB24ZGZ2hx7FMMLgHWcPmMCek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771441627; c=relaxed/simple;
	bh=EfypQhSgAkFW1AgvhmkFWCODARaF8PRv9uztyGsAJVE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hUpv1fSTXcqnEclt7UUrHSFRJWhAyRVp9Ep9VeYsSpNV84J5Lj30YNcksbvQqZfKewdxjWqQNSds7G028HjdkHTQX935q/waA518vnPkKuZs3pHswbmSzSW8fQ0ljkD6EnUWBGfoXY0JQWjpOXsjHZHIK6/fcw5FSb9Xo86wELA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YOch4US2; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YOch4US2"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12732165d1eso102719c88.1
        for <linux-gpio@vger.kernel.org>; Wed, 18 Feb 2026 11:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771441625; x=1772046425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hGMC48hC2L5VpdHq7Il24mNk1e3UpRMWTIQFQaN7Sw=;
        b=YOch4US2mmj6oGSaVv8fBhZe5kfdql7F3ArPjFSuV2YipEnP10XFK6d+r1P2QG0vOj
         hmdyIKClOtz3pEnZqEgn7dJqrUpBYPxSPKgKRBF3/vF6PfNR9flXJklXDdgG40YlCKIG
         /wUgXg6XsbM0mIe3IpGYSDvDRZcn0SIz3UfbZhIOotOBGA7uNR05JBnWA5FuQhpZYI0a
         izl65PVG/2vF94S9W55k+Irva+fV8RGGywaUQwTi8MGq/KF859/bK5ntGyhpHvLVZICf
         VXgwOHDdL/sdhepof6u0P6BP+aVGJqHmW3KCWGa0sp/KmLwCL0TIg/JUxQ7XuaqV4Mky
         NOcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771441625; x=1772046425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4hGMC48hC2L5VpdHq7Il24mNk1e3UpRMWTIQFQaN7Sw=;
        b=P7VLAGlnKHKCKe2e6J8LbecBOcTGHyBJ2l/Pb9Zf0OBHlua+drZ8ELCw39nxtVpvaD
         cufzw8lKaytcxECdB+Cxa2Up3T1LEArDAVx0XPlVCAgimdkzfz7RO4iw7qN/YZryXKmJ
         R2Z1ejg7mYjcz1M4xhEjDe1r/A0QjLwnjM7pFU6zH8un0241gTYnbDrpP+I+hhmCPlgL
         324q0wtpZ882YAvcegJI1pTpRjgNIHqGnB6Gdkxn/24VWjGGvmCxjtUDJdyC/lBhkrBH
         3m8KaFAqpzdkxC/wDlribQ2S7m4ZFg8H9IERwFGXdCckPsh3TB63JTPky9pTGnDEAhyv
         vZ3w==
X-Forwarded-Encrypted: i=1; AJvYcCUpjXBlSwrcROz6Z/JlM17xN+n5rTH93d0eFD/kGB1/vvyIwRUHJTi5/Fg3VOsNVFpoLiH+SCQsTdl7@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4s8qiXhxrg+Or+S+Zr9MI5DkSUJzQJB9hyxQqMU6ndzwbJbph
	QB0OVqE7+BqZFNoygjGDUjNSxQAaC4KaoB2kPV7JsJF/KKVlVEItJb7e
X-Gm-Gg: AZuq6aIFsdW3TKTnRYb9qiNuwzTPom9p7ph9tBsfd1vhuOGjTX4eK/qA3gOXEnTAsLj
	YjoJf3U/e1Qr2BhCCwilMUIBpl8L3tYtpfxzIf7qtarLq6J5tWhMBlUo22CLH7W0eJFW6z6JNvE
	kLTtetgg9nFRFi6C9d+5VQ73w1IW4hx1hNFPnauXUv5khzKgqB2giW2yQbT2gKcNG4r/6uOMSAx
	nt0bdDwK3XF2k3eMKkr283WEuKbrWABTVbH5vg8WPrJk5FFY+RLSxNesRVrpxfz02CwRqN0C9c1
	NqO0AgIlxUj2a/YLAmbtb1VVuolhOCiLeWtCxuXix+Mm0EFvDATxD8jfp5Sx6aXlc4JK1hDXvbm
	IB0m3ppN8DcBs73kWWBXelAqOHxxxKsYIP1krKHtbIfqHH8Y/WMBmGj0sNuzjKEBkVICphH5PiV
	CEU9vPm0d7D0/uxhE1dj5V2Sd6IeIfLyr7nakJYN6uFTIde7Pp0BFLMQJ/jzUzKoFm/m7o7n2uo
	ojGb8S911WwmRY=
X-Received: by 2002:a05:7022:2486:b0:11b:9386:826c with SMTP id a92af1059eb24-12759a730c4mr1667917c88.41.1771441624943;
        Wed, 18 Feb 2026 11:07:04 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:265b:f5ad:9e03:677e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb543d80sm22108652eec.1.2026.02.18.11.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 11:07:04 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@gmail.com>,
	Thomas Richard <thomas.richard@bootlin.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH 2/7] gpio: cgbc: normalize return value of gpio_get
Date: Wed, 18 Feb 2026 11:06:51 -0800
Message-ID: <20260218190657.2974723-2-dmitry.torokhov@gmail.com>
X-Mailer: git-send-email 2.53.0.335.g19a08e0c02-goog
In-Reply-To: <20260218190657.2974723-1-dmitry.torokhov@gmail.com>
References: <20260218190657.2974723-1-dmitry.torokhov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The GPIO get callback is expected to return 0 or 1 (or a negative error
code). Ensure that the value returned by cgbc_gpio_get() is normalized
to the [0, 1] range.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 drivers/gpio/gpio-cgbc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-cgbc.c b/drivers/gpio/gpio-cgbc.c
index 0efa1b61001a..84b5ed3c6e22 100644
--- a/drivers/gpio/gpio-cgbc.c
+++ b/drivers/gpio/gpio-cgbc.c
@@ -47,8 +47,8 @@ static int cgbc_gpio_get(struct gpio_chip *chip, unsigned int offset)
 
 	if (ret)
 		return ret;
-	else
-		return (int)(val & (u8)BIT(offset));
+
+	return !!(val & BIT(offset));
 }
 
 static int __cgbc_gpio_set(struct gpio_chip *chip, unsigned int offset,
-- 
2.53.0.335.g19a08e0c02-goog

