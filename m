Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D1A4C6FA82
	for <linux-gpio@archiver.kernel.org>; Thu, 22 Sep 2022 14:54:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231368AbiIVOx7 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 22 Sep 2022 10:53:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbiIVOx6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 22 Sep 2022 10:53:58 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6E61D4DE7;
        Thu, 22 Sep 2022 07:53:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 79D40B83813;
        Thu, 22 Sep 2022 14:53:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4BDCC433D7;
        Thu, 22 Sep 2022 14:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1663858435;
        bh=KTeWixHxNoQJTPzIJzb7kAXpWkg5DahLdcLN1A+Xbe8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pbw5mctyzje5yeed6jCcw7cpD8giF93mj1nh1wLENp5hV1ZznhMzpjVGT/fvnG4l5
         JaO+KSaN8+ziXiPWHE9Z2UFQ7QHD1IZv0DlwDcZyGnccfqmxv0FxD9ZwErVko9DIpY
         PrpjShLb+aWuhpHcLTMx6wMthUQU+bin98t1Oz+8=
Date:   Thu, 22 Sep 2022 16:53:52 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Conor Dooley <conor@kernel.org>
Cc:     Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
        linux-kernel@vger.kernel.org, sudipm.mukherjee@gmail.com,
        arnd@arndb.de, linux-gpio@vger.kernel.org,
        linux-next@vger.kernel.org, bagasdotme@gmail.com,
        zengheng4@huawei.com
Subject: Re: [PATCH v2 char-misc-next] misc: microchip: pci1xxxx: use
 DEFINE_SIMPLE_DEV_PM_OPS() in place  of the SIMPLE_DEV_PM_OPS() in
 pci1xxxx's gpio driver
Message-ID: <Yyx3AMaETK2GsBHl@kroah.com>
References: <20220915094729.646185-1-kumaravel.thiagarajan@microchip.com>
 <YytAbfmMfxNsIjcy@spud>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YytAbfmMfxNsIjcy@spud>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 21, 2022 at 05:48:45PM +0100, Conor Dooley wrote:
> On Thu, Sep 15, 2022 at 03:17:29PM +0530, Kumaravel Thiagarajan wrote:
> > misc: microchip: pci1xxxx: use DEFINE_SIMPLE_DEV_PM_OPS() in place  of the SIMPLE_DEV_PM_OPS() in pci1xxxx's gpio driver
>                                                                     ^^
> FYI, double space in the subject here, rather a mouthful though and
> surely everything after SIMPLE_DEV_PM_OPS() is redundant?
> 
> > build errors listed below and reported by Sudip Mukherjee
> > <sudipm.mukherjee@gmail.com> for the builds of
> > riscv, s390, csky, alpha and loongarch allmodconfig are fixed in
> > this patch.
> 
> allmodconfig has been broken for a while now, and this patch appears
> to have been sitting for a week & a second fix has shown up at:
> https://lore.kernel.org/all/20220919094250.858716-1-zengheng4@huawei.com/
> 
> I do note that Zeng Hang's patch does slightly more than this one does,
> but idk about about the PM APIs /shrug.
> 
> Has this just slipped under the radar since so many of us were
> attending conferences etc the last while or are you looking for
> Kumaravel to do something more here?

I've taken this change now, sorry for the delay.  Was not looking at
patches while at conferences.

greg k-h
