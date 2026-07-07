Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4901F30FF1D;
	Tue,  7 Jul 2026 21:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783459001; cv=none; b=B2kF1NRBxZYkfimXO6fypPdY8EZpWfJqxmK1j1GHDcjX+R1vTaPMItwBoMkXE/oxbut79MouiDvDmiqaGftQ8XL+qJyOiIfsoB75wrRWp1yrJg2yHs8A6FadEBtDhrez4C+NNf6hhEsy9ZdN+QNVQMRb/TzPg507uQdRGj6e4Po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783459001; c=relaxed/simple;
	bh=R5MYBkmg9DlEORfsOK2J6Cz+Av5R8RDX/POobqEtPto=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=R/JSd3FxGdiHakPE6SLYvakyV/iulW15lJqqsGRT3oPvU1lU1Vmz/T7UNQLXGczbjrvAEXM2bsizI11Zug4aNRHFmwTgA6KmZ/N+nrzeW9IsRTufw4cSKPmwt/WOK5D1oaNRq2vlkmTHIq/TFRK/pilel/b1ofzfsdWPq0J+CXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KhTR7fHk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KhTR7fHk"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD1CBC2BCB9;
	Tue,  7 Jul 2026 21:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1783459001;
	bh=R5MYBkmg9DlEORfsOK2J6Cz+Av5R8RDX/POobqEtPto=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=KhTR7fHkgiLKYaX9HeDBLFLXTkN3wSSKkz80Vqz3TrZWECQtE+EnD+SRR/f1WDCci
	 1eJaIXJlrip8ijyL+teGzMkHDUorbT/qghCQJjHI3nJOr/DbMHdi94KKJIdlP/UrWo
	 9emCSCkxV1n6USefTUxxHMf5eMEk6LnqLVNfHusUOxNweR058i8QhMDgGWVROVsej3
	 b45GjxWfvM1tTxnN+CufQrnV1m+gWFfiRtKqqGwoW024gSBwD9M1W5hrInk1lwfFOg
	 Ygt3fjYdbrq8im7EZkk2VFbCL3afz+EsFfkztbGJUbdyguSNrtFoLQh9NsFxD14acd
	 6ays9FrhcOjzw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B90B7C43458;
	Tue,  7 Jul 2026 21:16:40 +0000 (UTC)
From: Miao Wang via B4 Relay <devnull+shankerwangmiao.gmail.com@kernel.org>
Subject: [PATCH RFC v2 0/7] mfd: ls2kbmc: multiple fixes for this driver
Date: Wed, 08 Jul 2026 05:16:24 +0800
Message-Id: <20260708-ls2kbmc-mod-v2-0-2afdd1741766@gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKhsTWoC/1WNwQ6CMBBEf4Xs2ZplgSqeTEz8AK+GQykFNlBqW
 kM0hH+36c3jm8m82SAYzybAJdvAm5UDuyUCHTLQo1oGI7iLDIQkUZIUc6CptVpY14mKsM7rArF
 uCeLi5U3Pn2R7wuN+gyaGI4e389/0sOapSrITnv9kay5Q6KIs277qTK+K62AVz0ftLDT7vv8AY
 Qbd6qsAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2998;
 i=shankerwangmiao@gmail.com; s=20250715; h=from:subject:message-id;
 bh=R5MYBkmg9DlEORfsOK2J6Cz+Av5R8RDX/POobqEtPto=;
 b=owEBbQKS/ZANAwAKAbAx48p7/tluAcsmYgBqTWyrC82Pv8V+XNEbLed3/hBmNUQ1SUG+iKJoV
 c2qZ9CsunqJAjMEAAEKAB0WIQREqPWPgPJBxluezBOwMePKe/7ZbgUCak1sqwAKCRCwMePKe/7Z
 bmO6D/9/P/pbfxEimrdNKf34i2O+V5h5bPKE5p8lGK0luddjmI0bUBkW+hbhWQkH+a2MBDwU/PB
 Skj79VERiEarHKHldzXOkKmCGJQTLdIE7XVBDN5acORXyB3GXIB9d8xYFOMTO1HDRKbTPB9sbK9
 R6CIaWmshi04588GPS8Wp8cE9IgbnmabLRw0BNuBkaAu6y34GRGIxG7DmBHJy6DXi9Lw6MvlmTy
 HLEhQEps0ZNI9SFzUXT4MHw6Ot9jTc9S7SXtC6v2hx4x9eqn02eE0/iOrThmou52CWbtnelA8Im
 umDo4XGxx99hkmgSiIY68oNHAOta+6FiUxeng/IIKk7giL2ha+7UFyEu00IeEdFT3GC/5tr8DT9
 m0GW8a3PzIo36Hl5mFy9WjGxSsMJRXprytUNqQCvnAk0s/xHka1kLhZ8mRrmNYXQuLoyHOZfBg4
 /lFRuSmYVEAyyKeBxFiOSlh0VQ6a87VNEIuDqPf/mXzoX5ZY11GEPjXTEigIp+NvqXM063/lEOK
 hPnsSsQ2/BbZKlwyJlb+q7g3m5pUVliJsBBHeskcj/PWU3EwlSuv+3yWSEWRTEwe5YBLtyLJwHS
 ezvLfYA2s4zSpzOpB1dXae5dsAvdAf/aE320q7UBapGvUF0RDy+vGvRg1JNQ0D3NGrbn8ewSR/Y
 4bTxEZ4Oux0qtOw==
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
 drivers/mfd/ls2k-bmc-core.c | 237 ++++++++++++++++++++++++++++++++++----------
 3 files changed, 186 insertions(+), 55 deletions(-)
---
base-commit: 0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
change-id: 20260626-ls2kbmc-mod-5209193009b2

Best regards,
-- 
Miao Wang <shankerwangmiao@gmail.com>


