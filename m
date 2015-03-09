From: "Westerberg, Mika" <mika.westerberg@intel.com>
Subject: Re: [PATCH] Fix one issue in pinctrl-cherryview.c
Date: Mon, 9 Mar 2015 11:17:22 +0200
Message-ID: <20150309091722.GM1758@lahna.fi.intel.com>
References: <C6287702A945AC47BE5DB5DFD4B5C6DD01841877@SHSMSX104.ccr.corp.intel.com>
 <20150226071109.GY1758@lahna.fi.intel.com>
 <20150227174717.GA19392@psi-dev26.jf.intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="Qz2CZ664xQdCRdPu"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([192.55.52.115]:22706 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751715AbbCIJR0 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Mon, 9 Mar 2015 05:17:26 -0400
Content-Disposition: inline
In-Reply-To: <20150227174717.GA19392@psi-dev26.jf.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: David Cohen <david.a.cohen@linux.intel.com>
Cc: "Zha, Qipeng" <qipeng.zha@intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, 'Linus Walleij' <linus.walleij@linaro.org>


--Qz2CZ664xQdCRdPu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 27, 2015 at 09:47:17AM -0800, David Cohen wrote:
> Hi Mika,
> 
> On Thu, Feb 26, 2015 at 09:11:09AM +0200, Westerberg, Mika wrote:
> > On Thu, Feb 26, 2015 at 05:10:13AM +0200, Zha, Qipeng wrote:
> > >    Hi
> > > 
> > >    Please check below patch(or attached), thanks.
> > > 
> > >    this is verified on Intel cherrytrail platform on linux 3.19-rc6.
> > 
> > In general you should send your patches inline and plain text to the
> > interested parties. Please take some time reading Documentation/SubmittingPatches.
> > 
> > Then do this:
> > 
> >  1) git format-patch -1
> > 
> > This results 0001-pinctrl-update-direction_output-function-of-cherryvi.patch
> > 
> >  2) git send-email --dry-run --to self 0001-pinctrl-update-direction_output-function-of-cherryvi.patch
> > 
> > Verify that it sends the patch only to you
> > 
> >  3) git send-email --to self 0001-pinctrl-update-direction_output-function-of-cherryvi.patch
> > 
> > Verify that the patch formatting and content is ok. If not, apply fixes
> > and start from 1).
> > 
> > Once you are happy with the result you can then send the patch like:
> > 
> >  4) git send-email --to ... --cc ...
> > 
> > and everyone is happy :)
> > 
> > The patch itself looks good to me.
> 
> Not sure if I missed something, but where's the patch? :)

It was attached. Here it is again (attached).

--Qz2CZ664xQdCRdPu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="0001-pinctrl-update-direction_output-function-of-cherryvi.patch"

>From e22a498f8d1c3317e86b6a18fbb4371010862692 Mon Sep 17 00:00:00 2001
From: "qipeng.zha" <qipeng.zha@intel.com>
Date: Fri, 13 Feb 2015 19:03:56 +0800
Subject: [PATCH] pinctrl: update direction_output function of cherryview
 driver

>From the comments of gpiod_direction_output(), need to set @value
as initial output, so update the lowlevel routine to make it work.

Signed-off-by: jason.cj.chen<jason.cj.chen@intel.com>
Signed-off-by: qipeng.zha <qipeng.zha@intel.com>
---
 drivers/pinctrl/intel/pinctrl-cherryview.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/intel/pinctrl-cherryview.c b/drivers/pinctrl/intel/pinctrl-cherryview.c
index e9f8b39..ee6a6de 100644
--- a/drivers/pinctrl/intel/pinctrl-cherryview.c
+++ b/drivers/pinctrl/intel/pinctrl-cherryview.c
@@ -1206,6 +1206,7 @@ static int chv_gpio_direction_input(struct gpio_chip *chip, unsigned offset)
 static int chv_gpio_direction_output(struct gpio_chip *chip, unsigned offset,
 				     int value)
 {
+	chv_gpio_set(chip, offset, value);
 	return pinctrl_gpio_direction_output(chip->base + offset);
 }
 
-- 
1.8.1.2


--Qz2CZ664xQdCRdPu--
