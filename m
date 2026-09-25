Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB4F4D9F74;
	Fri, 25 Sep 2026 16:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790352583; cv=none; b=jb+VmywEP1DawV5gK5uXVSQG4+cIcV8pq10IQPii+8Ix2mbr9QqKELL/Tlro/O2mtkOw6NHCC8sXtKMGdeQ6YM+KOSkf5ucyN1DCpn7IsXt1kDHQiLx5kJ5jjXMtf8GJGMvKkXJBkyRigy/G85im5g6j0sQPpTyxH2/SCLoB5ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790352583; c=relaxed/simple;
	bh=acR0oFswQLFdJnzGHUMQCI7FJQeiDJlOpkIxZblquj8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=j2MYpDUXsYpLLp495uD/8V8qiuneLMKKfbltXYakE9mvm0/lgR8xU3dpC4Ip+91vgyCaNO2xj/pzHqQem4E+gWQTPXIBm020IKG4QLdyQE6om9LAsDtwqQk+U083/+gZ3L/mXDjAL8EAWdLzcn3QMv8XJDVbzsrwPVzCDTx0bEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A15C9k8r; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A15C9k8r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790352578; x=1821888578;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=acR0oFswQLFdJnzGHUMQCI7FJQeiDJlOpkIxZblquj8=;
  b=A15C9k8rFePmbRAGeMNjpScCUawYCMcdZ2aM4ShA3qg48YecYbL6/wD2
   64QLSypJ3gS4yv5WCazCOSUJTTdTn5mG4zWh8VUbkDu+PkamZyATtiy25
   uOdAJwiKuCS7cw0o2EoeSikduJSlpaRaRX++397AOIffK8GVSgYCywq3r
   Gi/OEOZ1rO/4/ADzvJS/GiqdKbB6Oz4UP3d5AkspE8PyADtpGQTtFxCnf
   OmYlDw8XJDIZFanytJXY1F7hWE0YVHoR3k720QgXRa/XrFR50rXZTnRzi
   K3ozCDsnyfJFlhtXqc9RLy1WVJKzL/ntTw0m2jDH2/98zVqzazjAztW4q
   A==;
X-CSE-ConnectionGUID: CT6+P1otReCVWiSHH/MBqQ==
X-CSE-MsgGUID: aRCmZp7dS5SZuOCTcY0xYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="93859818"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="93859818"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 09:09:32 -0700
X-CSE-ConnectionGUID: HGa7kB8NTaaSg8ajpoeFNw==
X-CSE-MsgGUID: zT28DDtkR9yRKizxDrTNUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="277533837"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 25 Sep 2026 09:09:28 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 9BD1699; Fri, 25 Sep 2026 18:09:26 +0200 (CEST)
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
Subject: [PATCH v1 0/5] gpio: Move most of the Intel GPIO to the dedicated folder
Date: Fri, 25 Sep 2026 17:57:02 +0200
Message-ID: <20260925160913.1648565-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

For the easier maintenance and future development move most of Intel GPIO
drivers to the dedicated 'intel' folder. For now it only covers the drivers
I maintain (as per record in the MAINTAINERS).

The idea is to have the 'intel' folder to be associated with the respective
Git tree from which the maintainer (currently me) sends PRs to Bart (GPIO
maintainer) from time to time.

Nova Lake event driver is up to their maintainers what to do (co-maintainers
are welcome!).

USBIO drivers as per Hans are for the camera (IPU) only, perhaps media tree
is the best to handle them. I can, of course, host them in 'intel/usbio'
subfolder on the terms that I do not touch or handle anything behind it.
Otherwise co-maintainers are a must.

Cc'ed to William on the point to might be hosting i8255 et alia (PC104?)
under the 'intel/i8255' subfolder on the terms like described above for USBIO.
Or you, William, can send me PRs, either way I don't want to maintain those.

PXA driver is indeed was used on early Intel MID, but we used to have
a different (now gone) driver and PXA was never adapted for that.

IPX one is Intel by vendor, but quite alien to anything listed above. Don't
think its place is in 'intel' subfolder.

This mini-series is supposed to go via my tree to avoid current conflicts.

Andy Shevchenko (5):
  gpio: Move Intel GPIO drivers to the dedicated subfolder
  gpio: Move Intel PMIC GPIO drivers to the dedicated subfolder
  gpio: Move Intel PCH type of GPIO drivers to the intel subfolder
  gpio: Move Intel Sodaville GPIO driver to the intel subfolder
  gpio: Move Intel vGPIO driver to the intel subfolder

 MAINTAINERS                                   |  21 +--
 drivers/gpio/Kconfig                          | 147 +-----------------
 drivers/gpio/Makefile                         |  13 +-
 drivers/gpio/intel/Kconfig                    | 136 ++++++++++++++++
 drivers/gpio/intel/Makefile                   |  19 +++
 drivers/gpio/{ => intel}/gpio-elkhartlake.c   |   0
 drivers/gpio/{ => intel}/gpio-graniterapids.c |   0
 drivers/gpio/{ => intel}/gpio-ich.c           |   0
 drivers/gpio/{ => intel}/gpio-merrifield.c    |   0
 drivers/gpio/{ => intel}/gpio-ml-ioh.c        |   0
 drivers/gpio/{ => intel}/gpio-pch.c           |   0
 drivers/gpio/{ => intel}/gpio-sch.c           |   0
 drivers/gpio/{ => intel}/gpio-sodaville.c     |   0
 drivers/gpio/{ => intel}/gpio-tangier.c       |   0
 drivers/gpio/{ => intel}/gpio-tangier.h       |   0
 drivers/gpio/intel/pmic/Kconfig               |  30 ++++
 drivers/gpio/intel/pmic/Makefile              |   5 +
 .../gpio/{ => intel/pmic}/gpio-crystalcove.c  |   0
 drivers/gpio/{ => intel/pmic}/gpio-wcove.c    |   0
 19 files changed, 200 insertions(+), 171 deletions(-)
 create mode 100644 drivers/gpio/intel/Kconfig
 create mode 100644 drivers/gpio/intel/Makefile
 rename drivers/gpio/{ => intel}/gpio-elkhartlake.c (100%)
 rename drivers/gpio/{ => intel}/gpio-graniterapids.c (100%)
 rename drivers/gpio/{ => intel}/gpio-ich.c (100%)
 rename drivers/gpio/{ => intel}/gpio-merrifield.c (100%)
 rename drivers/gpio/{ => intel}/gpio-ml-ioh.c (100%)
 rename drivers/gpio/{ => intel}/gpio-pch.c (100%)
 rename drivers/gpio/{ => intel}/gpio-sch.c (100%)
 rename drivers/gpio/{ => intel}/gpio-sodaville.c (100%)
 rename drivers/gpio/{ => intel}/gpio-tangier.c (100%)
 rename drivers/gpio/{ => intel}/gpio-tangier.h (100%)
 create mode 100644 drivers/gpio/intel/pmic/Kconfig
 create mode 100644 drivers/gpio/intel/pmic/Makefile
 rename drivers/gpio/{ => intel/pmic}/gpio-crystalcove.c (100%)
 rename drivers/gpio/{ => intel/pmic}/gpio-wcove.c (100%)

-- 
2.50.1

