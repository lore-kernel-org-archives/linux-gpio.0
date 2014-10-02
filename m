From: Benoit Parrot <bparrot@ti.com>
Subject: Re: [RFC PATCH] gpio: add GPIO hogging mechanism
Date: Thu, 2 Oct 2014 15:47:56 +0000 (UTC)
Message-ID: <loom.20141002T174034-940@post.gmane.org>
References: <1387463671-1164-1-git-send-email-b.brezillon@overkiz.com> <1387463671-1164-2-git-send-email-b.brezillon@overkiz.com> <CACRpkdb=atfrW+Wqbi17a1KhstS7XHkutuXsM24gL2VPEri_cw@mail.gmail.com> <52CD25FE.8010701@overkiz.com> <CACRpkdaEOyj-WcmR9e366O+qjLRZufo9732KUUB_OCXbER-YEQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from plane.gmane.org ([80.91.229.3]:41067 "EHLO plane.gmane.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753330AbaJBPuH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 2 Oct 2014 11:50:07 -0400
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <glg-linux-gpio@m.gmane.org>)
	id 1XZidn-0004tH-2o
	for linux-gpio@vger.kernel.org; Thu, 02 Oct 2014 17:50:03 +0200
Received: from proxysb01-out.ext.ti.com ([192.94.94.105])
        by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-gpio@vger.kernel.org>; Thu, 02 Oct 2014 17:50:03 +0200
Received: from bparrot by proxysb01-out.ext.ti.com with local (Gmexim 0.1 (Debian))
        id 1AlnuQ-0007hv-00
        for <linux-gpio@vger.kernel.org>; Thu, 02 Oct 2014 17:50:03 +0200
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org

Linus Walleij <linus.walleij <at> linaro.org> writes:

> 
> On Wed, Jan 8, 2014 at 11:18 AM, boris brezillon
> <b.brezillon <at> overkiz.com> wrote:
> 
> > Anyway, do you want me to rework the gpio hog as described below ?
> 
> If you feel you have time, drive and a proper usecase for testing it,
> sure. I just want it to be driven my someone who *really* needs
> that feature.

As Felipe mentioned we do have several evm with IO-expander controlling 
various mux. This feature would be very nice to have as we now have to 
insert the board related gpio setting code in the pdata-quirks which 
works temporarily but we are looking for an upstreamable solution.

I am leaning toward taking Boris patch set and reworking them given the 
comments you already had, unless you have a better ideas in mind.

Regards,
Benoit Parrot

> 
> Yours,
> Linus Walleij
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" 
in
> the body of a message to majordomo <at> vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 




