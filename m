Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792788131;
	b=Ly2cekQETnS/X7eBO3qkbNhcUAi9tzrK7juAknmJeCJaGEj1lOFCcfKdRq4hrD4nOAip
	 N2zvDVWHFwJvYr4vfBxOVuZuiIaOUTFnJqCCDc/OkV+Y1FMG9Oc5YNelKnPVCDya31gD3
	 LNrnSLuWnUmM7OuGu8d8Dl7zX+GhJrif1pbXJjd+uth8yToOMIOwBNWoZq9tyGYA61xhz
	 zjNr+jaxbcTn28b2SWXgdkXQ0c/XnOOjvV5Hua90Njkor27/0kl9ZrZ070O1mnOPqslwq
	 7vxWI9nZO+sdcGcriAYuCcfrf5GOAbAJPGlkhaWTnvme0gRCPLL8yl8CaWtvhplQoVA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792788131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=zyMApVzALEKfl7qhgL3ky6rk0V3N5+p98NsJ9aVJvD0=;
	b=hQaLkbqe5S/NOWmPTL5U3VMhoxis0RygkjcneC+RjFn8R4e7RKKUvOBxdhWEXc1ZPxPr
	 iHLk6vvUjSEHaADti8mB9EbBON7ytPKxQ2Q6aNzjMJd0yNls4D/HWjp0GSmplF22QtMaa
	 EB58PZ+c85kKOiJk3DJcQLavazizsLdmAcl6H/fxCbpcypK+JCTgjIXVnw7/J06RBDsPe
	 jgY0P+CFt1JkJitb84xysBZ3lV/p8isvzJUMT/k5i+f9QhNxtmK9STv2kN02IxLKf3ogY
	 xT3pTg9VCFLCJ+fGKmF/bULyCSidkmd9q4JN1+Y1TMYQpj0Ey6JTL3KooKOKp4Qd1Jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=mgcrea.io;
	spf=pass smtp.mailfrom=mg-crea.com;
	dkim=pass header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=pGG+kwUr;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61534606A325
	for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 20:42:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61534606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=mgcrea.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mg-crea.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=mg-crea-com.20251104.gappssmtp.com header.i=@mg-crea-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=pGG+kwUr
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48df0fa43c5so797686f8f.0
        for <linux-gpio@vger.kernel.org>; Fri, 23 Oct 2026 13:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mg-crea-com.20251104.gappssmtp.com; s=20251104; t=1792788128; x=1793392928; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zyMApVzALEKfl7qhgL3ky6rk0V3N5+p98NsJ9aVJvD0=;
        b=pGG+kwUrqpe5A/QKNgH2S+nkATS7olAO50nfGbt6mhyG/Zsgrf3rVvM/AKyZTjKXAd
         vv5Fs44g2MljOHzKPYv+EEBOx1bwYDjU35BGn2p6fEsGJ+jS0Le+4axiVU041ZZylKcS
         YpeRU6mN6VRtKYDr8moYFjXNnrhzY+fwA4y/UE2TboBVbmI/jb3Ncs7Tj88qowkFnrtW
         13xjITpCE7k/1oqRyAOSa8KzFJFRa4yNcH9tfZlPQTAXtEpVwhelPe0PY5Tcqplp5EiW
         1RBX8ic7BM7feT/hgCfTffJZtMTXIjrJSdmHwEynW2wGCIbmw2xn3JbbO03Hr62pQhKY
         jHIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792788128; x=1793392928;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zyMApVzALEKfl7qhgL3ky6rk0V3N5+p98NsJ9aVJvD0=;
        b=Ixc4Qjexgv8hKxlhGf+4rFrWIhRXK1Fu7d4bcwZPpUWUR9Cj9pqtW0OlAKd4w+Tl3S
         99qEJSusbezmbR63YBYaOXXb3KTUmtP+fSZPikovtCdySt4mnqhyYwz1rcHql55rk0PV
         MHbME/qejy+FaPjW8BJCQHBV1xCG8N7+IORPm06b/nC74PEerBts7BSO1GUaxb/h3H5E
         A+y4ocLVZv/UkG39KgR9uBiyHroWTXDu4mtGS9RrN41BkoO4vk+bzrG06qVEqI25hIWn
         kK7ImhPV79e4lbr7TZPQpI1jM/fDPeYOFhC+8Cu6/Zt1P4xvnXagk6HHrK4dBOLBatCX
         ghDA==
X-Forwarded-Encrypted: i=1; AKwUvByJc09xzza3zSbqWr1qh44IcRwMI96qA2UUG3qnDwQ9WQjh36U0hBkiTXzypf1+iOawuSgx23TcBVjC@vger.kernel.org
X-Gm-Message-State: AFq9FYI5Sc2JE76n+UMX6lRfhoeI97/KtKAUfrOLFq2nYimLrNVvqNWL
	OMyUNAgao/lis92NuyG//ZMHOveTUlTgsUvk+D+/n32uj/2vNzQbR4mtFNkETnq9f4I=
X-Gm-Gg: AYBFou3bp+mXxI0gwtlQLiGuX90FLXqjnGw0ncU2SQK7129IetJ20/EtBg/R5P3keRl
	mqTs5yj1MngJhfzloGZesb1T6aSUSIewvFGGvr+BBHfKu5vNXlbBvXu6L55Y7UvuMcnz9fpumDz
	ms3qMg0u0GibgJbk7vpDI+1B9MFU5DIsERRNY50LFqtKv/NFOLhXdb8k/DEFli7MJ2MaUkddwBY
	Bl7JYbYjhjZtoWbd50n4ty+/fBYnuwh7CogdFDy5Ums4GQ6Ysm2OopE5d/GMF4VM+hMnQO4Ptm6
	iSd8FS9P1WJmfjtaWyM52mnfXZlyBQeXVlteD5qgEVnNuYOfEb0fscTbcc8pPkFyJVyF09gjsFf
	IA8YBoMA3+pxK9n3qGvxisHvTAcTQa+L75yq1yGpPNy/tJGAJInPgb+y7KuQL8c1EhSGia4KYjg
	WXX/VxNJXdP06y/tHSUR3rje6yGgn1HS51ibB94gjZSNCoRZcugEsxjCN6NP4C3aIYZuqlfhtyZ
	zWGkWoXPC7/bOoaBfGccSde5/C8kq+8Wm/fT560eFAHcw6aca/OuIKr/FiC6OrDR+tGzafXdZqV
	29wZw0qgNqDZGgci8C5ldLarpZF+ID09
X-Received: by 2002:a5d:6e4d:0:b0:48d:bae5:41c with SMTP id ffacd0b85a97d-48e3eb7e458mr188254f8f.17.1792788128507;
        Fri, 23 Oct 2026 13:42:08 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:9c3:9990:89bb:701c:1852:56c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebd48e0sm253565f8f.38.2026.10.23.13.42.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Oct 2026 13:42:07 -0700 (PDT)
From: Olivier Louvignes <olivier@mgcrea.io>
To: Linus Walleij <linusw@kernel.org>
Cc: Paul Cercueil <paul@crapouillou.net>,
	linux-gpio@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Olivier Louvignes <olivier@mgcrea.io>
Subject: [PATCH 1/2] pinctrl: ingenic: Add X1600 groups for each I2S system clock
Date: Fri, 23 Oct 2026 22:42:06 +0200
Message-ID: <20261023204207.48277-1-olivier@mgcrea.io>
X-Mailer: git-send-email 2.54.0
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

The X1600 has a system clock (MCLK) pin for each direction: PB22 for
receive, PB26 for transmit. "i2s-sysclk" takes both, which a board that
only plays cannot use when PB22 has another job. Add "i2s-sysclk-rx" and
"i2s-sysclk-tx" for one each.

Used on a HiBy R1, which only plays and has an interrupt input on PB22:
its DAC takes MCLK from "i2s-sysclk-tx".

Signed-off-by: Olivier Louvignes <olivier@mgcrea.io>
---
 drivers/pinctrl/pinctrl-ingenic.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 1aa6a6dc1209..28e7f1852054 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -2411,6 +2411,8 @@ static int x1600_i2s_data_rx_pins[] = { 0x35, };
 static int x1600_i2s_clk_rx_pins[] = { 0x37, 0x38, };
 static int x1600_i2s_clk_tx_pins[] = { 0x3b, 0x3c, };
 static int x1600_i2s_sysclk_pins[] = { 0x36, 0x3a, };
+static int x1600_i2s_sysclk_rx_pins[] = { 0x36, };
+static int x1600_i2s_sysclk_tx_pins[] = { 0x3a, };
 
 static int x1600_cim_pins[] = {
 	0x14, 0x16, 0x15, 0x18, 0x13,
@@ -2493,6 +2495,8 @@ static const struct group_desc x1600_groups[] = {
 	INGENIC_PIN_GROUP("i2s-clk-rx", x1600_i2s_clk_rx, 0),
 	INGENIC_PIN_GROUP("i2s-clk-tx", x1600_i2s_clk_tx, 0),
 	INGENIC_PIN_GROUP("i2s-sysclk", x1600_i2s_sysclk, 0),
+	INGENIC_PIN_GROUP("i2s-sysclk-rx", x1600_i2s_sysclk_rx, 0),
+	INGENIC_PIN_GROUP("i2s-sysclk-tx", x1600_i2s_sysclk_tx, 0),
 	INGENIC_PIN_GROUP("cim-data", x1600_cim, 2),
 	INGENIC_PIN_GROUP("slcd-8bit", x1600_slcd_8bit, 1),
 	INGENIC_PIN_GROUP("slcd-16bit", x1600_slcd_16bit, 1),
@@ -2539,6 +2543,7 @@ static const char * const x1600_i2c1_groups[] = { "i2c1-data-b-15", "i2c1-data-b
 
 static const char * const x1600_i2s_groups[] = {
 	"i2s-data-tx", "i2s-data-rx", "i2s-clk-rx", "i2s-clk-tx", "i2s-sysclk",
+	"i2s-sysclk-rx", "i2s-sysclk-tx",
 };
 
 static const char * const x1600_cim_groups[] = { "cim-data", };

base-commit: f33a24cc012d34f25bb9942681bd478a1757b806
-- 
2.39.5

