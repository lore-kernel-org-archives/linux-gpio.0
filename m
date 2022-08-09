Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24912C19F2D
	for <linux-gpio@archiver.kernel.org>; Tue,  9 Aug 2022 20:24:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232905AbiHIUYw (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 9 Aug 2022 16:24:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232322AbiHIUYv (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 9 Aug 2022 16:24:51 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E8251EEF1
        for <linux-gpio@vger.kernel.org>; Tue,  9 Aug 2022 13:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
        Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
        Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
        Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
        In-Reply-To:References; bh=5w0vw/hNn1ZQ61zafjJ3NXPauqPoWUD9P5UB6v2mzxY=; b=V8
        142Ni27aWmMqHv9GbXpoQY5knpUhuusDj+XQp28Gm3VW4Lq/kr/nemR6QAZv4XSsE4vATHpxJNFnD
        GSDcG8iglFBlMx3RXdN/fbcChFjmdD+dNF9Xl0r30N5GpWQlmaKlDZMHZLpOJLcJ5HOBhwsxtHLBM
        Lv93zQHA3RsBOSc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1oLVmO-00CsPP-6L; Tue, 09 Aug 2022 22:24:44 +0200
Date:   Tue, 9 Aug 2022 22:24:44 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Cc:     Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v2 4/4] pinctrl: armada-37xx: Remove unused macro
 PIN_GRP()
Message-ID: <YvLCjLJUF4R07ubv@lunn.ch>
References: <20220805122202.23174-1-pali@kernel.org>
 <20220805122202.23174-4-pali@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220805122202.23174-4-pali@kernel.org>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 05, 2022 at 02:22:02PM +0200, Pali Rohár wrote:
> Macro PIN_GRP() is not used, remove it.
> 
> Signed-off-by: Pali Rohár <pali@kernel.org>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
