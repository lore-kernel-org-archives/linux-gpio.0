Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FAB4A99D5
	for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 20:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792010750; cv=none; b=V0RkfCpeWmfF2JOwfvWl0hrKKRARLq2HMHndA0SoJ+kg/fHrwX6xvJ9z9Gq5j4fzMkY3XDhUonlXkUwLsRIy9mGgjdNE5Pc6HKb6M/0+ebBLFbmV7gD0IL8U/Ae5vRYNRd26tTTTEu22Pg4WhjOe3uqAj8rN74tNG3MqJi4jM9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792010750; c=relaxed/simple;
	bh=6t1NbTe7Rxkbmhyic1T1cl3e0qURPytIKl63sDRVLjs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PpTFPEgdOnxtK7QqsV+1XccYGKhSAueSoDQ2oOqzt5GbKnBUG2RfR4ztLBEhnvKRjoqAcgpZ1ew9A0nSS0rgTIp0N4rUWl/jgXgVxy8a1YJbMT9Q2sN4ql94xU9SWEDAUkJOtdE9NKMEIUskMmmSmC1GFGVqgFfP78aNAO6ujHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s2lAqvXV; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s2lAqvXV"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3282db206d3so3921076eec.0
        for <linux-gpio@vger.kernel.org>; Wed, 14 Oct 2026 13:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792010749; x=1792615549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=w+VXnodruUJPl19jPfHLhxfJZGqvtsAgNI1YLQhK2Rc=;
        b=s2lAqvXVGaxHRoVoHOG2frUYVzGr+9fU9EONXKvUC2B9+qqBwQpbocWlkAmnoRH7hI
         3+yBNWHZuAI9xYsac5GEckGFpDj6l5MuCyplwYsw+w3beIQ1p9Msiw8sBLkZadSBW3db
         TScLah9nQ21VWjhz+jgFC/4mba5JEoU2PdY/AOcnZ/ZgG3DMYcUI5VzjyM2KFawzz0qD
         CnfxjnSywTArlQ1hshDW7r54zMD14NXQP3eOI9mEW5meWFpmECmj169P7pR9r5H2Q/xC
         RdVrh+gnMowTkpAw0XI+BMFbX1nu+1IiQA/M0qO981ALUIVyYRogNU+U7WH1RGiUoH7V
         WkDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792010749; x=1792615549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w+VXnodruUJPl19jPfHLhxfJZGqvtsAgNI1YLQhK2Rc=;
        b=vD4dLsYBvnbEaaEFazjU7tuzHNgDARGLdKXHxZHgz0SARlc3vXTyyBKKQNKIsV/UmH
         wXzIrYMb/2+wwdDMoEL5UtEg5tIQo0q3ilOru4cIb9hmRJshW2KI0JsUXKljK5Zhrcil
         PluQPNx+SLap0N5lgCEZwv40SVySlFLdylkBeVYo3qmkHO2hjZJRNIMp+IP6FlNI5J2f
         ybJ5qVpnu15aihbUHzPdeeBmkYJEJ0sVk+X5UQDQY+5ufYGwxjXa/QNaAaRT88OJ7Fdz
         kkTyFlKAFM/nyQsFYMPR8maC0Me5P2W1/kXZts6NgZ5iaAq5EYmYrLQhU6eYZTrMLtBw
         68qA==
X-Forwarded-Encrypted: i=1; AKwUvByj+LZC7H9L57czHzLL/u/GQDHb10Zj3kWhmEe4cbB+pAYNA+Fp7znrmYzK+BUql28dA0XHBNXmSrB8@vger.kernel.org
X-Gm-Message-State: AFq9FYJ614N+LTDQVVt8ERRf/Ylg7M9isaEtTleFJmDukOGc3aYk1AAc
	MCN/Vqb9yTkUV+mgAOeqyQBUQV152bmc2wOl8dtncLj8kaXr+ntfhba9
X-Gm-Gg: AYBFou08h/XJb62mMlVFoJxecdcgSkC7Q50Y2qwoBFPJ1Ab/YPoW90GS37vcuHwpErG
	N0b2pdYYMDWoPyQ85N6d4crCzY8vTONa/B0PHXa2Z7q/ypz28b/p2UNQ+/VCLawkYL7nZGT/wTS
	5Ay+2svaAJpr2Li9+pacj0rzcFft0AoyED2MaGcmo03xnfvj+GMSZX2gFUfqbi/dCKGJNEcs5jB
	4Ca7OlhjTubX1ZmHTOkwj0CXV4fV8Fl0ca0gWXqvWaiOYxHH8GLQnyokIMfu0QV1xCXqWi9omfC
	BgVBOwLvyVzJYqFncykRaHc2expQqzmH48H0EqkrkbOU95ldVzDJKJ69ERT8oZoV4jSjHjaBJxq
	AHzGl95VVq/L/0ET6Ph03MCoY+JSKfwNb7OZeMuJqN9n/m4FHOFBFnXzXk6qJdTmwPtI7ahGDgi
	ZDTX4qvbLRCIeWKAEfgqj0saxPMcXEErB46YKyRuFuLnKKyvgXvmgr8NNGLUtD0/Wf6r27C5EeJ
	P8Sy47QEMfRDcATzeq0jwmQdwX0
X-Received: by 2002:a05:693c:821a:b0:35c:813a:1c81 with SMTP id 5a478bee46e88-35c813a23b6mr8461466eec.18.1792010748588;
        Wed, 14 Oct 2026 13:45:48 -0700 (PDT)
Received: from hp-OMEN-Laptop-15-en0xxx.. ([122.172.84.6])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-353810403e9sm57109957eec.2.2026.10.14.13.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 13:45:48 -0700 (PDT)
From: Jayaraj Devaraj <jayarajdmit@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Linus Walleij <linusw@kernel.org>
Cc: Vladimir Zapolskiy <vz@mleia.com>,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jayaraj Devaraj <jayarajdmit@gmail.com>
Subject: [PATCH] gpio: lpc32xx: check devm_gpiochip_add_data() return value
Date: Thu, 15 Oct 2026 02:13:31 +0530
Message-Id: <20261014204331.15383-1-jayarajdmit@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

lpc32xx_gpio_probe() registers each gpio chip with
devm_gpiochip_add_data() but ignores the return value. If registering
a chip fails, probe still returns 0, so the driver binds with a chip
missing and no error is reported.

Check the return value, print an error naming the failing chip and
return the error code. Chips registered earlier in the loop are devm
managed and are removed automatically on failure.

Signed-off-by: Jayaraj Devaraj <jayarajdmit@gmail.com>
---
 drivers/gpio/gpio-lpc32xx.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-lpc32xx.c b/drivers/gpio/gpio-lpc32xx.c
index 37fc54fc7385..014eb8bc70da 100644
--- a/drivers/gpio/gpio-lpc32xx.c
+++ b/drivers/gpio/gpio-lpc32xx.c
@@ -510,7 +510,7 @@ static int lpc32xx_of_xlate(struct gpio_chip *gc,
 
 static int lpc32xx_gpio_probe(struct platform_device *pdev)
 {
-	int i;
+	int i, ret;
 	void __iomem *reg_base;
 
 	reg_base = devm_platform_ioremap_resource(pdev, 0);
@@ -524,8 +524,12 @@ static int lpc32xx_gpio_probe(struct platform_device *pdev)
 			lpc32xx_gpiochip[i].chip.of_gpio_n_cells = 3;
 			lpc32xx_gpiochip[i].reg_base = reg_base;
 		}
-		devm_gpiochip_add_data(&pdev->dev, &lpc32xx_gpiochip[i].chip,
-				  &lpc32xx_gpiochip[i]);
+		ret = devm_gpiochip_add_data(&pdev->dev, &lpc32xx_gpiochip[i].chip,
+					     &lpc32xx_gpiochip[i]);
+		if (ret) {
+			dev_err(&pdev->dev, "failed to register gpio chip %d: %d\n", i, ret);
+			return ret;
+		}
 	}
 
 	return 0;
-- 
2.34.1

