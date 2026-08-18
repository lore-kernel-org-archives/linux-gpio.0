Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EF6472520
	for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2026 12:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787056356; cv=none; b=ruS8vvqo1fjojfnBGzskmFwICLyEqTEL4cXuWzDWe6lxj24HLl6hV82HkigJP0kj7fVtgZaOL46pKKfAqJeecBzzaXj8xgkdQhm4LOryJxnrLt7iMD+CpmteuOfOoWIOZcjjR51eKtilO2+Jgb+ak9EDCvChqjA5w7xY+Nu2QUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787056356; c=relaxed/simple;
	bh=H9/lSITYSOgRO2jrcu59y2dJFs8PaMHRrNmBDZ1JjU8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Oz7pG9lUvTSc3isBJyRbWDTIMrDvNmjGLUs1D0F8kzpdh09gHa4ek0c4CfouTx/ZOIqIBPKlS9au6dmXrfjAWfUFDmMjOjE+qzi7cc5b0iBjEh9kuUOBITcL79Xgp6wgriIinWBKuqBMotcWQiP3KB0XcSNStF0XNApJ4qZ0u/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pCfNulnG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ITTY3wAd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pCfNulnG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ITTY3wAd"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABWhD1544848
	for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2026 12:32:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Nd6OjVsHZAfCBukiozJU4V
	RBPA75ayuLxcjR0ZrF24I=; b=pCfNulnGoz6JwcyXJ5Eh7j6wQbdgjSz8UMq8DP
	Id40O3JhYqSOBAtW4GQg75bzIr7RvIRIp8G+bnZV7VUav+IsQpZt2MNOU5ALGFki
	t/JFI1YEjD9uVljDt+TZLDC2ncbPe5VSwZPWbuKbDUhIbsBwloda5M197y+zcEHM
	d6I/8S4G4g2nJGDQ1dWv6KvssenD0O2D5P69TbR+zcGkY6zw3aynv+QovZKbAr1K
	Z9Ae4U/A1Ue98yTDODoNtdwK7liP9IhN36wSCAXjnBVLX0sJV/6dPUir7NULdSrj
	ALNZDOPMSh5JDoUbQ6eb2HBRXY+J5dp9SWSsXu13cMS8bSJA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4dcn2mfb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2026 12:32:30 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e5e38fbc5so501339585a.2
        for <linux-gpio@vger.kernel.org>; Tue, 18 Aug 2026 05:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787056349; x=1787661149; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nd6OjVsHZAfCBukiozJU4VRBPA75ayuLxcjR0ZrF24I=;
        b=ITTY3wAdIBYiLEtfwOpMAIRI2a8A2ivZRk86rRW29KIM/ZNaPW+faeg2FgejBh/CPX
         bhacf10srWFeWe4v2Dz1el7zPVY1BvzDk1iBvoefNMn3EtdJw6VPjkf7AC8BsUIrNyeA
         MJRu6aaOZ/IhgcqcUEH2tB3N6y+4q7pUnzyAq8Id7iR2/fTpZv/5oWqvmdu/+bAA32z+
         Vo/bDn4HmN3i+NPuHCK8kqo38sxH0WGjPbXbik9SHIggtkjLhcfP+RRF8X/Ko9kmcnUR
         jpEp0yJ/LCvITJll+l7f/bjF96OZdy7StP8VNY12CHu1CZe6+3EWuZAfKTzm1EnTY/tP
         nCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787056349; x=1787661149;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nd6OjVsHZAfCBukiozJU4VRBPA75ayuLxcjR0ZrF24I=;
        b=VA1tD+diIwkkEH7HFbIdC/y0pDtfCfTvTdqXOwb4S4WTCd+ScYyS+P8dPz7uUS1vZ6
         eIQwNRAoQXt03/hyXtmcZM2ugujEcryHtKWuQBkmbtrJ1Sbk1OGdL1UOX+3woGtkxVfi
         6O2xOI80mnXtILOJP917rxujDwo129slgk8QJ0MVdV2nC+w6260KOSiTDY0y/UEnGOVH
         u/JB63dfZVDd16O6kDWQ2+smsNr7o4Agw2y0dqUfYmZtH/c040X7uL3m1hRpWLRPXUto
         6kKJZ1o1r3sH3gUR5+C8liPl2B3fSIPcQkjq8WeLWmnjPDM10E/6xAAAKKjnpkc9A1np
         6PcQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro8sXbBIsO9w9jL9XJABZOKVgjxsvVFqCmsDPZ/7DosOt495N6iJkpi4dbzuwnnXkg8tcpSCVv7nQ/b@vger.kernel.org
X-Gm-Message-State: AOJu0YxkXSKFPMqewV+f9fveqQ6NjCR4LeEP5GIzYREZXHL73RH3rFoT
	MsFWrjPQF/RnH/muKvDiN7w/AlqI7iZnnVjjQ4tX32ovKhysk3FPQ7EJhN32i18jjpQxEnBsWnA
	sQ0vY5DkBfmK1StWsangf/KPLspEX9WVtZi3rXAPefqnJ6Zr+gzfg5N9DLq6s+92k
X-Gm-Gg: AR+sD11LrSEj3YDPUJkgX4wsGoh8EtHoyEascs2xVre4TcNeGwaylpkvEtMPGpcqiXR
	xpAZC+WYuS1T3iCKefI7KtKu2QJmP+CXzpp1yCNvisY+Urjk/0VyoQiSVaZEF/QGRIfx813ShaK
	JE5j7qRHYpCZw7bsQQ48yZy3KKZPfGVkbN8x1/0rLEMuw70aCDncHPktj+onvKvn/Ss30/kjP2p
	9f9CvV6vb0Q/1K/V87Lwl3cD6oFJ69QoUt2y5AfgXftheHwDBZv+f9TfCReBSmd73uZsqwnX8MG
	gCY469m+mmKrA4hhtVezOhbetdtgnxWJwdQi2/N6Dew6eV5KuB5Awji24vMUg6UyBNHqH+NruE1
	+a3x9CKElmEByKXzM7eP2KDSleeay
X-Received: by 2002:a05:620a:460a:b0:92e:5612:ba3a with SMTP id af79cd13be357-93704b04656mr625083185a.17.1787056348858;
        Tue, 18 Aug 2026 05:32:28 -0700 (PDT)
X-Received: by 2002:a05:620a:460a:b0:92e:5612:ba3a with SMTP id af79cd13be357-93704b04656mr625075385a.17.1787056348271;
        Tue, 18 Aug 2026 05:32:28 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:1d51:97e0:b2c1:5248])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a41ddc79sm27235425e9.4.2026.08.18.05.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 05:32:27 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio updates for v7.3-rc1 - take 2
Date: Tue, 18 Aug 2026 14:32:20 +0200
Message-ID: <20260818123221.61651-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: P-wK9PgQkfTqlwXm76543xOtTAYJlyhh
X-Authority-Analysis: v=2.4 cv=Gs5yPE1C c=1 sm=1 tr=0 ts=6a8450de cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=sz1kGu09MtvieF5SN4cA:9 a=h5VJNELYul4ZV2MX:21 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: P-wK9PgQkfTqlwXm76543xOtTAYJlyhh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA5MiBTYWx0ZWRfX1D7SXmnIV66e
 wZbVLjtSz86SUA1sly7Ha3Pc+VIlLXJ8/54kWxUu/RJrLzs0J1iwGESyadYGuHKCHYi3E586g9q
 brDIeq5O77RUtEf8cu7LCMT5km1QzW4YYqcx/d3MyIUsDG83X6YNQ0WWl8W2aBmzu3YjVaCZ72a
 n30jRapNiDHl0gxCGCVBONEDiftH0b6uMngod2vkuAWztc8uOXdJqduxB98Amnu9zyswP91XAXC
 TB/IHeWApnLhVGLIESsjRd9AL3GZpq4gBi62lLtDmHH72Ls55vb82Dz40+luBy6SgoJGbdtoD9b
 OrcswuzpmwJrMELTzSQn63s5ogaZsqTdFLpzh+1NPWrugYzNZkPIPbmM4L5gpmSuB4T1K2oGHQU
 LNFdsSFeUn/AVK0FlixBMr7/K6ZELL3U4TVO99hRhRd6a3wrNhk3pNkpGdRLOUWJC15gq5mxMi6
 VM9Cu1jpwIoiYXVzk9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA5MiBTYWx0ZWRfXwv2R3HNWJoFN
 2lRqlk2DTI2P1K3V4Tp6Rs7M8EOZb7OBDesMCSQpdjt0DW9ESNLM3rkzzeF8e44/zP5qZoGGHlI
 FzLPufSzz4b4IKT8DiNMK/YbIFM6J5M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 priorityscore=1501 clxscore=1015 suspectscore=0
 phishscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180092

Linus,

This is the fixed version of the primary PR from the GPIO tree for this merge
window. It's essentially the same except that it contains two additional merge
commits: one pulling in the upstream v7.2 tag in order to address a conflict
between my for-next and your master branches. The second pulls in an immutable
branch from Mark Brown I missed before but which contains a commit on which
some of the regmap changes depend.

There's one new driver for the Realtek DHC RTD1625 GPIO controller. If adding
it, reverting it and then adding it again raises your eyebrow: this was done
becuase the initial implementation - while correct - didn't use the gpio-regmap
abstraction that suited it nicely. The conversion was done after I had already
merged v7.2-rc2 into my tree so instead of rebasing, I went with a revert for
a cleaner git blame output.

The merges you see - other than pulling in your upstream tags with conflicting
fixes - are for a PR from Arnd containing his work on further isolating legacy
GPIO APIs and the fw_devlink support for software nodes that will go upstream
via the driver core tree.

Nothing else really stands out, details are in the signed tag. Please consider
pulling.

Thanks,
Bartosz

The following changes since commit 8d3ae59288f1e7d58d76558a6ee96d533bc5019f:

  Linux 7.2 (2026-08-16 14:32:26 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v7.3-rc1-v2

for you to fetch changes up to 146cc263e457ff6055fe7829e4f4f4b0b5d5dd86:

  Merge tag 'v7.2' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into gpio/for-next (2026-08-18 14:21:04 +0200)

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

Andy Shevchenko (5):
      regmap-irq: Provide IRQ resource request and release callbacks
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

Bartosz Golaszewski (14):
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
      Merge tag 'regmap-irq-reqrel' of https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap into gpio/for-next
      Merge tag 'v7.2' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into gpio/for-next

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
 drivers/base/regmap/regmap-irq.c                   |  22 +
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
 drivers/gpio/gpio-by-pinctrl.c                     |   4 +-
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
 include/linux/regmap.h                             |   2 +
 lib/kunit/Makefile                                 |   1 +
 lib/kunit/fwnode.c                                 | 146 +++++
 sound/pci/Kconfig                                  |   1 +
 sound/pci/cs5535audio/cs5535audio_olpc.c           |   2 +-
 sound/soc/codecs/cs42l84.c                         |   1 -
 sound/soc/codecs/cx2072x.c                         |   2 +-
 sound/soc/codecs/dmic.c                            |   1 -
 118 files changed, 2546 insertions(+), 363 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/realtek,rtd1625-gpio.yaml
 create mode 100644 drivers/base/test/swnode-devlink-test.c
 create mode 100644 drivers/gpio/gpio-rtd1625.c
 create mode 100644 include/kunit/fwnode.h
 create mode 100644 lib/kunit/fwnode.c
