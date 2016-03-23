From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: Diagnosing ACPI trouble related to pinctr_cherryview on 4.4.x
Date: Wed, 23 Mar 2016 13:13:02 +0200
Message-ID: <20160323111302.GJ2099@lahna.fi.intel.com>
References: <CACPiFCKv=QJ0t5e=9Wm4cC4Spynx-tVCiabL7AcbcOkp_w47fQ@mail.gmail.com>
 <20160322152218.GA2099@lahna.fi.intel.com>
 <CACPiFC+hDF0+9vPCrhvo079E6RCVVmZXTS1ziS-jHAAZJQ+wNg@mail.gmail.com>
 <20160322154950.GB2099@lahna.fi.intel.com>
 <CACPiFCKS-8re6g1Zbhs8N9D_tDMENqXPeNGRS_0dU6tzz50T8A@mail.gmail.com>
 <20160322162222.GF2099@lahna.fi.intel.com>
 <CACPiFCKD_Nwut=GL-xOU5gN2k8Na7pFWdhsms85QsDTvvREJLw@mail.gmail.com>
 <1458668165.5907.28.camel@linux.intel.com>
 <CACPiFC+_TpiFFm+hYJd1tX4AnadxSj_KKOtDALjSj0_c8Qa2pA@mail.gmail.com>
 <CACPiFCL2rc-yMht2_CyPgLg35xamDobhzQVJjDed4FgpbX9gTA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:15867 "EHLO mga09.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752573AbcCWLNI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 23 Mar 2016 07:13:08 -0400
Content-Disposition: inline
In-Reply-To: <CACPiFCL2rc-yMht2_CyPgLg35xamDobhzQVJjDed4FgpbX9gTA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Martin Langhoff <martin.langhoff@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Tue, Mar 22, 2016 at 04:32:30PM -0400, Martin Langhoff wrote:
> ok so I've tried blacklisting all the modules suggested here, but they
> do not make a difference. What does make a difference is to have
> pinctrl_cherryview (as a module and ) blacklisted, _and_ noapic.

Does it work if you have only pictrl-cherryview blacklisted? E.g no
noapic?

You can also disable the HS-UART as it tries to divide by zero:

CONFIG_SERIAL_8250_DW=n
