Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4010D367B8C;
	Thu, 28 May 2026 08:04:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779955497; cv=none; b=ZnDb2CMJbtoux2ug5Ur0UMqX67I2EczIigTLgz3ieXVDYiEtuLo8ji41pkop+4aJTLQ5sJswBeexRGSLhQ0NKvT21VQx1O/kROwgzzbte/j+/EH68OM3mgMjAoOxK7dD2CdWDBK2hZhkXnY72u8AiWYPhEv80q4AnrWhN1YzE38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779955497; c=relaxed/simple;
	bh=6MpYiUub0APMFI7uH+P2Fplw3Zl8ZQB1MvsBZY3p4QA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tatimIa2AKL4/3HoLvc1Y8ebyARoOtu/yA32Cnp31a3X6oGgKS++UhlvdnUmjfU+9uDu5PaKMwHXWS1ncPKBtDgd6FqIYEyj/bd+w6mmfRAfasc3HjGI9Qm/RcRw5Cn8YK3UrFP0chFFLmXFFaIqKTfYy1vHZGvt9lGQ7gsV2Hw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LQTLTsj2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LQTLTsj2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D36A31F000E9;
	Thu, 28 May 2026 08:04:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779955496;
	bh=IpNkcRyrbtHE0i7ymqh8hO4uiycSt7wtY+zaW32miTM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=LQTLTsj2Gr5HXXOlVvV+0g983TAnosR3MjP9w5U+39QQ5A86bnRHsDV43h83oka10
	 DzUFrpubRVIO1vV5H1h2JltEd2CjvahAz6xXQ9Fmm/kZLa/ltqaTiyCir/WJoTeca6
	 R+SEM16W/MB/yAftZbkYRvpUagp+SpWYFualITrWr4GyxP9nvJSYG7LmsQ0/rvx/RA
	 KknL78Z7KWh7WTqmSDb3UxJF9sQNznUO32Ucc3HPk7GwncyQY4CbncQW5Y5z9rtsOn
	 mfr+sjHll/u3ra1vMrSK/1zOItLPT0UCX5VccnoU5E6bwVt0TvTpFlyh42Ovl/Ypnn
	 rjMugpp7pOhOA==
From: Claudiu Beznea <claudiu.beznea@kernel.org>
To: geert+renesas@glider.be,
	linusw@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com
Cc: claudiu.beznea@kernel.org,
	claudiu.beznea@tuxon.dev,
	linux-renesas-soc@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 2/7] pinctrl: renesas: rzg2l: Drop defines present in struct rzg2l_hwcfg
Date: Thu, 28 May 2026 11:04:34 +0300
Message-ID: <20260528080439.615958-3-claudiu.beznea@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260528080439.615958-1-claudiu.beznea@kernel.org>
References: <20260528080439.615958-1-claudiu.beznea@kernel.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Drop the QSPI and OTHER_POC register defines, which are SoC specific and
accessible through struct rzg2l_hwcfg::{qspi, other_poc}.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- none

 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index a648d75a2bd2..77443cf1f431 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -180,8 +180,6 @@
 #define SMT(off)		(0x3400 + (off) * 8)
 #define SD_CH(off, ch)		((off) + (ch) * 4)
 #define ETH_POC(off, ch)	((off) + (ch) * 4)
-#define QSPI			(0x3008) /* known on RZ/{G2L,G2LC,G2UL,Five} only */
-#define OTHER_POC		(0x3028) /* known on RZ/G3L only */
 
 #define PVDD_2500		2	/* I/O domain voltage 2.5V */
 #define PVDD_1800		1	/* I/O domain voltage <= 1.8V */
@@ -3816,9 +3814,9 @@ static const struct rzg2l_hwcfg rzg2l_hwcfg = {
 	.regs = {
 		.pwpr = 0x3014,
 		.sd_ch = 0x3000,
+		.qspi = 0x3008,
 		.eth_poc = 0x300c,
 		.oen = 0x3018,
-		.qspi = QSPI,
 	},
 	.iolh_groupa_ua = {
 		/* 3v3 power source */
@@ -3835,7 +3833,7 @@ static const struct rzg2l_hwcfg rzg3l_hwcfg = {
 		.sd_ch = 0x3004,
 		.eth_poc = 0x3010,
 		.oen = 0x3018,
-		.other_poc = OTHER_POC,
+		.other_poc = 0x3028,
 	},
 	.masks = {
 		.other_poc_pvdd1833_oth_awo_poc = BIT(0),
-- 
2.43.0

