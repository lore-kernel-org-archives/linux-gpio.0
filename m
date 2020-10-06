Return-Path: <SRS0=v8Oc=DN=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57682C41604
	for <linux-gpio@archiver.kernel.org>; Tue,  6 Oct 2020 19:32:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00D3F206CB
	for <linux-gpio@archiver.kernel.org>; Tue,  6 Oct 2020 19:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602012760;
	bh=wikob5JEKWI5Hn7VlxVcVW1r5/vcTJXxrOztLmwxMiw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=oocwo6vF0aPizdLqvZ5hgjefoTL14o0KAKEEi+RVHZC2Q3sTTV856LEF10MyQNSFK
	 83HHxy7BjIfjzTC4VjDlw5ayMbJk09b20HWSLLrMNeO/jyVOA0ViMeSiVqxYaJzXOX
	 cIsTj0DKdmc2WU1+CrZTBkSJjaGSe+AcXz7WsknE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727127AbgJFTcj (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 6 Oct 2020 15:32:39 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:45808 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726981AbgJFTcj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Oct 2020 15:32:39 -0400
Received: by mail-oi1-f193.google.com with SMTP id z26so13836773oih.12;
        Tue, 06 Oct 2020 12:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1/W9fpjJX1MxtlTQRXm8CozrFntDRbNwBWOrJ26nwDY=;
        b=ME+xvnaQrW6vXwq6f24bZ/Dxv7528da/bESrdemjzjMbOCYzk4tZvqzb+vWQRHuMcy
         BiPb+y0hyZeVIdnsFpzin4yycpcN6lIzcYcAVx/0YD4XpTsl6RdcRGZsSHwALY0mVS0j
         YUXKRrBbV8OS1Lf+90B1Vj9Mbo6eUIhwCmKOFAIcYRSePhSI0hy43rO47yz02qFWRnJG
         lsd7h+cnspr4dA4BOF162EvCHfaKQEMZahVUx8A3G5VeymqluaUS3UDA+6WPoJdcYk2e
         M8bisGNba3YRhhZDSbUfqH46g9Ke8ii9x/za6Q57V9KK0l+3LXo6Ew4MDmMfdxoNjnBD
         iLFw==
X-Gm-Message-State: AOAM530sPOp/+L/mEVJrLIhR9viiMDXEbojNuWDsSL6l0oWYIJAHEG26
        DWDBlXRUclRjWfwAPUuuncgxBFVZWJLV
X-Google-Smtp-Source: ABdhPJydqWGiXMfOf6QmRCBWHEwjb4PnPjlDlShcrg+v3c2YaygDqEm+wA66WoR+4dNyzPbXIOgTMg==
X-Received: by 2002:aca:2205:: with SMTP id b5mr3721483oic.117.1602012756863;
        Tue, 06 Oct 2020 12:32:36 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u140sm1487959oie.41.2020.10.06.12.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 12:32:36 -0700 (PDT)
Received: (nullmailer pid 2692482 invoked by uid 1000);
        Tue, 06 Oct 2020 19:32:35 -0000
Date:   Tue, 6 Oct 2020 14:32:35 -0500
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Mike Looijmans <mike.looijmans@topic.nl>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: pca953x: Add support for the
 NXP PCAL9554B/C
Message-ID: <20201006193235.GA2689027@bogus>
References: <20200930092053.2114-1-mike.looijmans@topic.nl>
 <CACRpkdbsYcmv9m2EiQNgPDZ0MdjPnWTxXvnqATVPvWpB=8Oqkw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdbsYcmv9m2EiQNgPDZ0MdjPnWTxXvnqATVPvWpB=8Oqkw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Sep 30, 2020 at 11:50:38AM +0200, Linus Walleij wrote:
> On Wed, Sep 30, 2020 at 11:21 AM Mike Looijmans <mike.looijmans@topic.nl> wrote:
> 
> > The NXP PCAL9554B is a variant of the PCA953x GPIO expander,
> > with 8 GPIOs, latched interrupts and some advanced configuration
> > options. The "C" version only differs in I2C address.
> >
> > This adds the entry to the devicetree bindings.
> >
> > Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> > ---
> > v2: Split devicetree and code into separate patches
> 
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> 
> This patch 1/2 does not apply to my tree, I suppose Rob has
> to apply it?

Nope, no changes in my tree.

Rob
