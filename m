From: robert.middleton@rm5248.com
Subject: PATCH v2
Date: Wed, 22 Feb 2017 10:34:17 -0500
Message-ID: <1487777658-12951-1-git-send-email-robert.middleton@rm5248.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from hapkido.dreamhost.com ([66.33.216.122]:57293 "EHLO
        hapkido.dreamhost.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932684AbdBVPgG (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 22 Feb 2017 10:36:06 -0500
Received: from homiemail-a117.g.dreamhost.com (sub5.mail.dreamhost.com [208.113.200.129])
        by hapkido.dreamhost.com (Postfix) with ESMTP id BE9BECF827
        for <linux-gpio@vger.kernel.org>; Wed, 22 Feb 2017 07:35:52 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: linus.walleij@linaro.org, gnurou@gmail.com


This v2 patch changes the MCP23S08 interrupt logic to ensure that if multiple
inputs are changed at the same time, the kernel will be notified of all
the pins that changed.

I added several variables to the irq handler, however this means that there
are now quite a few local variables(possibly too many, as the kernel coding 
standard says that more than 5-10 is probably too many: 
https://www.kernel.org/doc/Documentation/process/coding-style.rst).  I'm 
not sure what the best way to fix this is, or if it has to be fixed.

-Robert Middleton
