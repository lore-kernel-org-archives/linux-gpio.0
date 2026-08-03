Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com [209.85.161.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A80C40F725
	for <linux-gpio@vger.kernel.org>; Mon,  3 Aug 2026 14:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785766242; cv=none; b=PGrfs7RxJ7vfFKV8CIqF7UoIOMhj+zkdPJIInWUMCFyjjZ8//Kgr5pMBc657blZ0yyMHVcH43T/9rBnWIaGeQdz/fXfawOoJ8iyR8o/ZZ4TlCd5Bgv73kxi08ODJbf1iLtKWHsIgv7Uq2aPnOjLtNz0ccogCdLCt34uNzha5fKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785766242; c=relaxed/simple;
	bh=7i97WC0GFc1OjbIZ5PDB9Kp5zZVuZx2ij7tryM/Y8JY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WpbM568XmNZewwlmElD6RZXZhZ9UYSXw1HVIzubzoxC/iebB14Ip2SCxeA3tCGxNF+VfrRFy0MT4pLXI2ZiwqQ68Bb+d7quULNMTYQ6vhDG/XOqxr7vpKwtpM6PHpaW7VlkpwRyxCFWqYt+wCPFb2UX2THs8ptcdX+uPTb62AsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=faayjzwC; arc=none smtp.client-ip=209.85.161.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="faayjzwC"
Received: by mail-oo1-f49.google.com with SMTP id 006d021491bc7-6aca0f482e5so2223451eaf.2
        for <linux-gpio@vger.kernel.org>; Mon, 03 Aug 2026 07:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785766238; x=1786371038; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zn8Ob/lYJrtvb6nSm3sGvGJOnXJvrAS/9UT9vBl2poM=;
        b=faayjzwCmZtgZe3diLuR9egddinJbQpf5Q+AICYVWyzwFwQTYDTHu9GjV0FbR1zENr
         rC1DwMjRvheh727R20tEdTUSooJGqP3zNSIMrhmssR19kPPR+jOjjP38MvdAdwt4JIYf
         oLPnaB1IhGeu6ZnDeETdMRC2E5nbumgRM8iqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785766238; x=1786371038;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zn8Ob/lYJrtvb6nSm3sGvGJOnXJvrAS/9UT9vBl2poM=;
        b=FNRk/8282Zq/dlOeEoczvGJZxSusSvhR+omKEqSQbMurW5Us/y6hL6gaU9r/mBk6mF
         ikSoeBQkGSINwd9O3R84FpCP+iNHtopBQ8aRKV8SQjPw84U6TQDaZBC8va8r/WO4DDfX
         vK6g0zsYEvXT4C+lG8ZS+AD0tbvmjoVJnXkPJufQzUE+XpAl+JVl2XDKzB+d0Wygm3Qz
         1XzqmJ51AdKZk2MXchSyDvvgXCK19DJEOfDH8ULpMUt/Z9LOdyOHeEGob4eswZCRIXkS
         340ysa9YyTeCPQKz/dv6yZ/nYEoKEWExU3Y1k3XJ0+u0xxg+rpemARWA+1dSWKcmGnmp
         XqKA==
X-Forwarded-Encrypted: i=1; AHgh+RqAJgq8bFbXh8xsG0xi56XUaTl/pbXE3WIq7M8oAe9+ih3R1o5mw3PwnbZbXwcKQy53Z8GyAo3NXNFT@vger.kernel.org
X-Gm-Message-State: AOJu0YzQtGzaXE8ja98fDH+ZLokM6We2pmkWxxCbyUp4LxqmGasp8pO0
	ZsNzYXO552nbdCJswYU9Lj2WZ8djVbGQXshms3qjYGMo6E/i839/wlJopJlvgttH4Q==
X-Gm-Gg: AR+sD11UOklQ+XGtXul+w5/gqXR4bt/cR/X3kvXulPhopyiHbxx+dRUBEm8kbH4BaN3
	eHK3XqZHvhjWlugOYAs4l6b+N0hpPo46sqWP4wxcdLA64pABQi48ZlhEihJWCSrVJO7hqIUVAor
	Z/ccbrzorKGKe6GvJm/D9ON1bbFKoNCy05O9cx8pIj+PokAZSPZwwaAWJkGn/K/z5riuNx99rQU
	qugV+a2pujruNHdNu7pw2pgVJmmJRF9Mv/BX6OD+ogElEQjIDZS5BmwYPIPWQSfLmFw8Ssczb9l
	m2AP4Kk5bRoxAV8EfsUGKuwE2LxAK8xRmRrgo5I0mMzpFgMxiiBto/grp5Fp53AI/iqDq69oWUU
	6WbMhKQIKaHJjPmifM1HiwIJyJLlRo8ehFZz4bzRcTWGfuVzngFk0aHuX+vllmE2IdTgKebc8zW
	wAOgJDZndM1+0uiWaskR0AWvRr+UY+BzqXCM14lR9KD0hnPY3H2Y/4xhw=
X-Received: by 2002:a05:6820:4a08:b0:6a1:5b63:2ae2 with SMTP id 006d021491bc7-6ae4334a975mr12207278eaf.29.1785766238536;
        Mon, 03 Aug 2026 07:10:38 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6ae3a0c9162sm6526695eaf.11.2026.08.03.07.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:10:37 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	Vladislav Leonov <vlad@zlab.su>,
	Jonas Karlman <jonas@kwiboo.se>,
	Simon Glass <sjg@chromium.org>,
	Jeffy Chen <jeffy.chen@rock-chips.com>,
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] pinctrl: rockchip: Reset the pin count when recalculating SoC data
Date: Mon,  3 Aug 2026 08:10:23 -0600
Message-ID: <20260803081024.1.72f72067ea890a9eac79d63bf655738bec374dfd@changeid>
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

rockchip_pinctrl_get_soc_data() mutates the static per-SoC data. The
iomux and drive offsets are recalculated idempotently, since a rerun
anchors at the values calculated before, but the total pin count only
accumulates: each run adds every bank's pins again. When the probe is
deferred and runs a second time, nr_pins doubles and every bank's
pin_base shifts, so later pin lookups resolve to the wrong bank and
the wrong registers.

Reset the pin count at the start of the calculation, so that a rerun
produces the same values.

This is verified on a Luckfox Pico Mini B (RV1103, with the pending
RV1106 series applied) by forcing the probe to defer once: without
this patch the second probe calculates nr_pins=304 instead of 152 and
no GPIO bank comes up; with it the recalculation matches the first
run and all banks work.

Fixes: d3e5116119bd ("pinctrl: add pinctrl driver for Rockchip SoCs")
Link: https://sashiko.dev/#/patchset/20260729132736.3807082-1-sjg@chromium.org?part=4
Assisted-by: Claude:claude-opus-5
Signed-off-by: Simon Glass <sjg@chromium.org>

---

 drivers/pinctrl/pinctrl-rockchip.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index 7e0fcd45fd26..8bfc7ab5de15 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -4296,6 +4296,16 @@ static struct rockchip_pin_ctrl *rockchip_pinctrl_get_soc_data(
 	pmu_offs = ctrl->pmu_mux_offset;
 	drv_pmu_offs = ctrl->pmu_drv_offset;
 	drv_grf_offs = ctrl->grf_drv_offset;
+
+	/*
+	 * This function mutates the static per-SoC data. Most of it is
+	 * idempotent: recalculated iomux and drv offsets anchor at the
+	 * values calculated by a previous run. The pin count is not, so
+	 * reset it here; otherwise it accumulates when the probe runs
+	 * again after a probe deferral, shifting every bank's pin_base.
+	 */
+	ctrl->nr_pins = 0;
+
 	bank = ctrl->pin_banks;
 	for (i = 0; i < ctrl->nr_banks; ++i, ++bank) {
 		int bank_pins = 0;
-- 
2.43.0

