Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795283200;
	b=cbG7nUywMJYPZCKSjIbvB9Mo4FcP0MW+NKa8xbrW203taccbL6gdq3bjt/P7raReeHBh
	 4VamiXu+QUqcEGwnZXjV7CTef15AVixCfy2j4dQo89+VBb+McFoWfTDcQoweEhMYHjUif
	 zT2QSNYYYHe4NG3wrcFbaXpx7b1uB92hwDU7zB5XPW6JbvVy9VF7IlYhoQdNL4Hjjltww
	 Ej/UgCznHU0UrWHviMAE0RgdqZiL67hAH+wwTwYyvjoJAqf+iPNsZUmXwI0JSO7gVc5jt
	 RJZewOp2ZQAGEAhSnaK+a7a0ji54s+j1IimAkviFrei2sCSUKcgItD2Xaz2GWv5Cvfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795283200;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=fjNd46J+nIPFpsHDZsAhjGUwUD3QMtAsvElWh0BXGNs=;
	b=g4D10gz4XK2ELRzoEeRLDzcKSW6+gS8C+uT0HN57S3XwHKhv9LMSs86tk64P18N0RTN1
	 nJmfjp3lVzOBmpOOXp2x/jcI9WNJoDH162Qss4sVuZZppKFCRZhTfvwptUt+0ADIQ9GM1
	 78zUJIH5tNVwmt29Zw8jJmvNVOYpgfDlNX3062eC8IoNfqw/2k9BZqKIrm7AIgaOhv/vc
	 7wJHXwqOlLd4WTdq839kKK6jwsuHBh1skQBzmkXE75XbjpM8xEiDHR3V+gpo+ZdTF8A+K
	 f0Hsqq52OS0z1GgP+KQVWtMcYT3eHwFtFTklo1sIXx0sRh03wKreqHMtupNFTj/J8QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gapp.nthu.edu.tw;
	spf=pass smtp.mailfrom=gapp.nthu.edu.tw;
	dkim=pass header.d=gapp-nthu-edu-tw.20260707.gappssmtp.com header.i=@gapp-nthu-edu-tw.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=TAHo4MKx;
	arc=none smtp.remote-ip=209.85.210.177
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94362606A320
	for <linux-gpio@vger.kernel.org>; Sat, 21 Nov 2026 17:46:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94362606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gapp.nthu.edu.tw
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gapp.nthu.edu.tw
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gapp-nthu-edu-tw.20260707.gappssmtp.com header.i=@gapp-nthu-edu-tw.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=TAHo4MKx
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-8b68e59ab33so1599349b3a.2
        for <linux-gpio@vger.kernel.org>; Sat, 21 Nov 2026 09:46:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gapp-nthu-edu-tw.20260707.gappssmtp.com; s=20260707; t=1795283197; x=1795887997; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fjNd46J+nIPFpsHDZsAhjGUwUD3QMtAsvElWh0BXGNs=;
        b=TAHo4MKxJE1LRdehpT6CytPalzs4hBRiAfU/vdbn4k5SWGEp8gUGtYaX6OVbufo1Ot
         rvB5vXCgZ9KQ6SQ60J1iPY+lJLmhMQIlSgiQlyi8cjW1yuIw5N77tvzjilhFGUSvEKh4
         lOnodlA5UzDq/+4lQnRA7hyST8PQIja0HQb1f6zekfgdAdRGU0w6AXyJkrgL4uNOhPtt
         T15z7OP5s0Uu0M9kFUvkC1WQK26N6VquPP9zvh83vmLReI67TS7m6P5YlK+CS2leASo+
         bh0M2J0eAOd9/CDWYlBuGBDy8YJ3S9NZyPYUzxyhXCwV3V9OMheqGMP4kpkQaeoimicC
         jM5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795283197; x=1795887997;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fjNd46J+nIPFpsHDZsAhjGUwUD3QMtAsvElWh0BXGNs=;
        b=zllsC0XRTMfQ6fDftipgYMGg89gt9W/sClmdsk9qLYuS60NToXE7pgBICZzbJixb8X
         i+W4IG4wPwfc3AliR8tM5bpORXEr1IR3oc0L/oeHH+HahjsGgHiUvSB968CVjEIBIym2
         udMzwxg6RN+fadiRqCdN/dGqRCmkqqDz9B4onih+Wp/VHUw5z0CQ1FzaGT09XO2UTFA+
         5iOhktnD6TDI277fv5vC3BAJ/tX83XeSYGXOrS5gWjFJsrv+myBu0qmhFA69QVrWuSU3
         tcvwJFyXmQ9ELMb0XtM54IW68Qmm4aC0raRhrKn+PQXERGF8AtlVDKbg3bTTx2JxV9VD
         vytQ==
X-Gm-Message-State: APuU4Z9D3rmpKwKXPAp3reCFAMegoD9Q7mqWs/ucyt/lV6ojrIqMBzSJ
	N7iNMCJ0a8LborFKTPGrauUqVkcpYVAfLmrMgmpGcfGU4GzsEj9tVZIxvPsNM9hmfco=
X-Gm-Gg: AZFdTZf8mGNd4vj5EIbkP6U3zejYDdq879ggmNt22bE7E2+bz8UTt0piYcCUsb9DTzX
	uCJp2xFPG7+KAkVDvYkU0WOepYfwaxrCerJlY/+hKvJeB+V+xSA6JlNe8XFB0/6+LZyGdKrjeLD
	LomN+hhy4bhTBM3ckygy42tjPmOKuiMJddw81uvBEoy3CP7GgvBaErPvEagGxvo2TgOpRgfMoMX
	XYzEuKoWM+LFkU3LdHOE0R+SaaznACVVcWLU7rGmuX+U1WZzyKe4B3zocVyaOmihMxbK3Mc6GRQ
	pzZqAVyRaeAGjAFg6LZnghLeMdVu33/QHXNZnK+iGUxM21433xztzDSjlX/TFX2kMjWqAtKucD4
	1O2cnvUsphy5+mpm85jQ45QfnkkgEhWAER1ulAjXkUKtqtutjH2cvj67FMX5khWMT3jFnbCwiNs
	yM6OKQ5k1gI3tWmsDvr9XN68HGOfFsZtbBiATlkldpxVPfv4dT+6XbROODkEGIbuO0/78kAwPtI
	ZeGMKzgmv3oa0n3QLCMuDFllfFBjXBk+dKurYSYwxqHaXidFQlWytuO0nT5/LN4ObMRtzH1Ki2/
	gY4/HhaXqmqdSzsBMQ7zY6sGMPCe+R1+DnZVhOq8PpwUy4A2McXKqQrhX9VUeS3R/N/4ASEJe3c
	mt/yZw2KFIhaSi7LwTgtJzPwhtHgRANQ0rUMcTgt3yleqD6aSXmOaZimAGHzSjdNW
X-Received: by 2002:a05:6a21:7e83:b0:3fa:d7ac:effb with SMTP id adf61e73a8af0-4014c060f6cmr4572900637.40.1795283197197;
        Sat, 21 Nov 2026 09:46:37 -0800 (PST)
Received: from tomato-cultivator-HP-ZBook-15-G6.. (2001-b400-e3e5-27a4-7997-dbab-03e4-f5ee.emome-ip6.hinet.net. [2001:b400:e3e5:27a4:7997:dbab:3e4:f5ee])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d02ba46sm2651076a12.21.2026.11.21.09.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 09:46:36 -0800 (PST)
From: Chen Jung Ku <ku.loong@gapp.nthu.edu.tw>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen Jung Ku <ku.loong@gapp.nthu.edu.tw>
Subject: [PATCH] gpio: amdpt: Use __func__ instead of hardcoded function names
Date: Sun, 22 Nov 2026 01:45:27 +0800
Message-ID: <20261121174527.19690-1-ku.loong@gapp.nthu.edu.tw>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace hardcoded function names with __func__ in the dev_dbg()
messages to fix checkpatch.pl warnings.

No functional changes.

Signed-off-by: Chen Jung Ku <ku.loong@gapp.nthu.edu.tw>
---
 drivers/gpio/gpio-amdpt.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-amdpt.c b/drivers/gpio/gpio-amdpt.c
index e886cf9e14ea..54281851a086 100644
--- a/drivers/gpio/gpio-amdpt.c
+++ b/drivers/gpio/gpio-amdpt.c
@@ -35,7 +35,7 @@ static int pt_gpio_request(struct gpio_chip *gc, unsigned offset)
 	struct pt_gpio_chip *pt_gpio = gpiochip_get_data(gc);
 	u32 using_pins;
 
-	dev_dbg(gc->parent, "pt_gpio_request offset=%x\n", offset);
+	dev_dbg(gc->parent, "%s offset=%x\n", __func__, offset);
 
 	guard(gpio_generic_lock_irqsave)(gen_gc);
 
@@ -63,7 +63,7 @@ static void pt_gpio_free(struct gpio_chip *gc, unsigned offset)
 	using_pins &= ~BIT(offset);
 	writel(using_pins, pt_gpio->reg_base + PT_SYNC_REG);
 
-	dev_dbg(gc->parent, "pt_gpio_free offset=%x\n", offset);
+	dev_dbg(gc->parent, "%s offset=%x\n", __func__, offset);
 }
 
 static int pt_gpio_probe(struct platform_device *pdev)
-- 
2.43.0

