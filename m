From: Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 0/2] pinctrl: Implicit inclusion fallout fixes
Date: Mon,  5 Feb 2018 13:47:48 +0100
Message-ID: <20180205124750.19305-1-thierry.reding@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-qt0-f195.google.com ([209.85.216.195]:41431 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752582AbeBEMrz (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Feb 2018 07:47:55 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-next@vger.kernel.org, linux-kernel@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Hi Linus,

these are two patches to fix build errors I've run into that are fallout
from your removal of the pinctrl/devinfo.h include from device.h. I sure
can imagine that there are more like this, but these seem to be the
common ones, judging by my own build tests and the kernel-build-reports
mailing list.

I'm sending these to you directly because I think it makes sense for you
to apply these on top of 23c35f48f5fb ("pinctrl: remove include file
from <linux/device.h>") rather than have these go in through their
respective maintainer trees, so that the build gets fixed as quickly as
possible.

Thierry

Thierry Reding (2):
  drm/rockchip: lvds: Explicitly include pinctrl headers
  mmc: meson-gx-mmc: Explicitly include pinctr/consumer.h

 drivers/gpu/drm/rockchip/rockchip_lvds.c | 2 ++
 drivers/mmc/host/meson-gx-mmc.c          | 1 +
 2 files changed, 3 insertions(+)

-- 
2.15.1

