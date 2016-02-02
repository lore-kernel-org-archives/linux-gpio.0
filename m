From: Bjorn Helgaas <bhelgaas@google.com>
Subject: [PATCH 0/3] USB: PHY: minor include cleanups
Date: Tue, 02 Feb 2016 14:02:30 -0600
Message-ID: <20160202200005.11646.98254.stgit@bhelgaas-glaptop2.roam.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:58459 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754437AbcBBUCd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 2 Feb 2016 15:02:33 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Felipe Balbi <balbi@ti.com>
Cc: Alexandre Courbot <gnurou@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linus Walleij <linus.walleij@linaro.org>, linux-usb@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>

Remove some gpio and regulator #includes when they can be replaced by
trivial forward struct declarations.  Also move a linux/gpio/consumer.h
#include from a header to the single .c files that uses it.

---

Bjorn Helgaas (3):
      usb: phy: generic: use forward declarations instead of #includes
      usb: phy: generic: use forward declarations instead of #includes
      usb: phy: phy-am335x: remove include of regulator/consumer.h


 drivers/pci/pcie/pme.c              |    4 +++-
 drivers/usb/phy/phy-am335x.c        |    1 -
 drivers/usb/phy/phy-generic.c       |    1 +
 drivers/usb/phy/phy-generic.h       |    5 +++--
 include/linux/usb/usb_phy_generic.h |    3 ++-
 5 files changed, 9 insertions(+), 5 deletions(-)
