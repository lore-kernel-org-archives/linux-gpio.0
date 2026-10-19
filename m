Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16834AA3F0
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 09:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792402211; cv=none; b=t65buwImfF2q1q8HhChO6bF3RJvZiwht7QiQrr9d3huIjLrbbj1kYxfduX+DPtEeby64yYjBODlGImjPvR5Z4a2rmppy5LqUATwxqzDecrRq3Km+oxzvFC2UXVXs715+aNd4OHG+y74ddCKg+Z9Q3GwesL1jYOLZoaAP//uMt/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792402211; c=relaxed/simple;
	bh=cmfxoZ3ZVkWVXpZIjV5RWlGPS9PtQdt5+X1+tzMTr7I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=jXxfte91jNsS+XnHVTf2V2LkSN5xN9FOPv6dxVj1agqmLfFgl8kLOx9IgZT8wTAjCXuHiwNYJLyNdRMkkK5NuifYIsVO0m8Pg5mfaKz3ndKWHRD8+zjnq9NjichXvfYo2OnGOlKcWSIMqPHR1ZXBITrkrDJMhnsWgmazYDYkUV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ku628DJF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YOEOS/u1; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ku628DJF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YOEOS/u1"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8OuvN1348224
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 09:30:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ZOWO0t44roL8dCo9oGFKRi
	VygiqRvHBx/LmB+3RuQMA=; b=Ku628DJF86Ziz5Ie1qQUsp5F7LsDFDF3qVSX75
	noiuc6TM/h4vAONS5Pk0WPup9NMiERClFdVfDALtVFJI4PPMGv2aFIT6l+u0HXPo
	sXLy2+YV+pPQjG4cr00QS96VMI9KP03zzeeaFXlPrBR1SnfsXDNi3fCIiA5K/xiy
	pQgEN1a057jqXzoHtABcKMKd5PvemdiSDQG9zerXeBpLvJv5LmC1NH4B2kNoY4M1
	bGIQlBjAR52vrwNte+ovOCHpa7m3qTygZaVXSzBhlF8ZoV4qjrSNznOL+yeyHDAi
	KiE2HK37mszS9rfK9gx1z1Qy6rBUSkfHjnaqUaed26Oaufhw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf4rgcrq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 09:30:08 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93c5ab5c136so320287285a.3
        for <linux-gpio@vger.kernel.org>; Mon, 19 Oct 2026 02:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792402207; x=1793007007; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZOWO0t44roL8dCo9oGFKRiVygiqRvHBx/LmB+3RuQMA=;
        b=YOEOS/u170Li85sCmVwo0TeSuL98yob5IphaKZx28fJbrdthiuQSPeJIIeugR8MA83
         8s5yzmK0uTSM0Ln/p9kG3iG8WzIgx4e4nX8j4TRpTieO/cHABHyZdBPQNiYv4d61TE/T
         glm1OO/wjSr3k7CZcZHnfYBWMyKdH5/oIyrd595kJw/RMOmeaNvPzLQCAr5/CxXpOXgh
         OVjAZGXsTBpRJSTRv8/nibC99FPoV+bq+lgmIu0+86hx/btg6I3N/352F/zqbZySHNfo
         hV318L/EOYmWEJCq6dEwgKMm4UPYf7dV737lYoWKxpoRwY2F6HX0YB1qEy1B3iQsLm2L
         CC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792402207; x=1793007007;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZOWO0t44roL8dCo9oGFKRiVygiqRvHBx/LmB+3RuQMA=;
        b=DuvnTbU5KJRIY9d+1xSYEOR65Zx/14cItSrAKy/uJis+fytoQdUDYdN/DacpU0Pp6k
         9Fjyics96yztXGb+axvnSpt8PJBBMGYhgIsuxciT/cz5jM3UQSe6ILyQo+3+VJvsjQ9e
         +hEVvI9sntm3TQf10m4ou8D1kTe6+0AthU/boOxmDdBSEdHGekp1ioqlA0nUGSGwDRkM
         TBlwbM0/viclJ2618PkHCxzcjIHa8JJ/fA8WZjRIKol7rPToIDgqddw77+J40BKWZ668
         cvfy8mTirax4yVTzmzi2x88J2pCcrOem+tYHaC1zoaTbgC5q4Q0RvY/jSpofCsJSzeTf
         rvjA==
X-Forwarded-Encrypted: i=1; AKwUvBwUhoXYFcKvtRl9Dr0nsDWvYd03tOjYtuF1XjmaACoQLbzbLx73gltQgApQlb8Avs/u4LdsGqdigPwk@vger.kernel.org
X-Gm-Message-State: AFq9FYLL3keG3hPYP4Mowlr2THV5HAwosV38UcRDvhBt0PhRv5S7mvo1
	A5qMRLfvZWYxoUOdn/WIG0+kSGqoTn/SEdcMTM6ah4uPwzNjGhcMicKK71JLeSUVmNU4d8wDiVN
	P3UGQDX1wUOcjgI6MxCy+CAUN7wTiSaPPFwe9E09tuEi68BQVgQ3kDuIp7HTIYaD8
X-Gm-Gg: AYBFou1K4eb1R5j5mlduyL3huiIAvWPuqzfL0g09ZENL2zpdKLH7n0vZ7O2oMoEcuuq
	5HPPQyZ750NhgGmq1BIWD+WuE/KF0GyuPhgDp2le1+ghZ2SO1yTnJEGfTHkhg5K+e4eF5QjiGWc
	sampEmGcDUAjH0RHNrRzwIwWds4gCkgu8aqPM7M5DrIXs2uEU1iWb6x5vXlc+Vtqv573DywclfR
	smsC3E23UlTX3zKV3UzGP/DUrXGoctSCVj3q6SO+SesXGOk92n7yhFdoqO7BEwVePUAVEwOf5nz
	UChRgAKZLevq6X/lVeDRI+7o1/ewlEPden6E3W/zeI9zzfBPp0NlOKNbaIFkOE+B2hijuw+Y4CU
	qAOKylYB2LI0AElpGZOE12LHMJv4=
X-Received: by 2002:a05:620a:1793:b0:93f:35fc:524e with SMTP id af79cd13be357-93f35fc58f0mr806655185a.35.1792402207162;
        Mon, 19 Oct 2026 02:30:07 -0700 (PDT)
X-Received: by 2002:a05:620a:1793:b0:93f:35fc:524e with SMTP id af79cd13be357-93f35fc58f0mr806650585a.35.1792402206571;
        Mon, 19 Oct 2026 02:30:06 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd510ba3sm21727906f8f.56.2026.10.19.02.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 02:30:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] gpio updates for v7.4-rc1
Date: Mon, 19 Oct 2026 11:30:00 +0200
Message-ID: <20261019093001.11999-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ETxD95TN3hsOvjDSOyWr_sExPFTKiNrU
X-Proofpoint-GUID: ETxD95TN3hsOvjDSOyWr_sExPFTKiNrU
X-Authority-Analysis: v=2.4 cv=H7NOUOYi c=1 sm=1 tr=0 ts=6ad5e320 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=7cXBHvu3RGn6FwDN4goA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNyBTYWx0ZWRfXywKOn9OG6vrQ
 1CWcM0mvRnEhXFfeVk1twlRsTa1xhSP4371N/LQdNVYH9uEsyrBEfutBsBqW1RXyd+JbXXkvr/W
 2R+JroPKyrJW6mCkA4QvhvYP4OKgwbL6FRDAuv04toR9uscC+M4x5C3kyjARLJYmhs5PUJrTc5C
 T32fPzBCjeQYfGBdPpz5DXfQJGhWqzX35dWZLmxai0yJBnUCRC72Loj20bmfZys8CxGxtzLbFnT
 osuIzWuY1BjgUmNjHO4V/EV/q4vtGgUPYTuPAGOMpPEYco9OV8p6tUpFXlnfGL9FGTAKhyICtf8
 YxhUGqiNJmlHSIQMTuFjmE8s6JO+DucFeYkgEitAR7nPO7yZc6A+VLWMYU5LWQMlpEK9NMq1VGW
 kxgsOOVdotqnPEmUd4K+U26V39bEREJ4AAGIdJin/HafKvB+FgGuxkJeuUCy7GpbMfe9dKfH0Me
 2wzUes9Lg/AKelvEZoA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNyBTYWx0ZWRfX0n3csnw4bj0B
 3dKUysubZfGrDh8K+H8D8LrzTy+1f/3ba0jECmThvIydg7YQm4NKBEF01r15IzQw9TxmqSVqqb2
 NHHOXmQ5oEcai8ZeGAUsligTHI4PgjE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190037

Linus,

Here's the primary pull-request for this merge window for the GPIO subsystem.
Nothing stands out as particularly interesting, it's been a calm cycle. We
have three new drivers, support for more models and lots of updates across
many modules (details are in the signed tag as usual). There are also some
minor changes and additions to the in-kernel GPIO API.

Merges are the usual mix of pulls from Andy's intel tree, immutable branches
from Lee Jones and my own tags provided for cross-tree developments.

Please consider pulling for v7.4.

Thanks,
Bartosz

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/gpio-updates-for-v7.4-rc1

for you to fetch changes up to 47f16cf7a6017212230985f6bc7f1b55b6d234d9:

  Merge tag 'intel-gpio-v7.3-1' of git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel into gpio/for-next (2026-10-15 15:06:29 +0200)

----------------------------------------------------------------
gpio updates for v7.4-rc1

GPIO core:
- provide a new controller API: gpiochip_generic_get_config()
- return -EOPNOTSUPP instead of -ENODEV to user-space if it requests
  hardware timestamping on systems where it's unavailable (no user-space
  regressions reported)

New drivers:
- add a driver for ROHM BD73800 PMIC GPIO controller
- add a driver for Axiado AX3005 SGPIO controller
- add a driver for Analog Devices AD7768 GPIO controller

New hardware support:
- extend gpio-rcar with support for R-Car X5H (R8A78000)
- extend gpio-tegra186 with support for Tegra 268

Driver changes:
- refactor and improve gpio-rtd1625: switch to modern or better fitting
  interfaces and improve coding style
- improve error handling of return values of platform_get_irq_optional()
  in several drivers
- normalize the return value of the gpio_chip::get() callback in gpio-siox in
  order to not propagate invalid values up to the GPIO core
- implement gpio_chip::get_direction() for gpio-pcf857x
- use managed variants of notifier registration functions in several drivers
- remove legacy gpio_set_value_cansleep() as it has no more users
- add pinctrl support to gpio-realtek-otto
- add runtime PM support to the gpio-regmap helper module
- add more ACPI GPIO quirks for various hardware
- stop needlessly reading gpio_chip::base in gpio-pxa
- add support for tracking of direction of generic GPIO chips with no
  direction registers via pinctrl backend to gpio-mmio (use the new core API:
  gpiochip_generic_get_config())
- use the "safe" variants of debugfs_create_file() in gpio-sloppy-analyzer
- use device name as GPIO chip label in gpio-omap
- refactor bit ops in gpio-dln2
- prepare gpio-it87 for upcoming kmalloc_obj() conversion

Devicetree bindings:
- document new model in gpio-pca95xx
- allow the gpio-hogs property in gpio-zynq and fsl,qoriq-gpio
- allow the gpio-ranges property in gpio-realtek-otto

Misc fixes:
- add missing MODULE_ALIAS() to gpio-crystalcove
- fix a comment typo in example GPIO tools
- fix unbalanced brackets in documentation
- add names to regmaps in gpio-mvebu to avoid collisions in debugfs output
- fix GPIO lookup using relative paths in GPIO ACPI

----------------------------------------------------------------
Abduvaliy Abdulazizov (1):
      gpiolib: acpi: Ignore GPIO 11 interrupt on Acer Nitro V 16S AI

Alban Bedel (1):
      gpiolib: acpi: Fix GPIO lookup using relative path

Andy Shevchenko (1):
      gpio: legacy: Kill gpio_set_value_cansleep()

Areeb Ul Haq Mirza (1):
      gpio: pxa: stop reading gpio_chip::base in direction callbacks

Bartosz Golaszewski (5):
      Merge tag 'devm_notifier_chain_register-for-7.4' of https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux into gpio/for-next
      Merge tag 'v7.3-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux into gpio/for-next
      Merge branch 'ib-gpio-dir-imx' of https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl into gpio/for-next
      Merge tag 'ib-mfd-clk-gpio-regulator-rtc-v7.4' of git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd into gpio/for-next
      Merge tag 'intel-gpio-v7.3-1' of git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel into gpio/for-next

Cengiz Can (1):
      gpio: sloppy-logic-analyzer: use debugfs_create_file() for buf_size and capture

Dmitry Torokhov (1):
      gpio: crystalcove: add missing MODULE_ALIAS()

Eliav Farber (4):
      notifier: add device-managed registration APIs
      gpio: adp5585: use devm_blocking_notifier_chain_register()
      gpio: eic-sprd: use devm_atomic_notifier_chain_register()
      gpio: gpiolib-kunit: use devm_blocking_notifier_chain_register()

Hemanth Selam (1):
      tools: gpio: fix typo "amount of times" in comment

Igor Velkov (1):
      dt-bindings: gpio: pca95xx: add onnn,pca9655 with nxp,pca9555 fallback

Iván Ezequiel Rodriguez (1):
      gpio: cdev: return EOPNOTSUPP when HTE is unavailable

Janani Sunil (3):
      gpio: regmap: Use regmap_test_bits() for single bit reads
      gpio: regmap: Add optional runtime PM support
      gpio: ad7768: Add AD7768 GPIO auxiliary driver

Jon Hunter (2):
      dt-bindings: gpio: Add compatible string for Tegra268
      gpio: tegra186: Add support for Tegra268

Kees Cook (1):
      gpio: it87: Remove const from labels_table allocation type

Kivan (1):
      gpiolib: acpi: Add ignore_wake quirk for ASUS ZenBook UX425UA_UM425UA

Linus Walleij (1):
      gpio: generic: Avoid pinctrl calls when ranges are missing

Manuel Ebner (1):
      Documentation: gpio: Fix bracket

Marek Vasut (2):
      dt-bindings: gpio: renesas,rcar-gpio: Document R-Car X5H (R8A78000) support
      gpio: rcar: Add R-Car X5H (R8A78000) support

Mateo Borda (1):
      gpiolib: acpi: Add quirk for Lenovo IdeaPad Slim 3 15ABR8

Matti Vaittinen (10):
      dt-bindings: mfd: Common ROHM PMIC properties
      dt-bindings: rohm,bd*: Ref common ROHM bindings
      dt-bindings: regulator: ROHM BD73800 regulators
      dt-bindings: mfd: ROHM BD73800 PMIC
      mfd: Support for ROHM BD73800 PMIC core
      rtc: bd70528: Support RTC on ROHM BD73800
      regulator: bd71828: Support ROHM BD73800
      clk: bd718x7: Support ROHM BD73800
      gpio: bd73800: Support ROHM BD73800 PMIC GPIOs
      MAINTAINERS: Add ROHM BD73800 PMIC files

Mehmet Fide (4):
      pinctrl: make the CONFIG_PINCTRL=n gpio config stubs return -ENOTSUPP
      pinctrl: imx: answer OUTPUT_ENABLE/INPUT_ENABLE queries from the pad register
      gpiolib: add get_config() and gpiochip_generic_get_config()
      gpio: mmio: track the direction of chips without direction registers

Michael Zavertkin (2):
      dt-bindings: gpio: otto-gpio: Add gpio-ranges
      gpio: realtek-otto: add pinctrl support

Michal Simek (1):
      dt-bindings: gpio: zynq: Add parsing of hogs

Peng Fan (1):
      gpio: dln2: use assign_bit() where applicable

Petar Stepanovic (2):
      dt-bindings: gpio: add Axiado AX3005 SGPIO controller
      gpio: axiado: add AX3005 SGPIO controller support

Richard Weinberger (1):
      gpio: omap: Use device name as chip label

Ridham Khurana (1):
      gpio: siox: normalize return value of gpio_get()

Rosen Penev (1):
      gpio: mvebu: name regmaps to fix debugfs collisions

Rustam Adilov (2):
      gpio: realtek-otto: use __raw_readl/writel in realtek_gpio_update_line_imr()
      gpio: realtek-otto: make bank_read/write overridable by endian property

Tapio Reijonen (1):
      gpio: pcf857x: implement get_direction()

Vincent Jardin (1):
      dt-bindings: gpio: fsl,qoriq-gpio: allow gpio-hog child nodes

Yu-Chun Lin (7):
      gpio: rtd1625: Remove unnecessary blank line
      gpio: rtd1625: Drop unneeded initializations
      gpio: rtd1625: Fix variable type for regmap_read()
      gpio: rtd1625: Narrow 'i' variable scope in loop
      gpio: rtd1625: Narrow 'hwirq' variable scope in loop
      gpio: rtd1625: Replace pr_err_ratelimited() with dev_err_ratelimited()
      gpio: rtd1625: Use IRQ_TYPE_DEFAULT macro

bui duc phuc (5):
      gpio: realtek-otto: Handle errors from optional IRQ lookup
      gpio: mlxbf3: Handle errors from optional IRQ lookup
      gpio: mlxbf2: Handle errors from optional IRQ lookup
      gpio: altera: Handle errors from optional IRQ lookup
      gpio: altera: Fix build failure caused by undeclared 'irq'

 .../bindings/gpio/axiado,ax3005-sgpio.yaml         | 112 ++++
 .../devicetree/bindings/gpio/fsl,qoriq-gpio.yaml   |   7 +
 .../devicetree/bindings/gpio/gpio-pca95xx.yaml     |   3 +
 .../devicetree/bindings/gpio/gpio-zynq.yaml        |   6 +
 .../bindings/gpio/nvidia,tegra186-gpio.yaml        |   9 +
 .../bindings/gpio/realtek,otto-gpio.yaml           |   2 +
 .../bindings/gpio/renesas,rcar-gpio.yaml           |   5 +
 .../devicetree/bindings/mfd/rohm,bd71815-pmic.yaml |   9 +-
 .../devicetree/bindings/mfd/rohm,bd71828-pmic.yaml |   9 +-
 .../devicetree/bindings/mfd/rohm,bd72720-pmic.yaml |  29 +-
 .../devicetree/bindings/mfd/rohm,bd73800-pmic.yaml | 218 ++++++
 .../devicetree/bindings/mfd/rohm,pmic-pins.yaml    |  72 ++
 .../bindings/regulator/rohm,bd73800-regulator.yaml |  99 +++
 Documentation/driver-api/gpio/board.rst            |   2 +-
 Documentation/driver-api/gpio/driver.rst           |   7 +
 MAINTAINERS                                        |  11 +
 drivers/clk/clk-bd718x7.c                          |   8 +
 drivers/gpio/Kconfig                               |  45 ++
 drivers/gpio/Makefile                              |   3 +
 drivers/gpio/gpio-ad7768.c                         | 121 ++++
 drivers/gpio/gpio-adp5585.c                        |  20 +-
 drivers/gpio/gpio-altera.c                         |   5 +-
 drivers/gpio/gpio-axiado-sgpio.c                   | 736 +++++++++++++++++++++
 drivers/gpio/gpio-bd73800.c                        | 209 ++++++
 drivers/gpio/gpio-crystalcove.c                    |   1 +
 drivers/gpio/gpio-dln2.c                           |   6 +-
 drivers/gpio/gpio-eic-sprd.c                       |  17 +-
 drivers/gpio/gpio-it87.c                           |   2 +-
 drivers/gpio/gpio-mlxbf2.c                         |   4 +-
 drivers/gpio/gpio-mlxbf3.c                         |   4 +-
 drivers/gpio/gpio-mmio.c                           |  65 +-
 drivers/gpio/gpio-mvebu.c                          |  19 +-
 drivers/gpio/gpio-omap.c                           |  11 +-
 drivers/gpio/gpio-pcf857x.c                        |  16 +-
 drivers/gpio/gpio-pxa.c                            |   4 +-
 drivers/gpio/gpio-rcar.c                           |  86 ++-
 drivers/gpio/gpio-realtek-otto.c                   |  21 +-
 drivers/gpio/gpio-regmap.c                         |  98 ++-
 drivers/gpio/gpio-rtd1625.c                        |  26 +-
 drivers/gpio/gpio-siox.c                           |   4 +-
 drivers/gpio/gpio-sloppy-logic-analyzer.c          |   4 +-
 drivers/gpio/gpio-tegra186.c                       |  74 +++
 drivers/gpio/gpiolib-acpi-core.c                   |  10 +-
 drivers/gpio/gpiolib-acpi-quirks.c                 |  42 ++
 drivers/gpio/gpiolib-cdev.c                        |   2 +
 drivers/gpio/gpiolib-kunit.c                       |  14 +-
 drivers/gpio/gpiolib.c                             |  21 +
 drivers/mfd/Kconfig                                |  15 +-
 drivers/mfd/rohm-bd71828.c                         | 147 +++-
 drivers/pinctrl/freescale/pinctrl-imx.c            |  54 +-
 drivers/pinctrl/freescale/pinctrl-imx.h            |   4 +
 drivers/pinctrl/freescale/pinctrl-vf610.c          |   2 +
 drivers/regulator/Kconfig                          |   4 +-
 drivers/regulator/bd71828-regulator.c              | 558 +++++++++++++++-
 drivers/rtc/rtc-bd70528.c                          |   8 +
 include/linux/gpio/driver.h                        |   9 +
 include/linux/gpio/legacy.h                        |  10 -
 include/linux/gpio/regmap.h                        |   2 +
 include/linux/mfd/rohm-bd73800.h                   | 306 +++++++++
 include/linux/mfd/rohm-generic.h                   |   1 +
 include/linux/notifier.h                           |   7 +
 include/linux/pinctrl/consumer.h                   |   4 +-
 kernel/notifier.c                                  | 105 +++
 tools/gpio/gpio-hammer.c                           |   2 +-
 64 files changed, 3344 insertions(+), 192 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/axiado,ax3005-sgpio.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,bd73800-pmic.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/rohm,pmic-pins.yaml
 create mode 100644 Documentation/devicetree/bindings/regulator/rohm,bd73800-regulator.yaml
 create mode 100644 drivers/gpio/gpio-ad7768.c
 create mode 100644 drivers/gpio/gpio-axiado-sgpio.c
 create mode 100644 drivers/gpio/gpio-bd73800.c
 create mode 100644 include/linux/mfd/rohm-bd73800.h
