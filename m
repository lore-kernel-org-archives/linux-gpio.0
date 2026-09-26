Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06F4F3C553F
	for <linux-gpio@vger.kernel.org>; Sat, 26 Sep 2026 10:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790417065; cv=none; b=pdwNzUKw+3Y0gpjeVbhlnlkflG4NDFgi8tg84L+uGs7HCC3b9Ufxex8TxDyZ0g8UHK/RgVrtF1kPFX0NmR7CZpb3BY0a/ObNvlcVNmwtRbb84HP61MdbID2E6IUihGBFB95RMJ4dvQiWRnESPBPVznDIdt8cvxx9dloSoRbN6cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790417065; c=relaxed/simple;
	bh=euCMwxHALKONHLslqhqKhiO7u5b/S+Zz1OF1d1F2hSI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=A7haHI9hR1CpbgF5Qg9IOCJ48BlA/9TOLV78WtcbO8M5NEnySTRpJ7WDKnCs5j97hcFN/2w9RcXsQA/P/myoNXyYT0RBsNpjUDG2/8TU0JP6uqECVev9FeS9qcUVs4lFimA6PYO0hhUI3/8jIKnkV1zcLKo9KM+dRf0HZ7mUP2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bt3CzJgi; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bt3CzJgi"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4bdf8abaaso1092177a12.2
        for <linux-gpio@vger.kernel.org>; Sat, 26 Sep 2026 03:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790417063; x=1791021863; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=a2QwrJTjNePGvVoDDQsoh5hhf8GU4fREmLPOvIhMRHQ=;
        b=Bt3CzJgiZikqVIVnL5X3UDUhEhCWZXamYXK3Wo05WNUusm91EzUh6tvbLqdC65a41z
         Q6t9zG4Hw5ybpm/dJPF7trS8jeYwGrzX1lZ8fhN7GynCPwimYqV+63Fd9Sp2QmYvcdZK
         7N6QFPkPRd7LOwRSRQYBey88TTchGy/aiHobGXe4M+mbTfjJUHXtz2AoUbZC56bC+v66
         bV65k5xjmI7HwhZ0FZWdlUF6RxvPN1QWQmIe3GrjtVKLSzjTzQMjAdlTOrCtOEDUml6I
         YoncmZFKDVNFa3G4PUIQJMwvG5o6h7MwI5PEWPfUO/JYF+2r37xmI3TXTy+EZBkL/HdS
         CLvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790417063; x=1791021863;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=a2QwrJTjNePGvVoDDQsoh5hhf8GU4fREmLPOvIhMRHQ=;
        b=QQyaouVh7P2ZlVDfhH7CV8vx9vs10D2wHiBgz4GM29DVqYQvqrpsx+xijTaReUPb8b
         kM3BiwyXGAlqPNVM0tvHxGxNLqicIK7t3Y7m9N15n+/VqQcdwYw91z9TRyAblRSwiMyN
         qdSOpZllsQi3Ca36xJ+uRYksuvg5tfIqkQmTuuUL0CrzwNQxO885Sa2uIwyz3VQl3kYV
         JAfZXG46b7A0HVH8tRqnxxHV+OWHil2N6P6Ikxi6Kr/Z/lGf4khGaJqsAlGiSwfdocVy
         b+UC13k8f93h7ohqd+tExOkVIuInwU5Lfmb1r43KcahngkehGw2DxjqApR8V8DuWHbK0
         SjKg==
X-Forwarded-Encrypted: i=1; AKwUvBzTh4zYM/tOx5lQTvYHQztwFyS8hV6lSnFPsXO6lDLVKj3BY+FtrQ96EEOTqq0ExTvNuusmW8oPLqt5@vger.kernel.org
X-Gm-Message-State: AFq9FYK0c95qNaiM3Ufg8uH3VU9VcR7CU4V37nXbVOyIrqCT9ShfMH2B
	BhhxspwMVEfaSO38q9h2tdhqEfU28Ewd/d8K7F12KCfgbmwsF3pNcZ/k
X-Gm-Gg: AYBFou3jl3bO1YCnXOegVmjkqwqpi7ypj8IGWx5uxFtNTTJ4oGLU7HXEMNzlhg7BnKT
	8+o8Epi4AarmWCyRFUY9zzoD9Vd/XiAzFVRRRxWxV6OKs4N4WsKe32nR3aadd6n+fIaUfT/xivq
	ZV6tDmhWrcAn5XPp6yd0vOw0HsO5ICTEgx+Fr3f+1JIpigzNxMbggZYU9ZS8lHTLJVmkvySEPRY
	CvSIZZ/3MAjsJH9K59eWfFSmYMHg+p0C+Jh5M4MeBwC2N2h7JBiNCCC6cMGjMMOejITqkxMGhs8
	/k976zytVn5rSQkG+6Gog2NX2ifVdZkwVZluhTHRJ4/ZF08T8R/f0qtGSBY7f6A6Hq1y6kUhD3c
	Zie4dOBYjNdJD0okF6LvOY4YW0pOcbJhMDoPxnC67sqSSm+ENVwjLYRQL+0vMwvTjeaGDsNVtBP
	/OfsOo2aeNwdq8lr3Js57RG5bX6TUngvKm2LofclpnpTN+Yw55NgvaXGghMIEeE5/kxelXfy5/G
	1W/+/9xbaeGc0SxngUS
X-Received: by 2002:a17:90b:17c9:b0:3a0:c833:de75 with SMTP id 98e67ed59e1d1-3a0c833e54amr3104087a91.30.1790417063447;
        Sat, 26 Sep 2026 03:04:23 -0700 (PDT)
Received: from localhost.localdomain ([104.28.254.47])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b9481e17sm8806891a91.8.2026.09.26.03.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 03:04:23 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
Date: Sat, 26 Sep 2026 18:04:14 +0800
Subject: [PATCH] pinctrl: mediatek: mt7629: fix the 2.4 GHz Wi-Fi pin mode
 array
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-b4-mt7629-pinctrl-v1-1-23904cb0c3f3@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQrCMBBA0auUWTuYDJISryIukjjagXYsSSqB0
 rsbXb7F/zsUzsIFrsMOmT9S5K0d9jRAmoK+GOXRDWTIGU8O4wWXOjryuIqmmme0yXmybJyjEXq
 3Zn5K+z9v9+4YCmPMQdP0O82iW0PlVs9LKJUzHMcXouaD74cAAAA=
X-Change-ID: 20260926-b4-mt7629-pinctrl-1c6921e06627
To: Sean Wang <sean.wang@kernel.org>, Linus Walleij <linusw@kernel.org>, 
 Ryder Lee <ryder.lee@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Chuanhong Guo <gch981213@gmail.com>
X-Mailer: b4 0.14.3

The wf0_2g group contains nine pins but only eight mux values.
mtk_pinmux_set_mux() indexes the mode array once for each pin, reading
past its end when configuring pin 78 (WF0_2G_HB6). This can select an
unrelated mux value or fail with -EINVAL, preventing the Wi-Fi device
from probing.

Add the missing mode 1 entry for WF0_2G_HB6.

Fixes: b44677375fee ("pinctrl: mediatek: add pinctrl support for MT7629 SoC")
Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 drivers/pinctrl/mediatek/pinctrl-mt7629.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7629.c b/drivers/pinctrl/mediatek/pinctrl-mt7629.c
index 385d66b8e3fb..29a4c171e8b6 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7629.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7629.c
@@ -294,7 +294,7 @@ static int mt7629_pwm_1_funcs[] = { 2, };
 
 /* WF 2G */
 static int mt7629_wf0_2g_pins[] = { 70, 71, 72, 73, 74, 75, 76, 77, 78, };
-static int mt7629_wf0_2g_funcs[] = { 1, 1, 1, 1, 1, 1, 1, 1, };
+static int mt7629_wf0_2g_funcs[] = { 1, 1, 1, 1, 1, 1, 1, 1, 1, };
 
 /* WF 5G */
 static int mt7629_wf0_5g_pins[] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, };

---
base-commit: f5f84daefcd92d7a630066635ecea1433ed5eac7
change-id: 20260926-b4-mt7629-pinctrl-1c6921e06627

Best regards,
-- 
Chuanhong Guo <gch981213@gmail.com>

