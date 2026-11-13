Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567963;
	b=beLvXzpU4bUBIE6TTfrf2JLjulEE3+n0/SZMNJ5ISF1v0N1iyJRBoxF0str3ZXhOJd3p
	 MBuLx93fJjxYHCO5yWOtKQjjQVpCDlDVPd9ux7NdbUoydn7OjKtmrSTjD8Q2SeQpNGSwF
	 xtQQ3Htwh4EW4ZgSShohR7SHP34iarTu/wHjoju6U85sPtmksrwXs2ND0WPiWPer5lHb4
	 Q3KMOmLjDOxV+/EsqYmTYizNGSU6xgI22XQKtEKYmz6JvRK2f93NOCWkabC4PG2WsBy/4
	 I/6f3dxUhPSORzFvB8z9JyU0I7taUgJpJx9HorATGcP4TFR7ftk0EWQ+Ypkm9myMSDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567963;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=yg0iZZhCVCWjBVUqZaveZMuIdKfbsHhFyJo5yYUlYrE=;
	b=AIvP4qUGPOQvCgUmFoJtoPLBYEmBt0sLZmyCusmE0wVNTriPhJDh1VI1sBfEuidDsMCI
	 Xbg5U1ZVxuVaL9xsNAiuSgY4H/dmwU9FL48yGmm3ZN1YkWqZrCVzOi5RlLIf7BbnKtgUa
	 gNhE5rH7+VwIctnadYUHiBzo5DgJasuA3yg/jobWn3l7eD2FwFnjB6rmmZikT/YiTnRJZ
	 rkLVDRSu+qWuV7S8jEaNUa1TySgkpAupfsRxwiCu1LGMSt5cdE/SLFjMmEuYY8o1z1eeo
	 5GuvdSYWdVt3gqnxWiCv5h9a1cL49QLuzVBFxsbJBPqENYxJc6+YUMUf7z/mvql0pFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bD5rIA6W;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86EA460A382D
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 11:06:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 86EA460A382D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=bD5rIA6W
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a5087a5348so5907425e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 03:06:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567962; x=1795172762; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yg0iZZhCVCWjBVUqZaveZMuIdKfbsHhFyJo5yYUlYrE=;
        b=bD5rIA6WLcIQpx8DTYeXxEY3FOwPzZOkYVEms9yqlDmrAm3UraDvLisHOLTtIZbore
         wH6mPfa+PbaEbEOUHJW4hq/ZgdqU1Exx+1/hKgzBlNFzV/BR3JWXKsIELtm1LW6pRyTc
         8LaH3ZkFXZVUtvkEZziZqfJcz4qX5A7oBCZCD2+LjDVVOOCDQbG7DqoMwDeCmSeTYB2p
         hVSx4dq8z/HlWUwt9jOabLRgWmoSbZqrk/88G4ZF5BqDL7RDf/+6Wa0kPnP8/5rurOqi
         YiM2PlMsNoqg1zCERHGN4BojmJG8f6j+y8fm+7p96aLjPDyp9VDo6Nd6KvKDQY9wPQeS
         +h1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567962; x=1795172762;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yg0iZZhCVCWjBVUqZaveZMuIdKfbsHhFyJo5yYUlYrE=;
        b=X5FpuU+ONIvcQN/zbZUCpUlYKyFj/t3Pm99YaCraz2ZPKn2k0XPG0glYCrxjg0i7m2
         dg0W5wj+TfquADKk2e6hwtxiM9wMoZJISuE5AKp6jZhXhqLDMMjgq7SaC9zTaCb/9xE7
         IynaJQFt0AJvIIsOUBbjqZGrUBd3A12q7U6ZQ1B/uN6chK/vMax7GovXe9hf1p3lrHE5
         IkU4K5tpmqXS6WI1sJGZiDsP26ei6bEJuWlbzBYYI3AfDaB30kFX4WfHbEQQ5fdHiGci
         Og0RBFJzPV3bC3nkWX8NiE+CubtAK2CeKe2mkizJwmCAFuniueJ5efmfh2Ty7PlqGjKk
         soFA==
X-Forwarded-Encrypted: i=1; AL+hErEjFeuOdQuOh+rJhSQUxqFTuqmy7iD3Bh2wLXt35CvWibD2/jHgwOCczfJiUhK8i1gUixbYnRBalUae@vger.kernel.org
X-Gm-Message-State: APuU4Z9q0lpSZvfCJl7n5rt91ea08KL9kGcvNWmS66WqM9vmLnOr23Ad
	5mudUlW0Axl8wMRXwkOitY3+BX1zjbERnU15uK06yS4txAcwnkuRvgxzcCAmX5TvwwA=
X-Gm-Gg: AYBFou2LtBt++zRiO6kFJW08u/6BJkBlA1ERzb7s9NnW6vQFh0GC03vb1g9NvzREk1W
	rQXw7rNpBlyuOzkeAhnxHXnjjKRT45Uk/Si3kLdYUcoEExObaqJtmau8xtR6qQdpIJzff/6+wTV
	KE2zQ5SKswZtxgctWFHuyKLmoIn+TT76y3FbiV51iepWWT7IhMtO62gbehi/nxtjm8Xna62P3Es
	eNf5QexEk/EYDw4pYyQGW/FteXecHS1XZAT5alH3vAXLcoDc1Aqp5f/HLnQKPdJzeVsP/lApDDE
	13WlsqOQpzDWA9BwhBrKhCBTnO5h1RIfbJlK4qtNZjJcdCTGfR1gV3Kgx1DHN5AZdoGKV16TSMW
	EoJn7tnENolkMzUEG3YEGrpxbg5NJ8YBbBEzpN8/zlq8zltLyPGbcczrZ7qxMI3jntj3USrIbTY
	sn9xSYO8XqVCRnXVp+yLx0/hpp/8RP5A29AhQvJ0dTZbwpwpO1M5dnlkNaMc4UiDC94fdnvqcqY
	IMUDd8L1ePOVXvSPn3LkprB9DmPODQ9T9tBS9n8tDOesGTS1kCoJagM6NY6Ui2yE9j3CU6cbJlh
	XZGsDr12x4QQfcYJeQIIHiM4rPOEGfPl42WWApmIz43sd6FqU9M=
X-Received: by 2002:a05:600c:8905:b0:4a3:5a98:c279 with SMTP id 5b1f17b1804b1-4bb55a57c66mr28918645e9.8.1794567961834;
        Fri, 13 Nov 2026 03:06:01 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49d69c21a17sm399461f8f.50.2026.11.13.03.06.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:06:01 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 13 Nov 2026 12:05:28 +0100
Subject: [PATCH v2 02/11] pinctrl: scmi: map the schmitt trigger enable to
 its SCMI type
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-2-faccb4685d88@baylibre.com>
References: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
In-Reply-To: <20261113-clegoffic-pinctrl-scmi-gpio-v2-0-faccb4685d88@baylibre.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Linus Walleij <linusw@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Oleksii Moisieiev <oleksii_moisieiev@epam.com>, 
 Andy Shevchenko <andy@kernel.org>, Dhruva Gole <d-gole@ti.com>, 
 Bartosz Golaszewski <brgl@kernel.org>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

PIN_CONFIG_INPUT_SCHMITT_ENABLE was sent as INPUT_MODE, which drives
the input buffer, and PIN_CONFIG_INPUT_SCHMITT, a threshold, as
INPUT_SCHMITT, which only takes 0 or 1. Send the enable as
INPUT_SCHMITT and refuse the threshold, the protocol has no type for
it.

Fixes: eb524cb651b7 ("pinctrl: Implementation of the generic scmi-pinctrl driver")
Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index af33ddd4056b..cbe4f3b6368f 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -128,11 +128,8 @@ static int pinctrl_scmi_map_pinconf_type(enum pin_config_param param,
 	case PIN_CONFIG_INPUT_ENABLE:
 		*type = SCMI_PIN_INPUT_MODE;
 		break;
-	case PIN_CONFIG_INPUT_SCHMITT:
-		*type = SCMI_PIN_INPUT_SCHMITT;
-		break;
 	case PIN_CONFIG_INPUT_SCHMITT_ENABLE:
-		*type = SCMI_PIN_INPUT_MODE;
+		*type = SCMI_PIN_INPUT_SCHMITT;
 		break;
 	case PIN_CONFIG_MODE_LOW_POWER:
 		*type = SCMI_PIN_LOW_POWER_MODE;

-- 
2.56.1

