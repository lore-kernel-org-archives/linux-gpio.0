From: Benjamin Henrion <zoobab@gmail.com>
Subject: ch341 gpio over USB help needed
Date: Thu, 13 Apr 2017 11:30:58 +0200
Message-ID: <CANjd3nd5K_=WSNQ4Yswv8m_JQqrQP1F7KcRi=eVzzMwk5vzRSw@mail.gmail.com>
Reply-To: zoobab@gmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-io0-f170.google.com ([209.85.223.170]:34579 "EHLO
        mail-io0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750811AbdDMJbA (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Apr 2017 05:31:00 -0400
Received: by mail-io0-f170.google.com with SMTP id a103so73392514ioj.1
        for <linux-gpio@vger.kernel.org>; Thu, 13 Apr 2017 02:31:00 -0700 (PDT)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org

Hi,

I found a cheap USB dongle based on ch341 chip, which has 8 GPIOs
available (D0-D7):

http://www.zoobab.com/ch341-usb-spi-i2c-uart-isp-dongle
https://github.com/zoobab/ch341-parport

I mirrored the driver published by WCH, they have a cli and a gui
interface to toggle the pins, but I cannot figure out what to pass
over there.

My goal is to sniff and write some simple toggling tool with libusb,
and then make a proper kernel driver for it (sysfs to start with).

Anyone can help?

Best,

--
Benjamin Henrion <bhenrion at ffii.org>
FFII Brussels - +32-484-566109 - +32-2-3500762
"In July 2005, after several failed attempts to legalise software
patents in Europe, the patent establishment changed its strategy.
Instead of explicitly seeking to sanction the patentability of
software, they are now seeking to create a central European patent
court, which would establish and enforce patentability rules in their
favor, without any possibility of correction by competing courts or
democratically elected legislators."
