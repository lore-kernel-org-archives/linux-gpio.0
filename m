From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: cherryview: fix issues caused by dynamic gpio
 irqs mapping
Date: Wed, 4 Oct 2017 09:41:03 +0300
Message-ID: <20171004064103.GO2761@lahna.fi.intel.com>
References: <20171003170049.24480-1-grygorii.strashko@ti.com>
 <CAHp75Vce0v0d9x4AiDnbNfqv4c_erxwNXsd+ApCTEfybCEOMdA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:9694 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750797AbdJDGlI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 4 Oct 2017 02:41:08 -0400
Content-Disposition: inline
In-Reply-To: <CAHp75Vce0v0d9x4AiDnbNfqv4c_erxwNXsd+ApCTEfybCEOMdA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Grygorii Strashko <grygorii.strashko@ti.com>, Linus Walleij <linus.walleij@linaro.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Gorman <chrisjohgorman@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>

On Tue, Oct 03, 2017 at 08:54:30PM +0300, Andy Shevchenko wrote:
> I'm not sure about this approach. It might be some other broken BIOS
> discovered with some other driver (like pinctrl-baytrail.c as an
> hypothetical example).

Let's deal that separately if it ever happens.

> Alternative is to deselect SPARSE_IRQ (though it makes it non-usable
> in entire x86 world).

No way.
