From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] gpio: stmpe: forbid unused lines to be mapped as IRQs
Date: Thu, 29 Sep 2016 09:40:55 +0300
Message-ID: <20160929064055.GF1218@lahna.fi.intel.com>
References: <1475017624-29686-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga05.intel.com ([192.55.52.43]:7178 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751038AbcI2GlA (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 29 Sep 2016 02:41:00 -0400
Content-Disposition: inline
In-Reply-To: <1475017624-29686-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Patrice Chotard <patrice.chotard@st.com>

On Tue, Sep 27, 2016 at 04:07:04PM -0700, Linus Walleij wrote:
> Exploit the new mechanism for masking off disallowed IRQs
> added by Mika Westerberg to properly manage the STMPE
> "norequest mask" to disallow also mapping said lines as
> IRQs.
> 
> Cc: Patrice Chotard <patrice.chotard@st.com>
> Cc: Mika Westerberg <mika.westerberg@linux.intel.com>

Good to see it being useful outside of pinctrl-cherryview.c :-)

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
