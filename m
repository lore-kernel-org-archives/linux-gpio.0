Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA61F411F95
	for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2026 14:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785766245; cv=none; b=h+zdFsQ6Bkh+y5j7IaxI+ELXkop/FNHGul+e19dHGYPlgLsMRPVeC4cC6Tw5wkLw6ADZ0xkhlooK22ANU1BoXTFpS4PgosDx2lf+CpB68eZlu6xprQuEmkUhtVGb5QvN7QV52FHHeFaNRyx5Z0VKVAL/Kx0aO+SWBBxjY0ZGw9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785766245; c=relaxed/simple;
	bh=8ON7cLoaK2drFfl2fBDzRH2dG309T7ctlwMdTZSLvc8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CPYHM2tYU2vhO8hDKCJGOSHUquOl/wK+7Lgp1PxsMFIgt6wwEdRjsPfgxwVaX92XkMG+2mB5zVo9bcWmXaISOY9kWmZbJdKozUx1UNGZhjaxI6K31Ch1Y6M22Oc9luJHfnOJcPB76HOMvIsLJrqqSu4zngPhn68njoCBo092n1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QfcejpSg; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QfcejpSg"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6ae534c2aadso943774eaf.3
        for <linux-gpio@vger.kernel.org>; Mon, 03 Aug 2026 07:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785766240; x=1786371040; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JVxxd59a0doljp4cj9wSApSMEwIu5WK0T7ewILpCQ84=;
        b=QfcejpSgtPFKTD3sDxEWWMf3gGdM9XfZJiv2vouFZj7b+YOcA/sWcDcys8qT+E8ofM
         4sf1KyOrP1EV8F1ETd9JsUtIuxOZDnqj3UJoZ4MbEk5Lq3Oej9CnGfTmYwXN6mewIOhy
         8e8WruHkhFQO2Ffi11EhqdytwUzjtDNgtMBUo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766240; x=1786371040;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JVxxd59a0doljp4cj9wSApSMEwIu5WK0T7ewILpCQ84=;
        b=r0Vyg91cm1X72LLvMfpjH4YnXtYWXrAaYrehZr5vMfJzuAOpIR1UYERgd0ky4VW8OE
         PNQZ+pRIoQ5mMhmXso83NK/0TmI3xnI5W67P9xm2q0EZKJ68lYWwQukVvcKMrQVFUDnG
         7pVPY46ulM5PCbq4bvRMawwZoLCJdF0JRxtNWz4zvgxBLAjgEZ1LPc8FpvsqBS+n229j
         yNAFIJIN9R6VsfL6BrOIymJukzXtwShf1G8bvgzCzxq5h78TMr5DgpUPheWq4J4xq9ns
         6MSKJZq3SH5xv6O8TDFBDN7ZKVxfM1vAk/6mzx8sw4NQgI/qZGxpWVISw2o0eb7Ct617
         Erkw==
X-Forwarded-Encrypted: i=1; AHgh+RrXifwmwvZrsA0UXqzK8RSCUlQSn6vXKYg7GoKt32Gto0OF9q5mwwFusvOfReUcEfcuv7EK8dMcFI9k@vger.kernel.org
X-Gm-Message-State: AOJu0Yyav7M2HAhQ2zTpXwWml37FGmKdM4y5GpStNtamYwzjlNG1gZmF
	rhAxe2e6v5avDIlxJejdjGdSLMKwugQAMz6p3UNc//x8O3Gxcrc4iIuEBLnbAUncYQ==
X-Gm-Gg: AR+sD11S4kNCkZxFQKO+nuVmj6ua2svAOVu3Z9ZRKtSLnVVUDfGlCiFUrjA9ooErPJc
	eX0r71b37OaKUfQ9JT8CeiXzcaA4OmlcPwg0WgzK9zWsqDo8vJqU0R794ir6b+uJBMN8KiJKC52
	NtqDikOsvV5ccxIzCUKvr4HzDJVAPMXglqB4JruT1XltYV8ruV6NLSfx6LJ1MgH3csUahGVnLaV
	Qns8jU+fjs+HcO1NEnd52gTVs7MIwhrYTZ5U9IyhPpoCJYtKlHQ1GxE65lklOGpG3GtoR4gHSPK
	DVMnucSq2mukxZXiF00a9qn+itQZZ6Uo2MRatItpLIkn2YOZe6ciz3lMF0tpxMrhdUTkWyED4uN
	ozcB4OKI2PLPZ5AwuuY0xs8EuRTXRhpYQblu0QIB8sEyFInE3EOtP7moNcMRo1bFa6GUUxg7SnF
	E89qRmIW45IZFfuMrqdlwzUOV/oQjmgp0VpN3XbKhJyJe5UvW2rC1oP5A=
X-Received: by 2002:a05:6820:811b:b0:6a3:7ee4:11c7 with SMTP id 006d021491bc7-6ae4336d8c5mr15037985eaf.29.1785766240682;
        Mon, 03 Aug 2026 07:10:40 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ae3a0c9162sm6526695eaf.11.2026.08.03.07.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:10:39 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Vladislav Leonov <vlad@zlab.su>,
	Jonas Karlman <jonas@kwiboo.se>,
	Simon Glass <sjg@chromium.org>,
	Fabio Estevam <festevam@nabladev.com>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] pinctrl: rockchip: Restrict the RV1103B 2-bit drive type to bank 2
Date: Mon,  3 Aug 2026 08:10:24 -0600
Message-ID: <20260803081024.2.5ce19c438ee3bdfa91ee7d414bac5ff6b16eaba8@changeid>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803141028.710706-1-sjg@chromium.org>
References: <20260803141028.710706-1-sjg@chromium.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The RV1103B override in rockchip_get_drive_perpin() forces the 2-bit
level drive type for every pin above 11, but only bank 2 has the
2-bit fields; banks 0 and 1 use the 8-bit level type for all pins,
as the corresponding check in rockchip_set_drive_perpin() shows.

Today this is harmless, since neither level type is decoded in the
get function and both paths fail with -EINVAL. It becomes an active
problem once decoding is added, as the pins of banks 0 and 1 would
be truncated to 2-bit values. Add the missing bank check, matching
the set path.

Fixes: 6d3ea3120eaa ("pinctrl: rockchip: Add RV1103B pinctrl support")
Link: https://sashiko.dev/#/patchset/20260729132736.3807082-1-sjg@chromium.org?part=1
Assisted-by: Claude:claude-opus-5
Signed-off-by: Simon Glass <sjg@chromium.org>

---

 drivers/pinctrl/pinctrl-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 8bfc7ab5de15..08084ed2cf1b 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -3212,7 +3212,7 @@ static int rockchip_get_drive_perpin(struct rockchip_pin_bank *bank,
 	u8 bit;
 	int drv_type = bank->drv[pin_num / 8].drv_type;
 
-	if (ctrl->type == RV1103B && pin_num >= 12)
+	if (ctrl->type == RV1103B && bank->bank_num == 2 && pin_num >= 12)
 		drv_type = DRV_TYPE_IO_LEVEL_2_BIT;
 
 	ret = ctrl->drv_calc_reg(bank, pin_num, &regmap, &reg, &bit);
-- 
2.43.0

