From: Mika Westerberg <mika.westerberg@intel.com>
Subject: Re: [PATCH 1/1] gpio: sch: Consolidate similar algorithms
Date: Thu, 22 Jan 2015 11:46:03 +0200
Message-ID: <20150122094603.GW1850@lahna.fi.intel.com>
References: <1421836341-2036-1-git-send-email-rebecca.swee.fun.chang@intel.com>
 <1421836341-2036-2-git-send-email-rebecca.swee.fun.chang@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:33809 "EHLO mga03.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750759AbbAVJqH (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 22 Jan 2015 04:46:07 -0500
Content-Disposition: inline
In-Reply-To: <1421836341-2036-2-git-send-email-rebecca.swee.fun.chang@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Alexandre Courbot <gnurou@gmail.com>, GPIO Subsystem Mailing List <linux-gpio@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Jan 21, 2015 at 06:32:21PM +0800, Chang Rebecca Swee Fun wrote:
> Consolidating similar algorithms into common functions to make
> GPIO SCH simpler and manageable.
> 
> Signed-off-by: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>

Like Alexandre said, you can carry the Reviewed-by: tags with the patch
if you only fixed build warning.

In future please make sure that patches compile without warnings and
that they have proper testing done beforehand. Thanks.

Reviewed-by: Mika Westerberg <mika.westerberg@linux.intel.com>
