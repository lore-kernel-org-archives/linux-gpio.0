Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBE28C433F5
	for <linux-gpio@archiver.kernel.org>; Wed,  6 Apr 2022 23:18:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229668AbiDFXUT (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 6 Apr 2022 19:20:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229586AbiDFXUS (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 6 Apr 2022 19:20:18 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 632CF237C2;
        Wed,  6 Apr 2022 16:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=a3YkcaLn8YtsboLw8Y8zRXa/RfeGgngH/9o02YrSnUE=; b=jdF+6TeNI8HiNHB0DtS+S8a3DN
        G/rLtRbscwCC0VDriMPDWLgtMb5azpzc9ErNvw4Od3/YeTYAPJAPF6L82qiQ8lfD1BHxj3cg501vG
        H+bL0rctxCwYXI+5kUIwwBxpwWj78t8avSPCvjIoc40RI07pTF9zS4GdN1CBfcVssQPo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1ncEuV-00EX0w-2B; Thu, 07 Apr 2022 01:17:59 +0200
Date:   Thu, 7 Apr 2022 01:17:59 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Chris Packham <Chris.Packham@alliedtelesis.co.nz>
Cc:     "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
        "will@kernel.org" <will@kernel.org>,
        "gregory.clement@bootlin.com" <gregory.clement@bootlin.com>,
        "sebastian.hesselbarth@gmail.com" <sebastian.hesselbarth@gmail.com>,
        "kostap@marvell.com" <kostap@marvell.com>,
        "robert.marko@sartura.hr" <robert.marko@sartura.hr>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 2/4] pinctrl: mvebu: pinctrl driver for 98DX2530 SoC
Message-ID: <Yk4fpxGdhqsORmFs@lunn.ch>
References: <20220406032158.1449049-1-chris.packham@alliedtelesis.co.nz>
 <20220406032158.1449049-3-chris.packham@alliedtelesis.co.nz>
 <Yk2JTo91sZHunEpN@lunn.ch>
 <5033e1ed-a4bc-687a-40f5-767e89317ce3@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5033e1ed-a4bc-687a-40f5-767e89317ce3@alliedtelesis.co.nz>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

> The pinctrl registers that are used are all continguous (0x80020100 -- 
> 0x8002011c) .

Great. So long at the DT only has that register range, what you have
should be good.

       Andrew
