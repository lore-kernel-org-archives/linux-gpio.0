From: Gregory CLEMENT <gregory.clement@free-electrons.com>
Subject: Re: [PATCHv2 06/15] devicetree: bindings: add DT binding for the
 Marvell Armada 39x SoC family
Date: Mon, 23 Feb 2015 17:07:26 +0100
Message-ID: <54EB503E.5010502@free-electrons.com>
References: <1424451874-25375-1-git-send-email-thomas.petazzoni@free-electrons.com> <1424451874-25375-7-git-send-email-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from down.free-electrons.com ([37.187.137.238]:33364 "EHLO
	mail.free-electrons.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1752799AbbBWQHb (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Mon, 23 Feb 2015 11:07:31 -0500
In-Reply-To: <1424451874-25375-7-git-send-email-thomas.petazzoni@free-electrons.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Jason Cooper <jason@lakedaemon.net>, Andrew Lunn <andrew@lunn.ch>, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Pawel Moll <pawel.moll@arm.com>, Mark Rutland <mark.rutland@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kumar Gala <galak@codeaurora.org>, Mike Turquette <mturquette@linaro.org>, Stephen Boyd <sboyd@codeaurora.org>, Linus Walleij <linus.walleij@linaro.org>, linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, Tawfik Bayouk <tawfik@marvell.com>, Nadav Haklai <nadavh@marvell.com>, Lior Amsalem <alior@marvell.com>, Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Maxime Ripard <maxime.ripard@free-electrons.com>

Hi Thomas,

On 20/02/2015 18:04, Thomas Petazzoni wrote:
> The Marvell Armada 39x is a family of two SoCs: the Armada 390 and the
> Armada 398, with a slightly different number of interfaces. This
> commit introduces the Device Tree binding that documents the top-level
> compatible strings for Armada 39x based platforms.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Gregory CLEMENT <gregory.clement@free-electrons.com>


Thanks,

Gregory

> ---
>  Documentation/devicetree/bindings/arm/armada-39x.txt | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/armada-39x.txt
> 
> diff --git a/Documentation/devicetree/bindings/arm/armada-39x.txt b/Documentation/devicetree/bindings/arm/armada-39x.txt
> new file mode 100644
> index 0000000..53d4ff9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/armada-39x.txt
> @@ -0,0 +1,20 @@
> +Marvell Armada 39x Platforms Device Tree Bindings
> +-------------------------------------------------
> +
> +Boards with a SoC of the Marvell Armada 39x family shall have the
> +following property:
> +
> +Required root node property:
> +
> + - compatible: must contain "marvell,armada390"
> +
> +In addition, boards using the Marvell Armada 398 SoC shall have the
> +following property before the previous one:
> +
> +Required root node property:
> +
> +compatible: must contain "marvell,armada398"
> +
> +Example:
> +
> +compatible = "marvell,a398-db", "marvell,armada398", "marvell,armada390";
> 


-- 
Gregory Clement, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
