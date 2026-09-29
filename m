Received: from mail-wr2-f35.google.com (mail-wr2-f35.google.com [74.125.225.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25DF7457E4E
	for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 20:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790714244; cv=none; b=e04CWCBEk1GJa5JGshyKj/HC3/7d9cV9Xp2npeh9n1LbL+eA4QAGHgUr0KzblhUdaCkCVGhnMCYfniNvfIW3KKZdBgjLjhIdYkBApUegBK2uQEBu3mesrEDvXrjRDWLf4tWrmy0IqMvY2wFqukEzo0V3+ZCImln8Fwx8rqWmAOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790714244; c=relaxed/simple;
	bh=Gqvcy2MOOYrL8Gno0HNWN9hEb57iEhrmpV/Bp5STDho=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iNfvDnSv2pn+hI5Nmj+D9eDlHjUbct5sYDPtoid4DLRSzUO7VINFyjAUhcuNO2P8OYu6xN3DBG5yAj6XObyf5a8gBYbOO46g67EY+ZFvZ/VCKsnpr9NBtzXc0IoiH5iuW0qJKCR8/wetDvNuok/UP24FKlssLy5AiOAr1B/c+6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QZYF45M+; arc=none smtp.client-ip=74.125.225.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QZYF45M+"
Received: by mail-wr2-f35.google.com with SMTP id ffacd0b85a97d-48434392b02so3987631f8f.3
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2026 13:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790714241; x=1791319041; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uc6m/QNpalNv4a9wmqg9O0BMMr47ojwjmucGyrpTpAA=;
        b=QZYF45M+ITdIzIGzHNdTvT9VMVQTEs9FcQrsXorTsfQfM5EgTro2DOlqZDLX+S6BR8
         KGA+xUWIZNbDnfIFlLUO8BtNNV9DZc1owqnYEthMAn+V4CjNOpRXywrkZKHXagGnw3o9
         60FkZ97e7XCCuCQ0SA8tZn+WwuQP25rRLNKhJLPYsrX8XncqDxEBRv/RobJ8/9Go9FFK
         9NwqbtrLsxZpyKqDj8AAA4YRkVyrpWLVncWPrZhnZvW7mOej3fQqppjz+T5K4Dd3cecy
         NZdyGNSjomNdwB72S7O0iD6SDc6/WwFoXunnFghk+BKuyO3Cf4dtiCVDYXmEi1zbmj/i
         zBjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790714241; x=1791319041;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uc6m/QNpalNv4a9wmqg9O0BMMr47ojwjmucGyrpTpAA=;
        b=lMCqUJy12gvfsR0DGZ3fIR/V+Drk+OTPxa1hr3TAb/6A9BT5NwZUMx5clSIvEB6amv
         LE3jW5UX+Ok79ULlTMqEXaV+bORAdb7DoXTuZC1flh6hUa6QWqgAQrQa8dG+daa/Udh2
         IYW9hwc41EyQORDsM0l71VyKPgFnt3YruCzfP4JytITecwljlyNSD4/qJZZ1bQ5UBm+r
         zVwgg7mWzJW5z2bzUWFA8Isu6u+yDfs2ZThGeGsCK7GIEjDUZe6NtVPBuJQazSg9+KCU
         qNfP5dq2+vi/50qpiIhGHZX2GwAM+tC5OxTn56eah4NBj33HRrxSIWg8SjPFEpn/1HXu
         tGWA==
X-Forwarded-Encrypted: i=1; AKwUvBzs6cZ6RjqCxEQE7psKcv7ABWnUnM5K76/Py5BCWARuKXuyZ3U7f0yiNvjmFJDi17O0c1Lhe82HFJ4y@vger.kernel.org
X-Gm-Message-State: AFq9FYIZcZvOru6QralAmYVPGoQwkKxUpsU6bzsyaQTsTUN0vNEQ2aXc
	mCUw8ehKJiXHb2OjyEdfHLcdF+IhXiEinKScP++PgYDWeKEkHTq/4gFO
X-Gm-Gg: AYBFou3GXCy9uhrkqG38bGVGAd3Qai6sobmfVN8a/XkBbSADi4nGbEmj1hKqO7vKCET
	dTAeGjoduE5tzvaH00CgIJj3CljgQJ2QNH8aU11YafUaepUEaPPOzbO0+vH1qPy2p21unNmmeIH
	VjEqE1S/JgjDA/fkZPgnzwZBN7Pxrjj9vAFjpCTHqQ72BovNjFnF4KW8nladsopeaPjfxapF726
	KKG7+7F8OkW66oPLBg90CoaO2QVpg9FqZjuvsUR+nk6SCe663h319BbNs8mG3ZspdMsoTwIbcZx
	WtdeOA4z+xqdVICuNoxswcOpAmn0QXtlFDBVrRk/Ea6lHRAxS22z5bAP6RpBNj588S6FjxqFdFi
	0Yuj+Qdr91Kxw+kHWp+EvBxeBIpkTJJFtReBmYabXSE+fhc3suxDgCsS83rrPxvqiuaw285UyD3
	0Pm8ltIIWebHkso59z/tcl5GThPv9oL6HO9yIvsFmx+Qc30nEPHyZMMbn8JKlpAy4vRloWtgY8w
	SpL9IQnyQsv/wUm9g07c59lRIx7cTe1ow0XQIUPhvX3
X-Received: by 2002:a05:6000:381:b0:487:27f9:83d with SMTP id ffacd0b85a97d-48afe782c3amr766701f8f.50.1790714241257;
        Tue, 29 Sep 2026 13:37:21 -0700 (PDT)
Received: from debian (ip-78-137-176-146.broadband.digiweb.ie. [78.137.176.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48afe6a9624sm1237578f8f.24.2026.09.29.13.37.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 13:37:20 -0700 (PDT)
From: Pablo Mazzini <pmazzini@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Andre Przywara <andre.przywara@arm.com>
Cc: Pablo Mazzini <pmazzini@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: sunxi: dt: number the IRQ banks from the first one that has IRQs
Date: Tue, 29 Sep 2026 21:36:34 +0100
Message-ID: <20260929203634.32998-1-pmazzini@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

prepare_function_table() assumes the first pin is in bank 0. On the
A523, which has no PA pins, every IRQ bank is numbered one too high:
the last bank writes past the end of irq_array, and interrupts are
looked up at the wrong offsets.

Count the IRQ banks from the first bank that has interrupts.

Fixes: f5e2cd34b12f ("pinctrl: sunxi: allow reading mux values from DT")
Signed-off-by: Pablo Mazzini <pmazzini@gmail.com>
---
 drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
index 50a16f3bd131..9c5eb21a86a5 100644
--- a/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
+++ b/drivers/pinctrl/sunxi/pinctrl-sunxi-dt.c
@@ -208,7 +208,7 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
 	 * The extra functions will be filled in later.
 	 */
 	irq_bank = 0;
-	last_bank = 0;
+	last_bank = -1;
 	for (i = 0; i < npins; i++) {
 		struct sunxi_desc_pin *pin = &pins[i];
 		int bank = (pin->pin.number - pin_base) / PINS_PER_BANK;
@@ -221,16 +221,14 @@ static int prepare_function_table(struct device *dev, struct device_node *pnode,
 		func[1].muxval = 1;
 
 		if (irq_mux) {
-			if (bank > last_bank)
+			if (last_bank >= 0 && bank > last_bank)
 				irq_bank++;
 			func[lastfunc].muxval = irq_mux;
 			func[lastfunc].irqbank = irq_bank;
 			func[lastfunc].irqnum = pin->pin.number % PINS_PER_BANK;
 			func[lastfunc].name = "irq";
-		}
-
-		if (bank > last_bank)
 			last_bank = bank;
+		}
 
 		pin->functions = func;
 
-- 
2.53.0

