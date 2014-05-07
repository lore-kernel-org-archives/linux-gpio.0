From: Johannes Berg <johannes@sipsolutions.net>
Subject: Re: [PATCHv2] rfkill-gpio: Use gpio cansleep version
Date: Wed, 07 May 2014 13:21:08 +0200
Message-ID: <1399461668.10517.19.camel@jlt4.sipsolutions.net>
References: <1399455491-4491-1-git-send-email-loic.poulain@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from s3.sipsolutions.net ([144.76.43.152]:49515 "EHLO
	sipsolutions.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751414AbaEGLVL (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 7 May 2014 07:21:11 -0400
In-Reply-To: <1399455491-4491-1-git-send-email-loic.poulain@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Loic Poulain <loic.poulain@intel.com>
Cc: linux-wireless@vger.kernel.org, linux-gpio@vger.kernel.org

On Wed, 2014-05-07 at 11:38 +0200, Loic Poulain wrote:
> If gpio controller requires waiting for read and write
> GPIO values, then we have to use the gpio cansleep api.
> Fix the rfkill_gpio_set_power which calls only the
> nonsleep version (causing kernel warning).
> There is no problem to use the cansleep version here
> because we are not in IRQ handler or similar context
> (cf rfkill_set_block).

Applied.

johannes

