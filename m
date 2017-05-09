From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH] pinctrl: imx: Check for memory allocation failure
Date: Tue, 9 May 2017 10:27:20 +0300
Message-ID: <20170509072720.xq6pwuxe43wjbgox@mwanda>
References: <20170506082359.6736-1-christophe.jaillet@wanadoo.fr>
 <20170506194038.GI17317@lianli.shorne-pla.net>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:48580 "EHLO
        userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751274AbdEIH2F (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 May 2017 03:28:05 -0400
Content-Disposition: inline
In-Reply-To: <20170506194038.GI17317@lianli.shorne-pla.net>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Stafford Horne <shorne@gmail.com>
Cc: Christophe JAILLET <christophe.jaillet@wanadoo.fr>, linus.walleij@linaro.org, gary.bisson@boundarydevices.com, vladimir_zapolskiy@mentor.com, tony@atomide.com, vivien.didelot@savoirfairelinux.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On Sun, May 07, 2017 at 04:40:38AM +0900, Stafford Horne wrote:
> Hi Christophe,
> 
> On Sat, May 06, 2017 at 10:23:59AM +0200, Christophe JAILLET wrote:
> > If 'devm_kzalloc' fails, a NULL pointer will be dereferenced.
> > Return -ENOMEM instead, as done for the other memory allocation just a
> > few lines below.
> 
> This looks fine.
> 
> > BTW, change the 'devm_kzalloc' into a 'devm_kcalloc'.
> 
> Any reason for the devm_kcalloc change?  It looks like the next for loop
> does set all of the group_name values.
> 

The advantage of kcalloc() over kzalloc() is the integer overflow
checking.  There is kmalloc_array() if we don't need to zero the memory.

regards,
dan carpenter

