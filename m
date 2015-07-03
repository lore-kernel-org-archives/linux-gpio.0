From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v3 0/3] Remove non-existing GPIO pins for R8A7790/1
Date: Sat, 04 Jul 2015 02:29:57 +0300
Message-ID: <1483256.kDOgcO6qW3@avalon>
References: <1460630.GxHT4lRd7u@wasted.cogentembedded.com> <558DBB45.3020507@cogentembedded.com> <CACRpkdZNqkoz9xSikCgKdp3LGgQnb4BRcOuF0nnc1rd49aS6xQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from galahad.ideasonboard.com ([185.26.127.97]:54817 "EHLO
	galahad.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755683AbbGCX3v (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 3 Jul 2015 19:29:51 -0400
In-Reply-To: <CACRpkdZNqkoz9xSikCgKdp3LGgQnb4BRcOuF0nnc1rd49aS6xQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

Hello,

On Monday 29 June 2015 12:43:09 Linus Walleij wrote:
> On Fri, Jun 26, 2015 at 10:51 PM, Sergei Shtylyov wrote:
> > On 06/26/2015 01:39 AM, Sergei Shtylyov wrote:
> >> Here's the set of 3 patches against the 'fixes' branch of Linus
> >> Walleij's
> >> 'linux-pinctrl.git' repo. Here we eliminate the pin array "holes" on
> >> R-Car SoCs and then remove unused GPIO pins for R8A7790/1.
> >> 
> >> 
> >> [1/3] sh-pfc: fix sparse GPIOs for R-Car SoCs
> >> 
> >    Note that this patch is necessary for the R8A7794 driver (already in
> > 
> > Linus' tree to work correctly.
> 
> Laurent is it OK to apply these three for fixes?

Sorry for the delay. I'll try to review this patch set on Monday.

-- 
Regards,

Laurent Pinchart

