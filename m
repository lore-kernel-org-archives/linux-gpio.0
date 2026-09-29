Received: from mx.nabladev.com (mx.nabladev.com [178.251.229.89])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C3D568FA3;
	Tue, 29 Sep 2026 19:41:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.251.229.89
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790710879; cv=none; b=VWpSeLrvmG+7sOvc0Y29vFKC414FfJv0u/qcUFuuufkc1sMfKSxlPkbJiUrH76dNZQL3XQVlJuguLzikOHAeJ9vLDjrjIegQqyDStKrSRfuuJ1UOmqg4xid4eUU1XwArtCseICzqUknC/PsTMEy0gclAyOLj/rzm3eFaKJyJHgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790710879; c=relaxed/simple;
	bh=N9cVl0ThAibAdEDHkYpe3SyIfBZ8Ccri6YJnosImIC8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KbCwFhOSoSNTMhKRMeE9KFx2D+nAKTP+kyUTvIhk72/Obc+uam+Aae9Lzdv3FUVEYlXx5NxjcSCxzB+lF/CiquebZ+t4JY+b/OleIOphL0c3mUZQHmQEZ8PxqnsQ9rVNsVndoqVQ5npIAuV88jaajU14tYLAyXvg2yQCXRjahLQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com; spf=pass smtp.mailfrom=nabladev.com; dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b=Jh4VjVqK; arc=none smtp.client-ip=178.251.229.89
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nabladev.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nabladev.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nabladev.com header.i=@nabladev.com header.b="Jh4VjVqK"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2F6C2106CF2;
	Tue, 29 Sep 2026 21:41:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1790710871; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=a503ZvQbaOcbrGVP+C0Du3gnG7TeATUmwBd+VIhzDak=;
	b=Jh4VjVqKLZq+ZPiq0ostQQww0AuXnY/J0US3guNqQ2cjxK9tIaPpDymbpOOKeu+GkPi+qT
	f4K+jij31eLLcFdbzYa8+3YfeQsXV50fnqLKPY3WUrOfk1LX06/rNCEW7Ga7FeKW1E9J0y
	EM8waL4jrQ14ZPl9dGagBAhVc3+q5lyAVybvZ2vslnBbTXVpHIK0n9T9FVyFyXGjKhqoFG
	/qKiQfV52sNfJYGc/vlbTfIsnZGLZZ/NXsog7ACH+H4iDd0RFqKsqvuIXpLnUxXJY9tHsd
	c0eiRcFw626Za0WjaejprLVm9bjVJ1E+uppvBR81ZaZb/0Ur2dlXBqbujWt+mQ==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	kernel@dh-electronics.com,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH 5/5] arm64: dts: st: Do not encode path in sdmmc2_*_pins_a/pins2 phandle
Date: Tue, 29 Sep 2026 21:39:59 +0200
Message-ID: <20260929194035.496244-5-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260929194035.496244-1-marex@nabladev.com>
References: <20260929194035.496244-1-marex@nabladev.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Do not encode node path in phandles, describe subnodes instead.
This is only a consistency change, no functional change.

Fixes: 9b584c92f94f ("arm64: dts: st: Add support for DH electronics STM32MP23xx/STM32MP25xx DHCOS SoM and Breakout Board and DHSBC")
Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Linus Walleij <linusw@kernel.org>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-gpio@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-stm32@st-md-mailman.stormreply.com
---
 .../arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
index 80d829c55d9d8..bcf63e2ea9898 100644
--- a/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp2xxx-dhcos-som.dtsi
@@ -389,14 +389,18 @@ &scmi_vddio4 {
 	regulator-always-on;
 };
 
-&{sdmmc2_b4_pins_a/pins2} {
-	/delete-property/ bias-disable;
-	bias-pull-up;
+&sdmmc2_b4_pins_a {
+	pins2 {
+		/delete-property/ bias-disable;
+		bias-pull-up;
+	};
 };
 
-&{sdmmc2_b4_od_pins_a/pins2} {
-	/delete-property/ bias-disable;
-	bias-pull-up;
+&sdmmc2_b4_od_pins_a {
+	pins2 {
+		/delete-property/ bias-disable;
+		bias-pull-up;
+	};
 };
 
 &sdmmc2 {
-- 
2.53.0

