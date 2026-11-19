Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=121.127.44.73
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795123071;
	b=HXA7rJ1kk/clBYUqC6xPijPgyLIwPM7ECTRss0mI2Rny6JHwLadugVdjj3WXCROQufdn
	 MNcbYvQy0ytmlsrf7DB3pZr84TMdSxlLAhvHTrGAR7JwqSpvxKx/kKtQCqmSa1uqs3H3/
	 GzYzvEPjzE9g0jSMRn/NaMmaFru6otAVqgukk1SMM1rKYG4S3KKk1QzyIoRlzl0pzPkQ/
	 QR8QX3rpI2yuDooVdOoCLeEiNBP9MIVanQkfPGyJMJ+NQnGQn0p6NHSRdQS+9A7ZGmF1l
	 eG6CrrJUWT/ZDx/1Cax6ncwRxcZMrSxfHJlRidnzJ2WiLblHQUdubmjpNgrBqYBLTvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795123071;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:CFBL-Feedback-ID:
	 CFBL-Address:X-Forward-Email-ID:X-Forward-Email-Sender:
	 X-Forward-Email-Version:X-Forward-Email-Website:X-Complaints-To:
	 X-Report-Abuse:X-Report-Abuse-To:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=BxIuQ0x+zM+x9HyEnukAMenKIXa8hWYpcEyJ67KKCCw=;
	b=CL8zhdlEMkywX+t0yw0fKH70cvTi28WJgCHN4VaQOdqRX04IkWsacfjMcXNlRUwkvV9f
	 El0rUQj804ZWwyIcLAxlMOqxd6Qti7ZNhNQ5mPbxRALGWHq2PtUUBIqKiuYwZB6dIZlGy
	 GiZu+RQDHy2snbCfklSSTXlVIKQAqFZL2XiKJRvLhE5MN+7yY8XgC+Bb2MIlmKyDi2Li3
	 rn9B3EummOyv3OjAfCf9BI5JCYDEnNp5bFGTFKj5lb60d182sM5krzWdTs/NsbYrhV3Bl
	 20Xpd08kkLdSauhp/L2kX4pWs8N4dCNfJiYzue0BHJq/b7/NteF2IkHFUYUWbpjU8Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kwiboo.se;
	spf=pass smtp.mailfrom=fe-bounces.kwiboo.se;
	dkim=pass header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=SspAqPIt;
	dkim=pass header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=EHJ1w6Nt;
	arc=none smtp.remote-ip=121.127.44.73
Received: from smtp.forwardemail.net (smtp.forwardemail.net [121.127.44.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37D9606A324
	for <linux-gpio@vger.kernel.org>; Thu, 19 Nov 2026 21:17:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C37D9606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kwiboo.se header.i=@kwiboo.se header.a=rsa-sha256 header.s=fe-e1b5cab7be header.b=SspAqPIt;
	dkim=pass (1024-bit key, unprotected) header.d=forwardemail.net header.i=@forwardemail.net header.a=rsa-sha256 header.s=default header.b=EHJ1w6Nt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=fe-e1b5cab7be;
 t=1795123069; bh=BxIuQ0x+zM+x9HyEnukAMenKIXa8hWYpcEyJ67KKCCw=;
 b=SspAqPItOXQbwfSifBYdKwM6LuzeRal6WQu708B4QMDGAutv/5yvm3StbGrJcgNSu68iZmv0A
 x9ABVEHkBmOMMRLTojjD1DDSR83enpFSIm5nmvkADSnI1wSYWcmfZLAIuZDsxDhpss5PFTPJO3O
 P4nvFcYBvs74NgDnRUPfYJ0nXDgj0KmMBPTd6f8IAMddUW7UiU6RslbhArBSFhPLboNEq1z8seb
 /ehrNbOR8YbdxZUlO5BSlTj24+3JkuS3ANXg/dsAo9mFp0nnvY2qH4g7UstingD8FVPvDQ8dWEY
 bsaecjMoazLju61Ch8SeZbC2OfI5Q40LgLogqVDdrwsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=forwardemail.net;
 h=Content-Transfer-Encoding: MIME-Version: Message-ID: Date: Subject: Cc:
 To: From: CFBL-Address: CFBL-Feedback-ID; q=dns/txt; s=default;
 t=1795123069; bh=BxIuQ0x+zM+x9HyEnukAMenKIXa8hWYpcEyJ67KKCCw=;
 b=EHJ1w6Ntrl1SjotUSbl7o/1gbXUaFeM60wK7VCHEsF+rsYJEtKvxgUoGqaDicOqpr1adWzTUi
 pX3vd5F9tNWJ0Hfj2QoFBJh4Tu/ZZJsuz/9nL7S+khgcb463R9YIoZa1TwMtxi5cCckDEe5a0gm
 76LZJjO62l20Yi1QbhmI2RU=
CFBL-Feedback-ID: 6aff677a2e4f08e3e6856b7d:717e687073dda47710113f537f5d096f
CFBL-Address: abuse@forwardemail.net; report=arf
X-Forward-Email-ID: 6aff677a2e4f08e3e6856b7d
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.19.33
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Linus Walleij <linusw@kernel.org>,
	Ye Zhang <ye.zhang@rock-chips.com>
Cc: linux-rockchip@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] pinctrl: rockchip: Fix RK3506 pinctrl support
Date: Thu, 19 Nov 2026 21:17:39 +0000
Message-ID: <20261119211739.566874-1-jonas@kwiboo.se>
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

The pinctrl driver added in commit dbd2317d7b9f ("pinctrl: rockchip:
Add rk3506 pinctrl support") depends on a rockchip,ioc1 property not
documented in dt-bindings to work, i.e. it expects the pinctrl node to
look something like following:

  pinctrl {
	rockchip,pmu = <&gpio0_ioc>;
	rockchip,ioc1 = <&gpio1_ioc>;
	rockchip,grf = <&gpio234_ioc>;

	gpio0 { };
	gpio1 { };
	gpio2 { };
  };

With the commit 63113d4fce6c ("pinctrl: rockchip: Add RV1106 pinctrl
support") the driver gained support for using GPIO bank referenced IO
control register blocks using the rockchip,grf phandle of the bank node.

Change the driver to work with dt-bindings documented nodes and
properties, i.e. something like:

  pinctrl {
	rockchip,grf = <&gpio234_ioc>;

	gpio0 {
		rockchip,grf = <&gpio0_ioc>;
	};
	gpio1 {
		rockchip,grf = <&gpio1_ioc>;
	};
	gpio2 { };
  };

Fixes: dbd2317d7b9f ("pinctrl: rockchip: Add rk3506 pinctrl support")
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
The initial devicetree submitted for RK3506 at [1] uses rockchip,grf
props in gpio0 and gpio1 nodes together with a rockchip,grf in the
pinctrl node to work as the fallback for gpio2, gpi3 and gpio4.

[1] http://patch.msgid.link/20261119152055.556266-3-jonas@kwiboo.se/
---
 drivers/pinctrl/pinctrl-rockchip.c | 49 ++++++++++++------------------
 drivers/pinctrl/pinctrl-rockchip.h |  1 -
 2 files changed, 19 insertions(+), 31 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
index b78be7dd5342..563c3ffcfe4a 100644
--- a/drivers/pinctrl/pinctrl-rockchip.c
+++ b/drivers/pinctrl/pinctrl-rockchip.c
@@ -1335,12 +1335,8 @@ static int rockchip_get_mux(struct rockchip_pin_bank *bank, int pin)
 	if (ctrl->type == RV1103B && bank->bank_num == 2 && pin >= 12)
 		return 0;
 
-	if (ctrl->type == RK3506) {
-		if (bank->bank_num == 1)
-			regmap = info->regmap_ioc1;
-		else if (bank->bank_num == 4)
-			return 0;
-	}
+	if (ctrl->type == RK3506 && bank->bank_num == 4)
+		return 0;
 
 	/* get basic quadrupel of mux registers and the correct reg inside */
 	mux_type = bank->iomux[iomux_num].type;
@@ -1492,12 +1488,8 @@ static int rockchip_set_mux(struct rockchip_pin_bank *bank, int pin, int mux)
 	if (ctrl->type == RV1103B && bank->bank_num == 2 && pin >= 12)
 		return 0;
 
-	if (ctrl->type == RK3506) {
-		if (bank->bank_num == 1)
-			regmap = info->regmap_ioc1;
-		else if (bank->bank_num == 4)
-			return 0;
-	}
+	if (ctrl->type == RK3506 && bank->bank_num == 4)
+		return 0;
 
 	/* get basic quadrupel of mux registers and the correct reg inside */
 	mux_type = bank->iomux[iomux_num].type;
@@ -2568,9 +2560,13 @@ static int rk3506_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
 	struct rockchip_pinctrl *info = bank->drvdata;
 	int ret = 0;
 
+	if (bank->regmap_ioc)
+		*regmap = bank->regmap_ioc;
+	else
+		*regmap = info->regmap_base;
+
 	switch (bank->bank_num) {
 	case 0:
-		*regmap = info->regmap_pmu;
 		if (pin_num > 24) {
 			ret = -EINVAL;
 		} else if (pin_num < 24) {
@@ -2584,7 +2580,6 @@ static int rk3506_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
 		break;
 
 	case 1:
-		*regmap = info->regmap_ioc1;
 		if (pin_num < 28)
 			*reg = RK3506_DRV_GPIO1_OFFSET;
 		else
@@ -2592,7 +2587,6 @@ static int rk3506_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
 		break;
 
 	case 2:
-		*regmap = info->regmap_base;
 		if (pin_num < 17)
 			*reg = RK3506_DRV_GPIO2_OFFSET;
 		else
@@ -2600,7 +2594,6 @@ static int rk3506_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
 		break;
 
 	case 3:
-		*regmap = info->regmap_base;
 		if (pin_num < 15)
 			*reg = RK3506_DRV_GPIO3_OFFSET;
 		else
@@ -2608,7 +2601,6 @@ static int rk3506_calc_drv_reg_and_bit(struct rockchip_pin_bank *bank,
 		break;
 
 	case 4:
-		*regmap = info->regmap_base;
 		if (pin_num < 8 || pin_num > 11) {
 			ret = -EINVAL;
 		} else {
@@ -2653,9 +2645,13 @@ static int rk3506_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
 	struct rockchip_pinctrl *info = bank->drvdata;
 	int ret = 0;
 
+	if (bank->regmap_ioc)
+		*regmap = bank->regmap_ioc;
+	else
+		*regmap = info->regmap_base;
+
 	switch (bank->bank_num) {
 	case 0:
-		*regmap = info->regmap_pmu;
 		if (pin_num > 24) {
 			ret = -EINVAL;
 		} else if (pin_num < 24) {
@@ -2669,7 +2665,6 @@ static int rk3506_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
 		break;
 
 	case 1:
-		*regmap = info->regmap_ioc1;
 		if (pin_num < 28)
 			*reg = RK3506_PULL_GPIO1_OFFSET;
 		else
@@ -2677,7 +2672,6 @@ static int rk3506_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
 		break;
 
 	case 2:
-		*regmap = info->regmap_base;
 		if (pin_num < 17)
 			*reg = RK3506_PULL_GPIO2_OFFSET;
 		else
@@ -2685,7 +2679,6 @@ static int rk3506_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
 		break;
 
 	case 3:
-		*regmap = info->regmap_base;
 		if (pin_num < 15)
 			*reg = RK3506_PULL_GPIO3_OFFSET;
 		else
@@ -2693,7 +2686,6 @@ static int rk3506_calc_pull_reg_and_bit(struct rockchip_pin_bank *bank,
 		break;
 
 	case 4:
-		*regmap = info->regmap_base;
 		if (pin_num < 8 || pin_num > 11) {
 			ret = -EINVAL;
 		} else {
@@ -2739,9 +2731,13 @@ static int rk3506_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
 	struct rockchip_pinctrl *info = bank->drvdata;
 	int ret = 0;
 
+	if (bank->regmap_ioc)
+		*regmap = bank->regmap_ioc;
+	else
+		*regmap = info->regmap_base;
+
 	switch (bank->bank_num) {
 	case 0:
-		*regmap = info->regmap_pmu;
 		if (pin_num > 24) {
 			ret = -EINVAL;
 		} else if (pin_num < 24) {
@@ -2755,7 +2751,6 @@ static int rk3506_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
 		break;
 
 	case 1:
-		*regmap = info->regmap_ioc1;
 		if (pin_num < 28)
 			*reg = RK3506_SMT_GPIO1_OFFSET;
 		else
@@ -2763,7 +2758,6 @@ static int rk3506_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
 		break;
 
 	case 2:
-		*regmap = info->regmap_base;
 		if (pin_num < 17)
 			*reg = RK3506_SMT_GPIO2_OFFSET;
 		else
@@ -2771,7 +2765,6 @@ static int rk3506_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
 		break;
 
 	case 3:
-		*regmap = info->regmap_base;
 		if (pin_num < 15)
 			*reg = RK3506_SMT_GPIO3_OFFSET;
 		else
@@ -2779,7 +2772,6 @@ static int rk3506_calc_schmitt_reg_and_bit(struct rockchip_pin_bank *bank,
 		break;
 
 	case 4:
-		*regmap = info->regmap_base;
 		if (pin_num < 8 || pin_num > 11) {
 			ret = -EINVAL;
 		} else {
@@ -5030,9 +5022,6 @@ static int rockchip_pinctrl_probe(struct platform_device *pdev)
 	/* try to find the optional reference to the pmu syscon */
 	info->regmap_pmu = syscon_regmap_lookup_by_phandle_optional(np, "rockchip,pmu");
 
-	/* try to find the optional reference to the ioc1 syscon */
-	info->regmap_ioc1 = syscon_regmap_lookup_by_phandle_optional(np, "rockchip,ioc1");
-
 	if (ctrl->type == RK3308) {
 		ret = rk3308_soc_data_init(info);
 		if (ret)
diff --git a/drivers/pinctrl/pinctrl-rockchip.h b/drivers/pinctrl/pinctrl-rockchip.h
index 553197f6dc69..b565f14254d8 100644
--- a/drivers/pinctrl/pinctrl-rockchip.h
+++ b/drivers/pinctrl/pinctrl-rockchip.h
@@ -468,7 +468,6 @@ struct rockchip_pinctrl {
 	int				reg_size;
 	struct regmap			*regmap_pull;
 	struct regmap			*regmap_pmu;
-	struct regmap			*regmap_ioc1;
 	struct device			*dev;
 	struct rockchip_pin_ctrl	*ctrl;
 	struct pinctrl_desc		pctl;
-- 
2.56.1

