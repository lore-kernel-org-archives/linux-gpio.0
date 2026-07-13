Received: from pidgin.makrotopia.org (pidgin.makrotopia.org [185.142.180.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E38E834388A;
	Mon, 13 Jul 2026 23:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.142.180.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783985471; cv=none; b=a495mQUcPWvRvcfo/FTaHRdBOVb+sIZz6//2/KJjddNC0I5YVw4clOC79YVh8MK0ITd8k71nwcsj7Vcp2/ghxIw/89gPlvBSnGzkDXSx5QIkJghSauEWX2J/Nppa6fiixgabUed6LhID8m5bvFU9FFSqRsxjidK0G0fZWe1M+wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783985471; c=relaxed/simple;
	bh=qQhLs0bCrhNFjURSJookWUQUDRmPrMS36AzKJT1kcmc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HtwjxLiOfaZQLko7zd6Ps8icCkpm1ZOQCri9/ZiIUsMABbjP3uEl++p6+Cvx+YbNrGoN6F3rHBJ9oD5RLRSXWHq278imnKcvANIbYUzj2kHOiz5YsLjb2mALIAdkwK+4J/9f4imA5BoAcCyqgg81cOkOaFba/AJmFzOk5TqOWq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org; spf=pass smtp.mailfrom=makrotopia.org; arc=none smtp.client-ip=185.142.180.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=makrotopia.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=makrotopia.org
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wjQ6z-000000000zU-2AOm;
	Mon, 13 Jul 2026 23:30:57 +0000
Date: Tue, 14 Jul 2026 00:30:53 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Wunderlich <frank-w@public-files.de>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH] gpiolib: tolerate gpio-hogs lacking a hogging state
Message-ID: <4c67cf0839ccf57db35a826df6d8fc779531509a.1783974733.git.daniel@makrotopia.org>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Commit d1d564ec4992 ("gpio: move hogs into GPIO core") made
gpiochip_add_hog() return -EINVAL for hog nodes lacking any of the
'input', 'output-low' or 'output-high' properties. The error is
propagated by gpiochip_hog_lines() and fails registration of the
whole GPIO chip.

The previous OF-specific implementation tolerated such nodes:
of_parse_own_gpio() warned "no hogging state specified, bailing out"
and of_gpiochip_add_hog() stopped processing the node without failing
chip registration.

Some boards deliberately ship hog nodes without a hogging state in
their base devicetree and supply the state via overlay, e.g. the PCIe
slot key selection hogs on the BananaPi R4 Pro added in
commit e309fa232d12 ("arm64: dts: mediatek: mt7988a-bpi-r4pro: rework
pcie gpio-hog handling"), as the polarity set in the base devicetree
could not be overridden from an overlay.

Booting such a board without an overlay applied now fails to register
the gpiochip. On the BananaPi R4 Pro this means the MT7988A pinctrl
device fails to probe, all peripherals including the console UART
defer forever, and the board finally hangs when clk_disable_unused()
gates the clocks of the UART still in use by earlycon:

  gpiochip_add_data_with_key: GPIOs 512..595 (pinctrl_moore) failed to register, -22
  mt7988-pinctrl 1001f000.pinctrl: error -EINVAL: Failed to add gpio_chip
  ...
  clk: Disabling unused clocks
  (hangs)

Restore the previous behaviour by warning about hog nodes lacking a
hogging state and skipping them instead of failing the registration
of the whole GPIO chip.

Fixes: d1d564ec4992 ("gpio: move hogs into GPIO core")
Cc: stable@vger.kernel.org
Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/gpio/gpiolib.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index e5fb60111151..c433a095907f 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -999,14 +999,17 @@ int gpiochip_add_hog(struct gpio_chip *gc, struct fwnode_handle *fwnode)
 	if (ret < 0)
 		return ret;
 
-	if (fwnode_property_present(fwnode, "input"))
+	if (fwnode_property_present(fwnode, "input")) {
 		dflags |= GPIOD_IN;
-	else if (fwnode_property_present(fwnode, "output-low"))
+	} else if (fwnode_property_present(fwnode, "output-low")) {
 		dflags |= GPIOD_OUT_LOW;
-	else if (fwnode_property_present(fwnode, "output-high"))
+	} else if (fwnode_property_present(fwnode, "output-high")) {
 		dflags |= GPIOD_OUT_HIGH;
-	else
-		return -EINVAL;
+	} else {
+		gpiochip_warn(gc, "%pfwP: no hogging state specified, bailing out\n",
+			      fwnode);
+		return 0;
+	}
 
 	fwnode_property_read_string(fwnode, "line-name", &name);
 
-- 
2.55.0
