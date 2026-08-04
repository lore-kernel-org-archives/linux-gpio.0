Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81BB2931D0;
	Tue,  4 Aug 2026 06:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785825293; cv=none; b=QKHtkeqRfMKpKnh93ErRIRrkFpf0JhRVbTVyf0e/WCDr/xH4W0ys/bZrJIBGd1OK+hlrZYLkll0tRXdUvBbEN+5RuBdJhwxJ62md7kg61jLrSH4x8PrI20YoGLvpGNqiN24biOVAB4Aw6w8ymcpwFtHMENiV6xRhZREABdIgbYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785825293; c=relaxed/simple;
	bh=mPhyr+m6FccjeCyl858n8ry/bKAmUmXxe9RxnWJQWDo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JLKD81tElBVLp0FQLIsN1DeGhbuU6EeP9emxEV9hwqwkE0sZlC1JrzGCr5geRA4AoCSCDMaB/M41KpgDTeTnek4DtH3bTLSIN4F38Ms3AT2sZjMDrJW6kbT0PYBeVKuDGVBm5U+wYVUGdI3umU8NeIISz8tczAsPk5C9IQgz8FI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mI8L8nFV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mI8L8nFV"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5ED8BC2BCFB;
	Tue,  4 Aug 2026 06:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785825293;
	bh=mPhyr+m6FccjeCyl858n8ry/bKAmUmXxe9RxnWJQWDo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mI8L8nFVABi1tz9sse0wyPkUDVnDutR7xh2VpYdYaMsaxJLjkyhEhnN1DAeuk4pLV
	 U88QybAw3gu1Ug8OQSYB+iVJoFbxvOSipq9biscsgEU9ZAIE1zJLF+KwMMqamWRVu+
	 e/SBC56AwSPwAnl9Vzt2NKs8I+nQLOOQAef35KWkiOZLJo56AzWHTLGGH/c5Y8zPjs
	 9qa9cxObmzHqGMwIHGTUh4ZUkRk2USKlesO+gInqpl5wCcNs8viXWpFWrFtQM11eXj
	 pZ0kuutUpvS+BFzMSU8Y0yn9t20yT+Io75JVj1fublo7IvzVyDeL7idht8BkmXdD1j
	 ksUgMiHP/aoCg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B3F6C55172;
	Tue,  4 Aug 2026 06:34:53 +0000 (UTC)
From: Alexandre MINETTE via B4 Relay <devnull+contact.alex-min.fr@kernel.org>
Date: Tue, 04 Aug 2026 08:34:27 +0200
Subject: [PATCH v5 2/6] pinctrl: qcom: Register functions before enabling
 pinctrl
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-mainline-send-v1-sending-v5-2-149dd4372ac8@alex-min.fr>
References: <20260804-mainline-send-v1-sending-v5-0-149dd4372ac8@alex-min.fr>
In-Reply-To: <20260804-mainline-send-v1-sending-v5-0-149dd4372ac8@alex-min.fr>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Linus Walleij <linusw@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, Lee Jones <lee@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 phone-devel@vger.kernel.org, Alexandre MINETTE <contact@alex-min.fr>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785825291; l=2065;
 i=contact@alex-min.fr; s=20260421; h=from:subject:message-id;
 bh=nnkIMq70r4eCtNSj9RhMpPTd6mbuz/WSgyu3J6EV+SU=;
 b=OX3qclg9jTAkcjMabQ6W+eCvAfzxUFjsMyNfQhqIUQ8J7tIjCLCnpzIvJnGXIfQ0g3BDJc6l1
 wIGjUGd68hVAJXsbN1EF9nCS/1CEX/7zAij9hsT4jRwEY8VoqFYmMck
X-Developer-Key: i=contact@alex-min.fr; a=ed25519;
 pk=KOCaxY4v16ptaT0uk1FRkuaDF2n1JhmnYwLiqWD76M4=
X-Endpoint-Received: by B4 Relay for contact@alex-min.fr/20260421 with
 auth_id=743
X-Original-From: Alexandre MINETTE <contact@alex-min.fr>
Reply-To: contact@alex-min.fr

From: Alexandre MINETTE <contact@alex-min.fr>

pinctrl consumers can request states while the pinctrl core enables the
controller. On Qualcomm pinctrl drivers this can happen before the SoC
function list has been registered, which leaves the function table
incomplete during state lookup.

On APQ8064 this can fail while claiming pinctrl hogs:

   apq8064-pinctrl 800000.pinctrl: invalid function ps_hold in map table
   apq8064-pinctrl 800000.pinctrl: error claiming hogs: -22
   apq8064-pinctrl 800000.pinctrl: could not claim hogs: -22

Register Qualcomm pinctrl with devm_pinctrl_register_and_init(), add the
SoC pin functions, and only then enable the pinctrl device.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 45b3a2763eb8..a2a1e0835735 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -1593,11 +1593,11 @@ int msm_pinctrl_probe(struct platform_device *pdev,
 	pctrl->desc.pins = pctrl->soc->pins;
 	pctrl->desc.npins = pctrl->soc->npins;
 
-	pctrl->pctrl = devm_pinctrl_register(&pdev->dev, &pctrl->desc, pctrl);
-	if (IS_ERR(pctrl->pctrl)) {
-		dev_err(&pdev->dev, "Couldn't register pinctrl driver\n");
-		return PTR_ERR(pctrl->pctrl);
-	}
+	ret = devm_pinctrl_register_and_init(&pdev->dev, &pctrl->desc,
+					     pctrl, &pctrl->pctrl);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Couldn't register pinctrl driver\n");
 
 	for (i = 0; i < soc_data->nfunctions; i++) {
 		func = &soc_data->functions[i];
@@ -1607,6 +1607,11 @@ int msm_pinctrl_probe(struct platform_device *pdev,
 			return ret;
 	}
 
+	ret = pinctrl_enable(pctrl->pctrl);
+	if (ret)
+		return dev_err_probe(&pdev->dev, ret,
+				     "Couldn't enable pinctrl driver\n");
+
 	ret = msm_gpio_init(pctrl);
 	if (ret)
 		return ret;

-- 
2.43.0


