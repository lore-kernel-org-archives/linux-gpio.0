Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A5AFC433FE
	for <linux-gpio@archiver.kernel.org>; Wed,  6 Apr 2022 23:20:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232339AbiDFXWR (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 6 Apr 2022 19:22:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232191AbiDFXWP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Apr 2022 19:22:15 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0820E7F43;
        Wed,  6 Apr 2022 16:20:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=NvXK5y7VDDAd/cYuc7P0sVm+jsXxmDifu71RQtl0hYU=; b=VWHXu1ZbbJSuGsxaP+bWqGKoGI
        qJQxdQNFIAXtEhLUX+6SqiWX4Og07U1eQ5K8C4t03ga+mR5q5bVmzk157jdTVVku2j8TuyUdopRmk
        Bxn9Zqj2wuq1gjfPr9F+71oQS4SycoKs0d0so+JGC04PGzKI0pmI2LT3eQ5989Pllcwg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1ncEwY-00EX2F-Gr; Thu, 07 Apr 2022 01:20:06 +0200
Date:   Thu, 7 Apr 2022 01:20:06 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org,
        gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com,
        kostap@marvell.com, robert.marko@sartura.hr,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] dt-bindings: pinctrl: mvebu: Document bindings
 for AC5
Message-ID: <Yk4gJpnFBL8yJLOM@lunn.ch>
References: <20220406032158.1449049-1-chris.packham@alliedtelesis.co.nz>
 <20220406032158.1449049-2-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220406032158.1449049-2-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Apr 06, 2022 at 03:21:55PM +1200, Chris Packham wrote:
> Add JSON schema for marvell,ac5-pinctrl present on the Marvell 98DX2530
> SoC.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
