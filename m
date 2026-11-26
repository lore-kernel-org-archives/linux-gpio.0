Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795700488;
	b=ZxPmnllozNfPQQ1gkNiT5hNl4Az73DJXOTapZ/fZS+QL2O5b8zRAmL/6ez31jrZ0mzoo
	 877rmO/uJmui7lLKeMRoViQqXk6LponGJr6zyTJgWVcSNZdmmVDlSseGfl7ROZSqbxgJo
	 vRwrMITOajJEafUmBL0tL4GqKXCS/KKyWt90Wyxq5AebtE0G7U+IOsy6lNP4vApYjtuko
	 s3KYDIgOI59ejGfv+RLuSxcZ+BK6OHztylL7HplG6VO9WfqSHjve84mjnUpLTpr6Jraud
	 DFPnbzfJBFhg54cu8sCXOFia5vpbESG/15MgLMyZJwIa+Vr2zzPU+PphusSFYmUUvtw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795700488;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=ExdFVZ6Sn5iSNtZ5KA27dxjqJvnys7ozPUcxSY/0d50=;
	b=Z17g/DJECrYuKvX21q/Oi8n4V3cj9YOUztIKeCTz9r63y8RRFqaulhcglIyRKIZv8CeC
	 lzeFg+TWcuIwnEEWv1AyvbA1AbZyD8TwC32uR/TBX2/qXOT06yXUN90QmcxTYxJOdmlK4
	 q+OzBe3EmLiqdZhwklLxDOrvqMxpH//WENdjloHCAwc2mmypeQhrU3UM6E4I2JWxvwqDC
	 dinQvN3F+BTvhi58pBQgu0bMnA6T1W/qHxk2MN6e08UH7LaWuQBhSVpZYV7snc1VyJFTE
	 RuTnlsJVQWOv8mdjvDbg33diMJxOw1lTJLFKOTShr6tFjKLMIIaBPdH9nsRKZ6de6gg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R0JpB2DJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606A9606A334;
	Thu, 26 Nov 2026 13:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=R0JpB2DJ
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795700487;
	b=yCWixU4gjY7xRX61s7iWdXv4eOG790XAyRgY9hCpf8ViastqSBdhd3tASYXjpgP0Sguf
	 mZRCE/TxlPEgUZnczKepUABLbuHAincDIJSFtgQGPzzCux3g3WBfYBGQ08hpSVAOll4BP
	 C8qy0kDFLSjRD6EXYu8JMi+MXuTjIi3VCJcuNHzbejqwXsvhgiQdObhFpcljlJjM5FqCP
	 izywVUXO0XZMVm6sLXWK710o+iKNUpq51oUKQj6FZiBxAMcEAUlfrR3KvL4o2WF8P1MEX
	 ULzV7LIH3dpM75KAE4fBZkA7iPuCt0rw3zkHj/uqJaBsuESrRfNSa5Z89AJnQYVnp5A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795700487;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=ExdFVZ6Sn5iSNtZ5KA27dxjqJvnys7ozPUcxSY/0d50=;
	b=HQ2y0bJcDnjewg5UnGS0oahmjRSIOzow/hKZlwMKXv8PkxBf93xDYtNFyARWzH82Mcum
	 0edmariyaOcRArApUrManczxDX63cMl/mZH+6jEfAXnVmpi0dxhYeR8Anusfuop2zKPx+
	 cEnS5nFknIOfnTRMwGHOzrPK+hr7mey7yfWCHBwMPOMLtWVu1xlu/fgGZFHMlaBitfH2j
	 W89ul6Ya3rO8PNWZXJUHjANswWaZQZH6G+8QheB/G9DT7YPJVo8dIqYv0tjuX5cLnF6op
	 4gZbpS3Zqwrcm/v2ybC6GflE/mjY5JHSTHWcI3KBWcgosj7C9mdKFxdbEdeRzALMDgQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 774B51F000D1;
	Thu, 26 Nov 2026 13:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795700487;
	bh=ExdFVZ6Sn5iSNtZ5KA27dxjqJvnys7ozPUcxSY/0d50=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=R0JpB2DJK+MpkdBk5BQMfOMHF//+LR+8KqvbMDR95/Ec0cTvEW0+2ZHVyVOsYzpR5
	 Msdi7qISH7aNo78ayni7KHrxtFHSEMDCrDAmFAzwK6//N4yvl1X+BNoDMMiCyZPv8C
	 z+ebg2v978e8ybe4mMy4BchbM7KARpsrw+MmJ09ZR3TLdLbfnq9wD1NVTzYM89Lt6w
	 ZSGBIZOSYyCHHM29es9xe8w0MQJuckoUkqSxMBRSgV164/0Yijo0v4dfIFmLItdJrx
	 BKReC/dhA5Azzrt+Dc6NhswuFQqsnoyvxmZq5BcSZ0Oo+/BZ6UywnRCrL7BgsPMrTo
	 ckI8fuSvDLrVA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0D3E04D54E;
	Thu, 26 Nov 2026 13:41:12 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Subject: [PATCH v2 0/4] pinctrl: sunxi: add support for the Allwinner V861
Date: Thu, 26 Nov 2026 21:41:08 +0800
Message-Id: <20261126-v861-pinctrl-v2-0-b1875a6a9bb8@iscas.ac.cn>
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Post: <mailto:linux-gpio@vger.kernel.org>
List-Help: <mailto:linux-gpio+help@vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-gpio+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQoCIRCA4VeROSc0I7jSq8Qe0sZ2Ikx0dwnEd
 8+243f4/waVi3CFi2pQeJcq7zRAJwVhuaUHa7kPA53JIpLVu7Oos6SwlpeOHl0k4yeDDCPJhaN
 8jt11/rtu/slh/T2g9y83ktIKcAAAAA==
X-Change-ID: 20261126-v861-pinctrl-fb18f23b731e
To: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Andre Przywara <andre.przywara@arm.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>, 
 Conor Dooley <conor.dooley@microchip.com>, Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795700469; l=1472;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=eQg1XPgM2OUF72cwOEwxs7jhBGy/qujAowmthq93fXs=;
 b=X2szDkYSIx12c7mpXlHG6VMgajFYM7aYhV70XDJf4UwJY+iyEn/kAIFYrjmi9qMV+u5Rq7Kha
 ZpbZtcqIjuGDRgRfDoJAqejLizBGcpNfcSe/5WNVhCDYyD8ZhkNpRZA
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
Reply-To: gaohan@iscas.ac.cn

Add the pin controller bindings and drivers for the Allwinner V861.

The vendor BSP code used as reference:
https://github.com/RevySR/linux/commit/bb06380bc2e5a02049cd01e0b10cb3c3c694b750

---
Changes in v2:
- Split out of the V861 series (Linus Walleij)
- Binding: explain the lowered minimums and keep the A523 and A733
  debounce limits (Conor)
- Drivers: drop mod_devicetable.h and fix the match table style (Uwe)
- Link the vendor BSP code (Jernej)
- Link to v1: https://lore.kernel.org/r/20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn

---
Han Gao (4):
      dt-bindings: pinctrl: add the Allwinner V861 pin controllers
      pinctrl: sunxi: allow a per-controller IRQ register base
      pinctrl: sunxi: add support for the Allwinner V861 PIO
      pinctrl: sunxi: add support for the Allwinner V861 R-PIO

 .../pinctrl/allwinner,sun55i-a523-pinctrl.yaml     | 36 ++++++++++++++--
 drivers/pinctrl/sunxi/Kconfig                      | 20 +++++++++
 drivers/pinctrl/sunxi/Makefile                     |  2 +
 drivers/pinctrl/sunxi/pinctrl-sun252i-v861-r.c     | 47 +++++++++++++++++++++
 drivers/pinctrl/sunxi/pinctrl-sun252i-v861.c       | 48 ++++++++++++++++++++++
 drivers/pinctrl/sunxi/pinctrl-sunxi.h              |  7 +++-
 6 files changed, 156 insertions(+), 4 deletions(-)
---
base-commit: b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
change-id: 20261126-v861-pinctrl-fb18f23b731e

Best regards,
--  
Han Gao <gaohan@iscas.ac.cn>


