From: Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH RFC 2/4] pinctrl: Rename mux group to group_or_pin to
 prepare for pin support
Date: Mon, 2 Oct 2017 11:10:37 +0100
Message-ID: <20171002101037.yzna7dpvyhrounaz@localhost.localdomain>
References: <20170929101503.6769-1-ckeepax@opensource.cirrus.com>
 <20170929101503.6769-3-ckeepax@opensource.cirrus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx0b-001ae601.pphosted.com ([67.231.152.168]:53290 "EHLO
        mx0b-001ae601.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750957AbdJBKKl (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 2 Oct 2017 06:10:41 -0400
Content-Disposition: inline
In-Reply-To: <20170929101503.6769-3-ckeepax@opensource.cirrus.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linus.walleij@linaro.org
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, patches@opensource.cirrus.com

On Fri, Sep 29, 2017 at 11:15:01AM +0100, Charles Keepax wrote:
> From: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> 
> To prepare for adding support for muxing individual pins rename the
> group member of the pinctrl_map_mux and pinctrl_setting_mux structs to
> group_or_pin.
> 
> Signed-off-by: Charles Keepax <ckeepax@opensource.wolfsonmicro.com>
> ---
>  include/linux/pinctrl/machine.h               |  2 +-
>  28 files changed, 59 insertions(+), 50 deletions(-)

> diff --git a/include/linux/pinctrl/machine.h b/include/linux/pinctrl/machine.h
> index 7fa5d87190c2..ec58c3647eb8 100644
> --- a/include/linux/pinctrl/machine.h
> +++ b/include/linux/pinctrl/machine.h
> @@ -32,7 +32,7 @@ enum pinctrl_map_type {
>   * @function: the mux function to select for the group
>   */
>  struct pinctrl_map_mux {
> -	const char *group;
> +	const char *group_or_pin;
>  	const char *function;
>  };

One additional fix is required for PIN_MAP_MUX_GROUP in this
file.

Thanks,
Charles
