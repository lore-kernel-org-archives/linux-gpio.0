Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E66D3C1403
	for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 14:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784299888; cv=none; b=hXoZHfi5Kpdz095ZAvAYbDcUj10YNw6a8A+EaIFFITOgLt+Zl6zB3J0kTJHOkOzHkC5F4sz1mSppc8fp1fPqe40wOmuISaiB6r4x4T0CkpjpTqV/TnziyuIo3XL+78sr/iVuqZF0jnIL64cfsj2BxUPkobec3zq1aV5Xv2lxfFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784299888; c=relaxed/simple;
	bh=v6KGcwddb0l8IcWTqCRDb4zO+LUewoltHwDvvn+vphg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aOphOJ62WAt/VZ+E+2nrW1neX/m/lQkVcPq2dmwdGvY3VLsh9RdZNEyzMlrmEtAqClbiDLOp/kHX/MZ5u9RoR84EKn/1UicoiRwwYt73gYPgBLWgbBuUQypw3gVxXiLtdE3SwYFRaz1UVueQjQBwix84/FiQFAIfEPXayDSZlDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=VPKWYCQS; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="VPKWYCQS"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c15ca7a7ca9so493025866b.0
        for <linux-gpio@vger.kernel.org>; Fri, 17 Jul 2026 07:51:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1784299884; x=1784904684; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8AdUtRfzJF8aQtS4v5fF5lPXueRGdYBtCeyt7x5EaDI=;
        b=VPKWYCQS+YZJNYLUEnZd6HFolZZz6jg747L+LkgCtF7dL/dcQsLrRiPrj8sFC9OGqJ
         DKeN9pTTjUqpb9nD0ohYXan+sazgFjmJJZ5k/GQURPu7F04TO+DmKDhi8Dlbng/Dt/hm
         3g5eSIoHOmuDeFbxyXwTQA+vGlFtVZ3DSVTjcN3CTX6cntVAsHFpRg7zGpWYItpjxcwk
         Khq9+GxGmpWXA9KUJJ+7WGqGikzyV9oYlde3TAPN6c6PjOb8z1uKaPBuaB7jiLDImLLF
         Cc2o7Fs5anIwwevTBGe8tinGUgELov27wv26NPJI76ppavec3ptQi8ZfAeleMPTHFTqa
         O2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784299884; x=1784904684;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8AdUtRfzJF8aQtS4v5fF5lPXueRGdYBtCeyt7x5EaDI=;
        b=NDLo2/TGbrYDAI7RNKSU9NLilco1FN+J2Ap7WH/k6LLKy1bmb6JZa2mJo9mU/gbWQF
         H2LcQ+sXQ8b8FSxLkik+liP4RiJ/IDkn4WbLSR6BAdZUjBWtcwY6W2lhC9xT2A7ALuNW
         2MRThYZE6AK1dhU4chESSBBT6Gheu3mgURObwjFPyp8n/jLcBFphMRXU9+o/MU5o9G5z
         b2pi5UKDoLrh/cVBBXqga86bLT7vFNIqqkCiqWAa/52a7n8MqOCBAz7flyQejo7wbFFU
         ptyQIoa3qgT9pF112u0ICnwXP8IF0iiHPwpLtJ7TYWWvzn/g8frEUpC1zbK6Bk7WZqOp
         k1Yg==
X-Forwarded-Encrypted: i=1; AHgh+Rq+LkqKgj8NPD4XncFHPmULqUVW1uhJWO7NHKR+fwUPEQHDsYoaZ/RM8FH9CfTgVOPJhvkGKXHTin8J@vger.kernel.org
X-Gm-Message-State: AOJu0YxTWoLe5xsUNZvvgm9lWH1N60z0+WOZer4TItTqtfEuKjwVpynN
	d9kAkEmI8q/0UZr0Gf0pS7U4r4aCvi5/i+rlZz7uMNfiqfEna72h+qSrhHuX11LCqS8=
X-Gm-Gg: AfdE7clVbN5t1m7XfMhc+jhYcdgX2yuxGTjlAXwW9uwCgtsy2UAdLLOmf07hUQnVcsg
	CB953DW96BwD/WzJML+hJCbsfX+yprbwAbnuRO6SseW4GoSB0QOnmNc2ce3PC/G1b0mGZeGgTD+
	1HyCACVfOcGnOngGyu61gfe3p3PDokhXPrvXZvjFNxnq72itkFTq6yzFO+5LfXRq3IWDNuQte7n
	UGUbOGRNsd9HziXpEHWtMZnQYEQ/wx4cLR92gXLtrgQBVSX2JKwQhbC23KurhslRwN0NIkFthky
	K5JMG6ziMRAR4dmWNCncgtYVJkgdSvLmrV8I/NQQ7m9iS96n+RgKGFZq/J4f+fIgICEUFPd+v5L
	oBjK5QVeXu00IzWeuw4JgKzdu9Re8krx01S/LGPnchQbT/SFywSfIIW9b77QAIAc7Ibc7/qEq72
	xniRYe2R2ilc8SUPxdoKhPkr/wYrZPgHNZu/dQvmY3OZM6aKtDjY/5vubkYztdEwN+9A==
X-Received: by 2002:a17:907:1b1f:b0:c15:c1fb:e8ca with SMTP id a640c23a62f3a-c16b4699441mr149267966b.12.1784299884353;
        Fri, 17 Jul 2026 07:51:24 -0700 (PDT)
Received: from localhost (p200300f65f47db047d2d8b161e35ab77.dip0.t-ipconnect.de. [2003:f6:5f47:db04:7d2d:8b16:1e35:ab77])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-c1712a5f986sm89319766b.40.2026.07.17.07.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:51:23 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>,
	Frank Haverkamp <haver@linux.ibm.com>,
	Kees Cook <kees@kernel.org>,
	Eric Piel <eric.piel@tremplin-utc.net>,
	Akshay Gupta <Akshay.Gupta@amd.com>,
	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>,
	Alexander Usyskin <alexander.usyskin@intel.com>,
	Brad Warrum <bwarrum@linux.ibm.com>,
	Ritu Agarwal <rituagar@linux.ibm.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
	John Stultz <jstultz@google.com>,
	Romain Gantois <romain.gantois@bootlin.com>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Scott Branden <scott.branden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	=?utf-8?b?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
	Keng-Yu Lin <keng-yu.lin@hpe.com>,
	"Vaibhaav Ram T.L" <vaibhaavram.tl@microchip.com>,
	Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
	Vamsi Attunuru <vattunuru@marvell.com>,
	Alexander Graf <graf@amazon.com>,
	The AWS Nitro Enclaves Team <aws-nitro-enclaves-devel@amazon.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Andrew Donnellan <andrew+kernel@donnellan.id.au>,
	Manivannan Sadhasivam <mani@kernel.org>,
	=?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Andrea della Porta <andrea.porta@suse.com>,
	Bryan Tan <bryan-bt.tan@broadcom.com>,
	Vishnu Dasa <vishnu.dasa@broadcom.com>,
	linux-gpio@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-pci@vger.kernel.org
Subject: [PATCH v2 00/12] misc: Improvements around *_device_id defintions
Date: Fri, 17 Jul 2026 16:50:46 +0200
Message-ID: <cover.1784299069.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.55.0.11.g153666a7d9bb
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4565; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=v6KGcwddb0l8IcWTqCRDb4zO+LUewoltHwDvvn+vphg=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqWkFG1z8C4NRHLFUNeuqopgHw00qW+nI9nFAsy Lfpc0JrQqqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCalpBRgAKCRCPgPtYfRL+ TgjPB/9mDiKAMUXV0wTB+CyNHbQLJZIEXYEmWQVuhH9QRBDgKl1H4iFu+J0C1cRYAMVVBXeWFKm bptw/U5yGNddrGZvPJIizrYRpjxAnbfRAeB11r9vDLxDKnILPO0Gvw8AZGCVsF0Y8eD40XySF0I 4wW5eRLSjMmzGU85S2ppLQevXoWQJKNEG7yr3Iqo2otnw5M0yZi7bzrfo0svgyXHp0KRM4CSb0V 17EyD29NvMnGBXwhZFUY2b6eghbBe8aTG7/1aR4zbNON8LPAmHRIFWIEMu0jgHftV26VB3u4Of1 3S89MPmxjLcxL6oF/2/xjjiCEz0G0TxVyXHqaWkJMimv5c5w
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

Hello,

the main motivation for this series are the patches that introduce named
initializers to these arrays. The reason I want these is that I plan to
make .driver_data a union, see
https://lore.kernel.org/all/cover.1780048925.git.u.kleine-koenig@baylibre.com/
for more details about this quest.

This series superseds a patch that only handled i2c_device_id, which is
available at
https://lore.kernel.org/all/20260515162734.469327-2-u.kleine-koenig@baylibre.com/.

Changes since then:

 - Also handle all the other *_device_id to ideally only have to bother
   about drivers/misc once for all the similar quests
 - split drivers/misc/eeprom in separate patches
 - rebased to yeserday's next

Best regards
Uwe

Uwe Kleine-König (The Capable Hub) (12):
  misc: Drop unused assignment of spi_device_id driver data
  misc/pvpanic: Drop unused assignment of acpi_device_id driver data
  misc: genwqe: Drop unused assignment of pci_device_id driver data
  misc: eeprom: Use named initializers for arrays of i2c_device_data
  misc: Use named initializers for arrays of i2c_device_data
  misc: Use named initializers for arrays of spi_device_data
  misc: mei: Use named initializers for acpi_device_id array
  misc: mei: Use named initializer for platform_device_id array
  misc: ibmvmc: Use named initializers for vio_device_id array
  misc: eeprom: idt_89hpesx: Unify style of of_device_id array
  misc: Unify style of of_device_id arrays
  misc: Unify code style for various *_device_id arrays

 drivers/misc/ad525x_dpot-i2c.c                |  52 ++---
 drivers/misc/ad525x_dpot-spi.c                |  58 ++---
 drivers/misc/amd-sbi/rmi-i2c.c                |   6 +-
 drivers/misc/apds9802als.c                    |   2 +-
 drivers/misc/bcm-vk/bcm_vk_dev.c              |   2 +-
 drivers/misc/bh1770glc.c                      |   6 +-
 drivers/misc/cardreader/alcor_pci.c           |   2 +-
 drivers/misc/cb710/core.c                     |   5 +-
 drivers/misc/ds1682.c                         |   6 +-
 drivers/misc/eeprom/idt_89hpesx.c             | 202 +++++++++---------
 drivers/misc/eeprom/max6875.c                 |   2 +-
 drivers/misc/fastrpc.c                        |   6 +-
 drivers/misc/gehc-achc.c                      |   4 +-
 drivers/misc/genwqe/card_base.c               |  88 +++-----
 drivers/misc/hi6421v600-irq.c                 |   2 +-
 drivers/misc/hisi_hikey_usb.c                 |   2 +-
 drivers/misc/hmc6352.c                        |   2 +-
 drivers/misc/hpilo.c                          |   6 +-
 drivers/misc/ibmasm/module.c                  |   2 +-
 drivers/misc/ibmvmc.c                         |   4 +-
 drivers/misc/ics932s401.c                     |   2 +-
 drivers/misc/isl29003.c                       |   4 +-
 drivers/misc/isl29020.c                       |   2 +-
 drivers/misc/keba/lan9252.c                   |   4 +-
 drivers/misc/lattice-ecp3-config.c            |   4 +-
 drivers/misc/lis3lv02d/lis3lv02d_i2c.c        |   8 +-
 drivers/misc/lis3lv02d/lis3lv02d_spi.c        |   2 +-
 drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c |   2 +-
 .../misc/mchp_pci1xxxx/mchp_pci1xxxx_gpio.c   |   4 +-
 .../misc/mchp_pci1xxxx/mchp_pci1xxxx_otpe2p.c |   4 +-
 drivers/misc/mei/pci-csc.c                    |   2 +-
 drivers/misc/mei/pci-me.c                     | 166 +++++++-------
 drivers/misc/mei/pci-txe.c                    |   6 +-
 drivers/misc/mei/platform-vsc.c               |   2 +-
 drivers/misc/mei/vsc-tp.c                     |  10 +-
 drivers/misc/mrvl_cn10k_dpi.c                 |   2 +-
 drivers/misc/nsm.c                            |   2 +-
 drivers/misc/ocxl/pci.c                       |   2 +-
 drivers/misc/open-dice.c                      |   2 +-
 drivers/misc/pci_endpoint_test.c              |  16 +-
 drivers/misc/phantom.c                        |   6 +-
 drivers/misc/pvpanic/pvpanic-mmio.c           |   8 +-
 drivers/misc/pvpanic/pvpanic-pci.c            |   4 +-
 drivers/misc/qcom-coincell.c                  |   4 +-
 drivers/misc/rp1/rp1_pci.c                    |   2 +-
 drivers/misc/sram.c                           |   2 +-
 drivers/misc/ti_fpc202.c                      |   2 +-
 drivers/misc/tsl2550.c                        |   2 +-
 drivers/misc/vcpu_stall_detector.c            |   4 +-
 drivers/misc/vmw_vmci/vmci_guest.c            |   4 +-
 50 files changed, 362 insertions(+), 381 deletions(-)


base-commit: 1a1757b76427f6201bfe0bf1bea9f7574f332a93
-- 
2.55.0.11.g153666a7d9bb

