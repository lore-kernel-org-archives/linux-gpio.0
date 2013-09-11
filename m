From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH 0/2] ARM: shmobile: Remove #gpio-ranges-cells property
Date: Wed, 11 Sep 2013 15:43:25 +0200
Message-ID: <1378907007-19152-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from perceval.ideasonboard.com ([95.142.166.194]:60779 "EHLO
	perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754154Ab3IKNni (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Sep 2013 09:43:38 -0400
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-sh@lists.infradead.org, linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Simon Horman <horms@verge.net.au>, devicetree-discuss@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org

The property has been deprecated and unused since commit
d9fe0039c4247383c2783923a3860227813b4d82 ("gpio: implement gpio-ranges binding
document fix"). Remove it.

This is a v3.12 fix, based on top of the latest mainline master branch.
Regression and backward compatibility issue should not occur, as:

- The first patch hardcodes the number of gpio-range cells to 3, which was the
  value used by all boards so far.

- The second patch removes a property from .dtsi files that isn't used anymore
  since the above-mentioned commit.

However, care must be taken to merge the patches in the correct order. Linus,
Simon, would you like to two patches to go through a single tree, or should
Linus provide a stable branch ?

Laurent Pinchart (2):
  gpio: rcar: Remove #gpio-range-cells DT property usage
  ARM: shmobile: Remove #gpio-ranges-cells DT property

 arch/arm/boot/dts/r8a7778.dtsi | 1 -
 arch/arm/boot/dts/r8a7779.dtsi | 1 -
 arch/arm/boot/dts/r8a7790.dtsi | 1 -
 drivers/gpio/gpio-rcar.c       | 7 +++----
 4 files changed, 3 insertions(+), 7 deletions(-)

-- 
Regards,

Laurent Pinchart

