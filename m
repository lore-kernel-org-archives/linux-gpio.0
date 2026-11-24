Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795540468;
	b=X/Y6fLZIapCVWfWCGpi4M1iOIb9GWXZVbqeVRYxH+vYX0yuSLBeQci5ICt0RKeNFVyp5
	 IMpfD1w8A/F6UOGu1cORhhOsg3fO+A5cSQSXiiwJGaGi+aBBmn3PufXqV+DU2gwP4P2Dg
	 sEzKSIxjOH5oTp6/Nm/DebTdbi/RG058p6tvWtYoyVEzEQOVUv2FAi7JgGCF4CL1s02xt
	 BF9PoLZwDbDxIyOU7LzxXvhPZd4t+ZOkhffAXRWj8R6UFzAnclg3VcwD65IeldWC5hZ4S
	 SEk2D2pKGuIPSxn8tvMec++P3hq6YkIY5N5xJ8Xjy59hYfSiWjaLSlCdCFoTlKsCELw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795540468;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=z2wCW2TznEr2hKQ6/D8LQzPudwB+Q3NlBOTdsjiFXJA=;
	b=IXeywn6+jQgHMYUlJcgUdpTOH2reT9K1C9Ltv25BB0TVq7HDXjL2vl8iiJTU+lH9IUyX
	 P6ItSB7sYBLpu4AgxlZK0x2CGuLxJWI/hQ9+nryyCo7OcRTNxugK1otW53gUrW9XAA3N5
	 BRi9BzhLHRWaQNwXBLJDmyGEpjDBG24jIXhgC740XQv8H/eLAm5Fpo/9fUrPg/IfS5X/n
	 InH3uTNKVBnjVrs0DdbIB7bYTLgwFZ3ebgsic/Kadf8sBiOsEWQGAJTgYv2Bo2iyF09+s
	 KWyFSUaSqdtaB+Ev6WvWF7qZ00km6/WQqhbhFWWzErjfRNiK2THMizMtmmqfp+0ljqQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=D00ym1I7;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807D6606A338
	for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 17:14:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 807D6606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=D00ym1I7
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a5024b3c28so3413811f8f.0
        for <linux-gpio@vger.kernel.org>; Tue, 24 Nov 2026 09:14:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795540467; x=1796145267; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=z2wCW2TznEr2hKQ6/D8LQzPudwB+Q3NlBOTdsjiFXJA=;
        b=D00ym1I7Iw5XfnvfRQUKkpupVs8+8YMvhyMCTzyJV7NiRAWVFYMKK0JBKfQJaoe4di
         VZZ9KHoCv6a6i1AiEcnkxsrvUgL8JBGa63ig99AFzvREh+ohOxwg9aqUW7LHHKTJ45Ri
         ZnA9e9GatxLDOQilXj7aTUJZhRAYXXDfc2YQ42i0Kl3jFe9lvVL+x8XN88/UysKb/8+u
         9H6ECwmltpMgweeCiezCMnymMxEZPqsm4rgP4LgPtRv65JlTgeflaA078R2xx4b4dGjn
         I0WMkOkNOqbgrKf6NaMAKTOOJieSwpGQHYK45i0kqcHmxsZDdHtSSnAtyW7+G+kPtIiT
         1Npw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795540467; x=1796145267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z2wCW2TznEr2hKQ6/D8LQzPudwB+Q3NlBOTdsjiFXJA=;
        b=qEq6XOn9ClBKTVGACrK4g6+WjoEHaif0zG7kRHZYTKBlh9+OUuEvCl9Yk+1ZGDvIxg
         wy5xA7hMMLsROXwWiVUTVPYJI7FSmIL+/gPyZ1yGuTS+8S00rsQAVN7TwDUaeOBZ5nxa
         +ioDV3LvgMbZa619sqMJMK43Hrej6bl6ohQyilLLKXkjbnG02gaot0JNEZwO3hUnT/Yv
         ODLyNGitwavcj5dtW2avIQmpYHkBvpAzCHg4GG1q/Miydv2hNQIN9m6ZbANIvgvlrmA+
         kThZpO57/pNK4eu2QT8Ws0tuLabSq/rPMpDCMwe9nfsyVil8rl7n2nZfenx5FxfYIgzK
         /PUw==
X-Forwarded-Encrypted: i=1; AL+hErHYvGnJ+DmL/P/L9DQsNxNs/Msfu1tO3IceEJ/WstMq+IoDkGh2c17FWdx5iQT/6EkMJ0NRd4xef56y@vger.kernel.org
X-Gm-Message-State: APuU4Z8LCtmJEO/gFOjD8AgE+dfFNfgxKu6cFsokGncWYiPTwddPiw1n
	sukSSjZ+kM7qgvnsmh93N9Liy/TavqHWkuPmDpHjup4jatuHZRfqYf59zIMGnD3rEt8=
X-Gm-Gg: AZFdTZcoKA5q6FtukHB5BgG9JHaU50eHy1TpK6lJGxLiqjKeaueMbqpRMJjwc0M5doq
	BvnFjRdQhMdY+qEl/m+sVEV8SzKhPJomt9NrMju3exBjjjHAtujyDoQubACVzNTU9wKrPppRiXW
	aDTEM/J+M3/zvKN9QqIsl1W4OjdAjlYzecybJm4lyRekn239LLTqJBYdPM2NebISjjknw5A9mWs
	Apo6tkWVaZAYebNVNCd3Ady5a8UecLnpUjBDrvUl5y7eQ0c4w548/o6+x/qSF7sLYrXLBK0Eerb
	OpYRJ8xS05oAFBGNjfQfQSLeLl7S7PqSMKo3lBWsvxxqS83oooN/KO4xncSqsS0pLWPfoq15pSM
	2RMKftru+izznuagsvHsSe2Uo/HcSwK59s5ndNqnN46fjbwmutw7g5GqlOUrHYAlnRs2hbwBzFO
	WZ6THdqW/NaUtuTc0zyAfsQyCISCxgml9Pku6KRzHVKi65/UbtyNhs2W1/++rOKjCKlnpN5/TpO
	yWonUtawX9/4xehUTWVEBNIJL8JUAL5906jU7O3lxmQhyNFeZ31PTUO2pc00o715vCh/92saPWD
	7RsdsmsdX4OeBL3k4+MZ+2BDYYifnzKtct+KKw8TkzJf/vsG7LI=
X-Received: by 2002:a05:600c:37c6:b0:4a1:88df:8a2a with SMTP id 5b1f17b1804b1-4bb88812a84mr313362825e9.13.1795540466734;
        Tue, 24 Nov 2026 09:14:26 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8849e598sm410592735e9.8.2026.11.24.09.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 09:14:26 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 24 Nov 2026 18:14:23 +0100
Subject: [PATCH v2 2/2] pinctrl: qcom: lpass-lpi: attach all the power
 domains
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-topic-sm8650-el2-pinctrl-v2-2-fd05c8378a08@linaro.org>
References: <20261124-topic-sm8650-el2-pinctrl-v2-0-fd05c8378a08@linaro.org>
In-Reply-To: <20261124-topic-sm8650-el2-pinctrl-v2-0-fd05c8378a08@linaro.org>
To: Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Srinivas Kandagatla <srini@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1672;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=zmp4vn3X04bE7pD2IGrBeIQaELOOnUf0zlQOX83mFQU=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBrBcXwjyCRaJ71OOMWY4Xx1GfsWkuRB7/GrEe7XVSM
 sJEaeuKJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCawXF8AAKCRB33NvayMhJ0dvcD/
 9A1aQZD0JS763OWx3fJkPF8CIKL945NiiVR8LJHeEwlJqSzCTo2dECbH+UVpZFAv1CULWOJYPW9BmF
 /2qUz60Cdzd51XF/+gfsQYylToyLDQ0Vdf5Ydfyh9TOLF8TcBh7lWr2Gedat2xtQB+IpHWsNjOJesB
 bVxuyrkKs/5HAfoyfDi8gABtoMfxgI4SzpT6bFMbP+EzsWfyu3y44h9GSPLdc4I3cSlHVBeoMlu7OJ
 rH1mfyxR9uDOVysVK0B/nSKW7gs/jvbmv0XFqOJytZJ/qBbx6mnjFpqB/AI7Y1jfM2DtzRtrs7O46X
 HbKtt80de57a2mpYcjEoNSMeW31f5qYkBpWTYblgTgRXI3OrN5L6Nlc5r8VIWFk7zV8ent0szWx40w
 wy/SKlFLxPQDd56rqjnPhYy9JT0gB8/KvX32DClvrAsLRHzClp8huT7SSiWlrR5vKcPVLdYAaQQq5E
 C6r7rZgRFceGjVIYfboEG8ffMF1ZTCOoKE1KF/3Jhs2ku+vrvVT7+MsMINe4ASwqfmHK5ri4+Hv3Jy
 EEIv/pRQ8UhbVQy+s8B3OnIZf+qZPvcett6nXhN0Yp38eoPgiSiNXv3fi2S9EzNqArEvq1z56+vlok
 psIz91UGoOmzv44qDie603sPF8/TnXiYxwmJv3MU2n7q9KKLIPcHblb96XbA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

When the LPASS is not handled by the ADSP firmware, the LPASS TLMM
block lies in the LPASS core and audio power domains, but the
driver core won't attach a device to multiple power domains.

Attach all the power domains with devm_pm_domain_attach_list() so
they get powered on when the TLMM registers are accessed.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-lpass-lpi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
index 02f678fa75b1..1b1d0f4bddb5 100644
--- a/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
+++ b/drivers/pinctrl/qcom/pinctrl-lpass-lpi.c
@@ -17,6 +17,7 @@
 #include <linux/pinctrl/pinconf.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/pm_clock.h>
+#include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
 
 #include "../pinctrl-utils.h"
@@ -37,6 +38,7 @@ struct lpi_pinctrl {
 	struct mutex lock;
 	DECLARE_BITMAP(ever_gpio, MAX_NR_GPIO);
 	const struct lpi_pinctrl_variant_data *data;
+	struct dev_pm_domain_list *pd_list;
 };
 
 static void __iomem *lpi_gpio_reg(struct lpi_pinctrl *state,
@@ -543,6 +545,13 @@ int lpi_pinctrl_probe(struct platform_device *pdev)
 					     "Slew resource not provided\n");
 	}
 
+	/* Attach all the power domains when the LPASS is not handled by the ADSP */
+	if (!dev->pm_domain) {
+		ret = devm_pm_domain_attach_list(dev, NULL, &pctrl->pd_list);
+		if (ret < 0)
+			return dev_err_probe(dev, ret, "failed to attach power domains\n");
+	}
+
 	ret = devm_pm_clk_create(dev);
 	if (ret)
 		return ret;

-- 
2.34.1

