Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com [209.85.167.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9761746AEFA
	for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2026 13:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785331822; cv=none; b=UEJLGVBRMyIKhtUPKcrc2+OrWZzC3Po274Q54bf/s+opAopO5TQHlvGz2LHWm4h4Spy6f4NbtA2gWxeCBB700JQtdEEhJLtwqw+at5C4l/FaD2Ubcl4ZB+Jicci+k+6oE/vhVpIosVMRf/3acx9C362H+j4S/MQ5rMXYYWq4l/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785331822; c=relaxed/simple;
	bh=h3mRRRWRIqCqBZfRc0CmpRMQKXvpCwzIZxNJvRvwNxg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UZGQFNqHjlzcq7xoFX4GXWBGELVwoMLtwjZjKh0I92AkY8vZVubl7AScH7vIq0bq16KFBZU7Je6mH2N3NQQMmbrGGZtg87m0N46kdnpzlGF8hYtZYkMpRja9YinpigIAqQXUlaAaRtYyP8rhCBVGZmsEYsKLgH0eZX4dWU7O6Q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cW2EEhv+; arc=none smtp.client-ip=209.85.167.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cW2EEhv+"
Received: by mail-oi1-f181.google.com with SMTP id 5614622812f47-4a475409044so350697b6e.1
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2026 06:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785331816; x=1785936616; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EaOPNvMsi1Oyj1Rb1H3YB9cT3SaYqM0H52mnkJ9+dKo=;
        b=cW2EEhv+eZcw1EF3qLP65xwCQiNKoqSWvpcTMIOmHuBeEscdxMdN++l+SVHvUMoCdt
         1NuBpO7xcMaN5v87SdJjCG4TXLpQTiM81V9l2UAZfNMEf9Nk3nc9oYPfuE0XfZvBaPOv
         E8Ga+3hI89ZSpWdOm/Ycy251hdXiSEcbJXxMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785331816; x=1785936616;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EaOPNvMsi1Oyj1Rb1H3YB9cT3SaYqM0H52mnkJ9+dKo=;
        b=NADFVJ37Feq/CE5+B5ZgcftrRsvTzF89ApFR5JiE8HK3zUvP9qXW0gJ9z9LzJnSOBX
         Rpg9Z17j86bQYbZA+N95kflqXrlO/llukMwGmK6H/GHXkgI81C0736N1knJsJ1Hml9UG
         pBM2C0v1rk2O+dLdEuLfj3sthni4pIGrpalJ6aXjUtDnSdi1S7C9mx4TsipVtWSMjFGq
         Rt9iNeOt74GCBAMcjxn5peZKrTO2N5ngV8MWWR7wNePcTjAwlo/eijJnh4wSjOt4AgWg
         WUhZmpDd3pK97y0qjQcZ7vW5FZGkqZM+VvwYiM52E/NoeF/7E9Qw+ubBtPDwcKkoaM5Q
         EmiQ==
X-Forwarded-Encrypted: i=1; AHgh+RpP9EyP/WCRv9pCU5T78h5ErOX2kQknLgPKo0ZGWVIIt0RERq38CcIDvQ8c4yT12sQ+pZP+jmp7EZL7@vger.kernel.org
X-Gm-Message-State: AOJu0YwgnczrPW9CzIdx4gGl86beMO+tP+NAfiFtPK68Ok8tZQMzCsZ1
	aA0G/TkNqkExocz5nlJaDPdy8yy7E/WWQOfzxhI5ON3eYmComKUHuGVTKVPMVvsMOA==
X-Gm-Gg: AR+sD11FZdQ2ZKjQgavAYHlVEQhV6TwKu5p8h5Jex4BfPRO/XT22govZt2h7FbCCJ2+
	Zf6W2LrDkFyrBV/Z9aZL0eO5acOw63aG3qvab6dg2R1fMYmDEgMJgO8hpl3C/nrtbvd3X/LWxQt
	VYR5GStQDK4YhiUMqlZ5U8tO2+LeewqrO7k3pPZuSNDyCJm9YMi/Z7HnKoyi4znv6/0GVVSAlXA
	yam835rzm3XCUxdU/da+U2eJDlFw7K7+Gxlcf8kBrEUU04duIfvZtJPhCTd2Z17kd8S/ng+0rbw
	A7nQkVwA0rCQK6lvaMJYlcx112b891P2KlRsXwyYKJij+RoUXqEG25mrDBKhjPCWdpK2p6z66zd
	9vn8KAmM8HKBCwBfX3ZeM2bY+9jTc5wR7h7UyhhYe1vjH4oBhXxggAguJvfNLNAkrVnsSyZri/h
	3strPvOjSbCRSw3AlLssvf7D3cKziOGYslD0sZovH1WIGxC/TthCgjBXA=
X-Received: by 2002:a05:6808:ec9:b0:494:9c17:c336 with SMTP id 5614622812f47-4ad5bd54593mr3466258b6e.34.1785331816049;
        Wed, 29 Jul 2026 06:30:16 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ad6ef5d650sm1712932b6e.9.2026.07.29.06.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 06:30:14 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	linux-rockchip@lists.infradead.org,
	Simon Glass <sjg@chromium.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	Ye Zhang <ye.zhang@rock-chips.com>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] pinctrl: rockchip: Decode drive strength in the get function
Date: Wed, 29 Jul 2026 07:27:25 -0600
Message-ID: <20260729132736.3807082-2-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260729132736.3807082-1-sjg@chromium.org>
References: <20260729132736.3807082-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The decoding of the 2-bit and 8-bit level drive-strength values sits in
rockchip_set_drive_perpin(), where it is unreachable: the SoCs whose
banks declare these drive types (RK3506 and RV1103B) take the early
ctrl->type branch in the set path, and the read-and-decode logic in a
set function has no purpose. Meanwhile rockchip_get_drive_perpin()
lacks the decoding, so pin_config_get() and the debugfs output report
-EINVAL for these SoCs.

Move the two cases to rockchip_get_drive_perpin(), where they belong.

Fixes: dbd2317d7b9f ("pinctrl: rockchip: Add rk3506 pinctrl support")
Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v3:
- Add new patch moving the drive-strength decoding to the get function

 drivers/pinctrl/pinctrl-rockchip.c | 38 +++++++++++++++---------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 7e0fcd45fd26..08a46a04a815 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3267,6 +3267,25 @@ static int rockchip_get_drive_perpin(struct rockchip_pin_bank *bank,
 	case DRV_TYPE_IO_1V8_ONLY:
 		rmask_bits = RK3288_DRV_BITS_PER_PIN;
 		break;
+	case DRV_TYPE_IO_LEVEL_2_BIT:
+		ret = regmap_read(regmap, reg, &data);
+		if (ret)
+			return ret;
+		data >>= bit;
+
+		return data & 0x3;
+	case DRV_TYPE_IO_LEVEL_8_BIT:
+		ret = regmap_read(regmap, reg, &data);
+		if (ret)
+			return ret;
+		data >>= bit;
+		data &= (1 << 8) - 1;
+
+		ret = hweight8(data);
+		if (ret > 0)
+			return ret - 1;
+		else
+			return -EINVAL;
 	default:
 		dev_err(dev, "unsupported pinctrl drive type: %d\n", drv_type);
 		return -EINVAL;
@@ -3390,25 +3409,6 @@ static int rockchip_set_drive_perpin(struct rockchip_pin_bank *bank,
 	case DRV_TYPE_IO_1V8_ONLY:
 		rmask_bits = RK3288_DRV_BITS_PER_PIN;
 		break;
-	case DRV_TYPE_IO_LEVEL_2_BIT:
-		ret = regmap_read(regmap, reg, &data);
-		if (ret)
-			return ret;
-		data >>= bit;
-
-		return data & 0x3;
-	case DRV_TYPE_IO_LEVEL_8_BIT:
-		ret = regmap_read(regmap, reg, &data);
-		if (ret)
-			return ret;
-		data >>= bit;
-		data &= (1 << 8) - 1;
-
-		ret = hweight8(data);
-		if (ret > 0)
-			return ret - 1;
-		else
-			return -EINVAL;
 	default:
 		dev_err(dev, "unsupported pinctrl drive type: %d\n", drv_type);
 		return -EINVAL;
-- 
2.43.0

