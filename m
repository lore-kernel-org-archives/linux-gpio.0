From: Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH] pinctrl: ti: The IODelay driver is a DRA7xxx feature so
 depend on that SoC
Date: Thu, 2 Mar 2017 09:57:44 -0800
Message-ID: <20170302175743.GK3897@atomide.com>
References: <20170302174636.6662-1-pbrobinson@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from muru.com ([72.249.23.125]:37368 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753851AbdCBSXf (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 2 Mar 2017 13:23:35 -0500
Content-Disposition: inline
In-Reply-To: <20170302174636.6662-1-pbrobinson@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Peter Robinson <pbrobinson@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Nishanth Menon <nm@ti.com>, linux-gpio@vger.kernel.org

* Peter Robinson <pbrobinson@gmail.com> [170302 09:48]:
> As the IODelay driver is a hardware feature of the  DRA7xxx SoC
> depend on that SoC and compile test.

Acked-by: Tony Lindgren <tony@atomide.com>
