From: Helmut Grohne <helmut@subdivi.de>
Subject: How to use a bidirectional gpio from userspace?
Date: Wed, 3 Jan 2018 08:50:20 +0100
Message-ID: <20180103075019.GA29466@alf.mars>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from isilmar-4.linta.de ([136.243.71.142]:59326 "EHLO
        isilmar-4.linta.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751648AbeACH7I (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 3 Jan 2018 02:59:08 -0500
Received: from isilmar-4.linta.de (isilmar.linta [10.0.0.1])
        by isilmar-4.linta.de (Postfix) with ESMTP id EB6B52008FB
        for <linux-gpio@vger.kernel.org>; Wed,  3 Jan 2018 07:50:34 +0000 (UTC)
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org

Hi,

For controlling gpios from userspace there currently are two APIs. The
older sysfs based API (which seems to be deprecated according to Linux
Walleij) and the /dev/gpiochipN ioctl API. I was trying to use the
latter from userspace and have a question on correctly using it.

For some devices it is necessary to toggle the direction of a gpio. For
instance W1 devices communicate over a single vcc/data wire. They have
an internal capacitor and communication is initiated by the host by
pulling the vcc/data line to ground and then listening to it. This
necessitates changing the direction of a gpio quite often and in-kernel
drivers for such devices tend to do that using gpiod_direction_input and
gpiod_direction_output (or the older non-d variant of them). Examples
include w1-gpio.c and dht11.c. Just how does one do that from userspace?

It seems that for driving a gpio as output one needs to obtain a
linehandle fd. To read the gpio, one needs a lineevent fd. If I
understand the API correctly, I cannot create both at the same time, so
switching the direction means closing a linehandle and obtaining a
linevent fd or vice versa. Is that correct?

If yes, I see a couple of downsides. First of all, I need to keep the
gpiochip fd open. Closing it would be good from a hardening pov. Then
closing the linehandle or lineevent releases the gpio and makes it
available to other users temporarily. Potentially a race condition is
introduced. Furthermore this switch of direction is relatively costly as
it allocates and frees quite some data structures.

With the sysfs API one can change the direction of an exported gpio with
a single write to the direction file.

Please Cc me in replies.

Helmut
