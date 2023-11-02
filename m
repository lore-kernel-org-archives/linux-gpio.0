Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81791C4332F
	for <linux-gpio@archiver.kernel.org>; Thu,  2 Nov 2023 07:06:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233299AbjKBHGx (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 2 Nov 2023 03:06:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjKBHGw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Nov 2023 03:06:52 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4DD39112;
        Thu,  2 Nov 2023 00:06:49 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8CD82F4;
        Thu,  2 Nov 2023 00:07:30 -0700 (PDT)
Received: from pluto (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 18A5A3F64C;
        Thu,  2 Nov 2023 00:06:46 -0700 (PDT)
Date:   Thu, 2 Nov 2023 07:06:44 +0000
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
Subject: Re: [RFC v5 1/5] firmware: arm_scmi: Add optional flags to extended
 names helper
Message-ID: <ZUNKhDwPzsBSgh63@pluto>
References: <cover.1698353854.git.oleksii_moisieiev@epam.com>
 <318eb79c7e1ddb1f964a901e778a0475bf18c85b.1698353854.git.oleksii_moisieiev@epam.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <318eb79c7e1ddb1f964a901e778a0475bf18c85b.1698353854.git.oleksii_moisieiev@epam.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Oct 27, 2023 at 06:28:09AM +0000, Oleksii Moisieiev wrote:
> From: Cristian Marussi <cristian.marussi@arm.com>
> 
> Some recently added SCMI protocols needs an additional flags parameter to
> be able to properly configure the command used to query the extended name
> of a resource.
> 

Hi,

this patch of mine contained a bug in v4, for which I sent you a fix
a while ago to include; since the patch is unchanged in v5 the bug is still
there: I'll reply to this mail thread with a new version of the whole patch
that indeed will be easier to include in your series instead of this current
buggy version.

Thanks,
Cristian
