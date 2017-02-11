From: robert.middleton@rm5248.com
Subject: MCP23S08 Interrupts Fix
Date: Sat, 11 Feb 2017 15:02:34 -0500
Message-ID: <1486843355-2386-1-git-send-email-robert.middleton@rm5248.com>
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from sub5.mail.dreamhost.com ([208.113.200.129]:37364 "EHLO
        homiemail-a79.g.dreamhost.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751047AbdBKUDK (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>);
        Sat, 11 Feb 2017 15:03:10 -0500
Received: from homiemail-a79.g.dreamhost.com (localhost [127.0.0.1])
        by homiemail-a79.g.dreamhost.com (Postfix) with ESMTP id 3F2F2600274A
        for <linux-gpio@vger.kernel.org>; Sat, 11 Feb 2017 12:03:09 -0800 (PST)
Received: from localhost.localdomain (50-195-76-73-static.hfc.comcastbusiness.net [50.195.76.73])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: robert.middleton@rm5248.com)
        by homiemail-a79.g.dreamhost.com (Postfix) with ESMTPSA id E93286002749
        for <linux-gpio@vger.kernel.org>; Sat, 11 Feb 2017 12:03:08 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org

This patch fixes the mcp23s08 interrupt logic so that when multiple pins are 
changed at the same time, the proper number of pin changes are reported.  
Without this patch, if more than one pin is changed at a time on the mcp23s08, 
the kernel will only report back the pin that actually caused the interrupt.  
The second pin that changed at the same time will not report a change.  This 
causes issues when both pins are being watched via their file descriptors in 
a poll(), since only one of the pins being watched will report a change.

Note that I had to break up some of the logic in the IRQ handler so that I 
could follow the code - this may not be compliant with the kernel coding 
standards.

This patch is against 4.9.9, although it should still apply without any issues 
to newer code.

-Robert Middleton

