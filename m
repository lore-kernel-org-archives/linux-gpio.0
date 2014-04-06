From: Michael Heimpold <mhei@heimpold.de>
Subject: Question about gpio sysfs interface
Date: Sun, 06 Apr 2014 20:56:41 +0200
Message-ID: <1420047.Pa7NFNg2Xt@kerker>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.219]:38769 "EHLO
	mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754355AbaDFS4n (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 6 Apr 2014 14:56:43 -0400
Received: from tonne.mhei.heimpold.itr (dslb-178-000-141-109.pools.arcor-ip.net [178.0.141.109])
	by post.strato.de (RZmta 32.31 DYNA|AUTH)
	with ESMTPA id x058e3q36Iuf6vm
	for <linux-gpio@vger.kernel.org>;
	Sun, 6 Apr 2014 20:56:41 +0200 (CEST)
Received: from kerker.localnet (kerker.mhei.heimpold.itr [192.168.8.1])
	by tonne.mhei.heimpold.itr (Postfix) with ESMTPS id 7A7C8116306
	for <linux-gpio@vger.kernel.org>; Sun,  6 Apr 2014 20:56:41 +0200 (CEST)
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org

Hi,

I have a question regarding user-space gpio support with sysfs.

Documentation/gpio/sysfs.txt states
> GPIO signals have paths like /sys/class/gpio/gpio42/ (for GPIO #42)
> and have the following read/write attributes:
>
>    /sys/class/gpio/gpioN/
>
>	"direction" ... reads as either "in" or "out". This value may
>		normally be written. ...
>
>		Note that this attribute *will not exist* if the kernel
>		doesn't support changing the direction of a GPIO, or
>		it was exported by kernel code that didn't explicitly
>		allow userspace to reconfigure this GPIO's direction.

Imagine for example a generic user-space tool which enumerates
all available GPIOs to the user and sorts by input and output GPIOs.
How would such a tool classify an exported GPIO when kernel
doesn't export the 'direction' file via sysfs? Or in other words: how
can userspace detect the state (in vs. out) of a GPIO when 'direction'
is not exported?

I propose to change the API that direction is always exported, but
is only readable when hardware doesn't support changing the
direction and/or kernel code wants to prohibit this.

Best regards,
Michael

