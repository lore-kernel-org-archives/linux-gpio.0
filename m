From: Agron Selimaj <as9902613@gmail.com>
Subject: Bring a new x86_64 device to Linux
Date: Mon, 18 Aug 2014 11:59:47 -0400
Message-ID: <CA+_PYyuy_4Y+YfVnW7yPLP2AA6vbpqvwLaW7w5PyKHxVDhaD8Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pd0-f174.google.com ([209.85.192.174]:53618 "EHLO
	mail-pd0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751057AbaHRP7u (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 18 Aug 2014 11:59:50 -0400
Received: by mail-pd0-f174.google.com with SMTP id fp1so7749550pdb.5
        for <linux-gpio@vger.kernel.org>; Mon, 18 Aug 2014 08:59:47 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org

Hello,

I am making a GPIO driver for a custom x86_64 motherboard.

It came with a windows driver which is fairly simple but before
reading or witting to a certain GPIO pin I have to keep reading an
other ioport with inb() until GPIO data is ready.

However, I need to make sure this is the right motherboard so I am
reading a 10 byte string where the model information is located, but
just before I read the last byte the kernel is killing my kernel
module and marking it as tainted. Why would this happen?

I also noticed that detection and probing is now done using platform
drivers on ARM platform. I would like to follow the same on x86_64 but
I don't find any documentation/examples to help me.


The kernel version I am working on is 3.12.21
