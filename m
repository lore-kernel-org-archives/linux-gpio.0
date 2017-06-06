From: rpjday@crashcourse.ca
Subject: why is gpiolib-legacy.o automatically compiled into gpiolib?
Date: Tue, 06 Jun 2017 06:59:55 -0400
Message-ID: <20170606065955.Horde.XoxPxs0B5NDB-5t0Ifgyr2E@crashcourse.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from cpanel2.indieserve.net ([199.212.143.6]:50270 "EHLO
        cpanel2.indieserve.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751671AbdFFK75 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Jun 2017 06:59:57 -0400
Received: from [::1] (port=47960 helo=cpanel2.indieserve.net)
        by cpanel2.indieserve.net with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
        (Exim 4.89)
        (envelope-from <rpjday@crashcourse.ca>)
        id 1dICDM-000142-2D
        for linux-gpio@vger.kernel.org; Tue, 06 Jun 2017 06:59:56 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org


   for the first time, going through the docs to learn about the descriptor
interface for GPIO, and while the Doc directory seems to suggest that the
"legacy" interface is deprecated, the drivers/gpio/Makefile contains the
line:

   obj-$(CONFIG_GPIOLIB)		+= gpiolib-legacy.o

so is that "legacy" file still required for descriptor-based interface?
i'm sure i'll figure it out if i keep reading, but a quick clarification
would not go unappreciated.

rday

