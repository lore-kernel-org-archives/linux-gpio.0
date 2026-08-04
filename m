Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC313F3279;
	Tue,  4 Aug 2026 19:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785870874; cv=none; b=XEptBH5Zvw65NTdGTRNJeDFOxjfbN7grrvpggP5L24Bl/OeszqRnLVHbquKTS0W1DPxNl2HbFTB2mDcbcVMAnxLKKwTYCPIhR2mmYs4xpmBzXVy0zuyJpU4iUKxZBQekrw1IpWw90PxbIfU7Ev3Sx2F/TMdyCGqrRkJp8iHcj8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785870874; c=relaxed/simple;
	bh=rOBZkQC7afZVrDwE7RAnfsnnkEpeAGfHPwHw71PvBcc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Qr0LmEZ7AJqYPuux4NFWxwx/gKbHPdlFDwEKkMzAjVZrJOKhoexkIwyNa33MU0EqpRoT4LCvmTGb5DQZWQnkfYHPIqQbrFIDhrHbPhaIuiplS3w9CORYj8yzpPaGq9en9Kzj2SSf6jAxF8OG3iQon4tCPW8DPAXZrSXKREqqhKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YKiNf5N6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YKiNf5N6"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 238FBC2BCF4;
	Tue,  4 Aug 2026 19:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785870874;
	bh=rOBZkQC7afZVrDwE7RAnfsnnkEpeAGfHPwHw71PvBcc=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=YKiNf5N6qEHvDMpd+KTHaY9cQya+H5o4aGQH4VuSNQkMs7Q3sPffvQWBnC9HoRnsV
	 a7At3fSEHdYFximV5RT6IaAur9WJfx2V1JI7ZcVGUca2EpZDV7twgXAYy5/QoM+sLA
	 ZN+021+nANM31OARC/t9IXW0OwdDi+xeLd0yzeBDci8SbYU7t56NyWhlyrts6akfzd
	 tZnHYZ4qKt6UesV1yfTqKV74gwTbyXD62VHN9yIW+HZ4gj+t8IV2fpQ9gMC+zT7VQL
	 3GlTfwf3+zzpTreDE8m7y+ZlVThG18dWb7iVjR0lTPeeR1LlFjAGsr8njvogaE2rFz
	 WQAACGWKzn+Iw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2ABDC55ABA;
	Tue,  4 Aug 2026 19:14:33 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Subject: [PATCH RFC v6 0/7] mfd: ls2kbmc: multiple fixes for this driver
Date: Wed, 05 Aug 2026 03:14:18 +0800
Message-Id: <20260805-ls2kbmc-mod-v6-0-16ccde412d86@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAo6cmoC/33Pu2oDMRAF0F8xqiMzGr1WqQKBfEDakEJPW8TrD
 auwJJj9d8tqbG2R8s5w7jAXUuKcYyHPuwuZ45JLns41qKcd8Ud7PkSaQ80EARUoVPRU8MuNno5
 ToBLBMMMBjENSxfccU/5tbR/k/e2VfNbhMZefaf5rFxbWVq1Mw9CVLYwC9VwIl2SIyfKXw2jza
 e+nsfUs+I/FatGmEJgWTCu1tfzBMugtrzYmzQbFVdRD3FrxYDnrrag2IDAJ6Cxys7XybgcQvZW
 3u8p56UMw1nT/rut6BfLM87GbAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4336;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=rOBZkQC7afZVrDwE7RAnfsnnkEpeAGfHPwHw71PvBcc=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqcjoNgbhAHQJbK2zv2h/dm7JFPCBYXkmvgY4eR
 0haGHjn5M6JAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCanI6DQAKCRCwMePKe/7Z
 bjq4D/94w6QLi1LdKnHO9bsJAMynykfFuds1pYOIJpOZr1XYk8DGXklhzrP9LyS/5D/RHD75fvd
 BArUMA6TaN9Vy7zVDgyHfM+EH0f0qzxe7iifbChDl2o7Xzd82URVrXCcWkoWgUU8PxZVNBc6wZa
 nAAvpLlUTsYfvAPqRPfQ6pC5K12cmVxdYHiDw3eQqhwWQG2+gMtEXaDvzkY1Kl7wqFwAtGJZSBQ
 kCeV2PwHVJZk9fXENIicFssq2/LvrfvGSqyra9wj5pxrwkA+MvUEnH/SynEF7/pwhNpqe1WmiH+
 Jw44jLIOLz2DhbAR3EruFFoiVZZ89YWod30yNbUU53AB37NXM1VrVI9xy+j0M8had0fIpkWxqPO
 NimuqzRUvawJv2eQE9nTc8dsrw87yY6bfq2DB/Ifazxvk+4NLyywlVwQWUg3ssCaHfMSFH4A5Dr
 ask9Dh+wBYR4Fga28yBAO69u/FBTHouf6/n0A9k+BuyPHtqR6lD4vL5gK5ZCv62/1k9rh8a8S17
 OXi6+UJuLUQ0ByDvcR0e9P2Tp9Ujv/kBkE1Ujz/tDOq+NIz1eI5V+jh7N9Rscmch5hXFs/E3kuz
 8Um2k+YRDVvGnaYvmUgUnh5u4mB0Sj7iqZ9GrvhGE9CsuKzX8J+aGKtMhgw5caZWKIkOT5cy/XK
 BRwCgnrJfxmHFng==
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
Changes in v6:
- Ajdust the Kconfig entry for IPMI_LS2K, moving the dependency on
  MFD_LS2K_BMC_CORE to the IPMI_SI Kconfig entry, as discussed with
  and agreed by Corey.
- Link to v5: https://lore.kernel.org/r/20260804-ls2kbmc-mod-v5-0-e6bc5cdd9a93@gmail.com

Changes in v5:
- Address issues found by the Sashiko AI review bot
  - Maintain the compatibility with possible unexpected mode string when
    parsing, although such mode string is actually not expected, to
    satisfy the AI bot's concern.
  - Add a comment to point out that the adjustment of the Kconfig entry
    for ls2kbmc is in the following patch, to satisfy the AI bot's
    concern.
- Link to v4: https://lore.kernel.org/r/20260731-ls2kbmc-mod-v4-0-d201502ba239@gmail.com

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
      ipmi: ls2k: adjust dependency to its mfd driver
      mfd: ls2kbmc: Able to be compiled as a module
      mfd: ls2kbmc: Capture the reset event of BMC through GPIO

 drivers/char/ipmi/Kconfig   |   2 +-
 drivers/mfd/Kconfig         |   2 +-
 drivers/mfd/ls2k-bmc-core.c | 246 ++++++++++++++++++++++++++++++++++----------
 3 files changed, 192 insertions(+), 58 deletions(-)
---
base-commit: 11028ab62899e4191e074ee364c712b77823a9c4
change-id: 20260626-ls2kbmc-mod-5209193009b2

Best regards,
-- 
Miao Wang <shankerwangmiao@gmail.com>


