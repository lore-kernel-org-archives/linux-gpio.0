Return-Path: <SRS0=v8Oc=DN=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A74C4363D
	for <linux-gpio@archiver.kernel.org>; Tue,  6 Oct 2020 22:25:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DE35F20B1F
	for <linux-gpio@archiver.kernel.org>; Tue,  6 Oct 2020 22:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602023123;
	bh=5d7QlwxCuDFtkfd5VYRuXSzh2UEpABOS1Q+hAk2ey1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=rQ6cRa1UxJAyvz3+/DTj0u1arcQ9aC/yvHPmlBgtSP57OtXviaG9+JkOWiosC+Y3p
	 tN+5YWfHhkaergd+u+BQq9f6KQxkOEc7N6VX70dx0fTPv35GBka7Yj2nmDD2FcY/5H
	 07tMnpfxH9E9OnYUvsnVv1qF4y33QA7OYdIfNByU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726934AbgJFWZX (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 6 Oct 2020 18:25:23 -0400
Received: from mail-oo1-f67.google.com ([209.85.161.67]:36398 "EHLO
        mail-oo1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbgJFWZX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 6 Oct 2020 18:25:23 -0400
Received: by mail-oo1-f67.google.com with SMTP id z1so127687ooj.3;
        Tue, 06 Oct 2020 15:25:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=/Ga2Z0C5bYkL6wxJvlHQG/Q6Nj02izfhVX4lbiXVzNA=;
        b=hZBmcK3x3fnrMjTTNrJx6ZvvJ925fy7PAHsa7SmbimeVgVHBR+rm5Vsd90OW9w0QKw
         Zl6h4g92Oa2Gb4eCPxr+TF+ucw08ckhPfGqyr4G6Yqf9WxGsRdHEkCmf37cYpsSCDNcV
         CGgtVAMbpFQGH/VlG5IIBORnVxau2n6dy9nlBUH6P7ogP07dm2gstJpFCa+f21pAVg6W
         /mwXGR8fFNA3+WffVR0i+iEkjm0ODUeUxKkhXCwXZrUO8qpzuBera9OqupkuupLmPDdp
         Q/U0D3npk/tkMoOS7ctYJ5/++FfT+C8KOXzCmAkTI15XjyvrWM3SDQUD7G/oKaGqNJQb
         txgg==
X-Gm-Message-State: AOAM530ppJaK3QnFZHRiJuN443fzCAH8YLUOw8euFJYStqipW1pRb35t
        bMcglMxLxtr9psydLWXuUs9sTHVjeHiL
X-Google-Smtp-Source: ABdhPJz3KuUGtTMqG6urse6MWFdEcXvkoe7E73SCozRInDxIDRL432QIj8fLXIIhZx9AlqMF8FRblQ==
X-Received: by 2002:a4a:dd0b:: with SMTP id m11mr168975oou.75.1602023122151;
        Tue, 06 Oct 2020 15:25:22 -0700 (PDT)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 38sm86240ota.42.2020.10.06.15.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 15:25:21 -0700 (PDT)
Received: (nullmailer pid 2965256 invoked by uid 1000);
        Tue, 06 Oct 2020 22:25:20 -0000
Date:   Tue, 6 Oct 2020 17:25:20 -0500
From:   Rob Herring <robh@kernel.org>
To:     =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Cc:     linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Yangtao Li <frank@allwinnertech.com>,
        linux-gpio@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH] dt-bindings: pinctrl: sunxi: Allow pinctrl with more
 interrupt banks
Message-ID: <20201006222520.GA2965226@bogus>
References: <20201005190939.21016-1-peron.clem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201005190939.21016-1-peron.clem@gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 05 Oct 2020 21:09:39 +0200, Clément Péron wrote:
> Recently introduced Allwinner A100 pinctrl block has 7 interrupts.
> 
> This trig a warning when running dtb_checks:
> sun50i-a100-allwinner-perf1.dt.yaml: pinctrl@300b000: interrupts: [...] is too long
> 	From schema: .../allwinner,sun4i-a10-pinctrl.yaml
> 
> Fix this by allowing up to 7 interrupts.
> 
> Signed-off-by: Clément Péron <peron.clem@gmail.com>
> ---
>  .../bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml           | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
