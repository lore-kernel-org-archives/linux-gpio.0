From: "Zhu, Lejun" <lejun.zhu@linux.intel.com>
Subject: Re: [PATCH v3] gpio: Add support for Intel SoC PMIC (Crystal Cove)
Date: Fri, 23 May 2014 09:26:15 +0800
Message-ID: <537EA3B7.2080307@linux.intel.com>
References: <1400734743-3154-1-git-send-email-lejun.zhu@linux.intel.com> <20140522111554.GG1651@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:11349 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750872AbaEWB0T (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 22 May 2014 21:26:19 -0400
In-Reply-To: <20140522111554.GG1651@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, mathias.nyman@linux.intel.com, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, jacob.jun.pan@linux.intel.com, bin.yang@intel.com


On 5/22/2014 7:15 PM, Mika Westerberg wrote:
> I suppose this is dependent on the MFD driver right? If so, this should
> probably be merged along with that patch.
> 

The MFD driver has been submitted on LKML as well. I think these two
drivers can be pulled into corresponding trees, and meet each other in
the Linus tree in the end, right?

Best Regards
Lejun
