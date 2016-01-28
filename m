From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 3/3] mfd: lpc_ich: add GPIO support for Baytrail
Date: Thu, 28 Jan 2016 17:48:22 +0200
Message-ID: <20160128154822.GC1778@lahna.fi.intel.com>
References: <1453566729-30220-1-git-send-email-antoine.tenart@free-electrons.com>
 <1453566729-30220-4-git-send-email-antoine.tenart@free-electrons.com>
 <CACRpkdYJPeYmp7pdn7qjt=VD6rsa7GBRpdFnCJ1t06SFCJPxNA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:49566 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S965872AbcA1Pvn (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 28 Jan 2016 10:51:43 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdYJPeYmp7pdn7qjt=VD6rsa7GBRpdFnCJ1t06SFCJPxNA@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>, "ptyser@xes-inc.com" <ptyser@xes-inc.com>, Lee Jones <lee.jones@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Jan 28, 2016 at 11:34:40AM +0100, Linus Walleij wrote:
> On Sat, Jan 23, 2016 at 5:32 PM, Antoine Tenart
> <antoine.tenart@free-electrons.com> wrote:
> 
> > This patch adds the GPIO support for the Baytrail family.
> >
> > Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
> 
> I'm confused by this and Mika's comment on patch 0.
> 
> Is the BayTrail an ICH variant or not? Or does it have
> two GPIO controllers? Or um ....

It is not compatible with ICH and there is only one GPIO controller in
the SoC.
