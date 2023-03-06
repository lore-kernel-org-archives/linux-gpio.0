Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68E82C64EC4
	for <linux-gpio@archiver.kernel.org>; Mon,  6 Mar 2023 23:28:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229516AbjCFX2o (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 6 Mar 2023 18:28:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42986 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229667AbjCFX2n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 6 Mar 2023 18:28:43 -0500
Received: from fgw23-7.mail.saunalahti.fi (fgw23-7.mail.saunalahti.fi [62.142.5.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A960F38670
        for <linux-gpio@vger.kernel.org>; Mon,  6 Mar 2023 15:28:39 -0800 (PST)
Received: from localhost (88-113-24-128.elisa-laajakaista.fi [88.113.24.128])
        by fgw23.mail.saunalahti.fi (Halon) with ESMTP
        id 9eb38d53-bc76-11ed-b972-005056bdfda7;
        Tue, 07 Mar 2023 01:28:37 +0200 (EET)
From:   andy.shevchenko@gmail.com
Date:   Tue, 7 Mar 2023 01:28:37 +0200
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Chester Lin <clin@suse.com>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        s32@nxp.com, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Larisa Grigore <larisa.grigore@nxp.com>,
        Ghennadi Procopciuc <Ghennadi.Procopciuc@oss.nxp.com>,
        Andrei Stefanescu <andrei.stefanescu@nxp.com>,
        Radu Pirea <radu-nicolae.pirea@nxp.com>,
        Matthias Brugger <mbrugger@suse.com>
Subject: Re: [PATCH v5 0/3] Add pinctrl support for S32 SoC family
Message-ID: <ZAZ3JZQ4Tuz5vyH1@surfacebook>
References: <20230220023320.3499-1-clin@suse.com>
 <CACRpkdYknZo3Q7_CeSkOL2XwwAmKERskx24o-toaVy=rs0Yf5Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACRpkdYknZo3Q7_CeSkOL2XwwAmKERskx24o-toaVy=rs0Yf5Q@mail.gmail.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Mon, Mar 06, 2023 at 02:28:56PM +0100, Linus Walleij kirjoitti:
> On Mon, Feb 20, 2023 at 3:33 AM Chester Lin <clin@suse.com> wrote:
> 
> > Here I want to introduce a new patch series, which aims to support IOMUX
> > functions provided by SIUL2 [System Integration Unit Lite2] on S32 SoCs,
> > such as S32G2. This series is originally from NXP's implementation on
> > nxp-auto-linux repo[1] and it will be required by upstream kernel for
> > supporting a variety of devices on S32 SoCs which need to config PINMUXs,
> > such as PHYs and MAC controllers.
> >
> > Thanks,
> > Chester
> >
> > Changes in v5:
> > - dt-bindings: No change
> > - driver:
> >   - Refactor register r/w access based on REGMAP_MMIO and regmap APIs.
> >   - Tag PM functions with '__maybe_unused'.
> >   - Add mask check while parsing pin ID from a pinmux value.
> >   - Simplify s32_pinconf_mscr_* functions.
> 
> This looks really good any no more comments arrived, so patches are applied
> for v6.4!
> 
> Thanks for your work on this so far Chester! (I suppose there will be
> maintenance
> for this family going forward.)

Can you unpull this?

-- 
With Best Regards,
Andy Shevchenko


