Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567971;
	b=h3KLEKVt0aEXUOfmgxVM/5hfFZyQbTmktHfMVe0Ruh+KU7T8K8qJJdq73fgQsHMFEnUJ
	 5usFEAW4upXAtNh1F7sXv0Q40AMk5DK8HAc8AeXyopKAf3ld9V94XQ0hLujXTF8v1OQGu
	 b6eoudEwTMjOeHr8cwX5SawKthUR5Zo3gFNRt+F9DXumtxz7Fee9cZSwSgqhI5hT2BQtW
	 XH+defHjAdti4LHqB2DQ0PX2PC+3a1jD+qsuLeozVZPBfNt1OuhK6JeBebfiGSQ/+NoSL
	 dQiVY6Rx0kkwhfnKGwI7uZuTRzO2WtGdCfhj5yK4p5fcPOQR7mOnTNchb5EWUV1n1Eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567971;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=pCZoU/KULySiNKg5bHmPXpUGGQnjpXel7S5fY/ZzmBY=;
	b=iJ1z0NeVmL+FOwmXMFVJB3gXBcmAUiqz0DX11qwMDoGVZfHfA3vAM6svPmgiWDuF51l6
	 DFLFN+zmCyNLvVNT1uR/xb7jXrBDf/EowcEQbDrVNN4vVtVwhRtWQyuUROhVS908s+JmS
	 Pne9isurZDellotXYX5FjoWQnpPTk4984AvC6HUt7xsoo3PFAZkeBpxlaVxkNDnJjZ+XJ
	 HWoaGnEjFtFVTXcglfn5Gy1MvxhLypEY8YfUzcerwYxrmYqDIggKHMqOtWkMjNsD4t0L3
	 b6Z5e3fWMfEffcHO1BdV1X3xadqs92xPQ+WmcA98oXvYtT5lJm98YS0Zow3WhxgSDAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=AMsiVTy5;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 219B2606DFCE
	for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 11:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 219B2606DFCE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=AMsiVTy5
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso5186385e9.0
        for <linux-gpio@vger.kernel.org>; Fri, 13 Nov 2026 03:06:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794567969; x=1795172769; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pCZoU/KULySiNKg5bHmPXpUGGQnjpXel7S5fY/ZzmBY=;
        b=AMsiVTy5KpPzmyePVeQ3DrHegJI/2oG4Ui27vx2Zf7JcNOKQnap1YxvM3EoBL38FN1
         zzwccYQdfEc7bp+7vSy47jlAh1AMscPmC6zkymQU26dY3nRyg6JsUscxy6vxwS1OfWR+
         4LsD7BYuZq1GXCDw2EWcHcPC82EKXUnS0LZsnU+K8fNHMSaLmS/njCYZsxR+2qcUYcn3
         MxquBUG1gJ9PEZRHxeCcDUE57NzldDSURyPNlFtEMt5TjFzJ350LC3e9hmDGBpMlzyQ9
         crew0pt0skUclzEUdtNv55AyMj3MrSXltwhVGdqeBFWA0HWOsC4K+UloxBsYvkjXOhSW
         QHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567969; x=1795172769;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pCZoU/KULySiNKg5bHmPXpUGGQnjpXel7S5fY/ZzmBY=;
        b=MrR45XQm/LWnV/ww/QjiRe5JFB6KZF1WXPPcLb1u6VkXuPV9riaSdJOBL0A4LAb0iV
         Pz0V0QGWP3t+zD7Nx+89OPGTsdC3FWX6O7bhRV9r+y5RvfFvAUmoVEkiyxQEUiZ3DQ+g
         QqAGoO3oz0q4fx8u9YpPL/jHAoY64373x5O8+XuNCPQ9/xhEipjopSZeVuc3eRL2K4aQ
         41UgDUEwRclPUiqo4nCGgXiYqhp1ZehvThhxmlWWqYx46ysMHxJUv6i8lCPP+jt0YOZ8
         mFLtZmFjYf1jxkYZ3RVoFnAR8h7aMXpa08lJ1m65I2wBxV3HiCyrWKUpkl6lv/Pq0SNa
         v59w==
X-Forwarded-Encrypted: i=1; AL+hErEzw3SvPWRwHKVSRr0Rns1WHGrnCHOOrPSKmh5uC9k/0ihAAvR06fs4djgLgEv5r4O9EsLmOdtOn/4x@vger.kernel.org
X-Gm-Message-State: APuU4Z+0n5RKVyuWsZ5ECS6c3Ot69d+WFMuBYJ7/ZsIv0F4JLHgiNugI
	pLVawUt7ELfJGll3jd0v5uVASyp83C79PoYZRqQFKzD3mCgiAFbnxAPGisuaG8+BZ48=
X-Gm-Gg: AYBFou08TNunPw4ulYN8nc6NJg1pXBt1YIxPFy1SLoPsRz52fRkVK5gpYWLzRH9WqWW
	qSfB0fEuRaO/K3HVuZ4NSjLw0zmy8xHnQcLaNRIB+57AAM6wZzr61xd6qP48wuww042pPRt26wx
	VV7f+hZri61AI1B2MF0xdGk4n0smjATu2F4I8+d+IC2sLioAqMWfh8KLznTe9lBFNiRkGizSw6c
	yRESDyfZwojTGkq4U88Bsclqxh+EUpNQccFVmIduOE5Rer+CUqbLFPFss4Rqr39MXOG4uZwQ6KE
	AdHf68dby8t1D+Sy6DiQo6s2o9ub7NzNdPvm/kGfRgc8QOG05MLGG+ekkXWpL/57oZEF++lblIL
	OA+a76u+FU+Y04c7Efs6l/mUYS5pHXBDkFyG671SsZBNfAuxNfxGoyNgY0ij8fRYKkOoKAE/LL/
	ups9VYNQVxZ7CZytr841M3iMbADxar5lho+iV4YFerS6Jt+LfRF/lbYut6pqu5po7F+ssY6wrbq
	JGZdC8/LyQ/vTTVijI+Ow8dUNXe5SvdlsjjOLBXWij+vg+GLhFGL/QGAtm5Et0BrUY8oS2Tf4Cr
	P3KOGoN3/421DL8fSS7+rWzRI2dghU5+YWC0zdK3Pna1t8lzZ+M=
X-Received: by 2002:a05:600c:1913:b0:4a1:fbd2:f689 with SMTP id 5b1f17b1804b1-4bb55a44c62mr47473995e9.7.1794567969426;
        Fri, 13 Nov 2026 03:06:09 -0800 (PST)
Received: from localhost (128.33.83.79.rev.sfr.net. [79.83.33.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55a68c65sm55915505e9.2.2026.11.13.03.06.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:06:08 -0800 (PST)
From: =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
Date: Fri, 13 Nov 2026 12:05:34 +0100
Subject: [PATCH v2 08/11] pinctrl: scmi: mark the GPIO functions
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
Message-Id: <20261113-clegoffic-pinctrl-scmi-gpio-v2-8-faccb4685d88@baylibre.com>
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
 Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
 =?utf-8?q?Cl=C3=A9ment_Le_Goffic?= <clegoffic@baylibre.com>
X-Mailer: b4 0.17-dev

Register the functions flagged as GPIO with PINFUNCTION_FLAG_GPIO.

Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Clément Le Goffic <clegoffic@baylibre.com>
---
 drivers/pinctrl/pinctrl-scmi.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-scmi.c b/drivers/pinctrl/pinctrl-scmi.c
index af9c9575d4f0..43b9d67eb9e5 100644
--- a/drivers/pinctrl/pinctrl-scmi.c
+++ b/drivers/pinctrl/pinctrl-scmi.c
@@ -438,6 +438,7 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 {
 	unsigned int nr_funcs, nr_groups, i, j;
 	const unsigned int *group_ids;
+	struct pinfunction func;
 	bool pin_only, gpio;
 	const char *fname;
 	const char **gnames;
@@ -479,8 +480,12 @@ static int pinctrl_scmi_get_functions(struct scmi_pinctrl *pmx)
 				return ret;
 		}
 
-		ret = pinmux_generic_add_function(pmx->pctldev, fname, gnames,
-				  nr_groups, NULL);
+		if (gpio)
+			func = PINCTRL_GPIO_PINFUNCTION(fname, gnames, nr_groups);
+		else
+			func = PINCTRL_PINFUNCTION(fname, gnames, nr_groups);
+
+		ret = pinmux_generic_add_pinfunction(pmx->pctldev, &func, NULL);
 		if (ret < 0)
 			return ret;
 		if (ret != i) {

-- 
2.56.1

