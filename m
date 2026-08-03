Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0442B3515D3
	for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2026 22:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785796550; cv=none; b=CmPGPqW6KEevKxP//2hTC7ugCBtdOv/+kaO8t49B4N+DT5gG/GunSEqz2Quo3eXNw0G28RUuSGObAOfT+IYrku8m/EmMMnx4xDFyD+pYQZ9ALcdxT3Xng+tKJb8oTcpFJe31QsxTpP5W4TKdWeVdQEuTynkLcym6x6LRiAu9JAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785796550; c=relaxed/simple;
	bh=avdEkHwYugA5hQ0Jl8tKEInydmUHEAoZiw77MPCgVFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rlqeo4xOYLI21Zn8uXbcvkkhumPGUdlKd85caP8+o6ehNHMVPpQD53oukfKwDZNVIS/NHk8lHBRt0AiMtI8OYqXvJRkL21SAOyARsa/WCYY+nRIPhtm9TVqBgUqpMIOkqudGiYTJ4/BZTUP6ot0kASSINftt/UuFYzATftoVAG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=r1360Wr3; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="r1360Wr3"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso4603933b3a.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Aug 2026 15:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785796548; x=1786401348; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Sj4NNt2oYO7Z5j3g1ICVeFL2IOOSPdBWqDyST2yYQk=;
        b=r1360Wr3sAmP1B4FQ+ut0HzLBklgTWwnJBWQsCipJrRijjfiSFx6l+MzNWncPYLjnJ
         oOi5JQhMQc5U4r8phXCPefpBe/P5BFU5jCYU1kjouLbFa+bisxdo8tdHaSQFyGpvzndC
         4leg8Far1D4MosbjaRQMb4UA9W+5D8GaAaFpmKGHAK+s6fswSHswhYkp9i2ecyv8YTAC
         rzSgbX5mfK+kSfoCpgNZSChJ0Uok7UiHV28fvxHFURaPBaNfR+g8Fm20YZHoXO2Q+wd7
         AxRvanZadLw8RMQcUdZ23wt9ErIE7Z2CGmpRa5BMrkrC+XSRCil4NdZLabBQdYnQtua2
         /VtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785796548; x=1786401348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Sj4NNt2oYO7Z5j3g1ICVeFL2IOOSPdBWqDyST2yYQk=;
        b=OV+0DZDd7e1s/CGvEG+vp6dKhEwmsaTtmNUtEHGQU2FqBuqiGo+bsXb1oYdy6hjxwn
         I5l+9oXcvtKubKfCjXDZwX/b0fvM2QrySXPJxAsNicD137agGgvOspGOvzahAt28Tu0t
         YDZsNPjsD2EQOsUxBj3866Y+SWB/Fgt+uJ2Wt2t+3/JxpQKSf8f5bzfrUCF/F7MTrC7w
         5g54cuRiZW2rukKOAssBnwyjgRGijuaJtx/GzTWNSeerQvxZ8IPf6593q6PS3RnImqvL
         21vZVYpHxP5Qd4EpbWYbIAiWG6q5OK5nnhYOVTCa14Q/+fmgo2EALZXsvdSo8ZLNguzo
         IhoA==
X-Gm-Message-State: AOJu0YyyaIWJTuvzrECzVNOk9eehJZpz9CxV2bbBr06/D7agpiKJmzho
	PwaBwsahsw1m+oigU0yywB9itRX89CvwyEQoMS/BZcVM00LA8zzXyIhAtH/E4g==
X-Gm-Gg: AR+sD12Uhg3QFLt++Jfdh4Gw1UX9fBPLC8WMOm1D3ZC78+ErtJ2jiGSH6zi47FreLva
	1J/Rrtliu6cO8IaG/rbZTGWXENZkkeXlP5dxy+R5GIRcNEzDGudREZ9bXzZnSPOV84WoAwV39uH
	jQJIVSRVj7rPxsIIQNPSWV5vRRjIB32ob0RkyUffH8UavggV//ttt+MitKgLETMlyo+ybdCPKnt
	eu+x7b9XfVc2SDi7u0VeG8Qw5Pra9TdDamC/fU/wz52qGzEotGX5TqoyLPvedP/Db3JnTn7pseB
	pMjJ8Wwu44LEWr4w0l8ActSG3+qZg0juRSTo9tNeCLHeYweAlc4+atMlwJ4GSOt5gutbG1xmlib
	tvyIKepPCzu1540HqioyLJmiLCSm1u23dCEubo717cJoQlyM6sgu78hiEjlldAuiiPclunRWXFb
	YHm/x/UTrS9ItTZt7eoLuUow932qSnJw5gcnRS9Mj5UceOxqynHVxkDVFZXTAfj4xLnqhZmGqN4
	E1eqrV7ocHN9UWjAgyiRQPQ/bOH1o75yZpVnKm9bVhcD1C9vSKLwZ3di1rXuWL66Pu53y1RlNv6
	rwi4D+txWPHk/1/P4UC3kv1f/+GgO3U+xeORNsIwkfpoZDMr
X-Received: by 2002:a05:6a00:4518:b0:848:637a:4cb0 with SMTP id d2e1a72fcca58-84ee49ac188mr10107343b3a.60.1785796548373;
        Mon, 03 Aug 2026 15:35:48 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e35])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84edc2d4473sm4186790b3a.40.2026.08.03.15.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 15:35:47 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-gpio@vger.kernel.org
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCHv2 4/8] gpio: ppc44x: Use platform resource helper for GPIO MMIO
Date: Mon,  3 Aug 2026 15:35:35 -0700
Message-ID: <20260803223539.86303-5-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803223539.86303-1-rosenp@gmail.com>
References: <20260803223539.86303-1-rosenp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Map the PPC44x GPIO register block through the platform device
resource instead of reparsing the firmware node directly.

The GPIO node now probes as a platform device, so use the
platform helper to keep resource handling aligned with the converted
driver model and to report mapping failures with the platform device
context.

Move ioremap up in order to avoid doing extra work in case of
-EPROBE_DEFER.

Assisted-by: Codex:GPT-5.5
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/gpio/gpio-ppc44x.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpio/gpio-ppc44x.c b/drivers/gpio/gpio-ppc44x.c
index 99fb11cd7966..5db5217c0225 100644
--- a/drivers/gpio/gpio-ppc44x.c
+++ b/drivers/gpio/gpio-ppc44x.c
@@ -158,13 +158,20 @@ static int ppc44x_gpio_probe(struct platform_device *ofdev)
 {
 	struct device *dev = &ofdev->dev;
 	struct device_node *np = dev->of_node;
+	struct ppc44x_gpio __iomem *regs;
 	struct ppc44x_gpio_chip *chip;
 	struct gpio_chip *gc;
 
+	regs = devm_platform_ioremap_resource(ofdev, 0);
+	if (IS_ERR(regs))
+		return PTR_ERR(regs);
+
 	chip = devm_kzalloc(dev, sizeof(*chip), GFP_KERNEL);
 	if (!chip)
 		return -ENOMEM;
 
+	chip->regs = regs;
+
 	spin_lock_init(&chip->lock);
 
 	gc = &chip->gc;
@@ -181,10 +188,6 @@ static int ppc44x_gpio_probe(struct platform_device *ofdev)
 	if (!gc->label)
 		return -ENOMEM;
 
-	chip->regs = devm_of_iomap(dev, np, 0, NULL);
-	if (IS_ERR(chip->regs))
-		return PTR_ERR(chip->regs);
-
 	return devm_gpiochip_add_data(dev, gc, chip);
 }
 
-- 
2.55.0

