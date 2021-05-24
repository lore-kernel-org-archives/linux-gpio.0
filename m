Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAC2DC2B9F8
	for <linux-gpio@archiver.kernel.org>; Mon, 24 May 2021 16:13:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AA0ED61403
	for <linux-gpio@archiver.kernel.org>; Mon, 24 May 2021 16:13:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234384AbhEXQPV (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 24 May 2021 12:15:21 -0400
Received: from vern.gendns.com ([98.142.107.122]:43838 "EHLO vern.gendns.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237025AbhEXQOR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 24 May 2021 12:14:17 -0400
X-Greylist: delayed 1212 seconds by postgrey-1.27 at vger.kernel.org; Mon, 24 May 2021 12:14:16 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=lechnology.com; s=default; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=mu76QB4BKzjBdZu1ybVuQhnhYDd8LEq/NCibHuc/NpI=; b=QT3nO2BecZHEyvyRTzcV140qNW
        wnc8wO8/dZnmXj7LljHXe6bvyvzEfV5wOW/crRLjTIH8UVfV2EQVQCJdmiUqzUuHVyYTr/fZOTRE1
        zBxYfK7KKHs/76InpIy1G9nI6orSo3NCLB89p8N3RQ7tC4MMBBNSlHdmdEHDtZt6f4BOXCBjEsPCI
        vzDkhuw5GUs0LQByGyYPZsrtemtE96Kwl1DKqQpIzNDGSMjQhbMvwFQw8YsLyvQrxBbZ34Guayc4L
        W11hjip8t/a/xYIpwTf924GIkAdGXiLxisXslMjDreIhNu8dCfYwYVSPilkRys+uM2LFgTTyFM/Wo
        p4pZ2Ilw==;
Received: from [2600:1700:4830:165f::fb2] (port=33546)
        by vern.gendns.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
        (Exim 4.94.2)
        (envelope-from <david@lechnology.com>)
        id 1llCsV-0002Ll-5n; Mon, 24 May 2021 11:52:30 -0400
Subject: Re: [PATCH v3 1/2] ARM: dts: da850-lego-ev3: align GPIO hog names
 with dt-schema
To:     Aswath Govindraju <a-govindraju@ti.com>
Cc:     Lokesh Vutla <lokeshvutla@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, Keerthy <j-keerthy@ti.com>,
        Sekhar Nori <nsekhar@ti.com>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20210524151955.8008-1-a-govindraju@ti.com>
 <20210524151955.8008-2-a-govindraju@ti.com>
From:   David Lechner <david@lechnology.com>
Message-ID: <4fbab5e8-f957-0927-c9fd-3127ae30b746@lechnology.com>
Date:   Mon, 24 May 2021 10:52:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210524151955.8008-2-a-govindraju@ti.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - vern.gendns.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - lechnology.com
X-Get-Message-Sender-Via: vern.gendns.com: authenticated_id: davidmain+lechnology.com/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: vern.gendns.com: davidmain@lechnology.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On 5/24/21 10:19 AM, Aswath Govindraju wrote:
> The GPIO hog dt-schema node naming convention expect GPIO hogs node names
> to end with a 'hog' suffix.
> 
> Signed-off-by: Aswath Govindraju <a-govindraju@ti.com>
> ---

Acked-by: David Lechner <david@lechnology.com>


