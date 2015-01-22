From: "Chang, Rebecca Swee Fun" <rebecca.swee.fun.chang@intel.com>
Subject: RE: [PATCH 1/1] gpio: sch: Consolidate similar algorithms
Date: Thu, 22 Jan 2015 10:01:13 +0000
Message-ID: <50B33AC5ED75F74F991980326F1C438D18601B2C@PGSMSX108.gar.corp.intel.com>
References: <1421836341-2036-1-git-send-email-rebecca.swee.fun.chang@intel.com>
 <1421836341-2036-2-git-send-email-rebecca.swee.fun.chang@intel.com>
 <20150122094603.GW1850@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:3036 "EHLO mga02.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750792AbbAVKBS convert rfc822-to-8bit (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Jan 2015 05:01:18 -0500
In-Reply-To: <20150122094603.GW1850@lahna.fi.intel.com>
Content-Language: en-US
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Westerberg, Mika" <mika.westerberg@intel.com>, Alexandre Courbot <gnurou@gmail.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, GPIO Subsystem Mailing List <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi both,

Noted with thanks!

Rebecca

> -----Original Message-----
> From: Westerberg, Mika
> Sent: 22 January, 2015 5:46 PM
> To: Chang, Rebecca Swee Fun
> Cc: Linus Walleij; Alexandre Courbot; GPIO Subsystem Mailing List; Linux Kernel
> Mailing List
> Subject: Re: [PATCH 1/1] gpio: sch: Consolidate similar algorithms
> 
> On Wed, Jan 21, 2015 at 06:32:21PM +0800, Chang Rebecca Swee Fun wrote:
> > Consolidating similar algorithms into common functions to make GPIO
> > SCH simpler and manageable.
> >
> > Signed-off-by: Chang Rebecca Swee Fun
> > <rebecca.swee.fun.chang@intel.com>
> 
> Like Alexandre said, you can carry the Reviewed-by: tags with the patch if you
> only fixed build warning.
> 
> In future please make sure that patches compile without warnings and that
> they have proper testing done beforehand. Thanks.
> 
> Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
