From: Michal Schorm <mschorm@redhat.com>
Subject: [libgpiod] Braswell GPIO newbie question
Date: Thu, 15 Feb 2018 15:06:17 +0100
Message-ID: <CALC7GWzP5Z7iQP_6zR9CWPgsD+QswDchBqnnX+p8THTOv8ukFg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:46908 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1032283AbeBOOGj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 15 Feb 2018 09:06:39 -0500
Received: by mail-lf0-f67.google.com with SMTP id q194so34200987lfe.13
        for <linux-gpio@vger.kernel.org>; Thu, 15 Feb 2018 06:06:39 -0800 (PST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org

Hello,

I got myself an UDOO development board with x86_64 processor, running
Fedora 27, and trying to work with GPIO.
Fedora don't use the 'sysfs' kernel module anymore, which makes it
nearly impossible to google *any* help.

However, I was able to finish a C code, that worked with GPIO with linux/gpio.h
https://github.com/FaramosCZ/UDOO/blob/gpio/gpio_3.c

It looks like it does the job, even 'libgpiod' tools confirm.

However one problem remains.
I have zero idea, which physical pin is referenced by which chip and
line in the system.

Here's the best reference for the board and Braswell GPIO pinout:
https://www.udoo.org/docs-x86/Hardware_Reference/Pinout_Braswell.html

Here's my call for help on the UDOO project forum:
https://www.udoo.org/forum/threads/gpio-on-fedora-27.11288/

Since you are the author / maintainer of the new kernel gpio module,
I'm reaching to you for help.

Let's say, I just want to light up a LED on pins 36 & 37, one with
'0', other with '1' set. (Yeah, 1,8V not much for LED, but it could be
visible)
How can I do that?
What should I know? learn?

--

Michal Schorm
Associate Software Engineer
Core Services - Databases Team
Red Hat
