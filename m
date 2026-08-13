Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A3F43F8AC
	for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 08:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786608769; cv=none; b=JUqdVl8O4gDvw+FFRly9yqv9lFyr7hiqr96o6bU6ZD9iIky6iY5lhyDt7iehx95DvIOOAPb/UgeeQNp4X1byF7PgfdmrP9xSTADgJvukd8nggu1BTR38cIrbXL0OrjXT3OhdHUMi9zc+qXDb7LqU0IbDoeNodlwr+64DWJq8FXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786608769; c=relaxed/simple;
	bh=j78tQP3Ry7ZDf/iw+6gT/h6eKJgQpt3ZVFeRH258q4I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rVbsy+OGUgGkKRf+zcnYLSm/xqO+QkUyvS589jiCwpEJLteFgjsvo5l5vOTDTOq5Rt1dL2Pu+K9XFTZiBhTmHQMtdaxOY6mYRJ+D8KVcnNi515FLVzSL9MlqdaqNp/6zbe6jnv54qDQRxES1Yfx3tpWZldt1UElvC8ymqAuZhmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pAMl7Uew; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QEFA8kh+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pAMl7Uew";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QEFA8kh+"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67D5g1Ni628997
	for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 08:12:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=VsJZN+/WvSGMZN/zVgQbWo
	iDQtWHZJ9r2r0Zejpycak=; b=pAMl7UewqUIMl49TDJH7q2Q+2fo8owIqECb3ig
	QGjD+e+nahUciKK739ZV5VDeIG3onqk8/mq+VFaAAIXXSHetLPbJgMx/waKZ/J+1
	cuDBaKiFqvzc4Lr0/mxTyax8iFnveVBV6xL83B1ItFthVhq0HbGeiK/crWv9DkxC
	zup5V++ZWnI2P0ufa1jt5/lgvUDEvYQ02/st5pjLWJYUtAuX7SHOITte6qm4tBqO
	nsGKGvmDuzezjr052sRCBB8UZL4qoKnHbi7S2Ro+ffsyVGvIqKlfpMO6yIFrywPr
	AA1I6x76kEKj0O1/j56mJrcyYJwPki+30e+hIsBB1Zejtehw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0xsk2kc6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 08:12:40 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51bf321d786so28180501cf.1
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2026 01:12:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786608759; x=1787213559; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VsJZN+/WvSGMZN/zVgQbWoiDQtWHZJ9r2r0Zejpycak=;
        b=QEFA8kh+RnO21KA7wlkqPD4H3QQ21b+4GAxVRXNlAaYYBh9aYO1hJFOX80FQWp1M6c
         k1hHpW2VXVyD2ZZn2vAadEvuIkLXp7/lIF2GUNPZ3p3RawC7tDhBHMdhs92ZHldD9p6v
         xJmBxTsUhFLAz8WCF0xoNjjPhtL/KCgBapahfTRfUq/+lSRI6l/T/udVeJ6R2MYmsEmI
         K3colek8X5Q/bkAdZNmauUWNZjhgmW1Z7mg9IVIRJieVh8MfyNI2MvuOfCEAqaNRkvW2
         OIiwy+dOueoM8kxY2KWulBpM8I+dS3B0RrkY/Lblqq7O30FNSIJ5H9A7qzCnlVXrXYJG
         UJ5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786608759; x=1787213559;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VsJZN+/WvSGMZN/zVgQbWoiDQtWHZJ9r2r0Zejpycak=;
        b=Z8OCBGT1ae2/aqdNJD8v13vUUxxu6J0BXxpMOC2ZH9YVef1Uyllt0luuOtGhuQLS5r
         ZaOgnPsIzCnYxhtYlG3OrK3QgbPdoEsS3EsAV6BQ+s8iuKhKgQ1DqY9w7O30UF4tD5kM
         JpyXFe/OX8ZZ8kPxfmP13y1JxLqUonJqVlvwIPBVKKztRjRteUXcRX81bbY/7JrILBGC
         lixDfsTm1+QnpKv2eKa5ZxSa1qbrecDrYag3o7n+W2x4jx1iX1b20IvMnlO1ofC31k6d
         eUnUaGk6gH8fB0VghZdvHbgwI3MYe9F3J5m/Cn3yAK00uLRi4b3Bp8hKubT80DqHdfQZ
         JZTg==
X-Forwarded-Encrypted: i=1; AHgh+RpdNeeN7zXnAAX4nsUIeQ5ksBGpTgmHMcka8Ri/VJf2DmQ799eFG3RW2tMSze26eeK9rISvNsqoFqVH@vger.kernel.org
X-Gm-Message-State: AOJu0YyeQhYqUP6WdNSPO8hsP0Y3AptEUyh8L/tvTK8GDFcbERnu/sMr
	9qbWlBUkbnYJF5szN6XrsULAnJSMyEQejPaxEWVd/e35X/e4rIpfvF6YUKzUBmmq53pjUf2QR8c
	NudEoKZBkRp7jC2UfvIzZuDikeRq6DoK6U9LE5JpoS/QcE8H7UfSllbFtOvraP+i8tl0b7jBS
X-Gm-Gg: AR+sD13mPai430cEHaywDJZ36fQ7Ip6M9FflJC8iCta5G4j46j9KQXiG7YUCcoJrq1B
	xz4XJ0qYEPVAJtdJgG7mpMRsTVQzx44YRo1QRe2CZ2yGrsYECnyXKoW8wwtlbBf6pieqBcpmqx7
	GbnPTQ54efi+OZC+uB4jdzXIminG5SU3AiIjQuBlZfD4x4esVC3jRWKyafoHp7VJ4HsZu9+SwEg
	bnG27iv5pozQK022SwjG7tWvhBx0/jzfURpwnzH/NHagCNIlAQ3aJ7MDWFFj/KPup+ofKv3bsrm
	yvWo4KlDZTbiromUC/le6THA2KPP36nmKJB7nHaxWBVfTlvkxybXDXP/hr0sB207MOL+X1dIgUE
	SDGXj/yl64zC0XoNFjQaptK0FMwjspCmn8f4rWw==
X-Received: by 2002:a05:622a:44b:b0:528:3216:b802 with SMTP id d75a77b69052e-52d73c74050mr35928511cf.15.1786608759138;
        Thu, 13 Aug 2026 01:12:39 -0700 (PDT)
X-Received: by 2002:a05:622a:44b:b0:528:3216:b802 with SMTP id d75a77b69052e-52d73c74050mr35928231cf.15.1786608758519;
        Thu, 13 Aug 2026 01:12:38 -0700 (PDT)
Received: from localhost.localdomain ([2a01:cb1d:dc:7e00:4b5d:4abc:49d7:be98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499821652dbsm39124705e9.9.2026.08.13.01.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 01:12:37 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio updates for v7.3-rc1
Date: Thu, 13 Aug 2026 10:12:30 +0200
Message-ID: <20260813081231.8855-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: uec5jrMxyAvTda2DJMdu-k7C5z4aWkCx
X-Authority-Analysis: v=2.4 cv=M7J97Sws c=1 sm=1 tr=0 ts=6a7d7c78 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=sz1kGu09MtvieF5SN4cA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEzMDA1NiBTYWx0ZWRfX2pcHPtB4uRCj
 0rWYXgEz+4a+J2GG6XG7GoxqASuf8oG8NfR2ZCfsP2FhFEt0zlNIzLY19hfhwzsTkU4a45MBZIO
 WPHYfKnoBxFK7kqqtOTXXWeBhznW5qw=
X-Proofpoint-ORIG-GUID: uec5jrMxyAvTda2DJMdu-k7C5z4aWkCx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEzMDA1NiBTYWx0ZWRfX+N5oNtL+1Jd5
 8LDf3zNYXK+oZNTZaVElqJxacDJZKmVgcAJA5xa1RTYcNspGj0hsx3+nXUHWqCKk0KZeqepj6zc
 OuZ5NRGzge6trRRX6Y1Mawk9wANX6JfHm7S+xSadJVhH0xzUXOqmu6SOMjnzt60dSH/Ue5/4mq/
 d0naIDkiNPVYw2Q6pPz8KMhX5wpGIlGcL9jo98rqc1r890aGpS/0mWpslBc1ZhZHIB2nTVqLjGq
 SmABB+ZaBPd84pjCwNvkvN3A3NGSlmqD3pRtiw7J4IE2qmkpIrywn/7zBQhqqJ2TkLdrln1kj+S
 eepHWBOyO+/ckc8IqdClO/lIkDokpdUzncja9sYM/L6tj4fyeK6uHZ6Fs8lgoXP/KT4QI6F7UBN
 Ejwn97asVZQvjFr6VBmyHYhc2xBfJI9+mhgc1WQK+tIpvOkckPOW7MivvYR9WpfthwNkqiS4RLe
 Guh25GmDGPLFoKjUyTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-13_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 spamscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 suspectscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608130056

Linus,

I'm sending my pull-request earlier as I'll be mostly OoO until September.

There's one new driver for the Realtek DHC RTD1625 GPIO controller. If adding
it, reverting it and then adding it again raises your eyebrow: this was done
becuase the initial implementation - while correct - didn't use the gpio-regmap
abstraction that suited it nicely. The conversion was done after I had already
merged v7.2-rc2 into my tree so instead of rebasing, I went with a revert.

The merges you see - other than pulling in your upstream tags with conflicting
fixes - are for a PR from Arnd containing his work on further isolating legacy
GPIO APIs and the fw_devlink support for software nodes that will go upstream
via the driver core tree.

Nothing else really stands out, details are in the signed tag. Please consider
pulling.

Thanks,
Bartosz

The following changes since commit 8cdeaa50eae8dad34885515f62559ee83e7e8dda:

  Linux 7.2-rc2 (2026-07-05 14:44:06 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git gpio-updates-for-v7.3-rc1

for you to fetch changes up to 408866669ce01b8f2111afdea2c13d15a8960bff:

  gpio: gpio-by-pinctrl: Apply initial value in direction output wrapper (2026-08-11 16:08:01 +0200)

----------------------------------------------------------------
gpio updates for v7.3-rc1

GPIO core:
- extend the gpio-regmap abstraction layer with more features allowing users
  to override configuration setting, translate register values and masks and
  enable/disable interrupts
- extend GPIO kunit tests with suites verifying probe ordering by software
  node devlink support and software node hogs
- shrink GPIO kunit initialization code
- coding style updates (remove commas from sentinels where applicable)
- with all users now converted treewide to using real firmware node links for
  software node GPIO lookup: remove the deprecated label-matching mechanism
  from from GPIO core
- drop redundant return value check of nonseekable_open() in gpiolib-cdev
- use IRQ trigger helpers where applicable

Driver updates:
- refactor error paths and logging in gpio-nomadik
- use more modern interfaces for getting resources in gpio-rockchip,
  gpio-bt8xx and gpio-pca9570
- add missing MODULE_DEVICE_TABLE() to gpio-sifive and gpio-vf610
- drop unused FILONOFF macro from gpio-rcar
- extend build coverage of ioport GPIO drivers with COMPILE_TEST=y
- only enable the gpio-rtd driver by default with ARCH_REALTEK=y to avoid
  bloating the build
- refactor coding style in several drivers
- use correct endianess translation in gpio-pcf85x
- add wake-up interrupt support to gpio-mvebu
- apply initial value in direction output setter in gpio-by-pinctrl

Misc:
- replace linux/gpio.h inclusions treewide with linux/gpio/legacy.h which now
  exports all the deprecated APIs
- select GPIOLIB_LEGACY in Kconfig where required treewide
- use software nodes for gpio-keys in MFD drivers

Devicetree bindings:
- describe the realtek rtd1625 GPIO controller
- document new models for gpio-pca95xx and gpio-cadence
- document new property in gpio-rockchip

----------------------------------------------------------------
Alex Tran (1):
      gpio: gpio-by-pinctrl: Apply initial value in direction output wrapper

Andy Shevchenko (4):
      gpio: pcf857x: Use le16_to_cpu() and cpu_to_le16() in IO accessors
      gpio: regmap: Provide default IRQ resource request and release callbacks
      gpio: regmap: Apply default resource callbacks for regmap IRQ chip
      gpio: regmap: Order kernel-doc descriptions with the actual appearance

Arnd Bergmann (12):
      Input: soc_button_array - select CONFIG_GPIOLIB_LEGACY
      Input: gpio-keys: make legacy gpiolib optional
      sh: select legacy gpiolib interface
      x86/olpc: select GPIOLIB_LEGACY
      mips: replace linux/gpio.h inclusions
      sh: replace linux/gpio.h inclusions
      mfd: replace linux/gpio.h inclusions
      ASoC: replace linux/gpio.h inclusions
      pcmcia: replace linux/gpio.h inclusions
      phy: replace linux/gpio.h inclusions
      Input: matrix_keyboard - replace linux/gpio.h inclusion
      gpib: gpio: replace linux/gpio.h inclusion

Bartosz Golaszewski (12):
      Merge tag 'v7.2-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into gpio/for-next
      gpio: kunit: shrink initialization code
      gpio: kunit: add test cases for software node hogs
      Merge tag 'v7.2-rc2' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into gpio/for-next
      gpio: swnode: remove deprecated lookup mechanism
      kunit: provide a set of fwnode-oriented helpers
      software node: add fw_devlink support
      software node: add kunit tests for fw_devlink support
      MAINTAINERS: add myself as reviewer of software node support
      Merge tag 'swnode-7.3-rc1' of https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core into gpio/for-next
      gpio: kunit: add test cases verifying swnode devlink support
      Merge tag 'config-gpio-legacy-for-7.3' of https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground into gpio/for-next

Colin Ian King (1):
      gpio: bd72720: make read-only const arrays regs static

Dmitry Torokhov (4):
      gpio: amd-fch: switch to guard() notation
      gpiolib: remove trailing comma from sentinel in GPIO_LOOKUP_SINGLE
      mfd: rohm-bd71828: Use software nodes for gpio-keys
      mfd: rohm-bd718x7: Use software nodes for gpio-keys

Igor Putko (2):
      gpio: tb10x: use unsigned int instead of bare unsigned
      gpio: tb10x: remove unnecessary braces

Marco Scardovi (2):
      gpio: rockchip: use devm_platform_ioremap_resource() to map registers
      gpio: rockchip: use platform_get_irq() to retrieve interrupt

Marek Vasut (2):
      gpio: rcar: Drop unused FILONOFF macro
      dt-bindings: gpio: pca95xx: Document Kinetic KTS1622

Maulik Shah (1):
      gpio: Use IRQ trigger mask helpers

Pengpeng Hou (3):
      gpio: pca9570: Use I2C match data
      gpio: sifive: add missing MODULE_DEVICE_TABLE()
      gpio: vf610: add missing MODULE_DEVICE_TABLE()

Rosen Penev (3):
      gpio: mvebu: add wake-up interrupt support
      gpio: bt8xx: use devm_ioremap_resource()
      gpio: allow COMPILE_TEST for IOPORT drivers

Sergio Paracuellos (1):
      gpio: mt7621: unify naming style in driver code

Simon Glass (1):
      dt-bindings: gpio: rockchip,gpio-bank: Add rockchip,grf property

Swark Yang (1):
      dt-bindings: gpio: cdns: add Axiado AX3005 GPIO variant

Théo Lebrun (5):
      gpio: nomadik: convert nmk_gpio_populate_chip() to goto cleanup
      gpio: nomadik: add missing dev_err() call on chip populate failure
      gpio: nomadik: drop duplicate probe error line
      gpio: nomadik: use dev_err_probe()
      gpio: nomadik: drop "chip registered" log on probe success

Tzuyi Chang (3):
      dt-bindings: gpio: realtek: Add realtek,rtd1625-gpio
      gpio: realtek: Add driver for Realtek DHC RTD1625 SoC
      gpio: realtek: Add driver for Realtek DHC RTD1625 SoC

Wolfram Sang (1):
      gpio: sloppy-logic-analyzer: add a comment explaining the buffer init

Yu-Chun Lin (6):
      gpio: Replace "default y" with "default ARCH_REALTEK" in Kconfig
      Revert "gpio: realtek: Add driver for Realtek DHC RTD1625 SoC"
      gpio: regmap: Add gpio_regmap_operation to extend reg_mask_xlate callback
      gpio: regmap: Add value_xlate callback
      gpio: regmap: Add set_config callback
      gpio: regmap: Add IRQ enable/disable helpers

bui duc phuc (1):
      gpio: cdev: Drop redundant nonseekable_open() return check

 .../devicetree/bindings/gpio/cdns,gpio.yaml        |   7 +-
 .../devicetree/bindings/gpio/gpio-pca95xx.yaml     |   3 +
 .../bindings/gpio/realtek,rtd1625-gpio.yaml        |  71 +++
 .../bindings/gpio/rockchip,gpio-bank.yaml          |   7 +
 MAINTAINERS                                        |   2 +
 arch/mips/alchemy/board-xxs1500.c                  |   2 +-
 arch/mips/alchemy/devboards/db1000.c               |   2 +-
 arch/mips/alchemy/devboards/db1200.c               |   2 +-
 arch/mips/alchemy/devboards/db1550.c               |   2 +-
 arch/mips/bcm47xx/workarounds.c                    |   2 +-
 arch/mips/bcm63xx/boards/board_bcm963xx.c          |   1 +
 .../mips/include/asm/mach-bcm63xx/board_bcm963xx.h |   2 +-
 arch/sh/Kconfig                                    |   1 +
 arch/sh/boards/Kconfig                             |   8 +
 arch/sh/boards/board-magicpanelr2.c                |   2 +-
 arch/sh/boards/board-sh7757lcr.c                   |   2 +-
 arch/sh/boards/board-urquell.c                     |   2 +-
 arch/sh/boards/mach-ap325rxa/setup.c               |   2 +-
 arch/sh/boards/mach-ecovec24/setup.c               |   2 +-
 arch/sh/boards/mach-highlander/Kconfig             |   1 +
 arch/sh/boards/mach-highlander/pinmux-r7785rp.c    |   2 +-
 arch/sh/boards/mach-kfr2r09/lcd_wqvga.c            |   2 +-
 arch/sh/boards/mach-kfr2r09/setup.c                |   2 +-
 arch/sh/boards/mach-migor/lcd_qvga.c               |   2 +-
 arch/sh/boards/mach-migor/setup.c                  |   2 +-
 arch/sh/boards/mach-rsk/Kconfig                    |   3 +
 arch/sh/boards/mach-rsk/devices-rsk7269.c          |   1 -
 arch/sh/boards/mach-se/7724/setup.c                |   2 +-
 arch/sh/include/mach-common/mach/magicpanelr2.h    |   2 -
 arch/sh/kernel/cpu/sh4a/setup-shx3.c               |   2 +-
 arch/x86/Kconfig                                   |   1 +
 arch/x86/platform/olpc/olpc-xo1-sci.c              |   2 +-
 drivers/base/swnode.c                              |  79 +++
 drivers/base/test/Kconfig                          |   5 +
 drivers/base/test/Makefile                         |   2 +
 drivers/base/test/swnode-devlink-test.c            | 337 ++++++++++
 drivers/gpib/gpio/gpib_bitbang.c                   |   1 -
 drivers/gpio/Kconfig                               |  19 +-
 drivers/gpio/Makefile                              |   1 +
 drivers/gpio/gpio-104-idi-48.c                     |   7 +-
 drivers/gpio/gpio-amd-fch.c                        |  22 +-
 drivers/gpio/gpio-bd72720.c                        |  24 +-
 drivers/gpio/gpio-bt8xx.c                          |  21 +-
 drivers/gpio/gpio-by-pinctrl.c                     |  18 +-
 drivers/gpio/gpio-davinci.c                        |   8 +-
 drivers/gpio/gpio-i8255.c                          |   4 +-
 drivers/gpio/gpio-idio-16.c                        |   6 +-
 drivers/gpio/gpio-max7360.c                        |   8 +-
 drivers/gpio/gpio-mt7621.c                         |  42 +-
 drivers/gpio/gpio-mvebu.c                          |  44 +-
 drivers/gpio/gpio-mxs.c                            |   4 +-
 drivers/gpio/gpio-nomadik.c                        |  64 +-
 drivers/gpio/gpio-omap.c                           |   9 +-
 drivers/gpio/gpio-pca9570.c                        |   2 +-
 drivers/gpio/gpio-pcf857x.c                        |  13 +-
 drivers/gpio/gpio-pcie-idio-24.c                   |   6 +-
 drivers/gpio/gpio-pl061.c                          |   5 +-
 drivers/gpio/gpio-pxa.c                            |   2 +-
 drivers/gpio/gpio-rcar.c                           |   1 -
 drivers/gpio/gpio-rda.c                            |   4 +-
 drivers/gpio/gpio-regmap.c                         | 104 +++-
 drivers/gpio/gpio-rockchip.c                       |  16 +-
 drivers/gpio/gpio-rtd1625.c                        | 677 +++++++++++++++++++++
 drivers/gpio/gpio-sa1100.c                         |   2 +-
 drivers/gpio/gpio-sifive.c                         |   1 +
 drivers/gpio/gpio-sloppy-logic-analyzer.c          |   1 +
 drivers/gpio/gpio-sodaville.c                      |   2 +-
 drivers/gpio/gpio-stmpe.c                          |   2 +-
 drivers/gpio/gpio-tb10x.c                          |   5 +-
 drivers/gpio/gpio-tegra.c                          |   4 +-
 drivers/gpio/gpio-timberdale.c                     |   2 +-
 drivers/gpio/gpio-vf610.c                          |   1 +
 drivers/gpio/gpiolib-cdev.c                        |   9 +-
 drivers/gpio/gpiolib-kunit.c                       | 571 ++++++++++++++++-
 drivers/gpio/gpiolib-swnode.c                      |  23 +-
 drivers/iio/adc/ad7173.c                           |   8 +-
 drivers/iio/addac/stx104.c                         |   6 +-
 drivers/input/keyboard/gpio_keys.c                 |   7 +-
 drivers/input/keyboard/gpio_keys_polled.c          |   4 +-
 drivers/input/keyboard/matrix_keypad.c             |   1 -
 drivers/input/misc/Kconfig                         |   3 +
 drivers/input/misc/soc_button_array.c              |   1 -
 drivers/mfd/aat2870-core.c                         |   2 +-
 drivers/mfd/arizona-irq.c                          |   2 +-
 drivers/mfd/lp3943.c                               |   2 +-
 drivers/mfd/rohm-bd71828.c                         | 125 +++-
 drivers/mfd/rohm-bd718x7.c                         | 123 +++-
 drivers/mfd/sm501.c                                |   2 +-
 drivers/mfd/tps6105x.c                             |   2 +-
 drivers/mfd/tps65911-comparator.c                  |   2 +-
 drivers/mfd/wm8994-irq.c                           |   2 +-
 drivers/pcmcia/bcm63xx_pcmcia.c                    |   2 +-
 drivers/pcmcia/db1xxx_ss.c                         |   2 +-
 drivers/pcmcia/sa1100_h3600.c                      |   2 +-
 drivers/pcmcia/soc_common.c                        |   2 +-
 drivers/pcmcia/xxs1500_ss.c                        |   2 +-
 drivers/phy/broadcom/phy-bcm-ns2-usbdrd.c          |   1 -
 drivers/phy/rockchip/phy-rockchip-usbdp.c          |   2 +-
 drivers/phy/ti/phy-j721e-wiz.c                     |   1 -
 drivers/pinctrl/bcm/pinctrl-bcm63xx.c              |   1 +
 drivers/pinctrl/pinctrl-tps6594.c                  |   1 +
 include/kunit/fwnode.h                             |  29 +
 include/linux/gpio/machine.h                       |   2 +-
 include/linux/gpio/regmap.h                        |  73 ++-
 include/linux/gpio_keys.h                          |   2 +
 include/linux/mfd/lp3943.h                         |   2 +-
 include/linux/mfd/ti-lmu.h                         |   1 -
 include/linux/mfd/tps65910.h                       |   2 +-
 include/linux/mfd/ucb1x00.h                        |   2 +-
 lib/kunit/Makefile                                 |   1 +
 lib/kunit/fwnode.c                                 | 146 +++++
 sound/pci/Kconfig                                  |   1 +
 sound/pci/cs5535audio/cs5535audio_olpc.c           |   2 +-
 sound/soc/codecs/cs42l84.c                         |   1 -
 sound/soc/codecs/cx2072x.c                         |   2 +-
 sound/soc/codecs/dmic.c                            |   1 -
 116 files changed, 2532 insertions(+), 367 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/realtek,rtd1625-gpio.yaml
 create mode 100644 drivers/base/test/swnode-devlink-test.c
 create mode 100644 drivers/gpio/gpio-rtd1625.c
 create mode 100644 include/kunit/fwnode.h
 create mode 100644 lib/kunit/fwnode.c
