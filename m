Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F022349B209;
	Fri, 25 Sep 2026 16:09:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352587; cv=none; b=iVaiPJb0DZ0a16rRDd7WYtaLR3gZRw1ZPzct5TcREN+hGm2H+JDcK/sI+GOrsgJHR8ipolNP2FRMH+vpttoiA2bCko1bBtWWOzSiX2AiEut/PkZRAjQkGSIsj+NVAewcIwgh6J3xPlBUDLdiI3IFqYj6Zgu1tByZqW2Ba3TS1Lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352587; c=relaxed/simple;
	bh=b6/fYlyV0jC2MyZmbJI5a79JQERxD6D52LiSjG0I00U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OFd6D5Gjhxhg18ytwEFRLORZEkRHfU77aA9qYCIkceXKEIMabzpn9BZPt77YLxNlFmO3Hf9mfSwN6cnPvCB6+0cP7ie48FmvFc+Q+qUmGXwuFKhif8t7OQ/mu2hA04gmFJc1A0jAv8bGM/9ls/5SOxs7Xec2vvVXpJxu8k0BqTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nhYY03RL; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nhYY03RL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790352585; x=1821888585;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=b6/fYlyV0jC2MyZmbJI5a79JQERxD6D52LiSjG0I00U=;
  b=nhYY03RLIgWLgxZPsxfyntzNjYVS9zjpsnAnMknYydxOD8pbqs/t/ZzG
   zbP0aZV09jU95gP5iV3GjZh1yePAzbjatS5u0iwG3Zc1OOLPDs2O0GJRm
   NhWtfxIAGBISw/7b64PUHl3uiyV385CMvFxKRKT1FJOZAnkLsKBcLsa9i
   tbvuFDr7hmypRexGWFvZD+Y86iiAcPMYI89kYX8CZif5uoibr2u/ekK8Y
   qxBvMfzqRII3MqMVa9ss1W/3mR7cuKEB7Vw2Lcjt+6HVowB9GGYfa/gZs
   OmYJtBqzv8I+/7DyZvgcd0aSBbDogTzRpVGJBh+9WgV7CM1JUAkUm2ylv
   g==;
X-CSE-ConnectionGUID: /3e2TIiQTr2Xb3CqEmJzsA==
X-CSE-MsgGUID: D2BYXXdDRRKHXN6nIcIITw==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="93859828"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="93859828"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 09:09:32 -0700
X-CSE-ConnectionGUID: H8ZsZXY0QaeJJJDRFlvU0w==
X-CSE-MsgGUID: l6/g643cSuqhlxpxyRiUvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="277533835"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 25 Sep 2026 09:09:28 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id AE47FA1; Fri, 25 Sep 2026 18:09:26 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Raag Jadav <raag.jadav@intel.com>,
	Junjie Cao <junjie.cao@linux.dev>,
	Runyu Xiao <runyu.xiao@seu.edu.cn>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Peng Fan <peng.fan@nxp.com>,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Bartosz Golaszewski <brgl@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Peter Tyser <ptyser@xes-inc.com>,
	Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	William Breathitt Gray <wbg@kernel.org>,
	Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Lixu Zhang <lixu.zhang@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v1 4/5] gpio: Move Intel Sodaville GPIO driver to the intel subfolder
Date: Fri, 25 Sep 2026 17:57:06 +0200
Message-ID: <20260925160913.1648565-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260925160913.1648565-1-andriy.shevchenko@linux.intel.com>
References: <20260925160913.1648565-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For better maintenance and development experience, move
Intel Sodaville GPIO driver to the intel subfolder.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 MAINTAINERS                               | 1 -
 drivers/gpio/Kconfig                      | 8 --------
 drivers/gpio/Makefile                     | 1 -
 drivers/gpio/intel/Kconfig                | 9 +++++++++
 drivers/gpio/intel/Makefile               | 2 ++
 drivers/gpio/{ => intel}/gpio-sodaville.c | 0
 6 files changed, 11 insertions(+), 10 deletions(-)
 rename drivers/gpio/{ => intel}/gpio-sodaville.c (100%)

diff --git a/MAINTAINERS b/MAINTAINERS
index e1e4d64a5960..b3f9f20f8264 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13132,7 +13132,6 @@ L:	linux-gpio@vger.kernel.org
 S:	Supported
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/andy/linux-gpio-intel.git
 F:	drivers/gpio/gpio-graniterapids.c
-F:	drivers/gpio/gpio-sodaville.c
 F:	drivers/gpio/intel/
 
 INTEL GPIO GPE DRIVER
diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 25d6e66bc4fc..0353226cb2d7 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1837,14 +1837,6 @@ config GPIO_RDC321X
 	  Support for the RDC R321x SoC GPIOs over southbridge
 	  PCI configuration space.
 
-config GPIO_SODAVILLE
-	bool "Intel Sodaville GPIO support"
-	depends on X86 && OF
-	select GPIO_GENERIC
-	select GENERIC_IRQ_CHIP
-	help
-	  Say Y here to support Intel Sodaville GPIO.
-
 endmenu
 
 menu "SPI GPIO expanders"
diff --git a/drivers/gpio/Makefile b/drivers/gpio/Makefile
index 819583fc0d0b..ba01904588d9 100644
--- a/drivers/gpio/Makefile
+++ b/drivers/gpio/Makefile
@@ -167,7 +167,6 @@ obj-$(CONFIG_GPIO_SIM)			+= gpio-sim.o
 obj-$(CONFIG_GPIO_SIOX)			+= gpio-siox.o
 obj-$(CONFIG_GPIO_SL28CPLD)		+= gpio-sl28cpld.o
 obj-$(CONFIG_GPIO_SLOPPY_LOGIC_ANALYZER) += gpio-sloppy-logic-analyzer.o
-obj-$(CONFIG_GPIO_SODAVILLE)		+= gpio-sodaville.o
 obj-$(CONFIG_GPIO_SPACEMIT_K1)		+= gpio-spacemit-k1.o
 obj-$(CONFIG_GPIO_SPEAR_SPICS)		+= gpio-spear-spics.o
 obj-$(CONFIG_GPIO_SPRD)			+= gpio-sprd.o
diff --git a/drivers/gpio/intel/Kconfig b/drivers/gpio/intel/Kconfig
index ad8321ef1705..54fc93b362c6 100644
--- a/drivers/gpio/intel/Kconfig
+++ b/drivers/gpio/intel/Kconfig
@@ -36,6 +36,15 @@ config GPIO_MERRIFIELD
 
 endif
 
+config GPIO_SODAVILLE
+	bool "Intel Sodaville GPIO support"
+	depends on X86 && OF
+	depends on PCI
+	select GPIO_GENERIC
+	select GENERIC_IRQ_CHIP
+	help
+	  Say Y here to support Intel Sodaville GPIO.
+
 # PCH type of drivers
 
 if PCI
diff --git a/drivers/gpio/intel/Makefile b/drivers/gpio/intel/Makefile
index 26704fc1fa1a..cb373d25b56e 100644
--- a/drivers/gpio/intel/Makefile
+++ b/drivers/gpio/intel/Makefile
@@ -5,6 +5,8 @@ obj-$(CONFIG_GPIO_TANGIER)		+= gpio-tangier.o
 obj-$(CONFIG_GPIO_ELKHARTLAKE)		+= gpio-elkhartlake.o
 obj-$(CONFIG_GPIO_MERRIFIELD)		+= gpio-merrifield.o
 
+obj-$(CONFIG_GPIO_SODAVILLE)		+= gpio-sodaville.o
+
 # PCH type of drivers
 
 obj-$(CONFIG_GPIO_ICH)			+= gpio-ich.o
diff --git a/drivers/gpio/gpio-sodaville.c b/drivers/gpio/intel/gpio-sodaville.c
similarity index 100%
rename from drivers/gpio/gpio-sodaville.c
rename to drivers/gpio/intel/gpio-sodaville.c
-- 
2.50.1

