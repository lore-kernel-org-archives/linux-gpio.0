Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD603FC5A4;
	Tue,  4 Aug 2026 06:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785825293; cv=none; b=qm6z0pqMvmcSBzAd4nusHU3kMlPP+H+81wzIubrBgAarHCJ+9+YAkAF+GQyjbLKblHD1NaKtU/Mkc+e22KPSLqJREOkFEfqclKKZcIwnbxAqYOeUy9yDM0RrTm2/H9RrMUI3gJGVc4quEOTf3U/N9xg7GMiRAUgLMTzD5GXMEpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785825293; c=relaxed/simple;
	bh=ho6QcQ1LKbLfIoHgvQi0DuiBjdbVeMQkcjFmCfEHeC0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OACfG9YfNcA+Chcbz+Mgn0pqGS4cQGX89CWOBmV3jd+uGFUlnQccl4R2jqfr8uXCf5VyUuVUZmjEYWouKn0aePhW5M/ih8wGiZXhCazojlqpkQEukv0prKC4ONCdOA0IMliQr2A687M15MEdyrNBx7sPDsXs/I1HvEvxYyyPQ+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VJGNQn6u; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VJGNQn6u"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9607CC2BD00;
	Tue,  4 Aug 2026 06:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785825293;
	bh=ho6QcQ1LKbLfIoHgvQi0DuiBjdbVeMQkcjFmCfEHeC0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VJGNQn6uqBx8y5afMK98JlVnzi0TAphHYb+Er8KcmL7WvqNGrAtgGU+ZKVz30KBOw
	 B5FIF91brP3I2JvIc9DDh9pWdTAscIfSeeQlocg3rD15jK4hiAGCd0jpYeSluuyDlQ
	 yHZ1isWFkySaGel7gunBwl4cIY/fHPbHy3OscnHbEvKBVhXcE+KYBHcoPK3peHubR+
	 ymlhUFi7xmNFYXY8eOhPzbPOKMnpooDcrj+1yRri93XKHdzRESJZD4PTA6MGW/vpC+
	 6oVP0ixBelQI1y12isuEWL3wER4LpUfAdgMYQfxiPVzrINjKTSqRcmYhpm8aTvXI/j
	 /Pq+Rl3FDqTsQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83DAAC55172;
	Tue,  4 Aug 2026 06:34:53 +0000 (UTC)
From: Alexandre MINETTE via B4 Relay <devnull+contact.alex-min.fr@kernel.org>
Date: Tue, 04 Aug 2026 08:34:30 +0200
Subject: [PATCH v5 5/6] extcon: qcom-spmi-misc: match PM8xxx USB ID
 platform device
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-mainline-send-v1-sending-v5-5-149dd4372ac8@alex-min.fr>
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
 phone-devel@vger.kernel.org, Alexandre MINETTE <contact@alex-min.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785825291; l=1259;
 i=contact@alex-min.fr; s=20260421; h=from:subject:message-id;
 bh=GY8HHAKQAe9p+CGliq7ltiYrSns53pS1wL6cDILgUI0=;
 b=ZLboheVqEulZk767LeMAQIhKgzjMzsE9seG0dIqxjEa/av+wcyMuf7HKKNGCow88t9DvLFo6g
 CJwRNYVEFXxB5ZKI1DlVEYny8s165aSEas87LF4guXotYkN0emTH9Gw
X-Developer-Key: i=contact@alex-min.fr; a=ed25519;
 pk=KOCaxY4v16ptaT0uk1FRkuaDF2n1JhmnYwLiqWD76M4=
X-Endpoint-Received: by B4 Relay for contact@alex-min.fr/20260421 with
 auth_id=743
X-Original-From: Alexandre MINETTE <contact@alex-min.fr>
Reply-To: contact@alex-min.fr

From: Alexandre MINETTE <contact@alex-min.fr>

The PM8xxx MFD registers the PM8921 USB ID detector as a platform device
named "qcom-pm8xxx-usb-id". Its reused firmware node remains compatible
with "qcom,pm8921", so it does not match the extcon driver's OF table.

Add a platform device ID so the existing extcon driver binds to this
device and consumes its named USB ID interrupt.

Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
---
 drivers/extcon/extcon-qcom-spmi-misc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/extcon/extcon-qcom-spmi-misc.c b/drivers/extcon/extcon-qcom-spmi-misc.c
index afaba5685c3d..e16c109b553e 100644
--- a/drivers/extcon/extcon-qcom-spmi-misc.c
+++ b/drivers/extcon/extcon-qcom-spmi-misc.c
@@ -204,8 +204,15 @@ static const struct of_device_id qcom_usb_extcon_dt_match[] = {
 };
 MODULE_DEVICE_TABLE(of, qcom_usb_extcon_dt_match);
 
+static const struct platform_device_id qcom_usb_extcon_id[] = {
+	{ "qcom-pm8xxx-usb-id" },
+	{ }
+};
+MODULE_DEVICE_TABLE(platform, qcom_usb_extcon_id);
+
 static struct platform_driver qcom_usb_extcon_driver = {
 	.probe		= qcom_usb_extcon_probe,
+	.id_table	= qcom_usb_extcon_id,
 	.driver		= {
 		.name	= "extcon-pm8941-misc",
 		.pm	= &qcom_usb_extcon_pm_ops,

-- 
2.43.0


