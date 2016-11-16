From: Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH 1/2] ARM: dts: rockchip: add the sdmmc pinctrl for rk1108
Date: Wed, 16 Nov 2016 13:42:28 +0100
Message-ID: <17426494.06vbuIDA0O@phil>
References: <1479024799-29198-1-git-send-email-jacob-chen@iotwrt.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from gloria.sntech.de ([95.129.55.99]:58934 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752755AbcKPMmt (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 16 Nov 2016 07:42:49 -0500
In-Reply-To: <1479024799-29198-1-git-send-email-jacob-chen@iotwrt.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jacob Chen <jacob-chen@iotwrt.com>
Cc: andy.yan@rock-chips.com, linux-gpio@vger.kernel.org, linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jacob Chen <jacob2.chen@rock-chips.com>

Am Sonntag, 13. November 2016, 16:13:18 CET schrieb Jacob Chen:
> From: Jacob Chen <jacob2.chen@rock-chips.com>
> 
> Signed-off-by: Jacob Chen <jacob2.chen@rock-chips.com>
> ---
>  arch/arm/boot/dts/rk1108.dtsi | 25 +++++++++++++++++++++++++
>  1 file changed, 25 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/rk1108.dtsi b/arch/arm/boot/dts/rk1108.dtsi
> index 9dccfea..6a06ad7 100644
> --- a/arch/arm/boot/dts/rk1108.dtsi
> +++ b/arch/arm/boot/dts/rk1108.dtsi
> @@ -321,6 +321,31 @@
>  			input-enable;
>  		};
> 
> +        sdmmc {

I've fixed the intendation here (needed tabs instead of spaces) and moved the 
block to its alphabetically correct position between i2c and uart nodes and 
applied the result to my dts32 branch.


Thanks
Heiko

