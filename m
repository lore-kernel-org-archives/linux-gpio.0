Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793434689;
	b=rIw7x6ZBeOxbbOH5PWqsGmPGu2SYt42eELCEPzcmBF39NivEWaLLNOaxTc501OPdI4Dr
	 MSIKh9AUubnjbBHqf03TP3zIiqw5Jf/x/AN1tcpFMDpcCx0DxtASJzqfpAMxjWDsOQd3m
	 8GnsHQil9OUu8qWlwgNK2USMPDPOICDc+oaWbjZ78UyLdAiVRGqtuZxW1uxlngbseLrML
	 gYZ3BIDT+zmTasSLZWOWkjvcBqPdhZP3mInAw3GpO6yqsUicKEU0LGBFDsHAYzAARxgk8
	 cq1RHkdjmEl5Z5AExj2c1hYCwWAifEHS2jq5Aam8vBt1dE+itmm2DM6B7ukoxhl3dWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793434689;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xcR6OO9DMf/GV3DMUQD0OFfeXG/gnWXrfg7cl7YoGnE=;
	b=aa3dW/W7TFUsZWD3N0GViDNdfG1HzcQsSflKJU/uQ2CblQAojdrHwgcndPUsicGIvDKD
	 utX44IINtDMloD1NcCk3W7gr77j1u02NJnyhU+8gm3U1a5XtBoD7if/GxtsAqgiNBGe1V
	 T7LPNWF3BYXa0mnGm6SEFdue+GkXtt2MRb9uBPl487nIUZXqPzC9lkX2xQj/+Qny1W5tp
	 sPnRE4GQj3DmEBl6J7klPdKT2YkCVGEaX3L1z5VTW1C0i65mu5/epmnnJP35QlamvZe7e
	 27gBRE1oHAyHr7TJHVSwa4kf+thOhsexOQgR4sf+kZXqn+Um2m+VdAi4D5U4ly/iy9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="zKULn/6D";
	arc=none smtp.remote-ip=209.85.216.47
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449C9606A31E
	for <linux-gpio@vger.kernel.org>; Sat, 31 Oct 2026 08:18:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 449C9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zKULn/6D
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3ae57dc1ea9so761621a91.2
        for <linux-gpio@vger.kernel.org>; Sat, 31 Oct 2026 01:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793434688; x=1794039488; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xcR6OO9DMf/GV3DMUQD0OFfeXG/gnWXrfg7cl7YoGnE=;
        b=zKULn/6Dode09/lnBjRIO9OamUmJKqsN3UyMmIPm1wcXvP1MO+eJTj2vp5pX8oBLMq
         LfpYtOMFP20aXUWHKlPQkX6kRjD8kc9f6R4sTNMK/p8xMxLUXH0bQJPCeRPaJiHePuVV
         NeSt1VX+SJf7MLTgXbVM3GItqzA/l2zYjw0Yyj4p0/T0fJ//gf/Zbx2BTWNFpnZ3A0BR
         J3tuOZSj7lpfcOIvLRUbJpkELPIxayjn7O4Rd3KOCArYkRtGOepzAzBE0wNh5ZLcmh/e
         h8KrVl5961YqnT+3/vrRSgScW7kw+jBiYipM5JJwRy5ze/Ll07G03CIE8sVKelWERVpg
         QAQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793434688; x=1794039488;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xcR6OO9DMf/GV3DMUQD0OFfeXG/gnWXrfg7cl7YoGnE=;
        b=KonK73Ned9e0ZLx8V32SXnstEeTSWefdyyEFpCudlExVCujSynAl9EK8dDO3XP+gWE
         G9hjR14GOC4bv995uVZwOi8I0/s4c3AKiXhgq5athAP3kKu247LMRLTNSC7bRRTu/bZy
         QwraXJaTcHg1iLH9Iq8crx+p2essudx8QDKndoO7XoQeZ97ePkLRq8NqUO1JQp2UdeVr
         nHe/n7jHeRVsNfgCdq5PmWMBiR9iyJQMIYrGXyJanZH7o5AFlzdSz51ni8n8sexkf/AK
         VeaIhqHwlmHizYMNP+5hdBEr7OrxzJcFkNkN0IdtR4cfKjRUj1/UeW5C0l8xqNkRDksB
         mHiQ==
X-Forwarded-Encrypted: i=1; AKwUvBx48V2aANmx83KEzMEyn/uX6A4OI/F6MGgJbS8c5zcvKNnsEG6ezY4fXwTW+PHITRwiaL7BQHYeRl7c@vger.kernel.org
X-Gm-Message-State: AFq9FYIP6KkDg2TU6YgQH+lLFBZjpmP2h2jqNF3NFtm/DQ196czt8Xe/
	GVOgwg3EGQq3rRKP7AmU5j//Nvwxk5sKcoTGoi2cJSlYBQ1+KK54UzQKj9Pc4WhO
X-Gm-Gg: AYBFou28rOhH8dHTeh0d8ZBc/aT/w9bUcLoP1ox62YMjZHXkyF4xkjWhmuw1bjJ/UN7
	Ezk6Y3Y/kIYcCf/4sjoDxHTv/ZhmXt3cio7vw1z/+D5Swmdlk+Z94cvIaGNfsljgfVXJSrUo4HY
	HuKKAE1Onk6dsAb3zR+qwcn+qK1XORa+kPg1lFrDDzXYn4S5vddiFYAHje8G2kOfOAHqjDT8W46
	L/tYEQ0YPuKdpoujXVedEXfENr0w1Kv3ZbQpfvWWsiU50PNfyck+W/vRNmLRRhoo9iNnb9I+X4w
	+cBPaHpVMFsn0bvtuo/Uid+S5nnpk59Qp5rVUSELPwyjsAcHYppB+2cj7o/SPPV9jddoubRzP/k
	XRzhmTb0jD0KjqJ3YKPjz+dpx4kQby6z+NejIgXgR8LPGLVry52ZKJdb+cexi2KyzCGwsJ8uB8H
	cHaWwalwJbHTdOsim9m0xlFV79NxuA3nmtQhbiuYyJmi561rsJN1EPaegObZ0/MlmZX3h2MbV82
	DcKAzax+fwHZKHIngQvbHK9KD55QS/E6LhO7c6HIbMYbvYORbFIFatRj0L0obwp0VPRV5ZwYV80
	kfgkqiDohi5+ysCjPqFwDrLsgtkvbcJkIgV74YxMUQ+LEipaL/0MjcWdodrLKxzce30=
X-Received: by 2002:a17:90b:43:b0:3a7:e126:4980 with SMTP id 98e67ed59e1d1-3ae8979de24mr3720019a91.43.1793434688533;
        Sat, 31 Oct 2026 01:18:08 -0700 (PDT)
Received: from asahi.tail4da9e3.ts.net ([218.48.198.193])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e99b267sm11288897a91.14.2026.10.31.01.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 01:18:08 -0700 (PDT)
From: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
To: Linus Walleij <linusw@kernel.org>,
	Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>,
	James Tai <james.tai@realtek.com>,
	=?UTF-8?q?Andreas=20F=C3=A4rber?= <afaerber@suse.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-realtek-soc@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] pinctrl: realtek: Write the encoded slew rate value
Date: Sat, 31 Oct 2026 17:18:04 +0900
Message-ID: <20261031081804.218566-1-pocj8ur4in@gmail.com>
X-Mailer: git-send-email 2.55.0
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

rtd_pconf_parse_conf() maps slew-rate arguments 1, 10, 20 and 30 to the
two-bit field values 0, 1, 2 and 3. However, it shifts the original
argument into the register value instead of using the computed encoding.
After masking, these arguments write 1, 2, 0 and 2 respectively. In
particular, the distinct 10 and 30 settings write the same field value.

Use set_val when constructing the register value so that both individual
pin and group configuration apply the existing conversion. Leave argument
validation, field offsets, masks and regmap error handling unchanged.

Fixes: dcc9334435b0 ("pinctrl: realtek: add support for slew rate, input voltage and high VIL")
Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>
---
An arm64 QEMU kernel exercised the RTD1625 MAIN2 pin and group
state-selection paths using the real pinctrl callbacks and a synthetic
regmap backend. A slew-rate request of 10 wrote field value 2 before
the change and 1 after it, while adjacent bits were preserved. No
board device tree, physical MMIO or signal timing was tested.

 drivers/pinctrl/realtek/pinctrl-rtd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/realtek/pinctrl-rtd.c b/drivers/pinctrl/realtek/pinctrl-rtd.c
index 60222339726b4..656c281c557ac 100644
--- a/drivers/pinctrl/realtek/pinctrl-rtd.c
+++ b/drivers/pinctrl/realtek/pinctrl-rtd.c
@@ -438,7 +438,7 @@ static int rtd_pconf_parse_conf(struct rtd_pinctrl *data,
 		sr_off = config_desc->base_bit + config_desc->slew_rate_offset;
 		reg_off = config_desc->reg_offset;
 		mask = 0x3 << sr_off;
-		val = arg << sr_off;
+		val = set_val << sr_off;
 		break;
 
 	case PIN_CONFIG_INPUT_VOLTAGE_UV:
-- 
2.55.0

