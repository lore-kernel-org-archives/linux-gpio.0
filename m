From: Vincent Pelletier <plr.vincent@gmail.com>
Subject: gpio-f7188x: Fix concurrent GPIO accesses (and minor improvements)
Date: Thu, 20 Aug 2015 20:03:25 +0200
Message-ID: <1440093809-18234-1-git-send-email-plr.vincent@gmail.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173]:36989 "EHLO
	mail-wi0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751031AbbHTSDp (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 20 Aug 2015 14:03:45 -0400
Received: by widdq5 with SMTP id dq5so13035670wid.0
        for <linux-gpio@vger.kernel.org>; Thu, 20 Aug 2015 11:03:44 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Simon Guinot <simon.guinot@sequanux.org>

Hello,

Making intensive use of the GPIOs on this SuperIO chip, I triggered a race
condition causing apparently the wrong GPIO pins to be modified (and likely
read) randomly.
For some reason (unclear to me, I'm not used at all to kernel API),
request_muxed_region/release_region as it is used in this driver is not
sufficient to serialize accesses.
Also, reading other drivers for the same chip, I see a different pattern:
rather than accessing GPIO registers through the common IO region, this
region is only used for device discovery. From there, per-function base
address is retrieved, and that IO region gets requested once.

So I fixed the concurrent access by:
- using the same access pattern as in other drivers
- adding mutexes around IO region accesses

Once this was done and I got a bit more comfortable with this driver, chip and
gpiolib, I continued and fixed 3 minor issues/lacks.

Regards,
--
Vincent Pelletier

