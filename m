From: Krzysztof Adamski <k@japko.eu>
Subject: Default pin direction after exporting/requesting
Date: Wed, 10 Feb 2016 08:36:12 +0100
Message-ID: <20160210073612.GB19622@box2.japko.eu>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from box2.japko.eu ([91.121.152.53]:40007 "EHLO box2.japko.eu"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750988AbcBJHgn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 10 Feb 2016 02:36:43 -0500
Received: from box2.japko.eu (localhost.localdomain [127.0.0.1])
	by box2.japko.eu (Postfix) with ESMTPA id 9501C61CE0
	for <linux-gpio@vger.kernel.org>; Wed, 10 Feb 2016 08:36:12 +0100 (CET)
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org

Hi,

While playing with sunxi SoC based board GPIOs I found out that after 
exporting a GPIO it's direction is set to "in" but it's not able to 
actually sense any value unless I manually write "in" to 
/sys/class/gpioX/direction.

This is because on those SoCs default GPIO function is "disabled" and it 
is not changed when GPIO is exported. Since "direction" only supports 
two stated (in/out) there is no way this state could be represented. I 
see this as a bug and would like to fix this but I'm not sure what would 
be preffered way.

- write my own "request" handler instead of using 
  "gpiochip_generic_request" for "gpio_chip" structre (this was my first 
  try but sunxi dev wasn't convinced it's a good place for this change)

- keep using "gpiochip_generic_request" and write "gpio_request_enable" 
  handler for "pinmux_ops"

- change higher layers, like gpiolib, to enforce setting gpio direction 
  as input when exporting/requesting GPIO

Or maybe there is even better way of doing that? I couldn't find any 
documentation that clearly states what state should GPIO be in after 
requesting/exporting but clearly at least gpiolib sysfs interface expect 
it to be set as input.

Best regards,
Krzysztof Adamski
