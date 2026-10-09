Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1339233AD8C;
	Fri,  9 Oct 2026 20:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791578741; cv=none; b=QR6KL+AzWGvveMIdx0iWUAwfU+P8VTOA0U0OPdXVjUVdFaUZnyuixVoxVAoeejSx804/tlPCqGi+f4QGxfaaeLEA+HoW1uNKpv14MJemRgQLK3IY2MxeadJvxSvtYrTY4ZeEb7TAA587LhjkiZP5eTOBGxtGbaY8xmOhNmeSMyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791578741; c=relaxed/simple;
	bh=UQ+m+cX3b8a09KtNN9qmo839za4WugcpVesAEN25Y/A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oQV0sxME5T20ZJ0RVNBBCuhqTM48rYP10UAxaQ4uG2ZY/VrShJcU6/UgDCV02chQXyqkZXGdo9HrOsiVkthGJH/bXKyuzYZyqw9XyNaQMFoqm+L8h0MhCGxCI4Rp6AWYrSoJn4/fDHynjpbaCVMTIQrTgK4RrDKwV6qWNUqT17Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uIfcn0S/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uIfcn0S/"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1C5BC2BCF4;
	Fri,  9 Oct 2026 20:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791578740;
	bh=UQ+m+cX3b8a09KtNN9qmo839za4WugcpVesAEN25Y/A=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=uIfcn0S/gyXh8aiD0LzjZ7SHfIY00VHSQ26DRu093Va+lAlb2HxEGAH0advHSYeZS
	 C2zB0qqLp8sfcw5dfaQHG0dw7QZzSoyX1wwPhuoMBESeir+STIgWiPpO285zqnZWC8
	 +3w/Wa8c3oIASbqXxZFsr9tLSYCuwcLlr9+lFgaVK4DqWi+ep7IOWtAc4rYqpAhgwQ
	 l/aifk0mXZufOpHVbQFgvjERWoFY0oHCyV/OOAht5A68kTiUbzVH76+In1t1nSHbh1
	 7RjLZYznQRExeEgV+LekvLivD3Mkqto9PMZErkI6MkJuE2wgf1AFvauF9wkRau2pc9
	 zTHQJLak3qYkA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78F30CA601F;
	Fri,  9 Oct 2026 20:45:40 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Subject: [PATCH 0/2] Add the PCA9655E GPIO expander to Kobol Helios64
Date: Fri, 09 Oct 2026 20:45:35 +0000
Message-Id: <20261009-helios64-pca9655-v1-0-673ee4432650@iav.lv>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHBSyWoC/x3MQQqAIBBA0avErBswU8GuEi1kmnIgLBQikO6et
 HyL/ysUzsIFpq5C5luKnKlh6DugGNLOKGszaKXdoJTHyIecxRm8KHhnLY7emZF0oM2s0LIr8yb
 Pv5yX9/0AYNOxXWIAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1301; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=UQ+m+cX3b8a09KtNN9qmo839za4WugcpVesAEN25Y/A=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDFkng4q0jVm3fLHmSZ6XtP9CnjVPy+yV+xJmp7YomyX7c
 K63MV3fUcrCIMbFICumyDLhkMatjCVX//p7mD+AmcPKBDKEgYtTACbyq4bhf2RqyCKN1INvJcPa
 p96bwFmz2nXbDdZ4jpaJO8VVrye+SGBkWPb2ncVBz06jMyIs+9+uXLOr/v2SfVN9y6JW9TyNO9V
 5iwEA
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv

On Rosen's binding v2 Krzysztof quoted the "onnn,pca9655",
"nxp,pca9555" form [1]. This series documents that form and adds its
first user, the expander on Kobol Helios64. Patch 1 is for the GPIO
tree, patch 2 for the Rockchip tree; they only meet in dtbs_check.

6dfda7947653 ("ARM: dts: marvell: armada-388: use onnn,pca9655
compatible") in linux-next lists "onnn,pca9655" alone on Clearfog and
Helios4; with this binding they would need the fallback as well.

Tested on Helios64 (7.3-rc6 with this DTB): pca953x binds at 2-0020,
all 16 lines read as inputs, and the interrupt on GPIO0_B1 is
registered and stays quiet. Interrupt delivery is not tested: nothing
is connected to the P5 header.

[1] https://lore.kernel.org/r/20261009-venomous-carmine-locust-f788ca@quoll

---
Igor Velkov (2):
      dt-bindings: gpio: pca95xx: add onnn,pca9655 with nxp,pca9555 fallback
      arm64: dts: rockchip: Add the GPIO expander to Kobol Helios64

 .../devicetree/bindings/gpio/gpio-pca95xx.yaml       |  3 +++
 .../boot/dts/rockchip/rk3399-kobol-helios64.dts      | 20 ++++++++++++++++++++
 2 files changed, 23 insertions(+)
---
base-commit: 36b190eca882ecd39b5354f7ee995f939dc6d885
change-id: 20261009-helios64-pca9655-39643c2acf4d

Best regards,
-- 
Igor Velkov <iav@iav.lv>


