Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1341B371072;
	Fri,  9 Oct 2026 20:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791578741; cv=none; b=KUlSrCM0f+NrR1kNOr5oiQesnUXciJPN1OmCMKlkJSKrwvd0EQ+fx2/lJd042iqIBSjRrW5HITgOPoSz/mIgFj7zQAHxqiq9UU+566P7xYZKJBtgg9+jBmQFrVKdJY+rRwxySSr8BDMe1f/Jvctg+7A2aR7MljCbAKON4ESgeRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791578741; c=relaxed/simple;
	bh=vpQiuBK6+oVU+3H9fHMnAa4/lvYSw1L26uvgbFaz1gA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WpO1AYmTHyNpUztjr28l5Q0KY2bGCqFWw/beYtQ0Bay/OAjRLRKUYOCk1S5g1fKA+N52VMfAU6pRzYXwBmEO5tPn524i5BFJgAeIE7U4q1S+Go6S0wclNIO+aBOyxyXpOh5uNTzM/+aZ9z9FbWtq7D4IX5VFNjDdx84rtYFUPmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GLpY+EZf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GLpY+EZf"
Received: by smtp.kernel.org (Postfix) with ESMTPS id ADC62C2BCFB;
	Fri,  9 Oct 2026 20:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791578740;
	bh=vpQiuBK6+oVU+3H9fHMnAa4/lvYSw1L26uvgbFaz1gA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=GLpY+EZf/jbS0oXCHZw6BuVOxSt4cv5EDMGUu6tFw7e3o1agLJpuPdSgSU7RTM+kJ
	 W/j8o4joj58zWaUC7AM/vUO+nDBnXeWxPlGDuf9/+CwVNcFGKknPls+WgHRmP9vSBt
	 3g96IsaqTK5qvVFNJg0FSYwUZgWb13q66ehfuWGhFRgPUhgiNtpBcYYqWgjZecUquW
	 Zkr8KwP+hEybG1xJiQNfVt8P/0FQvW+YqaGxgRgxqUmuAEFFXvZoZrIwG2XCGdt6/m
	 BEhrvizZXo2W2u4/2EnpgjFxYsEwr72hIa61/BwCxfNsoXblhiJSzcCYbvzFphPWuv
	 qZ35URoZIf6XA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A63BCA601E;
	Fri,  9 Oct 2026 20:45:40 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Fri, 09 Oct 2026 20:45:36 +0000
Subject: [PATCH 1/2] dt-bindings: gpio: pca95xx: add onnn,pca9655 with
 nxp,pca9555 fallback
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261009-helios64-pca9655-v1-1-673ee4432650@iav.lv>
References: <20261009-helios64-pca9655-v1-0-673ee4432650@iav.lv>
In-Reply-To: <20261009-helios64-pca9655-v1-0-673ee4432650@iav.lv>
To: Linus Walleij <linusw@kernel.org>, 
 Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Rosen Penev <rosenp@gmail.com>, 
 Gregory Clement <gregory.clement@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1279; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=hwPZSPeRdIPJzNMdM23subxRzNUtRq7wz0V1xH0yzjg=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFkng4q0mR+f+lNWWPY86ViKmaPPXsN/ryL4bzfHMdXL8
 bzzDr3dUcrCIMbFICumyDLhkMatjCVX//p7mD+AmcPKBDKEgYtTACby4CEjw3v3veEsqge9IxZu
 n6A/fd2/fzerWBRt2Z70hl/btj64cT8jQ6vZ+10TDlxxX3IrKax844VsZacev0C//51+7zjXJP1
 W4wQA
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv

From: Igor Velkov <iav@iav.lv>

The ON Semiconductor PCA9655E is a 16-bit I2C GPIO expander that the
pca953x driver handles as a PCA9555: both entries of its OF match
table carry OF_953X(16, PCA_INT), and onnn,pca9655 has been there since
commit 6d49b3a0f351 ("gpio: pca953x: Add support for the On Semi
pca9655"). Document it with nxp,pca9555 as the fallback, the form the
comments in armada-388-clearfog.dtsi and armada-388-helios4.dts ask
for. The I2C core tries OF matching first, so the fallback form
probes; tested on Helios64, the first user.

Assisted-by: LLM
Signed-off-by: Igor Velkov <iav@iav.lv>
---
 Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
index 4631388a7d91..d671aaf83bb7 100644
--- a/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
+++ b/Documentation/devicetree/bindings/gpio/gpio-pca95xx.yaml
@@ -25,6 +25,9 @@ properties:
       - items:
           - const: kinetic,kts1622
           - const: ti,tcal6416
+      - items:
+          - const: onnn,pca9655
+          - const: nxp,pca9555
       - items:
           - enum:
               - exar,xra1202

-- 
2.43.0


