From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: small pca953x update and fix for of.
Date: Tue,  8 Dec 2015 10:19:24 +0000
Message-ID: <1449569966-16816-1-git-send-email-ben.dooks@codethink.co.uk>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from ducie-dc1.codethink.co.uk ([185.25.241.215]:59172 "EHLO
	ducie-dc1.codethink.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932515AbbLHKTe (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Tue, 8 Dec 2015 05:19:34 -0500
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: ben.dooks@codethink.co.uk, linus.walleij@linaro.org, gnurou@gmail.com, linux-gpio@vger.kernel.org

When adding support for the OnSemi PCA9654 device to the pca953x driver
it was found that the driver did not work with of probing. This small
series adds the of-id for onsemi,pca9654 and fixes the of-only probe.

