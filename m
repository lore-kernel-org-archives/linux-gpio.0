Return-Path: <SRS0=EsZ3=A7=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90BB5C433F7
	for <linux-gpio@archiver.kernel.org>; Mon, 20 Jul 2020 13:39:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6FA4922B4D
	for <linux-gpio@archiver.kernel.org>; Mon, 20 Jul 2020 13:39:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="heDejIMJ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728424AbgGTNjI (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 20 Jul 2020 09:39:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726012AbgGTNjH (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 20 Jul 2020 09:39:07 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FA8AC0619D2
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2020 06:39:07 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id e4so20276952ljn.4
        for <linux-gpio@vger.kernel.org>; Mon, 20 Jul 2020 06:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SZUWsa00iYf7K4HBHvDEC7hUnyTTw9NrXYfUvdxiJpg=;
        b=heDejIMJKRXAtiwM4h6NQUEF4C8R+h9OzJFFP+tx2PpKbFI2hUWSzTXkRZ5BekWopZ
         kkmHaTiWp+56nihbet+WZkRgccJ+WY102U7/bX1toov424jnra2iCMxgAaLdXldEDN9m
         /M8CrZMGUnAdq3bLWETEuv7OnckZaZ7GNi/Zuv2LR76FQP+GkPBC7iWl1Isv1tTs42FF
         a+kNCmhUgNF5Ky1orT1rf+r2/pdGrZr1F8A4yIGvL3Hjqp/vvU3qdtlqbklKCbpDSO4/
         /GttKdlO6SXUGc+AMPh+wpuKfytoLCdVR9ceEA9QCUEUVTGf+BvfnCLlMrY8DbFi+EID
         sVlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SZUWsa00iYf7K4HBHvDEC7hUnyTTw9NrXYfUvdxiJpg=;
        b=ZdlSM/Uo/29XCYqXrfFIMbybtdvLNWbR1jaXP9cpr7M8jO+hIYW/UN1s90ZyZr64yB
         eeqhgpWeYTgcyE/ks38bPq2oojiA0R0KYZCy6udV+4HInTWDxlRzgVO1TQrTWHvZ02A5
         N7lKKOIIvS37UgZS2+017tuHglXWOJC7vBWUim+2x+caZSRHWkKgkSET2Aw796TeoGp4
         q7sYhktj0dPfAz221IEd9OnztqKZ3scDjcXncpfvJxkS3kRtUkVVhUC35Y+wfvPmobS5
         cHt+4AklnQawQaQi1dT2jQRsHPECx/VYvPxkQ91XOSKpMBXHdxRDqppURnys/R7bD5T6
         LkWQ==
X-Gm-Message-State: AOAM531RD7Haxb2eCH/CmmZ+2wpFzU3iZvdPxEqqXjIUsBsMaoCVBnjK
        vPcVuiwf83DJClP/QNaFCWYt5DStYgTbtwQrUY739g==
X-Google-Smtp-Source: ABdhPJzHGab0xEgyMQVlieVYjfPMYKbHimCOGtZ21uJ+KasO8fWcs9EFajtwAK+p4doX0sdbOccThgfvXySb191nTxI=
X-Received: by 2002:a05:651c:1291:: with SMTP id 17mr11205367ljc.286.1595252345768;
 Mon, 20 Jul 2020 06:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <20200716212213.GA17623@embeddedor>
In-Reply-To: <20200716212213.GA17623@embeddedor>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 20 Jul 2020 15:38:54 +0200
Message-ID: <CACRpkdaBuvbtswYczwsSx9-YOLODs5x8YvWSB4bpMbXpvoPLrA@mail.gmail.com>
Subject: Re: [PATCH][next] pinctrl: qcom: spmi-gpio: Use fallthrough pseudo-keyword
To:     "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jul 16, 2020 at 11:16 PM Gustavo A. R. Silva
<gustavoars@kernel.org> wrote:

> Replace the existing /* fall through */ comments and its variants with
> the new pseudo-keyword macro fallthrough[1].
>
> [1] https://www.kernel.org/doc/html/latest/process/deprecated.html?highlight=fallthrough#implicit-switch-case-fall-through
>
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Patch applied, I don't see any controversy here.

Yours,
Linus Walleij
