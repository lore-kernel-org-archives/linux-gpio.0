Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FC59C001B0
	for <linux-gpio@archiver.kernel.org>; Wed, 16 Aug 2023 12:31:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244273AbjHPMaj (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 16 Aug 2023 08:30:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245360AbjHPMad (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 16 Aug 2023 08:30:33 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D06D42700;
        Wed, 16 Aug 2023 05:30:25 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AD6C21063;
        Wed, 16 Aug 2023 05:31:06 -0700 (PDT)
Received: from pluto (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0BAA53F6C4;
        Wed, 16 Aug 2023 05:30:23 -0700 (PDT)
Date:   Wed, 16 Aug 2023 13:30:13 +0100
From:   Cristian Marussi <cristian.marussi@arm.com>
To:     Oleksii Moisieiev <Oleksii_Moisieiev@epam.com>
Cc:     "sudeep.holla@arm.com" <sudeep.holla@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH v4 0/4] firmware: arm_scmi: Add SCMI v3.2 pincontrol
 protocol basic support
Message-ID: <ZNzBVWOyp_gfoG4I@pluto>
References: <cover.1691518313.git.oleksii_moisieiev@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1691518313.git.oleksii_moisieiev@epam.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Aug 08, 2023 at 06:25:34PM +0000, Oleksii Moisieiev wrote:
> This Patch series is intended to introduce the generic driver for
> pin controls over SCMI protocol, provided in the latest beta version of DEN0056 [0].
> 

Hi Oleksii,

as said in general seems good to me now, beside the out-of-spec issue I
mentioned elsewhere around PINCTRL_CONFIG_GET/SET.

I'll review and test further with the above fixes in V5 during the next
cycle.

Thanks for all the work addressing the reported issues.

Cristian

