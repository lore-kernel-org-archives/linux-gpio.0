From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Subject: Re: linux-next regression caused by "gpiolib: request the gpio
 before querying its direction"
Date: Wed, 30 Aug 2017 16:17:30 +0200
Message-ID: <20170830161730.41919554@windsurf.lan>
References: <20170830112424.7a3a7c36@windsurf.lan>
        <3cce6903-d167-1bfc-38b4-1fdd7b3ff24b@codeaurora.org>
        <87ziah2m3f.fsf@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail.free-electrons.com ([62.4.15.54]:43288 "EHLO
        mail.free-electrons.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751317AbdH3ORm (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 30 Aug 2017 10:17:42 -0400
In-Reply-To: <87ziah2m3f.fsf@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Gregory CLEMENT <gregory.clement@free-electrons.com>
Cc: Timur Tabi <timur@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Antoine =?UTF-8?B?VMOpbmFydA==?= <antoine.tenart@free-electrons.com>, =?UTF-8?B?TWlxdcOobA==?= Raynal <miquel.raynal@free-electrons.com>, Nadav Haklai <nadavh@marvell.com>

Hello,

On Wed, 30 Aug 2017 15:59:00 +0200, Gregory CLEMENT wrote:

> > When gpiochip_add_data() calls chip->request, what function is that
> > calling?  
> 
> the request callback is gpiochip_generic_request so I would be surprised
> that there was a bug in it.

The call chain leading to the problem is:

 gpiochip_add_data()
  chip->request() == gpiochip_generic_request()
   pinctrl_request_gpio()
    pinmux_request_gpio()
     pin_request()
      ops->gpio_request_enable() == mvebu_pinmux_gpio_request_enable()
       mvebu_pinconf_group_set()
        grp->ctrl->mpp_set() == mvebu_regmap_mpp_ctrl_set()

So what Timur is saying perhaps is that
mvebu_pinmux_gpio_request_enable() shouldn't be changing the type of
muxing, and therefore shouldn't be calling mvebu_pinconf_group_set().

However, even the "reference" pinctrl-single.c implementation does it,
in pcs_request_gpio().

Am I missing something ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
