From: Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH] Revert "pinctrl: amd: make it explicitly non-modular"
Date: Tue, 19 Jul 2016 10:46:29 +0200
Message-ID: <20160719104629.656ef179@endymion>
References: <20160719003030.26420-1-paul.gortmaker@windriver.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:58845 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752558AbcGSIqk (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Tue, 19 Jul 2016 04:46:40 -0400
In-Reply-To: <20160719003030.26420-1-paul.gortmaker@windriver.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: linux-kernel@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

Hi Paul,

On Mon, 18 Jul 2016 20:30:30 -0400, Paul Gortmaker wrote:
> This reverts commit b8c2b10a9bc0272a20e096852f8fbbf361749dda.
> 
> This patch was in my queue at the same time that a conversion of
> the same driver from bool --> tristate was pending and merged.
> 
> That is commit 337ea0fb1535 ("pinctrl: Turn AMD support to tristate")

I can't find this commit anywhere, but I would certainly prefer this to
making the driver non-modular. So I vote in favor of this revert.

Acked-by: Jean Delvare <jdelvare@suse.de>

Thanks,
-- 
Jean Delvare
SUSE L3 Support
