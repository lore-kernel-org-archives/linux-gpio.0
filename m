Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795863761;
	b=hvHaOg7uIonStp/zhlPM8aAAjlwbtap8u7Z7PVWX8IeYn2BLZWYqx0WI7m6IvoBvwkVw
	 /BGhJ7zSVHCE29fBKDs+vbiSAw3MuBaVjIiI4dRu9d6fY7Jmx+hs6OvsYl3EsKc/+htHG
	 GKHoLkXwk6fO/uEyxnveSLrNv5EE0uIPfeOzKEAQjjVg26n+bp8pSX0hUeahr6C/nA8Wr
	 UJfrigA6SmKcEAaeMrSj+q3h8898qZo42orK8SMLFG3Fwc13nX2XpAa4RpU44kTJkqtta
	 wE68HnenXwjammoHUbrzUf0dAMSBVWBmWb1Pwb3F1FWgmdGSFFzKjy3MYxH117Aq59A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795863761;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=dEoOM0479ecXXUtpNia9MRKD7yUw0KNkdzZ0olJu7ko=;
	b=Yih/Vd8wHyYxNgqrcmKXJrugigt6KMpNS9h0I7vE3Icfj06zT1szVI5r1/YtUicuGLJb
	 bRzZYtzrvHQQ0retABSYIGRe/4yOCOqePcqdqB/nvKYULPvMXdWavCYmRyyRmDPHOTPfp
	 lyemDDmRQJ85PALyoLFSXrgnvw16YN+EHDXYoFRonHUFaB4JVMMhYq/HF1APuIPmTEvE9
	 r8nSfimffmZUAIsK0ZxBF8kVMzkQ7dJ3btgO8IOb9ayDpX8WFWN+G3fMsbi7kKiUPilyZ
	 ucIsy0IlDjHB+0dRh7uqTy12YCaaBsvO4ldKRQVswy7Ez3btpcgvSCA6uwCQYNoK7Cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=UIPVxrDA;
	arc=none smtp.remote-ip=45.254.49.197
Received: from mail-m49197.qiye.163.com (mail-m49197.qiye.163.com [45.254.49.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E98606A330;
	Sat, 28 Nov 2026 11:02:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36E98606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=UIPVxrDA
Received: from user.localdomain (unknown [223.80.110.101])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5656652b4;
	Sat, 28 Nov 2026 19:02:36 +0800 (GMT+08:00)
From: Tian Xuechen <202300460064@mail.sdu.edu.cn>
To: andersson@kernel.org,
	brgl@kernel.org,
	linusw@kernel.org,
	sboyd@codeaurora.org
Cc: linux-arm-msm@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	liguangshuo@mail.sdu.edu.cn
Subject: [PATCH] pinctrl: qcom: Release the PS_HOLD power-off handler on teardown
Date: Sat, 28 Nov 2026 19:02:35 +0800
Message-Id: <20261128110235.875432-1-202300460064@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.34.1
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
X-HM-Tid: 0aa221d23eaa03a2kunm28f6d0fc3cbc92
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZQxpOVkNOQ0geS0pNGB5LGFYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUhVQ0tVSkpLVUpLSllXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=UIPVxrDAKVxWwrzF4E9obzAJvVwJ33DXEH1s/ZVU61xR0tdQyDzhJHdBYWmHWPanfZu4DNRfRbUqOixr07aLSViopJ/ORt/LpwxqGmj3eeZ2HdZhe02ONEdOKviLW69dCBfTaEPTDVrGHd2pGdvQn9oUhj3Vdnh7iKGNiTzmhEs=; s=default; c=relaxed/relaxed; d=mail.sdu.edu.cn; v=1;
	bh=dEoOM0479ecXXUtpNia9MRKD7yUw0KNkdzZ0olJu7ko=;
	h=date:mime-version:subject:message-id:from;

From: Tian Xuechen <202300460064@mail.sdu.edu.cn>

The power-off callback keeps a global pointer to the TLMM instance
after its device is removed. Register it with devres and pass the
instance as the callback argument, as the restart handler already does.

This issue was found by our static analysis tool under development.

Fixes: ad64498762dd ("pinctrl: qcom: Hook pm_power_down for shutdown support")
Signed-off-by: Tian Xuechen <202300460064@mail.sdu.edu.cn>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 657ecdaec425..dde94e547010 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1537,17 +1537,6 @@ static int msm_ps_hold_restart(struct sys_off_data *data)
 	return NOTIFY_DONE;
 }
 
-static struct msm_pinctrl *poweroff_pctrl;
-
-static void msm_ps_hold_poweroff(void)
-{
-	struct sys_off_data data = {
-		.cb_data = poweroff_pctrl,
-	};
-
-	msm_ps_hold_restart(&data);
-}
-
 static void msm_pinctrl_setup_pm_reset(struct msm_pinctrl *pctrl)
 {
 	int i;
@@ -1562,8 +1551,8 @@ static void msm_pinctrl_setup_pm_reset(struct msm_pinctrl *pctrl)
 							  pctrl))
 				dev_err(pctrl->dev,
 					"failed to setup restart handler.\n");
-			poweroff_pctrl = pctrl;
-			pm_power_off = msm_ps_hold_poweroff;
+			if (devm_register_power_off_handler(pctrl->dev, msm_ps_hold_restart, pctrl))
+				dev_err(pctrl->dev, "failed to set up power-off handler\n");
 			break;
 		}
 }

base-commit: 4dce97c6c265544342e716e62fd24bbb232590c5
-- 
2.43.0

