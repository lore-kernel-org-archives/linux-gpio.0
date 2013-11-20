From: David Cohen <david.a.cohen@linux.intel.com>
Subject: Re: [PATCH] gpio: intel-mid: lock IRQs when starting them
Date: Wed, 20 Nov 2013 10:17:24 -0800
Message-ID: <528CFCB4.1070603@linux.intel.com>
References: <1384957655-23215-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:14158 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753716Ab3KTSTS (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Wed, 20 Nov 2013 13:19:18 -0500
In-Reply-To: <1384957655-23215-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>

On 11/20/2013 06:27 AM, Linus Walleij wrote:
> This uses the new API for tagging GPIO lines as in use by
> IRQs. This enforces a few semantic checks on how the underlying
> GPIO line is used.
> 
> Cc: David Cohen <david.a.cohen@linux.intel.com>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

Acked-by: David Cohen <david.a.cohen@linux.intel.com>
