Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDC7471CE9
	for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2026 13:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785331828; cv=none; b=VlVL4Llx2R4yseN+osWDuOytgrf4hBl/yN1fL2b8RZUdG7RzOXJJ1YqIxvqicFAcUcitlg6fCWXnJeSq40MmWw/W6fBcnUekleLbjLhy35ZPIo2MUtLl56W24bMImTtfR9kwcnvl2A+j77zPIz9FeiW2Dr2WyJYUyhGpsN1F170=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785331828; c=relaxed/simple;
	bh=JNPAUINbD0RD9KybCqO6mE+R6lBKwrezk7Zf9d2lUIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q6KqWs3Q7Dux+AUwsbO6CWXZz0aUGD5/JYfmaYtyqmJP6pFSTnEr3H6cpQ7U0AK3drNsldGd31VlhHq/htex7MBg966DJB74qRXVUq7Hq00QMMCRiDqMt6VCF6DtyP11S9NqPp3zOrH+pfsuiuAHGdlYdy2+qkbohS1BrsYgw88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TkQJrfGO; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TkQJrfGO"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4a427e628a9so334579b6e.0
        for <linux-gpio@vger.kernel.org>; Wed, 29 Jul 2026 06:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785331822; x=1785936622; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MGY9pJ9HxACe2V5dSfk8s/efrdxSSwRbR+Ftr/FTg6A=;
        b=TkQJrfGOnJ+TUAHwGpumGr3sfyOodaoPGSBN39Epa8WquMSayZ2w3v6ATkP1wFwHSd
         SMVDQ1C5LxDPD25a+haBhY2t4lqAgJ2yt4/V6eRnB4BCraNqEY3It/5IC/UdgDTia2dk
         XblpPOcCnfHzICLcub+p+dDubANL9x3tN0J30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785331822; x=1785936622;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MGY9pJ9HxACe2V5dSfk8s/efrdxSSwRbR+Ftr/FTg6A=;
        b=k8MeGFmzs3TybuRbi3XI8w9NQ/palgrLY1053UfQDmqJNUxbnwk0FpLOwOO79QhzwS
         KJOmhIMJdXHgLAPjKNccQBOgY+YN6z5Z55j2DlgJg6QwdRA8uUwT+Js+D57uSaegX60X
         FWABpMPf0XtxuIGMiBZ3ZBwvyYd3bFwbmBheRfZ8RMxclfAjXyYpNzSnT2d++NblZ02m
         olINM+cOQrHbMSS60UrWe0lwrozTVN62+zmR5SeJ1bVchM/j0ittMUtEpzClbX3zPjIf
         CCH7HKNj54WuOq7tFgZkB/gAmQrDTvNmciY7jdEqrcUVCSkeYp84N0Rvc1W7YW8cXtVS
         JZ+g==
X-Forwarded-Encrypted: i=1; AHgh+RrHhAphfbtJcXb4dQJifOGhSoElEvQqX519b59FetyakH1lJfIA2ZPC65Q8nOibicDAjfwiXaUm99Tm@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8nIxgRL9KpuTLn9+J8mPjv/osev5uxz5M435sVoq0RWbXfhUn
	v5zE5BaaNWJYaJHTEoD/tZADsZmrI3wWyRV5wbi6MM3OI2Yq0nn0fgmjcMHl0OVpWw==
X-Gm-Gg: AR+sD13eJhBtpKbEk8Zxam9+Mda6MIDkoYpIEt+yfop/S4nRc8NPX1N9l/dd+hGAuSE
	jSB7PbVzXs6SXuUjrQIX6tlQ9iNyLV7TYzyonLvgQrICTQGd6UB7jxpJgr3SKsLMqO6eIfT9LYM
	S0vGQu0sdzoRGqFPV78OyhgnL4xCjC+FiC06gBVoajnZwby7dr9h0JUWFRGozVA7bH7bU6sNH5t
	5AjwPE0yTXWh9Hty4FzvCMldp0/MyEL3Sh7JqQOVWRvzsltHGH7v59sGw9y5jFuh/mb3w9/MGpR
	AhXzTckmmZGHuMzk+cHgkWF5MOSqA1hQzMQuaAoZiGDB1+uUq65OejH8cXFD+btFMghEZyYFNvT
	b2qLhDbCV3HOFLpvLxQ5mSB8t57S12ikr5OP5vwJK+CNG2x/ZSum7NcNtvIj0sLS1KaqT8XIloc
	fvNU5JPlRI8FQczu/lOI26gu2NtGn72Wm6CnydG8zzsDU/SMRVttwCdtengtjFxLjjfg==
X-Received: by 2002:a05:6808:1905:b0:496:11f1:f2b5 with SMTP id 5614622812f47-4ad5b987d6emr3451568b6e.10.1785331822286;
        Wed, 29 Jul 2026 06:30:22 -0700 (PDT)
Received: from chromium.org ([174.51.25.52])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4ad6ef5d650sm1712932b6e.9.2026.07.29.06.30.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 06:30:20 -0700 (PDT)
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
	huang lin <hl@rock-chips.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/4] dt-bindings: pinctrl: rockchip: Add RV1106 compatible
Date: Wed, 29 Jul 2026 07:27:27 -0600
Message-ID: <20260729072727.v3.3.3a4f9d47d4dba36e14141f8796afe8907028aa9c@changeid>
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

Add the compatible for the pin controller of the Rockchip RV1106 and
its RV1103 package variant.

Signed-off-by: Simon Glass <sjg@chromium.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---

(no changes since v1)

 Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
index 9b3cbeb54fed..81747bb53056 100644
--- a/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
+++ b/Documentation/devicetree/bindings/pinctrl/rockchip,pinctrl.yaml
@@ -51,6 +51,7 @@ properties:
       - rockchip,rk3576-pinctrl
       - rockchip,rk3588-pinctrl
       - rockchip,rv1103b-pinctrl
+      - rockchip,rv1106-pinctrl
       - rockchip,rv1108-pinctrl
       - rockchip,rv1126-pinctrl
 
-- 
2.43.0

