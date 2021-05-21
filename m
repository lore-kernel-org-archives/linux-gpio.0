Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C229C4707D
	for <linux-gpio@archiver.kernel.org>; Fri, 21 May 2021 20:05:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6982761164
	for <linux-gpio@archiver.kernel.org>; Fri, 21 May 2021 20:05:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230095AbhEUUHU (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 21 May 2021 16:07:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:48336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231128AbhEUUHT (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Fri, 21 May 2021 16:07:19 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CB9F4613E1;
        Fri, 21 May 2021 20:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1621627556;
        bh=HOAgQgMrds9WX4hrTMQsXqTjJUHDShCTNkMSvhtMlxg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=w/OT9YPEPaIm1eRnI0kgXOgjb9HXlKPfb69lcpR/7B8ojljR0Txpm8y68IUHIcN8l
         YLA6rSBsi5AVWsbcg7tvDAgeWLpwUEsSSpvxWd8qDjineXe7akNXulkc4Vk0s6i55+
         g+a8wHga5FLMXF9tI+hbARpaQ5XST9PUBcR0D67M=
Date:   Fri, 21 May 2021 22:05:54 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     John Stultz <john.stultz@linaro.org>
Cc:     lkml <linux-kernel@vger.kernel.org>,
        Saravana Kannan <saravanak@google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Joerg Roedel <joro@8bytes.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Marc Zyngier <maz@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Maulik Shah <mkshah@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, Todd Kjos <tkjos@google.com>,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] irqchip/qcom-pdc: Switch to IRQCHIP_PLATFORM_DRIVER
 and allow as a module
Message-ID: <YKgSonVO/L34eObX@kroah.com>
References: <20210518211922.3474368-1-john.stultz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210518211922.3474368-1-john.stultz@linaro.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, May 18, 2021 at 09:19:21PM +0000, John Stultz wrote:
> From: Saravana Kannan <saravanak@google.com>
> 
> This patch revives changes from Saravana Kannan to switch the
> qcom-pdc driver to use IRQCHIP_PLATFORM_DRIVER helper macros,
> and allows qcom-pdc driver to be loaded as a permanent module.
> 
> Earlier attempts at this ran into trouble with loading
> dependencies, but with Saravana's fw_devlink=on set by default
> now we should avoid those.
> 
> Cc: Andy Gross <agross@kernel.org>
> Cc: Bjorn Andersson <bjorn.andersson@linaro.org>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Maulik Shah <mkshah@codeaurora.org>
> Cc: Lina Iyer <ilina@codeaurora.org>
> Cc: Saravana Kannan <saravanak@google.com>
> Cc: Todd Kjos <tkjos@google.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: iommu@lists.linux-foundation.org
> Cc: linux-gpio@vger.kernel.org
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> [jstultz: Folded in with my changes to allow the driver to be
>  loadable as a permenent module]
> Signed-off-by: John Stultz <john.stultz@linaro.org>

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
