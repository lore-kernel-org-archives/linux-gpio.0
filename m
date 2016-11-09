From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: Configure pin as GPIO input when used
 directly through irqchip
Date: Wed, 9 Nov 2016 13:48:37 +0200
Message-ID: <1d97d968-e425-0319-7d9d-6ea8f65ab78c@linux.intel.com>
References: <20161109112231.122700-1-mika.westerberg@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:46455 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751674AbcKILvc (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 9 Nov 2016 06:51:32 -0500
In-Reply-To: <20161109112231.122700-1-mika.westerberg@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, linux-gpio@vger.kernel.org

On 11/09/2016 01:22 PM, Mika Westerberg wrote:
> If a pin is used directly through irqchip without requesting it first as
> GPIO, it might be in wrong mode (for example input buffer disabled). This
> means the user may never get any interrupts.
>
> Fix this by configuring the pin as GPIO input when its type is first set in
> irq_set_type().
>
> Reported-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
> Since we probably need to do this for cherryview and baytrail pinctrl
> drivers as well, I'm thinking is this something that the GPIO core could do
> automatically?
>
>  drivers/pinctrl/intel/pinctrl-intel.c | 46 +++++++++++++++++++++++------------
>  1 file changed, 31 insertions(+), 15 deletions(-)
>
Tested-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
