Return-Path: <SRS0=6Eea=WR=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF7FEC3A59E
	for <linux-gpio@archiver.kernel.org>; Wed, 21 Aug 2019 21:02:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 87A3B22CF7
	for <linux-gpio@archiver.kernel.org>; Wed, 21 Aug 2019 21:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566421355;
	bh=6ivhu7Dvdf0c8/tVlFVqd0t3at0NPseUai1rWDfwwmk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=fGIC8KYCDWjKGmxQgj+/bOBRugPUlsb9CemH7UU6xpI2kSXJ4zYvAmObdC8MpTvUV
	 24R/ylYIVFjV9WrGRaKja5OsB8dcW7Y3KB/aNFlifd+knZZkdUxdVCvO/RDL6oHGXF
	 DrOqQpvbsXkGwo/6NVhtnMI/M3b5IxmKj/pl08mE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730684AbfHUVCf (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 21 Aug 2019 17:02:35 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:44458 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728428AbfHUVCe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 21 Aug 2019 17:02:34 -0400
Received: by mail-ot1-f67.google.com with SMTP id w4so3389703ote.11;
        Wed, 21 Aug 2019 14:02:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qeldRNnrKJ6n4nBoYRhi7qGMwnjGqI0qiOR/k4DQ+G0=;
        b=dErylmymL/cdPXUTD4Fl977fElu9afRvA8ZC0q+hr1G6KyZUINk3X0wKWC+eXdXjWv
         es5xPCcEh5rEN+IWMwgn8dbarum10/mhNLRkEiNVAX0DgxPm4xpT57uYY0RJ1NZh/4+7
         vLW2sYT2nGoRkgKk0qd3t1uVlClE5YlnZ0V+7e5JrQPo0huLkPP28SvYpktgdbUkqtNT
         tgwqkTaqoVl9/X4sKnAts1NzCCIlnpEAgptP+U17p7jxHlIszD1I6mhKsGxW41HnecHq
         COd/plInMt0QcvwqBOLzZj2iApdUsBdAkymi/JCzE3J660pcjHBTHKjftilxy8zaMW0H
         0qjA==
X-Gm-Message-State: APjAAAW8WO6Wn4ytjQW37rwPZB0qt+DkNNFsOvSzNl6N3QvwKNwTImms
        7IzvpD4lylgdfIk/pWLXIQ==
X-Google-Smtp-Source: APXvYqyRJsdPlJBUmlZSY3uPEIBvI3RM6nnZGMr1ukyS82VcusB4lOcfeVYUcWuho5QRGbPVjA0/Jw==
X-Received: by 2002:a05:6830:1e79:: with SMTP id m25mr22039139otr.109.1566421353755;
        Wed, 21 Aug 2019 14:02:33 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id v5sm8176751otk.64.2019.08.21.14.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Aug 2019 14:02:32 -0700 (PDT)
Date:   Wed, 21 Aug 2019 16:02:32 -0500
From:   Rob Herring <robh@kernel.org>
To:     Lokesh Vutla <lokeshvutla@ti.com>
Cc:     Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>,
        linus.walleij@linaro.org, Keerthy <j-keerthy@ti.com>,
        linux-gpio@vger.kernel.org,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 5/6] dt-bindings: pinctrl: k3: Introduce pinmux
 definitions for J721E
Message-ID: <20190821210232.GA22578@bogus>
References: <20190809082947.30590-1-lokeshvutla@ti.com>
 <20190809082947.30590-6-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190809082947.30590-6-lokeshvutla@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Aug 09, 2019 at 01:59:46PM +0530, Lokesh Vutla wrote:
> Add pinctrl macros for J721E SoC. These macro definitions are
> similar to that of AM6, but adding new definitions to avoid
> any naming confusions in the soc dts files.
> 
> Acked-by: Nishanth Menon <nm@ti.com>
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
>  include/dt-bindings/pinctrl/k3.h | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/include/dt-bindings/pinctrl/k3.h b/include/dt-bindings/pinctrl/k3.h
> index 45e11b6170ca..499de6216581 100644
> --- a/include/dt-bindings/pinctrl/k3.h
> +++ b/include/dt-bindings/pinctrl/k3.h
> @@ -32,4 +32,7 @@
>  #define AM65X_IOPAD(pa, val, muxmode)		(((pa) & 0x1fff)) ((val) | (muxmode))
>  #define AM65X_WKUP_IOPAD(pa, val, muxmode)	(((pa) & 0x1fff)) ((val) | (muxmode))
>  
> +#define J721E_IOPAD(pa, val, muxmode)		(((pa) & 0x1fff)) ((val) | (muxmode))
> +#define J721E_WKUP_IOPAD(pa, val, muxmode)	(((pa) & 0x1fff)) ((val) | (muxmode))

checkpatch reports a parentheses error:         (((pa) & 0x1fff) ((val) | (muxmode)))

> +
>  #endif
> -- 
> 2.22.0
> 
