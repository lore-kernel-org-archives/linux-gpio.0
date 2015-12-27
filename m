From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: Re: [PATCH] gpiolib: fix warning about iterator
Date: Sun, 27 Dec 2015 19:01:54 +0530
Message-ID: <20151227133154.GA8735@sudip-pc>
References: <1451116719-19158-1-git-send-email-sudipm.mukherjee@gmail.com>
 <CACRpkdZA7m=YzjVmQwzoKNzMu+QiOeA9s3Wu_axZYMw=5j-LnQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:34768 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754617AbbL0NcE (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Sun, 27 Dec 2015 08:32:04 -0500
Content-Disposition: inline
In-Reply-To: <CACRpkdZA7m=YzjVmQwzoKNzMu+QiOeA9s3Wu_axZYMw=5j-LnQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Ross Zwisler <ross.zwisler@linux.intel.com>, Alexandre Courbot <gnurou@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Sat, Dec 26, 2015 at 10:31:15PM +0100, Linus Walleij wrote:
> On Sat, Dec 26, 2015 at 8:58 AM, Sudip Mukherjee
> <sudipm.mukherjee@gmail.com> wrote:
> 
> > We were getting build warning about "iterator" being used uninitialized.
> > Use iterator properly to fix the build warning and in the process remove
> > the variable "pos" which is not required now.
> >
> > Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
> 
> Aha there is a real patch solving the problem. Sorry Ross,
> had to drop your patch and replace it with this.
> 
> Patch applied!

oops .. i think i have a small mistake in the patch. After the loop for
list_for_each_entry ends we are having:
        if (iterator->base + iterator->ngpio <= chip->base)
	                goto found;

But at the end of the loop iterator will point to head. The condition in
the loop is &pos->member != (head).
I am sending v2 as reply to this thread. It will be great if you can
review and apply that instead of this one.
Sorry for the inconvenience. I guess christmas effect. :)

regards
sudip
