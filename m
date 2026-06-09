Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC6463EAC86;
	Tue,  9 Jun 2026 08:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780992836; cv=none; b=SQmHkKUieIWkTHyRNf9mO5b0TDFOyofuKbk0qqUMyQzJ47Sm9Ootnsnvzu6smqenWYWF+M//RvyspZPC/ERrWv5Px8jc988ukCGjgg8itfQ29l5j6P1Gq1670BLuHftGSca583RDUwCW0XgRuuSTvLZu6r1U81VidBwbBISMyxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780992836; c=relaxed/simple;
	bh=BXZ5QG6v4UDK57mLHZRzAVjTQ4P7nYL957IdTPYYDiM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JtVhIDZ29+eJFokf5xq1jtVdzlCwntTnHA/ckkPk273jq8T58ajfsVTu2VxgOUvfWrvuWr1R+aCQA8UqKIeORLKSbB1w9pwCwnAkenpSlAw5IA8i0iAYBfNLsw04gs1VKQxKjCdr67L1xPaOrlFisnq+vRCXcUKMNH0ULqOM4tE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t9EoloyR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t9EoloyR"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6CD2EC4AF19;
	Tue,  9 Jun 2026 08:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780992836;
	bh=BXZ5QG6v4UDK57mLHZRzAVjTQ4P7nYL957IdTPYYDiM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=t9EoloyRnEUNQKI6/doAKImNzACYIFXQiUJMDeENYQySjR6urxvvFJH8Qq3sM+n2N
	 VSscgmfQt6WOn0adzJJAjlZhUa9l8ZStnLXEGbqlANrE71aX7tATooOQp0wUrSyTUR
	 aXa+hq5bvtXc9kq77EyxXKR7D8hEInDzN6z3w3M66MDfAsZZqr2HZWZaQW3KcVCCYr
	 Asqmnqh24suqpuJ83ad7xYX3e9n1ZAQBF/NzGfLtVT8F+1aO9YmJJ9+WNLb4ojtrSx
	 0rkc8RxVYVVfh7UBVK51YBiU9Y/N/0vo5DdPoCiTpMRRoHxBlX2aYkPD8xu1lXjEUP
	 X5fAuMdlWpI1g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6114CCD8CBF;
	Tue,  9 Jun 2026 08:13:56 +0000 (UTC)
From: Alexandre MINETTE via B4 Relay <devnull+contact.alex-min.fr@kernel.org>
Date: Tue, 09 Jun 2026 10:13:46 +0200
Subject: [PATCH v4 3/6] ARM: dts: qcom: apq8064: Fix USB controller clocks
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-mainline-send-v1-sending-v4-3-83768fbf404d@alex-min.fr>
References: <20260609-mainline-send-v1-sending-v4-0-83768fbf404d@alex-min.fr>
In-Reply-To: <20260609-mainline-send-v1-sending-v4-0-83768fbf404d@alex-min.fr>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Guru Das Srinagesh <linux@gurudas.dev>, Linus Walleij <linusw@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Kees Cook <kees@kernel.org>, 
 Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 phone-devel@vger.kernel.org, Alexandre MINETTE <contact@alex-min.fr>, 
 Antony Kurniawan Soemardi <linux@smankusors.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780992834; l=3024;
 i=contact@alex-min.fr; s=20260421; h=from:subject:message-id;
 bh=GqHsba4If8+Q0/z6LsTrLfjYZUS+n2wsp24jrmw+SmI=;
 b=WtpNUFqzLuML7j28Xhycbr2yVGrBcroxfjqO4B71uk1XC4A/nZSBPPn6utz7xEYTaGQY3Upe2
 Dglq3H8GIf0AmVMamW1i5+fs7CFO7Px+xYHakpk4tsrhCUPqx4b4KuE
X-Developer-Key: i=contact@alex-min.fr; a=ed25519;
 pk=KOCaxY4v16ptaT0uk1FRkuaDF2n1JhmnYwLiqWD76M4=
X-Endpoint-Received: by B4 Relay for contact@alex-min.fr/20260421 with
 auth_id=743
X-Original-From: Alexandre MINETTE <contact@alex-min.fr>
Reply-To: contact@alex-min.fr

From: Alexandre MINETTE <contact@alex-min.fr>

The APQ8064 HS USB controller nodes describe the transceiver clock as
"core", but the ChipIdea MSM glue expects "core" to be the controller
fabric clock and "fs" to be the transceiver clock.

This mismatch can leave the fabric clock disabled while the controller is
accessed. Some boards may tolerate that if the clock is already enabled
elsewhere, but it is not a correct description of the hardware.

Describe the RPM Daytona fabric clock as "core", the AHB clock as
"iface", and the transceiver clock as "fs" for all APQ8064 HS USB
controllers. Without this, USB does not probe reliably on Samsung Galaxy
S4 because the fabric clock remains disabled.

Link: https://lore.kernel.org/all/20260516-qcom-ci-hdrc-clock-fix-v2-1-aaec8d33d0aa@smankusors.com/
Suggested-by: Antony Kurniawan Soemardi <linux@smankusors.com>
Signed-off-by: Alexandre MINETTE <contact@alex-min.fr>
Acked-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Linus Walleij <linusw@kernel.org>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index 09062b2ad8ba..d64a162abdad 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -813,8 +813,10 @@ usb1: usb@12500000 {
 			reg = <0x12500000 0x200>,
 			      <0x12500200 0x200>;
 			interrupts = <GIC_SPI 100 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc USB_HS1_XCVR_CLK>, <&gcc USB_HS1_H_CLK>;
-			clock-names = "core", "iface";
+			clocks = <&gcc USB_HS1_H_CLK>,
+				 <&rpmcc RPM_DAYTONA_FABRIC_CLK>,
+				 <&gcc USB_HS1_XCVR_CLK>;
+			clock-names = "iface", "core", "fs";
 			assigned-clocks = <&gcc USB_HS1_XCVR_CLK>;
 			assigned-clock-rates = <60000000>;
 			resets = <&gcc USB_HS1_RESET>;
@@ -844,8 +846,10 @@ usb3: usb@12520000 {
 			reg = <0x12520000 0x200>,
 			      <0x12520200 0x200>;
 			interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc USB_HS3_XCVR_CLK>, <&gcc USB_HS3_H_CLK>;
-			clock-names = "core", "iface";
+			clocks = <&gcc USB_HS3_H_CLK>,
+				 <&rpmcc RPM_DAYTONA_FABRIC_CLK>,
+				 <&gcc USB_HS3_XCVR_CLK>;
+			clock-names = "iface", "core", "fs";
 			assigned-clocks = <&gcc USB_HS3_XCVR_CLK>;
 			assigned-clock-rates = <60000000>;
 			resets = <&gcc USB_HS3_RESET>;
@@ -875,8 +879,10 @@ usb4: usb@12530000 {
 			reg = <0x12530000 0x200>,
 			      <0x12530200 0x200>;
 			interrupts = <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&gcc USB_HS4_XCVR_CLK>, <&gcc USB_HS4_H_CLK>;
-			clock-names = "core", "iface";
+			clocks = <&gcc USB_HS4_H_CLK>,
+				 <&rpmcc RPM_DAYTONA_FABRIC_CLK>,
+				 <&gcc USB_HS4_XCVR_CLK>;
+			clock-names = "iface", "core", "fs";
 			assigned-clocks = <&gcc USB_HS4_XCVR_CLK>;
 			assigned-clock-rates = <60000000>;
 			resets = <&gcc USB_HS4_RESET>;

-- 
2.43.0


