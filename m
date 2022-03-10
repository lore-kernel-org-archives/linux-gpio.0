Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE03DC433EF
	for <linux-gpio@archiver.kernel.org>; Thu, 10 Mar 2022 13:59:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242613AbiCJOAw (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 10 Mar 2022 09:00:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231335AbiCJOAw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 10 Mar 2022 09:00:52 -0500
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BC9B12D931;
        Thu, 10 Mar 2022 05:59:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=sMXDG3iPLIAfzMIqiebQ+/yXHBBD9O0BpUAfr3dOufU=; b=CfEItpNecM2XkSGUyIthwIn1Lk
        OG5b3HXdwEFmY4DrSaU5OnmPf0vUKIYpFDOA8IgM3iGib/nLh/1XQ1mNIexevmpqSZdulqGrFEYpg
        bnC3rAFgnIDjN3RBkAo4ZSiah4bQp1DDKr1nXG89AhhdbYXHYCfcPSVe1aB6EfrzMoyY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1nSJKF-00A8gb-OK; Thu, 10 Mar 2022 14:59:31 +0100
Date:   Thu, 10 Mar 2022 14:59:31 +0100
From:   Andrew Lunn <andrew@lunn.ch>
To:     Chris Packham <chris.packham@alliedtelesis.co.nz>
Cc:     linus.walleij@linaro.org, robh+dt@kernel.org,
        catalin.marinas@arm.com, will@kernel.org,
        gregory.clement@bootlin.com, sebastian.hesselbarth@gmail.com,
        kostap@marvell.com, robert.marko@sartura.hr,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v1 2/4] pinctrl: mvebu: pinctrl driver for 98DX2530 SoC
Message-ID: <YioEQ3g1LlqEv5BY@lunn.ch>
References: <20220310030039.2833808-1-chris.packham@alliedtelesis.co.nz>
 <20220310030039.2833808-3-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220310030039.2833808-3-chris.packham@alliedtelesis.co.nz>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Mar 10, 2022 at 04:00:37PM +1300, Chris Packham wrote:
> This pinctrl driver supports the 98DX25xx and 98DX35xx family of chips
> from Marvell. It is based on the Marvell SDK with additions for various
> (non-gpio) pin configurations based on the datasheet.
> 
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>

Hi Chris

Past experience with pinctrl and gpio for mvebu is that developers get
GPI and GPO pins wrong. Are there any pins which are not GPIO but only
a subset, so only GPI or GPO?

  Andrew
