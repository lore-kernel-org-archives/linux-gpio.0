From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [RFC 1/3] Documentation: dt: Add devicetree bindings for NI USRP E3xx pinconf
Date: Fri, 06 Nov 2015 09:56:09 +0100
Message-ID: <13386304.3r3On4b7Qg@wuerfel>
References: <1446766883-25703-1-git-send-email-moritz.fischer@ettus.com> <1446766883-25703-2-git-send-email-moritz.fischer@ettus.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.24]:64231 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1031997AbbKFI4Z (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 6 Nov 2015 03:56:25 -0500
In-Reply-To: <1446766883-25703-2-git-send-email-moritz.fischer@ettus.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Moritz Fischer <moritz.fischer@ettus.com>
Cc: linus.walleij@linaro.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, robh+dt@kernel.org, pawel.moll@arm.com, mark.rutland@arm.com, ijc+devicetree@hellion.org.uk, galak@codeaurora.org, devicetree@vger.kernel.org

On Thursday 05 November 2015 15:41:21 Moritz Fischer wrote:
> +       e3xx_pinctrl: e3xx-pinctrl@40200a00 {

Just "pinctrl@40200a00"

> +               compatible = "ettus,e3xx-pinctrl-1.0";

no wildcards in the name, use exact chip revisions here. If two chips
use the same one, add a fallback to the older version in the dts file
of the newer one.

	Arnd
