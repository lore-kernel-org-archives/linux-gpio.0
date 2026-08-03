Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F53A38E8A2;
	Mon,  3 Aug 2026 16:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785776206; cv=none; b=ijcNv3LfetgSdRG0G8iufI3lbwK8D+hA07p5B4KNJdHPu1mjIpa5Q7+HGjR8dW7OU4BscwE3uMdMEm6CE0sn19zLwfoknFyJ7PqoUPpNV4qsINC+o/7qUIANW0ZD2Z9qlrw1gs+zbcOx4qc7e6PeB0JnNT8BTTpPnugHQoUxrz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785776206; c=relaxed/simple;
	bh=00R75UySHqyvWDXRIcvJrzFhhNQlK+S8CJZvS9Em2ag=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bOU+K4hg1gwuPnDN6Y8uIODyMjKG5nCp8oLrh3nKVVnr/VGYxxXv45Dn8EYzaeUQM6eKY226WZavlBUT8TetFpivIrgkKC9zSOXYJD+wq9lBtdjXpfJTM5cXo5UNxJbv1LPR6hSHP11oo/5XAhtFGrF3UcB8uDUlPfmPEZhkJqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T7dc95Cx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T7dc95Cx"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A50EDC2BCF6;
	Mon,  3 Aug 2026 16:56:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785776205;
	bh=00R75UySHqyvWDXRIcvJrzFhhNQlK+S8CJZvS9Em2ag=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=T7dc95CxanoWO2CfNzOCth3zZfF97/HKiFGggiEs6D0UPs+bUGUbwds/HQeIMZkZk
	 zxODSOMdNRNtcgUqUZXdKAkfyoptd1bSfWeLR5pqfSsq/N277QCAbGU4iO/j/4PXuw
	 EBigXbc/poJaVxsQr8eMTkcBtm2FAxo98iSYtQcq+BVuh6+ffD5hs1NyEZPAzHD13C
	 g9geozrfYfdtab4XlJkn3UcP7UXNe45LfeXxG1q3Y3MkZEPPwAPlYmwru7AnBZ4p+A
	 Mcbtfb/oyob256TqstAudfsUKvAe4S6FRi/F/Xer0JtLQhWe8xkHXfyAm44DJv7Wqk
	 hU9FcU2RZy8og==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77693C55822;
	Mon,  3 Aug 2026 16:56:45 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Subject: [PATCH RFC v5 0/7] mfd: ls2kbmc: multiple fixes for this driver
Date: Tue, 04 Aug 2026 00:55:48 +0800
Message-Id: <20260804-ls2kbmc-mod-v5-0-e6bc5cdd9a93@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABTIcGoC/33NsY7CMAyA4VdBmcnJdtKkvQkJiQdgPd2QNg5ER
 ylqUAVCffeLMrUMjLb1/X6JxGPkJL43LzHyFFMcrnmothvRnd31xDL6PAsCMmDIyEuiv7bvZD9
 4WRE02CiApiWRxW3kEB+l9iOOh734zctzTPdhfJYPE5ZTiVmoV7EJJchOad2GynNwanfqXbx8d
 UNfOhN9sJQtueA9Wo3WmHerFhZhbVW2HCzWRhm2Nb9bvbAK11Zn6wmwAmodqWZp53n+B6W0kex
 fAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4070;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=00R75UySHqyvWDXRIcvJrzFhhNQlK+S8CJZvS9Em2ag=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqcMhBYc2vOUvOY/wHPTljdj2Ftxko+pcQLIy6H
 CcaU4QBqL6JAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCanDIQQAKCRCwMePKe/7Z
 bsXYD/9tG2QyBpwmX4FQAK664+oOveFBZxK4TleKwKKs1ZdbfDDzbrGEG/hSKpXIgSO0yxaIEHQ
 FWjg+G0W7fBSgPEDsyvkABrt9VwskjpJHQs+1zcxEqp7fDJcm2kl2djRtF8sLpgzCRKeMn+mXg6
 eAaSrJCTaw6nl4GR8co8AY2FSOlDRWf1Qmg/mAoCO/mUJ2FSE1A2y34fzAHAH0rGZtk6QeDR5Bb
 xmCVY95nqrTl/k4i+HW48IDI4OGOpY3SqKGOoWtTzvuCefUfZkWaitgw6FtQvt5ZsBZmpxTUrX6
 tmtoZZm7asCDDnmtBUMXyS+m64Ohf6OwoI+SqJf9NEsxdWt+f2k6COv53b41AUs2hD0vEAkyts8
 jySiF+NWd1slfqf69AJjbZkNknQU/V23pbdPaQ9A2rKc/vmpYod0m2cXpj1/xzcH7li7lUe2g3Z
 yQH49suD46/M9jBiEGgNP1oXqb211R6KfG3Rvhfwj3fPz0ap4wetSiMwrubQxeEIUtFX7IkbakQ
 khkx2/Y5eK5EZ/VM7hriQwC4L1cE2qM41/9JdgRsy5bLkfe/wqMB1JJpXVsQ4Ly3ULqKKt7Tqmi
 oEwDoLDWEluAMIYgMa4PUBwQmZYKxBtCFwr6745kREl0GitkB5Rb0zbHikq9uX1R4gDBcxYMjwT
 PwNGLA0sF0bKs0w==
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
      ipmi: ls2k: Relax the dependency to its mfd driver
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


