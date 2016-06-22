From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: baytrail: Fix mingled clock pins
Date: Wed, 22 Jun 2016 18:33:13 +0300
Message-ID: <20160622153313.GB1718@lahna.fi.intel.com>
References: <1466594239-10988-1-git-send-email-cristina.ciocan@intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:1574 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751434AbcFVPfQ (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 22 Jun 2016 11:35:16 -0400
Content-Disposition: inline
In-Reply-To: <1466594239-10988-1-git-send-email-cristina.ciocan@intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Cristina Ciocan <cristina.ciocan@intel.com>
Cc: heikki.krogerus@linux.intel.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, irina.tirdea@intel.com

On Wed, Jun 22, 2016 at 02:17:19PM +0300, Cristina Ciocan wrote:
> Fix plt clock 3, 4 and 5 pins, which were not in the proper order.
> 
> Signed-off-by: Cristina Ciocan <cristina.ciocan@intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
