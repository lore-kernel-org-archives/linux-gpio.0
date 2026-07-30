Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F49397E9A;
	Thu, 30 Jul 2026 17:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785431015; cv=none; b=VeCt/u7Ev0LI0PPyT3SCKkqWutOzX4SG8+tjv27OjI9GYLM/JECWoIMSc1YxWkgyTGPPd68hE3LPgMUh/JwawcBeG6vaA9Y6ythcf9iMvJ1oCWkFpnkk3fFl3keYFSrnZM94E1pF7rGKn7O/upRp8dZuC3267e5HjZO7nlkC5oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785431015; c=relaxed/simple;
	bh=WxawCAjuivPPyNws7SgCgulDxwcEXKxjrImqvRJqI6s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sPZxc5xRDvQBUse0MZwQGy4x9Vklsax7mK2j2SfIcvEtBIv1E6oBotoeszjaRzaCaQRfYrIaf8Rea6cbOsftdwcggpynj3WjZYF+t9/vxGIytZss8cuYs5YOOV1eucO4MuJv39O4Hy9e+8a2+lPjvZt8XK+MI7HaioJqmQVVO2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=djr4h6Av; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="djr4h6Av"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A1A5DC19425;
	Thu, 30 Jul 2026 17:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785431014;
	bh=WxawCAjuivPPyNws7SgCgulDxwcEXKxjrImqvRJqI6s=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=djr4h6AvSaEqQ4pFBwW3A/cHCKrVrPSILAHDs5Prmx7UG94guIUp3Gs9J1VwtJQbr
	 2W0pprM7m/DssqO4vHOWiRSHPih57PFUam32S4LcSsoj2nld+MuY3wpOrFmZ+Y0Cpe
	 I5id+onkYvFfTHMUJlVkDE19Ipuol1TCKF8lVW2Hjtv45imhKjpLh6WP2iw98qPorU
	 2316JLJvdRO2p6yxVgwKqhVS/toiVtmfcS/1xwt8bERSfqGv221WsqDuODoEKJqgta
	 aakNguF97B6j/CsiyKSgdvsx0fIZP2ESxTa4op1UYSwi7vyn4PTFpWSErIC56WUGm8
	 dyRBuwR6xVJdw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E30EC55164;
	Thu, 30 Jul 2026 17:03:34 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Subject: [PATCH RFC v4 0/7] mfd: ls2kbmc: multiple fixes for this driver
Date: Fri, 31 Jul 2026 01:03:21 +0800
Message-Id: <20260731-ls2kbmc-mod-v4-0-d201502ba239@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANmDa2oC/33NvQ7CIBDA8VdpmMXAQaF1MjHxAVyNAy1HJfbDF
 NNomr67hKl1cLy7/P43k4Cjx0AO2UxGnHzwQx8HuctIfTd9g9TbOBNgoJgCRdsAj6qraTdYmgM
 reSkYKysgUTxHdP6daldyOZ/ILS7vPryG8ZM+TDydUkyzYhObOGW0FlJWLrfojDg2nfHtvh661
 Jngj4VowThruZZcK/VrxcpytrUiWnSaF0oo1AWu7bIsX0ocR8wjAQAA
X-Change-ID: 20260626-ls2kbmc-mod-5209193009b2
To: Binbin Zhou <zhoubinbin@loongson.cn>, 
 Chong Qiao <qiaochong@loongson.cn>, Lee Jones <lee@kernel.org>, 
 Huacai Chen <chenhuacai@kernel.org>, Corey Minyard <corey@minyard.net>, 
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Cc: Xi Ruoyao <xry111@xry111.site>, WANG Xuerui <kernel@xen0n.name>, 
 Yinbo Zhu <zhuyinbo@loongson.cn>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 mfd@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, openipmi-developer@lists.sourceforge.net, 
 Miao Wang <shankerwangmiao@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3576;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=WxawCAjuivPPyNws7SgCgulDxwcEXKxjrImqvRJqI6s=;
 b=owEBbAKT/ZANAwAKAbAx48p7/tluAcsmYgBqa4PbiKdxbCPI0BHtzwCLbIemEz6ovs+dhMzkU
 jEO+W3W67yJAjIEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCamuD2wAKCRCwMePKe/7Z
 boV9D/iHuNZoPW5CE3s2ZdoOKZWATOtShvTtmqG9El2r8eDKqOb4eyOW0BJQKzNJp2hHNWhtsVp
 VlZDgbfQWHje93QObdOh/YTO/d+VsagZk8K3sgqK5DvDlwlwBQfseIQzeZAEndc6xn4PZ4Vnsz2
 iUrIm9hYVcL9nmMzgQSUhOw8j6/dCe2WtMYun3JiTQ9j+U9b4o1Aks7xBSl+8HpkUpreStxaEtQ
 2jNp7PHBGaS9E5hf7iLxjyQNJQvZ+vWuhvijyz3rHIndmuq7SbsovKayFS/QuOZ/T7ewJhN0yt5
 Dppd22jtZeySF0fvL+N/mfPBke7Qyvaa8QmHo7aV7AeLzOCzWBx7yrSCmrwG0JUgHUf9A0ulpz2
 CahlTKQy9gxzgFl+3PYONu2WMIlJv80HHgsxdDguNPpmD3SxGllPeQmgvz7jGrOK3wKrQkmCLZr
 FFIpr2u9WGzVjJGtT6ZUmY5dHaSE9H0HHfToAeox/T01qTGqxB2i6uV3v/hQX6O4/OUTwJ17txy
 8Mb4Ck6/qthcGmq5Cx/1x80MBHHlGXYU4UZRgtf+BcyFzem+9HigfR3dsJW19ttnLAkzarJr5V/
 P8a0DA9mWxiUqJgClKgZ6S2rkQOJGHrHYpq5Ny91Zof7SWol4PQ9nxdSZxjgTYvaFpRbjn7ttYW
 CDGp95chr2y/p
X-Developer-Key: i=shankerwangmiao@gmail.com; a=openpgp;
 fpr=6FAEFF06B7D212A774C60BFDFA0D166D6632EF4A
X-Endpoint-Received: by B4 Relay for shankerwangmiao@gmail.com/20250715
 with auth_id=462
X-Original-From: Miao Wang <shankerwangmiao@gmail.com>
Reply-To: shankerwangmiao@gmail.com

Previously, the driver has been introduced to support the Loongson 2K
BMC running on the Loongson Servers, which is essential to prevent
the system from hanging when the BMC is being reset and the default
efi-framebuffer is being used. However, there are some drawbacks in the
driver.

Firstly, the driver tries to read and write to the connected PCI-E host
controller registers, assuming that the BMC is connected to LS7A PCI-E
host controller. This assumption should be true for real products, but
to prevent from accidentally reading and writing to the wrong PCI-E host
controller, this driver should be modified to check this before
accessing the registers.

Secondly, the driver uses non-exported functions to tell the vt
subsystem to redraw the screen, preventing the driver from being
compiling as a module. This can be fixed by using the exported
functions instead.

Thirdly, the driver directly accesses the GPIO controller registers
using hard-coded addresses, which might conflict with the loaded GPIO
controller driver for the same GPIO controller. This is fixed in this
series by using the GPIO subsystem APIs instead. However, legacy GPIO
APIs have to be used in this fixed to correctly request a GPIO
descriptor from the GPIO subsystem, which might be further discussed
to find a better solution.

Finally, there is a minor issue in the driver where it changes the
mode string describing the screen resolution during probing, which
prevents the device from being probed again if -EPROBE_DEFER is
returned by the probe function.

I have tested the changes in this series on a single-socket Loongson
3C6000 server with a Loongson 2K BMC, and the driver works as expected
when the corresponding GPIO driver is additionally loaded.

Signed-off-by: Miao Wang <shankerwangmiao@gmail.com>
---
Changes in v4:
- Use a better way to get the GPIO device fwnode.
- Add a comment to describe a problem found by AI bot which is actually
  intended.
- Link to v3: https://lore.kernel.org/r/20260710-ls2kbmc-mod-v3-0-ef718636e78e@gmail.com

Changes in v3:
- Check the return value of devm_add_action_or_reset when registering
  the cleanup hook of the work queue
- Use swnode to create the link between the device to the GPIO chip,
  and prevent borrowing the legacy GPIO APIs
- Link to v2: https://lore.kernel.org/r/20260708-ls2kbmc-mod-v2-0-2afdd1741766@gmail.com

Changes in v2:
- Several fixes suggested by the Sashiko AI review bot
- Add a cleanup function for the wq on removal of the device
- Relax the reverse dependency from CONFIG_IPMI_LS2K to
  CONFIG_MFD_LS2K_BMC_CORE to allow the driver to be built as a module
- Link to v1: https://lore.kernel.org/r/20260708-ls2kbmc-mod-v1-0-c344bf5defa3@gmail.com

---
Miao Wang (7):
      mfd: ls2kbmc: Make a copy when parsing mode string
      mfd: ls2kbmc: Sanity check for the connected pci port
      mfd: ls2kbmc: Redraw using exported functions
      mfd: ls2kbmc: Cancel the work queue on removal
      ipmi: ls2k: Relax the dependency to its mfd driver
      mfd: ls2kbmc: Able to be compiled as a module
      mfd: ls2kbmc: Capture the reset event of BMC through GPIO

 drivers/char/ipmi/Kconfig   |   2 +-
 drivers/mfd/Kconfig         |   2 +-
 drivers/mfd/ls2k-bmc-core.c | 240 ++++++++++++++++++++++++++++++++++----------
 3 files changed, 189 insertions(+), 55 deletions(-)
---
base-commit: 11028ab62899e4191e074ee364c712b77823a9c4
change-id: 20260626-ls2kbmc-mod-5209193009b2

Best regards,
-- 
Miao Wang <shankerwangmiao@gmail.com>


