From: Gottfried Haider <gottfried.haider@gmail.com>
Subject: Pull-up/down control via sysfs
Date: Sun, 14 Jun 2015 21:44:10 +0200
Message-ID: <CAPoCmY+Py2Ngq4M8OwTV7egSp7bQoGR4kbFpyRN6+DGzHZnfHA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oi0-f53.google.com ([209.85.218.53]:34266 "EHLO
	mail-oi0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752091AbbFNTob (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 14 Jun 2015 15:44:31 -0400
Received: by oigz2 with SMTP id z2so47269972oig.1
        for <linux-gpio@vger.kernel.org>; Sun, 14 Jun 2015 12:44:31 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org

Hello all,

I am interested in implementing a sysfs way to control pull-up/down
bias for gpio pins. I believe the pinctrl subsystem offers a pin
configuration interface [1] that my driver could implement for this,
but I am not sure about cross-referencing this from the gpio subsystem
and getting sysfs access..

Any hints/pointers would be greatly appreciated.

Thanks
Gottfried

[1] http://www.df.lth.se/~triad/papers/pincontrol-gpio-update.pdf (p. 12)
