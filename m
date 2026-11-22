Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795369474;
	b=CaqTUk4mCNHg4kC08NnttJ1K84YZhFH1skJj2BGzKYPbQfThp1uqPNVV6pMxrBzxp7Ey
	 uBlh5hHUPey0Jtty2jjzeEb+tL+Bubq8baUG5mZMx9M/wuzWnF8q47xvDNq2ao3eZMt1b
	 aGgK2Q8zlOc6udGMYe0kS8wHB+zmGASA1OpEEliVvx8rlW7IhEDb1U4G0ztgFrrJkdiRE
	 x8g+YaTyAC7QkW+6DOSJ/kAASLpT/6QE3RC0ZMYs0I8soWd7weJq2vLbM/ZiX2te1RS/A
	 3HvK/b4UMyY6OUq3jk1e1NBiewpe9yIEvbbeWlWjPKkCS5xq42u4aGeXZZC2gVe4Usg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795369474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=4TIo8XI8rbm8m77QUuo4L5vnn8DDR2Hp5bySmwkQxQ8=;
	b=rTYrnwvc5vJvHH/KbAE7n9MAlQ9/WAUSkDPYzROtdAt97w+mfRexxjEmpfgSyn4Fa6GA
	 yJfkmsMP2kK4319XrSNtAAhLpzuPpf7In0GuhbjhxlK0Fet2Vxwi7vle1gnZT8YL2RA2x
	 FioCDel631RP2JpzArPnamn03V+8kWkQIpUrsHk3gO5FSPEZpyPV1EfZSt7SImONKdvrJ
	 /1hkPzRFy/OArtFde5F1AvG9JQcsKGyJEUUQwZf17qxsBx47RhXeArCZX9QDlHkUOLPTZ
	 o6gxBVo0YmLJSSuIf8GGlHZL7jiweCCAZHuMe51ereXXVgzFHZjMX9flHtLN6lQk9Xw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rLeiBumj;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75BFA606A331
	for <linux-gpio@vger.kernel.org>; Sun, 22 Nov 2026 17:44:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75BFA606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rLeiBumj
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cc147d86bebso1308835a12.0
        for <linux-gpio@vger.kernel.org>; Sun, 22 Nov 2026 09:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795369472; x=1795974272; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4TIo8XI8rbm8m77QUuo4L5vnn8DDR2Hp5bySmwkQxQ8=;
        b=rLeiBumjk8TQGxJxb12x1jOoBNcpTTZuMgD5FoSJfFUr1x8u3IcRvBDV2aKGQ+EWLj
         CWgtnCaNl1IQzgFGpJEZ7w1GuGVfo/XjnJkSQgtGBwdSGwTvGx5PngJq4I8AohwPDdgQ
         ZdLAJ3Wic+Yl3yqokWFgkZeYNK9Qyh2I1AQ9GMJHWn/KC/BFELg9DvZ1elIhDEdJTEhm
         Bab8jDUt7R5Qtbk1LcHHuhzgnxIB7BDPwCH/ZYzkh/Xq1WZ38U2f/xBeqrcdrd+BhWta
         30U6TAWHv6yfzN2NTLWK6vRrIwNt3Nm2ydXoTmPbMgpOvOo40VaErfViSOU/JMbmEqmh
         N57A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795369472; x=1795974272;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4TIo8XI8rbm8m77QUuo4L5vnn8DDR2Hp5bySmwkQxQ8=;
        b=xiK1OkbeVwbSQyoBtFVIEYkQMEEA5NeB97HWO5la8NlMQIAcwpEn9GOg/ISRo/6ybx
         stAiuT16EsJ0vNtW1ANhstNkdMgtt4JMmRrys2r1836iCVX8ILlXj/OMwLbN8SrvTR1F
         OEZNwe5AQnwFB8YVwG/R2IokMbLc8szbPxJKsTfDvFnLy7FMnfHa5pxL3oBeOeiju/RL
         QnDM0G/85hYrrFK7xIjW18/fZgF1U5voYcgvLjj+dbIjZEyOBI20yQr5o0KzmwTs0yjE
         /WYhBCEFToLAhCnVPdPhlQ8Zo7n0bFZGLdlu3e/5U2WTzori90g8qjLBJakgwfcc7O1D
         UlxQ==
X-Forwarded-Encrypted: i=1; AL+hErFQGS10pKjMzJaGLkPSzxRc2T/G/T+LvYM69Uvbp6oAfSrNz3aReUBgghYlr098BKV+SNAkgx1AdaoW@vger.kernel.org
X-Gm-Message-State: APuU4Z9/oLvyllVwGgNoUpH9Vf2OHe6B6DGe3qfGYAuQENCHd+rCTX3C
	f4EvWAAWSgJF8RNtFRQV6o6b7tWrsj0X5K5YVSJ+d0o/lYo5aPHKGbdC
X-Gm-Gg: AZFdTZelnse9PLTLFyEyQPUnAfmH0Cf6MmsSB2OMdSfmgTzzeZ7LfDNqMBF7AajHyBe
	JVYg1tFYJ90fItUzGHYgplhmYg96+G91OeI9FEhoAiihBaWY/aoHH/MbxM/Du9La0zSRsc1OELs
	qPoTQbJiB2NFmLxdcUmXkVggkmpFM4rg18CAQkc14R44SpNRrcdydS5nDsH90QZsoNBGe5HgZFh
	1okw4QTaP2JnhySXLJ1aZnmQfvZAHPy7Z9Ly49eV8JBn9qOg+zruWmdfWJKZHzvdLDM78HoYOGN
	JRx6Duv4PPossgfTZZp4LxDQdeyqwnk7OMLT4+0/1pU/sPws4zhVLHj8FvDImvXZjR2Hh1dn1zB
	pThHwbzjqHH1/IGyhlOePkmZ210/vePk6jCkHE7Ja5OWXEFSdsghUK6r5pBanbelX8T+eZBvQhT
	GFq03Hk5Il4AMi0HckQjfnGwqIcJayDstnOeOBig6wSMJOByOrWWN0tRBcyo48Em0YpPkP0SCZu
	2Bh+q9kewdSqEYKM/rp5XTUANqAoUGtqnR8nEgeCorMI7eMHo5jvWcScXj6MwtJiqMg5jjAAg3j
	D8q3fYD16AJ/8TqPAprPBsn6mogzDG1J05R87RYPTibRl89Jm6kKiuhBPDDSVikffLbfaMFz
X-Received: by 2002:a05:6a20:a106:b0:3fa:53f1:abf2 with SMTP id adf61e73a8af0-4014de5db77mr6772027637.29.1795369471685;
        Sun, 22 Nov 2026 09:44:31 -0800 (PST)
Received: from fedora.tailc1fb0a.ts.net ([134.82.71.171])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c872e4d7basm4060108b3a.21.2026.11.22.09.44.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 09:44:31 -0800 (PST)
From: Artem Novak <artem122novak@gmail.com>
To: geert+renesas@glider.be
Cc: linusw@kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Artem Novak <artem122novak@gmail.com>
Subject: [PATCH] pinctrl: renesas: fix typo in RZ/A1 driver description
Date: Sun, 22 Nov 2026 11:44:27 -0600
Message-ID: <20261122174427.276446-1-artem122novak@gmail.com>
X-Mailer: git-send-email 2.56.1
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

Correct the spelling of "Renesas" in the RZ/A1 pin
controller driver's module description.

Signed-off-by: Artem Novak <artem122novak@gmail.com>
---
 drivers/pinctrl/renesas/pinctrl-rza1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rza1.c b/drivers/pinctrl/renesas/pinctrl-rza1.c
index 07afa4b3abae..7a2ea8add139 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza1.c
@@ -1401,4 +1401,4 @@ static int __init rza1_pinctrl_init(void)
 core_initcall(rza1_pinctrl_init);
 
 MODULE_AUTHOR("Jacopo Mondi <jacopo+renesas@jmondi.org");
-MODULE_DESCRIPTION("Pin and gpio controller driver for Reneas RZ/A1 SoC");
+MODULE_DESCRIPTION("Pin and gpio controller driver for Renesas RZ/A1 SoC");
-- 
2.56.1

