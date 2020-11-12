Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1CB6C2D0A3
	for <linux-gpio@archiver.kernel.org>; Thu, 12 Nov 2020 16:12:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69B6722227
	for <linux-gpio@archiver.kernel.org>; Thu, 12 Nov 2020 16:12:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="F+RuezPC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728426AbgKLQMe (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 12 Nov 2020 11:12:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:60466 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728233AbgKLQMe (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 12 Nov 2020 11:12:34 -0500
Received: from localhost (c-73-47-72-35.hsd1.nh.comcast.net [73.47.72.35])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 9F8952085B;
        Thu, 12 Nov 2020 16:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605197554;
        bh=S3DED15DdhftiCDicms1yyB5w94yipk0Rb9seTjbqPY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=F+RuezPCOuEN4TcLA9/qG9zCvBdO2hPmW+sdhrEmxjIm8mTV0eevqDa1RVmWFPz4o
         UNLfJ6tpvymTPdZpQYaV4dhCXjFWTOVcOfkQSUlXhEEkm66ULUqhOPH4ARFLPOSrNL
         UIthQBNjKjeSJDIdv54PR5zM9UIstsV6TX17MQMk=
Date:   Thu, 12 Nov 2020 11:12:32 -0500
From:   Sasha Levin <sashal@kernel.org>
To:     Ben Hutchings <ben.hutchings@codethink.co.uk>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Sasha Levin <Alexander.Levin@microsoft.com>,
        stable <stable@vger.kernel.org>,
        intel-wired-lan@lists.osuosl.org, linux-gpio@vger.kernel.org,
        netdev <netdev@vger.kernel.org>
Subject: Re: [4.9] Security fixes (pinctrl, i40e, geneve)
Message-ID: <20201112161232.GD403069@sasha-vm>
References: <add9899fca821cbe47025c7710ebb63e9c16597c.camel@codethink.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <add9899fca821cbe47025c7710ebb63e9c16597c.camel@codethink.co.uk>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 11, 2020 at 02:10:27AM +0000, Ben Hutchings wrote:
>Here are backports of some fixes to the 4.9 stable branch.
>
>I wasn't able to test the pinctrl fix (no idea how to reproduce it).
>
>I wasn't able to test the i40e changes (no hardware and no reproducer
>available).
>
>I tested the geneve fix with libreswan as (roughly) described in the
>commit message.

Queued up, thanks Ben!

-- 
Thanks,
Sasha
